import pg from 'pg';
import fs from 'fs';
import path from 'path';

const { Client } = pg;

const DB_CONFIG = {
  host: 'db.eptnkprttskodgnfeasg.supabase.co',
  port: 5432,
  database: 'postgres',
  user: 'postgres',
  password: 'Yonchforget1!',
  ssl: { rejectUnauthorized: false },
  statement_timeout: 300000, // 5 min for large seeds
};

const seedDir = path.join(process.cwd(), 'supabase', 'seed');

// Fix SQL content before running
function fixSql(sql, filename) {
  let fixed = sql;
  let fixCount = 0;

  // Fix 1: Ambiguous model_id in IF NOT EXISTS subqueries within PL/pgSQL blocks
  // Pattern: IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = v_model_id
  // Fix: Add table alias vy to disambiguate
  const ambiguousPattern = /IF NOT EXISTS \(SELECT 1 FROM public\.vehicle_years WHERE model_id =/g;
  const ambiguousReplacement = 'IF NOT EXISTS (SELECT 1 FROM public.vehicle_years vy WHERE vy.model_id =';
  const ambiguousCount = (fixed.match(ambiguousPattern) || []).length;
  if (ambiguousCount > 0) {
    fixed = fixed.replace(ambiguousPattern, ambiguousReplacement);
    fixCount += ambiguousCount;
    console.log(`  Fixed ${ambiguousCount} ambiguous model_id references`);
  }

  // Also fix any other potential ambiguous column refs in IF NOT EXISTS with vehicle_years
  const ambiguousPattern2 = /IF NOT EXISTS \(SELECT 1 FROM public\.vehicle_years WHERE year_start/g;
  const ambiguousReplacement2 = 'IF NOT EXISTS (SELECT 1 FROM public.vehicle_years vy WHERE vy.year_start';
  const ambiguousCount2 = (fixed.match(ambiguousPattern2) || []).length;
  if (ambiguousCount2 > 0) {
    fixed = fixed.replace(ambiguousPattern2, ambiguousReplacement2);
    fixCount += ambiguousCount2;
    console.log(`  Fixed ${ambiguousCount2} ambiguous year_start references`);
  }

  // Fix 2: Add ON CONFLICT DO NOTHING to vehicle_years INSERTs inside DO $$ blocks (PL/pgSQL)
  // These use RETURNING id INTO v_year_id, so we need a unique constraint first
  // Since vehicle_years has no unique constraint on (model_id, year_start, year_end),
  // the IF NOT EXISTS check handles duplicates in PL/pgSQL blocks.
  // For CTE-based inserts (PART2 style), they use gen_random_uuid() for IDs, so duplicates
  // create new rows. These are OK since PART1 wipes data first.

  // Fix 3: Add ON CONFLICT DO NOTHING to vehicle_years INSERTs in CTE patterns (PART2 style)
  // Pattern: INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  // These don't have unique constraints, so ON CONFLICT won't work. Instead, we wrap with
  // a check or just let them through since data is wiped first.

  // Fix 4: For standalone INSERT INTO vehicle_years without ON CONFLICT (non-PL/pgSQL)
  // Add a unique constraint first, then ON CONFLICT

  console.log(`  Total fixes applied: ${fixCount}`);
  return fixed;
}

async function addUniqueConstraints(client) {
  console.log('Adding unique constraints for idempotent operations...');

  const constraints = [
    `DO $$ BEGIN
      IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'vehicle_years_model_year_unique') THEN
        ALTER TABLE public.vehicle_years ADD CONSTRAINT vehicle_years_model_year_unique UNIQUE (model_id, year_start, year_end);
      END IF;
    END $$;`,
    `DO $$ BEGIN
      IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'automotive_keys_year_model_unique') THEN
        ALTER TABLE public.automotive_keys ADD CONSTRAINT automotive_keys_year_model_unique UNIQUE (year_id, model_name);
      END IF;
    END $$;`,
  ];

  for (const sql of constraints) {
    try {
      await client.query(sql);
    } catch (err) {
      console.log(`  Constraint warning: ${err.message}`);
    }
  }
  console.log('  Constraints ready.\n');
}

async function main() {
  const client = new Client(DB_CONFIG);

  console.log('=== LOCKBASE MASTER SEED - FIX & RUN ===\n');
  console.log('Connecting to Supabase database...');
  await client.connect();
  console.log('Connected!\n');

  // Step 1: Add unique constraints for idempotent inserts
  await addUniqueConstraints(client);

  // Step 2: Run seed parts in order
  const parts = [
    'MASTER_SEED_PART1.sql',
    'MASTER_SEED_PART2.sql',
    'MASTER_SEED_PART3.sql',
    'MASTER_SEED_PART4.sql',
  ];

  for (const filename of parts) {
    const filepath = path.join(seedDir, filename);
    if (!fs.existsSync(filepath)) {
      console.log(`SKIP: ${filename} not found\n`);
      continue;
    }

    let sql = fs.readFileSync(filepath, 'utf-8');
    const sizeKB = Math.round(sql.length / 1024);
    console.log(`Processing ${filename} (${sizeKB} KB)...`);

    // Apply fixes
    sql = fixSql(sql, filename);

    // Run the SQL
    const start = Date.now();
    try {
      await client.query(sql);
      const elapsed = ((Date.now() - start) / 1000).toFixed(1);
      console.log(`  SUCCESS (${elapsed}s)\n`);
    } catch (err) {
      const elapsed = ((Date.now() - start) / 1000).toFixed(1);
      console.error(`  FAILED after ${elapsed}s`);
      console.error(`  Error: ${err.message}`);
      console.error(`  Detail: ${err.detail || 'none'}`);
      console.error(`  Hint: ${err.hint || 'none'}`);
      console.error(`  Position: ${err.position || 'none'}`);

      // Try to show the problematic SQL around the position
      if (err.position) {
        const pos = parseInt(err.position);
        const context = sql.substring(Math.max(0, pos - 200), pos + 200);
        console.error(`  Context around error:\n  ...${context}...`);
      }

      // Don't exit - try to continue with remaining parts
      console.error(`  Continuing with next file...\n`);
    }
  }

  // Step 3: Verify data
  console.log('=== VERIFICATION ===');
  try {
    const counts = await Promise.all([
      client.query('SELECT COUNT(*) FROM public.manufacturers'),
      client.query('SELECT COUNT(*) FROM public.vehicle_models'),
      client.query('SELECT COUNT(*) FROM public.vehicle_years'),
      client.query('SELECT COUNT(*) FROM public.automotive_keys'),
      client.query('SELECT COUNT(*) FROM public.residential_locks'),
      client.query('SELECT COUNT(*) FROM public.residential_key_blanks'),
      client.query("SELECT COUNT(*) FROM public.automotive_keys WHERE lishi_tool IS NOT NULL AND lishi_tool != ''"),
      client.query("SELECT COUNT(*) FROM public.automotive_keys WHERE fcc_id IS NOT NULL AND fcc_id != '' AND fcc_id != 'N/A'"),
      client.query("SELECT COUNT(*) FROM public.automotive_keys WHERE battery_type IS NOT NULL AND battery_type != '' AND battery_type != 'N/A'"),
      client.query("SELECT COUNT(*) FROM public.automotive_keys WHERE image_url IS NOT NULL AND image_url != ''"),
    ]);

    console.log(`  Manufacturers:      ${counts[0].rows[0].count}`);
    console.log(`  Vehicle models:     ${counts[1].rows[0].count}`);
    console.log(`  Vehicle years:      ${counts[2].rows[0].count}`);
    console.log(`  Automotive keys:    ${counts[3].rows[0].count}`);
    console.log(`  Residential locks:  ${counts[4].rows[0].count}`);
    console.log(`  Residential blanks: ${counts[5].rows[0].count}`);
    console.log(`  With lishi_tool:    ${counts[6].rows[0].count}`);
    console.log(`  With FCC ID:        ${counts[7].rows[0].count}`);
    console.log(`  With battery:       ${counts[8].rows[0].count}`);
    console.log(`  With image_url:     ${counts[9].rows[0].count}`);

    // Sample data check
    const sampleMfrs = await client.query("SELECT name, type FROM public.manufacturers ORDER BY name LIMIT 10");
    console.log('\n  Sample manufacturers:');
    for (const row of sampleMfrs.rows) {
      console.log(`    ${row.name} (${row.type})`);
    }

    const sampleKeys = await client.query("SELECT model_name, key_blank, transponder_type FROM public.automotive_keys LIMIT 5");
    console.log('\n  Sample keys:');
    for (const row of sampleKeys.rows) {
      console.log(`    ${row.model_name} - ${row.key_blank} (${row.transponder_type})`);
    }

  } catch (err) {
    console.error(`  Verification error: ${err.message}`);
  }

  await client.end();
  console.log('\nDone!');
}

main().catch(err => {
  console.error('Fatal:', err.message);
  process.exit(1);
});
