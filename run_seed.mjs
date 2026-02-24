import pg from 'pg';
import fs from 'fs';
import path from 'path';

const { Client } = pg;

const client = new Client({
  host: 'db.eptnkprttskodgnfeasg.supabase.co',
  port: 5432,
  database: 'postgres',
  user: 'postgres',
  password: process.env.SUPA_DB_PASS,
  ssl: { rejectUnauthorized: false },
  // Large SQL needs longer timeout
  statement_timeout: 120000,
});

const seedDir = path.join(process.cwd(), 'supabase', 'seed');

const parts = [
  'MASTER_SEED_PART1.sql',
  'MASTER_SEED_PART2.sql',
  'MASTER_SEED_PART3a.sql',
  'MASTER_SEED_PART3b.sql',
  'MASTER_SEED_PART4.sql',
];

async function main() {
  console.log('Connecting to Supabase database...');
  await client.connect();
  console.log('Connected!\n');

  for (const filename of parts) {
    const filepath = path.join(seedDir, filename);
    if (!fs.existsSync(filepath)) {
      console.log(`SKIP: ${filename} not found`);
      continue;
    }
    const sql = fs.readFileSync(filepath, 'utf-8');
    const sizeKB = Math.round(sql.length / 1024);
    console.log(`Running ${filename} (${sizeKB} KB)...`);
    const start = Date.now();
    try {
      await client.query(sql);
      const elapsed = ((Date.now() - start) / 1000).toFixed(1);
      console.log(`  OK (${elapsed}s)\n`);
    } catch (err) {
      const elapsed = ((Date.now() - start) / 1000).toFixed(1);
      console.error(`  FAILED after ${elapsed}s`);
      console.error(`  Error: ${err.message}`);
      console.error(`  Detail: ${err.detail || 'none'}`);
      console.error(`  Position: ${err.position || 'none'}`);
      await client.end();
      process.exit(1);
    }
  }

  // Quick verification
  console.log('Verifying data...');
  const counts = await Promise.all([
    client.query('SELECT COUNT(*) FROM public.manufacturers'),
    client.query('SELECT COUNT(*) FROM public.vehicle_models'),
    client.query('SELECT COUNT(*) FROM public.automotive_keys'),
    client.query('SELECT COUNT(*) FROM public.residential_locks'),
    client.query("SELECT COUNT(*) FROM public.automotive_keys WHERE lishi_tool IS NOT NULL"),
    client.query("SELECT COUNT(*) FROM public.automotive_keys WHERE fcc_id IS NOT NULL"),
    client.query("SELECT COUNT(*) FROM public.automotive_keys WHERE battery_type IS NOT NULL"),
  ]);

  console.log(`  Manufacturers:    ${counts[0].rows[0].count}`);
  console.log(`  Vehicle models:   ${counts[1].rows[0].count}`);
  console.log(`  Automotive keys:  ${counts[2].rows[0].count}`);
  console.log(`  Residential locks:${counts[3].rows[0].count}`);
  console.log(`  Lishi tool filled:${counts[4].rows[0].count}`);
  console.log(`  FCC ID filled:    ${counts[5].rows[0].count}`);
  console.log(`  Battery filled:   ${counts[6].rows[0].count}`);

  await client.end();
  console.log('\nDone!');
}

main().catch(err => {
  console.error('Fatal:', err.message);
  process.exit(1);
});
