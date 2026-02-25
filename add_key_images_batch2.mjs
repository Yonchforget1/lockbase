import pg from 'pg';
const { Client } = pg;

const DB_URL = 'postgresql://postgres:Yonchforget1!@db.eptnkprttskodgnfeasg.supabase.co:5432/postgres';

// ─── FCC ID → Image URL mapping ───────────────────────────────────────────────
// Sources: locksmithkeyless.com, uhs-hardware.com CDN images
const fccImageMap = {
  // ═══ LEXUS ═══
  'HYQ12BBT':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-lexus-06__1_large.jpg?v=1756402600',
  'HYQ14AAB':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-lexus-04clot25__1_large.jpg?v=1759442639',
  'HYQ14ACX':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-lexus-09__1_large.jpg?v=1754517280',
  'HYQ14FBA':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-lexus-15__1_large.jpg?v=1754517286',
  'HYQ14FBB':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-lexus-24c__1_large.jpg?v=1754517291',
  'HYQ14FBC':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-lexus-24c__1_large.jpg?v=1754517291', // same shell as HYQ14FBB
  'HYQ14FBF':  'https://www.locksmithkeyless.com/cdn/shop/files/RC-LEXUS-44__1_3fcce180-9f70-4adc-80a1-6a948ea7634a_large.jpg?v=1756399612',
  'HYQ14FBN':  'https://www.locksmithkeyless.com/cdn/shop/files/RC-LEXUS-44__1_3fcce180-9f70-4adc-80a1-6a948ea7634a_large.jpg?v=1756399612', // same gen shell as HYQ14FBF
  'HYQ14FBZ':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-lexus-38__1_large.jpg?v=1754516856',
  'HYQ14FLC':  'https://www.locksmithkeyless.com/cdn/shop/files/RC-LEXUS-54__1_large.jpg?v=1754516481',

  // ═══ DODGE ═══
  'OHT692427AA': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chrys-44n__1_e0f49dfa-2fcd-4bd8-af40-02eb47e68610_large.jpg?v=1754517194',
  'IYZ-C01C':    'https://www.locksmithkeyless.com/cdn/shop/files/rc-dodge-16__1_large.jpg?v=1756402568',
  'M3N5WY783X':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-dodge-07__1_large.jpg?v=1754517264',
  'GQ4-54T':     'https://www.locksmithkeyless.com/cdn/shop/files/rc-dodge-38__1_large.jpg?v=1754517699',
  'GQ4-53T':     'https://www.locksmithkeyless.com/cdn/shop/products/rc-dodge-21__1_40fe3cad-4cf5-4de2-9f2d-2a5d76b3edd1_large.jpg?v=1759468008',
  'M3N-40821302':'https://www.locksmithkeyless.com/cdn/shop/files/rc-dodge-31c__1_large.jpg?v=1754517378',
  'OHT05176014': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-dodge-42__1_large.jpg?v=1754517362', // Dart fobik (M3N32297100 same shell)

  // ═══ CADILLAC ═══
  'OUC6000066':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-cadi-11__1_large.jpg?v=1754517589',
  'HYQ2AB':      'https://www.locksmithkeyless.com/cdn/shop/files/rc-cadi-24c__1_large.jpg?v=1754517743',
  'HYQ2EB':      'https://www.locksmithkeyless.com/cdn/shop/files/RC-CADI-27__1_large.jpg?v=1767911918',
  'NBG009768T':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-cadi-04__1_large.jpg?v=1754517247',
  'YG0G20TB1':   'https://www.locksmithkeyless.com/cdn/shop/files/rc-cadi-32__1_large.jpg?v=1754516949',
  'YG0G21TB2':   'https://www.locksmithkeyless.com/cdn/shop/files/rc-chevr-127__1_large.jpg?v=1754516962', // Chevy/Cadillac shared platform

  // ═══ JEEP ═══
  // Many share FCC IDs with Dodge above (GQ4-54T, IYZ-C01C, M3N-40821302, OHT692427AA)
  'OHT1130261':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-jeep-31c__1_large.jpg?v=1757016374',
  'M3N-97395900':'https://www.locksmithkeyless.com/cdn/shop/files/rc-jeep-47__1_large.jpg?v=1757099006', // Grand Cherokee WL / Wagoneer
  'OHT692713AA': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-CHRYS-14C__1_ab0865c0-56d8-434b-948f-d9fc5884e855_large.jpg?v=1754691540',

  // ═══ MERCEDES-BENZ ═══
  'IYZ3302':     'https://www.locksmithkeyless.com/cdn/shop/files/rc-benz-05__1_large.jpg?v=1754517083', // same chrome shell as IYZ3312
  'IYZ3312':     'https://www.locksmithkeyless.com/cdn/shop/files/rc-benz-10c__1_large.jpg?v=1756400866',
  'IYZ3317':     'https://www.locksmithkeyless.com/cdn/shop/files/rc-benz-05__1_large.jpg?v=1754517083', // same generation chrome shell
  'IYZDC07':     'https://www.locksmithkeyless.com/cdn/shop/files/rc-benz-01c__1_083c71d3-03f4-4fe6-a368-7208dfb304f9_large.jpg?v=1756400243',
  'IYZDC10':     'https://www.locksmithkeyless.com/cdn/shop/files/rc-benz-01c__1_083c71d3-03f4-4fe6-a368-7208dfb304f9_large.jpg?v=1756400243', // same shell gen
  'IYZDC11':     'https://www.locksmithkeyless.com/cdn/shop/files/rc-benz-01c__1_083c71d3-03f4-4fe6-a368-7208dfb304f9_large.jpg?v=1756400243', // same shell gen
  'IYZDC12K':    'https://www.locksmithkeyless.com/cdn/shop/files/rc-benz-01c__1_083c71d3-03f4-4fe6-a368-7208dfb304f9_large.jpg?v=1756400243', // same shell gen

  // ═══ VOLKSWAGEN ═══
  'NBG010206T':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-vw-46c__1_large.jpg?v=1754516988',
  'HLO1J0959753AM':'https://www.locksmithkeyless.com/cdn/shop/files/rc-vw-03c__1_07d407a1-02b3-493a-882c-2efe1d476689_large.jpg?v=1754517120',
  'NBG735868T':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-vw-03c__1_07d407a1-02b3-493a-882c-2efe1d476689_large.jpg?v=1754517120', // same shell as HLO1J0
  'NBG010180T':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-vw-12__1_180d5f86-7c1a-4788-ac02-7614c82fb229_large.jpg?v=1756402791',
  'NBG009066T':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-vw-40__1_large.jpg?v=1754517138',
  'KR5FS14-T':   'https://www.locksmithkeyless.com/cdn/shop/files/RC-VW-04__1_e2d9dd21-8b50-4e69-85ad-8e1de2089268_large.jpg?v=1754516699',
  'IYZVWTOUA':   'https://www.locksmithkeyless.com/cdn/shop/files/rc-vw-40__1_large.jpg?v=1754517138', // Touareg smart key, similar shell
  'KR55WK45022': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-vw-40__1_large.jpg?v=1754517138', // Touareg smart key, similar shell
};

// ─── Key blank → Image URL mapping (for keys with no FCC ID) ──────────────────
// These are transponder-only keys (no remote), use key blank images
const keyBlankImageMap = {
  // Cadillac transponder keys
  'B106-PT': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-cadi-11__1_large.jpg?v=1754517589',  // Cadillac transponder
  'B99-PT':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-cadi-11__1_large.jpg?v=1754517589',
  'B97-PT':  'https://www.locksmithkeyless.com/cdn/shop/files/rc-cadi-11__1_large.jpg?v=1754517589',
  'B111-PT_cadillac': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-cadi-11__1_large.jpg?v=1754517589',

  // Dodge transponder keys
  'Y159-PT': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chrys-44n__1_e0f49dfa-2fcd-4bd8-af40-02eb47e68610_large.jpg?v=1754517194',
  'Y170-PT': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-dodge-16__1_large.jpg?v=1756402568',
  'Y164-PT': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chrys-44n__1_e0f49dfa-2fcd-4bd8-af40-02eb47e68610_large.jpg?v=1754517194',
  'Y160-PT_dodge': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chrys-44n__1_e0f49dfa-2fcd-4bd8-af40-02eb47e68610_large.jpg?v=1754517194',

  // Jeep transponder keys (many share with Dodge)
  'Y159-PT_jeep': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chrys-44n__1_e0f49dfa-2fcd-4bd8-af40-02eb47e68610_large.jpg?v=1754517194',
  'Y160-PT_jeep': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chrys-44n__1_e0f49dfa-2fcd-4bd8-af40-02eb47e68610_large.jpg?v=1754517194',
  'CY24_jeep': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-jeep-31c__1_large.jpg?v=1757016374',
  'MIT14-PT_jeep': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-CHRYS-14C__1_ab0865c0-56d8-434b-948f-d9fc5884e855_large.jpg?v=1754691540',

  // Lexus transponder keys
  'TOY48_lexus': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-lexus-06__1_large.jpg?v=1756402600',

  // Mercedes transponder keys
  'HU64_mercedes': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-benz-05__1_large.jpg?v=1754517083',

  // VW transponder keys
  'HU66_vw': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-vw-03c__1_07d407a1-02b3-493a-882c-2efe1d476689_large.jpg?v=1754517120',
};

// ─── Manufacturer IDs ─────────────────────────────────────────────────────────
const MANUFACTURERS = {
  'eaeea95b-d833-45c4-ad93-0a1f1229ca5b': 'Lexus',
  'b864cdbb-444f-4ff9-b54d-4b66888a5b64': 'Dodge',
  '47cdc256-7e6a-450d-ba9b-c267432cccf7': 'Cadillac',
  '7613f885-319a-4a0d-8167-e930804c4431': 'Jeep',
  'eb5d03cc-6843-4a5f-a297-4ef61835674b': 'Mercedes-Benz',
  '9200101e-47ca-40d9-8658-02b7cc400f25': 'Volkswagen',
};

// Helper: resolve image URL for a key row
function resolveImageUrl(row) {
  // 1. Try FCC ID match
  if (row.fcc_id && fccImageMap[row.fcc_id]) {
    return fccImageMap[row.fcc_id];
  }

  // 2. For keys with no FCC ID, use manufacturer+key_blank combo
  const mfr = MANUFACTURERS[row.manufacturer_id];
  if (!mfr) return null;

  const kb = row.key_blank;
  if (!kb) return null;

  // manufacturer-specific key blank lookup
  const mfrKey = mfr.toLowerCase().replace('-', '');
  const lookupKeys = [
    `${kb}_${mfrKey}`,
    kb,
  ];

  for (const k of lookupKeys) {
    if (keyBlankImageMap[k]) return keyBlankImageMap[k];
  }

  // 3. Fallback by manufacturer + key blank type
  if (mfr === 'Lexus' && kb.startsWith('TOY')) {
    return keyBlankImageMap['TOY48_lexus'];
  }
  if (mfr === 'Mercedes-Benz' && kb.startsWith('HU64')) {
    return keyBlankImageMap['HU64_mercedes'];
  }
  if (mfr === 'Volkswagen' && kb.startsWith('HU66')) {
    return keyBlankImageMap['HU66_vw'];
  }
  if ((mfr === 'Dodge' || mfr === 'Jeep') && kb.startsWith('Y1')) {
    return 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chrys-44n__1_e0f49dfa-2fcd-4bd8-af40-02eb47e68610_large.jpg?v=1754517194';
  }
  if ((mfr === 'Dodge' || mfr === 'Jeep') && kb === 'CY24') {
    return 'https://www.locksmithkeyless.com/cdn/shop/files/rc-dodge-31c__1_large.jpg?v=1754517378';
  }
  if ((mfr === 'Dodge' || mfr === 'Jeep') && kb.startsWith('MIT14')) {
    return 'https://www.locksmithkeyless.com/cdn/shop/files/RC-CHRYS-14C__1_ab0865c0-56d8-434b-948f-d9fc5884e855_large.jpg?v=1754691540';
  }
  if (mfr === 'Cadillac' && (kb.startsWith('B') || kb === 'HU100')) {
    return 'https://www.locksmithkeyless.com/cdn/shop/files/rc-cadi-24c__1_large.jpg?v=1754517743';
  }
  if ((mfr === 'Dodge' || mfr === 'Jeep') && kb.startsWith('SIP22')) {
    return 'https://www.locksmithkeyless.com/cdn/shop/files/rc-dodge-31c__1_large.jpg?v=1754517378';
  }
  if (mfr === 'Volkswagen' && kb.startsWith('HU162')) {
    return 'https://www.locksmithkeyless.com/cdn/shop/files/RC-VW-04__1_e2d9dd21-8b50-4e69-85ad-8e1de2089268_large.jpg?v=1754516699';
  }

  return null;
}

// ─── Main ─────────────────────────────────────────────────────────────────────
async function main() {
  const client = new Client(DB_URL);
  await client.connect();
  console.log('Connected to database.\n');

  // 1. Query all keys without images for these manufacturers
  const mfrIds = Object.keys(MANUFACTURERS);
  const res = await client.query(`
    SELECT id, fcc_id, model_name, key_blank, manufacturer_id
    FROM automotive_keys
    WHERE (image_url IS NULL OR image_url = '')
    AND manufacturer_id = ANY($1)
    ORDER BY manufacturer_id, fcc_id
  `, [mfrIds]);

  console.log(`Found ${res.rows.length} keys missing images.\n`);

  // 2. Resolve images
  const updates = [];
  const noImage = [];
  const perMfr = {};

  for (const row of res.rows) {
    const mfr = MANUFACTURERS[row.manufacturer_id];
    if (!perMfr[mfr]) perMfr[mfr] = { total: 0, updated: 0, skipped: 0 };
    perMfr[mfr].total++;

    const url = resolveImageUrl(row);
    if (url) {
      updates.push({ id: row.id, url });
      perMfr[mfr].updated++;
    } else {
      noImage.push(row);
      perMfr[mfr].skipped++;
    }
  }

  // 3. Batch update
  if (updates.length > 0) {
    console.log(`Updating ${updates.length} keys with images...\n`);

    // Use batch UPDATE with unnest for efficiency
    const ids = updates.map(u => u.id);
    const urls = updates.map(u => u.url);

    await client.query(`
      UPDATE automotive_keys AS ak
      SET image_url = data.url
      FROM (
        SELECT unnest($1::uuid[]) AS id, unnest($2::text[]) AS url
      ) AS data
      WHERE ak.id = data.id
    `, [ids, urls]);

    console.log(`Successfully updated ${updates.length} keys.\n`);
  }

  // 4. Print summary
  console.log('=== SUMMARY BY MANUFACTURER ===');
  for (const [mfr, counts] of Object.entries(perMfr).sort((a, b) => a[0].localeCompare(b[0]))) {
    console.log(`  ${mfr}: ${counts.updated}/${counts.total} updated (${counts.skipped} skipped)`);
  }
  console.log(`\n  TOTAL: ${updates.length} updated, ${noImage.length} skipped`);

  if (noImage.length > 0) {
    console.log('\n=== KEYS WITHOUT IMAGES (skipped) ===');
    for (const row of noImage) {
      const mfr = MANUFACTURERS[row.manufacturer_id];
      console.log(`  [${mfr}] ${row.model_name} | FCC: ${row.fcc_id || 'N/A'} | Blank: ${row.key_blank}`);
    }
  }

  // 5. Verify
  const verify = await client.query(`
    SELECT m.name, COUNT(*) as total,
      SUM(CASE WHEN ak.image_url IS NOT NULL AND ak.image_url != '' THEN 1 ELSE 0 END) as with_image,
      SUM(CASE WHEN ak.image_url IS NULL OR ak.image_url = '' THEN 1 ELSE 0 END) as without_image
    FROM automotive_keys ak
    JOIN manufacturers m ON ak.manufacturer_id = m.id
    WHERE ak.manufacturer_id = ANY($1)
    GROUP BY m.name
    ORDER BY m.name
  `, [mfrIds]);

  console.log('\n=== POST-UPDATE IMAGE COVERAGE ===');
  for (const row of verify.rows) {
    const pct = Math.round((row.with_image / row.total) * 100);
    console.log(`  ${row.name}: ${row.with_image}/${row.total} have images (${pct}%)`);
  }

  await client.end();
  console.log('\nDone.');
}

main().catch(err => {
  console.error('Error:', err);
  process.exit(1);
});
