import pg from 'pg';
const { Client } = pg;
const client = new Client({ connectionString: 'postgresql://postgres:Yonchforget1!@db.eptnkprttskodgnfeasg.supabase.co:5432/postgres' });

async function main() {
  await client.connect();

  const total = await client.query('SELECT COUNT(*) as cnt FROM automotive_keys');
  console.log('Total automotive keys:', total.rows[0].cnt);

  const byMfr = await client.query(
    "SELECT m.name, COUNT(*) as cnt FROM automotive_keys ak JOIN manufacturers m ON ak.manufacturer_id = m.id GROUP BY m.name ORDER BY cnt DESC"
  );
  console.log('\nBy manufacturer:');
  byMfr.rows.forEach(r => console.log(`  ${r.name}: ${r.cnt}`));

  const withImages = await client.query("SELECT COUNT(*) as cnt FROM automotive_keys WHERE image_url IS NOT NULL AND image_url != ''");
  console.log('\nKeys with images:', withImages.rows[0].cnt);

  const locks = await client.query('SELECT COUNT(*) as cnt FROM residential_locks');
  console.log('Total residential locks:', locks.rows[0].cnt);

  const locksWithImages = await client.query("SELECT COUNT(*) as cnt FROM residential_locks WHERE image_url IS NOT NULL AND image_url != ''");
  console.log('Locks with images:', locksWithImages.rows[0].cnt);

  const mfrsWithLogos = await client.query("SELECT COUNT(*) as cnt FROM manufacturers WHERE logo_url IS NOT NULL AND logo_url != ''");
  const totalMfrs = await client.query('SELECT COUNT(*) as cnt FROM manufacturers');
  console.log('\nManufacturers:', totalMfrs.rows[0].cnt, '| With logos:', mfrsWithLogos.rows[0].cnt);

  // Check storage buckets
  try {
    const buckets = await client.query("SELECT id, name, public FROM storage.buckets");
    console.log('\nStorage buckets:', buckets.rows);
  } catch (e) {
    console.log('\nStorage buckets query failed:', e.message);
  }

  await client.end();
}
main().catch(e => { console.error(e); process.exit(1); });
