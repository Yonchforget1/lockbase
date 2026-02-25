import pg from 'pg';
const { Client } = pg;

const client = new Client({
  host: 'db.eptnkprttskodgnfeasg.supabase.co',
  port: 5432,
  database: 'postgres',
  user: 'postgres',
  password: 'Yonchforget1!',
  ssl: { rejectUnauthorized: false }
});

await client.connect();
console.log('Connected to database.\n');

const changes = { inserts: [], updates: [], errors: [] };

// ============================================================
// HELPER: Get manufacturer_id
// ============================================================
const mfgIds = {
  Honda: 'b68edab6-f74a-4e2d-8ac9-22654e2e2fe6',
  Toyota: '66d71230-7c63-4e78-a835-8146f75fc3d3',
  Ford: '77d79363-9036-4db2-9958-8a32439e6a92',
  Chevrolet: '6715ba9c-427d-4ec0-b22c-2add8ef712b4'
};

// ============================================================
// HELPER: Get year_id for a model
// ============================================================
async function getYearId(mfgId, modelName, yearStart, yearEnd) {
  // Strip brand prefix from model_name to match vehicle_models.name
  // e.g. "Honda Odyssey" -> "Odyssey", "Ford F-150" -> "F-150"
  const mfgIdToPrefix = {
    [mfgIds.Honda]: 'Honda ',
    [mfgIds.Toyota]: 'Toyota ',
    [mfgIds.Ford]: 'Ford ',
    [mfgIds.Chevrolet]: 'Chevrolet '
  };
  const prefix = mfgIdToPrefix[mfgId] || '';
  const shortName = modelName.startsWith(prefix) ? modelName.slice(prefix.length) : modelName;

  // Find vehicle_model
  const modelRes = await client.query(
    `SELECT id FROM vehicle_models WHERE manufacturer_id = $1 AND name = $2`,
    [mfgId, shortName]
  );
  if (modelRes.rows.length === 0) {
    // Try to find by inserting
    throw new Error(`Model not found: ${modelName} for mfg ${mfgId}`);
  }
  const modelId = modelRes.rows[0].id;

  // Find or create year entry
  const yearRes = await client.query(
    `SELECT id FROM vehicle_years WHERE model_id = $1 AND year_start = $2 AND year_end = $3`,
    [modelId, yearStart, yearEnd]
  );
  if (yearRes.rows.length > 0) {
    return yearRes.rows[0].id;
  }
  // Create new year entry
  const insertRes = await client.query(
    `INSERT INTO vehicle_years (id, model_id, year_start, year_end) VALUES (gen_random_uuid(), $1, $2, $3) RETURNING id`,
    [modelId, yearStart, yearEnd]
  );
  return insertRes.rows[0].id;
}

// ============================================================
// HELPER: Check if a row already exists (avoid duplicates)
// ============================================================
async function rowExists(mfgId, modelName, yearStart, yearEnd, fccId, buttons) {
  const res = await client.query(
    `SELECT id FROM automotive_keys
     WHERE manufacturer_id = $1 AND model_name = $2 AND year_start = $3 AND year_end = $4
     AND fcc_id = $5 AND buttons = $6`,
    [mfgId, modelName, yearStart, yearEnd, fccId, buttons]
  );
  return res.rows.length > 0;
}

// ============================================================
// HELPER: Insert a new key variant
// ============================================================
async function insertVariant(data) {
  const {
    make, modelName, yearStart, yearEnd, keyType, fccId, icNumber,
    buttons, batteryType, keyBlank, emergencyKeyBlank, testKeyBlank,
    transponderType, chipType, remoteFrequency, pinCodeRequired, obdProgrammable,
    programmingNotes, imageUrl, lishiTool
  } = data;

  const mfgId = mfgIds[make];

  // Check for duplicate
  const exists = await rowExists(mfgId, modelName, yearStart, yearEnd, fccId, buttons);
  if (exists) {
    console.log(`  SKIP (exists): ${make} ${modelName} ${yearStart}-${yearEnd} ${fccId} ${buttons}`);
    return;
  }

  const yearId = await getYearId(mfgId, modelName, yearStart, yearEnd);

  await client.query(
    `INSERT INTO automotive_keys (
      id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type,
      remote_frequency, key_type, fcc_id, programming_notes, pin_code_required,
      obd_programmable, emergency_key_blank, year_start, year_end, ic_number,
      battery_type, buttons, test_key_blank, image_url, lishi_tool
    ) VALUES (
      gen_random_uuid(), $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21
    )`,
    [
      yearId, mfgId, modelName, keyBlank, transponderType, chipType,
      remoteFrequency, keyType, fccId, programmingNotes, pinCodeRequired,
      obdProgrammable, emergencyKeyBlank, yearStart, yearEnd, icNumber,
      batteryType, buttons, testKeyBlank, imageUrl, lishiTool
    ]
  );

  const desc = `${make} ${modelName} ${yearStart}-${yearEnd} | ${keyType} | ${fccId} | ${buttons}`;
  changes.inserts.push(desc);
  console.log(`  INSERTED: ${desc}`);
}

// ============================================================
// PART 1: CAPITALIZATION & FIELD FIXES
// ============================================================
console.log('=== PART 1: CAPITALIZATION & FIELD FIXES ===\n');

// Fix all FCC IDs to uppercase
const fccRows = await client.query(
  `SELECT id, fcc_id FROM automotive_keys WHERE fcc_id IS NOT NULL AND fcc_id != UPPER(fcc_id)
   AND manufacturer_id IN ($1, $2, $3, $4)`,
  [mfgIds.Honda, mfgIds.Toyota, mfgIds.Ford, mfgIds.Chevrolet]
);
for (const row of fccRows.rows) {
  const upper = row.fcc_id.toUpperCase();
  await client.query(`UPDATE automotive_keys SET fcc_id = $1 WHERE id = $2`, [upper, row.id]);
  changes.updates.push(`FCC ID capitalization: ${row.fcc_id} -> ${upper}`);
  console.log(`  FIX FCC: ${row.fcc_id} -> ${upper}`);
}

// Fix all IC numbers to uppercase
const icRows = await client.query(
  `SELECT id, ic_number FROM automotive_keys WHERE ic_number IS NOT NULL AND ic_number != UPPER(ic_number)
   AND manufacturer_id IN ($1, $2, $3, $4)`,
  [mfgIds.Honda, mfgIds.Toyota, mfgIds.Ford, mfgIds.Chevrolet]
);
for (const row of icRows.rows) {
  const upper = row.ic_number.toUpperCase();
  await client.query(`UPDATE automotive_keys SET ic_number = $1 WHERE id = $2`, [upper, row.id]);
  changes.updates.push(`IC number capitalization: ${row.ic_number} -> ${upper}`);
  console.log(`  FIX IC: ${row.ic_number} -> ${upper}`);
}

// Fix battery_type capitalization (CR2032, CR2450, CR1616, etc.)
const battRows = await client.query(
  `SELECT id, battery_type FROM automotive_keys WHERE battery_type IS NOT NULL AND battery_type != UPPER(battery_type)
   AND manufacturer_id IN ($1, $2, $3, $4)`,
  [mfgIds.Honda, mfgIds.Toyota, mfgIds.Ford, mfgIds.Chevrolet]
);
for (const row of battRows.rows) {
  const upper = row.battery_type.toUpperCase();
  await client.query(`UPDATE automotive_keys SET battery_type = $1 WHERE id = $2`, [upper, row.id]);
  changes.updates.push(`Battery capitalization: ${row.battery_type} -> ${upper}`);
  console.log(`  FIX BATT: ${row.battery_type} -> ${upper}`);
}

// ============================================================
// PART 2: EMERGENCY KEY BLANK FIXES
// For Honda smart keys, HO01 IS the correct emergency blank.
// HO01 = HON66 keyway = the standard Honda high-security blank.
// The insert blade for smart keys is also HO01 profile.
// For newer Hondas (2022+), LXP90 is correct.
// Make sure emergency_key_blank matches what's expected.
// ============================================================
console.log('\n=== PART 2: EMERGENCY KEY BLANK FIXES ===\n');

// Honda smart keys should have emergency_key_blank set properly
// HO01 is correct for 2013-2021 Honda smart keys (the emergency blade IS the HO01/HON66 keyway)
// For Honda smart keys where emergency blank is set to HO01, that's correct

// Fix any Honda smart keys missing emergency_key_blank
const hondaSmartMissing = await client.query(
  `SELECT id, model_name, year_start, year_end, key_blank, emergency_key_blank
   FROM automotive_keys
   WHERE manufacturer_id = $1 AND key_type = 'smart_key' AND emergency_key_blank IS NULL`,
  [mfgIds.Honda]
);
for (const row of hondaSmartMissing.rows) {
  let correctBlank = 'HO01';
  if (row.year_start >= 2022 && row.key_blank === 'LXP90') {
    correctBlank = 'LXP90';
  }
  await client.query(`UPDATE automotive_keys SET emergency_key_blank = $1 WHERE id = $2`, [correctBlank, row.id]);
  changes.updates.push(`Honda ${row.model_name} ${row.year_start}: Set emergency_key_blank = ${correctBlank}`);
  console.log(`  FIX EMERGENCY: Honda ${row.model_name} ${row.year_start}-${row.year_end}: set emergency_key_blank = ${correctBlank}`);
}

// ============================================================
// PART 3: IMAGE URL FIXES - ensure every row has an image
// ============================================================
console.log('\n=== PART 3: IMAGE URL FIXES ===\n');

const noImage = await client.query(
  `SELECT id, model_name, year_start, year_end, key_type, manufacturer_id
   FROM automotive_keys
   WHERE image_url IS NULL
   AND manufacturer_id IN ($1, $2, $3, $4)`,
  [mfgIds.Honda, mfgIds.Toyota, mfgIds.Ford, mfgIds.Chevrolet]
);

// Generic fallback images by brand and key type
const fallbackImages = {
  Honda: {
    smart_key: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-5B1_480x480.jpg',
    transponder: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RKS-HON-066_480x480.jpg',
    standard: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HON66_480x480.jpg'
  },
  Toyota: {
    smart_key: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-TOY-4B_480x480.jpg',
    transponder: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RHK-TOY-4B1_480x480.jpg',
    standard: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY43_480x480.jpg'
  },
  Ford: {
    smart_key: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/20_ford_5b_smart_peps_480x480.jpg',
    transponder: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/20_ford_3b_flip_480x480.jpg',
    standard: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/Ford_H84_480x480.jpg'
  },
  Chevrolet: {
    smart_key: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/20_gm_5b_smart_480x480.jpg',
    transponder: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/20_gm_4b_flip_480x480.jpg',
    standard: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/GM_B111_480x480.jpg'
  }
};

const mfgIdToName = {};
for (const [name, id] of Object.entries(mfgIds)) {
  mfgIdToName[id] = name;
}

for (const row of noImage.rows) {
  const brand = mfgIdToName[row.manufacturer_id];
  const img = fallbackImages[brand]?.[row.key_type] || fallbackImages[brand]?.standard;
  if (img) {
    await client.query(`UPDATE automotive_keys SET image_url = $1 WHERE id = $2`, [img, row.id]);
    changes.updates.push(`Added image_url for ${brand} ${row.model_name} ${row.year_start}-${row.year_end}`);
    console.log(`  FIX IMAGE: ${brand} ${row.model_name} ${row.year_start}-${row.year_end} -> set image`);
  }
}

// ============================================================
// PART 4: ADD MISSING VARIANTS
// ============================================================
console.log('\n=== PART 4: ADD MISSING KEY VARIANTS ===\n');

// ---------------------------------------------------------------
// 4.1 Honda Odyssey 2018-2020: 4-button KR5V2X (base, no power doors)
// Currently has 7-button KR5V2X. Missing 4-button for EX base.
// ---------------------------------------------------------------
console.log('-- Honda Odyssey 2018-2020: 4-button base variant --');
await insertVariant({
  make: 'Honda',
  modelName: 'Honda Odyssey',
  yearStart: 2018,
  yearEnd: 2020,
  keyType: 'smart_key',
  fccId: 'KR5V2X',
  icNumber: '7812D-V2X',
  buttons: 'Lock, Unlock, Hatch, Panic',
  batteryType: 'CR2032',
  keyBlank: 'HO01',
  emergencyKeyBlank: 'HO01',
  testKeyBlank: 'HO01',
  transponderType: 'Hitag 3',
  chipType: 'ID 47',
  remoteFrequency: '433 MHz',
  pinCodeRequired: false,
  obdProgrammable: true,
  programmingNotes: '5th gen Odyssey LX/EX base (without power sliding doors). 4-button smart key. 433 MHz. KR5V2X V41. PN: 72147-THR-A01. Same FCC ID as 7-button but fewer buttons (no sliding door or remote start controls). Honda HDS or aftermarket.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-4B1_480x480.jpg',
  lishiTool: 'Lishi HON66'
});

// ---------------------------------------------------------------
// 4.2 Honda Odyssey 2021-2022: 5-button KR5T4X (without power doors)
// Currently has 7-button KR5T4X only.
// The Odyssey 2021-2022 also had an EX trim with fewer buttons.
// ---------------------------------------------------------------
console.log('-- Honda Odyssey 2021-2022: 5-button variant (no power doors) --');
await insertVariant({
  make: 'Honda',
  modelName: 'Honda Odyssey',
  yearStart: 2021,
  yearEnd: 2022,
  keyType: 'smart_key',
  fccId: 'KR5T4X',
  icNumber: '7812D-T4X',
  buttons: 'Lock, Unlock, Hatch, Panic, Remote Start',
  batteryType: 'CR2032',
  keyBlank: 'HO01',
  emergencyKeyBlank: 'HO01',
  testKeyBlank: 'HO01',
  transponderType: 'Hitag 3',
  chipType: 'ID 47',
  remoteFrequency: '433 MHz',
  pinCodeRequired: false,
  obdProgrammable: true,
  programmingNotes: '5th gen Odyssey EX (without power sliding doors). 5-button smart key. 433 MHz. KR5T4X. Does NOT have power door buttons. Honda HDS or aftermarket tool.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-5B1_480x480.jpg',
  lishiTool: 'Lishi HON66'
});

// ---------------------------------------------------------------
// 4.3 Honda Pilot 2016-2018: 4-button KR5V2X (LX/EX base - no remote start)
// Currently has 5-button (Lock, Unlock, Panic, Hatch, Remote Start).
// Missing 4-button for LX/EX without remote start.
// ---------------------------------------------------------------
console.log('-- Honda Pilot 2016-2018: 4-button base variant --');
await insertVariant({
  make: 'Honda',
  modelName: 'Honda Pilot',
  yearStart: 2016,
  yearEnd: 2018,
  keyType: 'smart_key',
  fccId: 'KR5V2X',
  icNumber: '7812D-V2X',
  buttons: 'Lock, Unlock, Hatch, Panic',
  batteryType: 'CR2032',
  keyBlank: 'HO01',
  emergencyKeyBlank: 'HO01',
  testKeyBlank: 'HO01',
  transponderType: 'Hitag 3',
  chipType: 'ID 47',
  remoteFrequency: '434 MHz',
  pinCodeRequired: false,
  obdProgrammable: true,
  programmingNotes: '3rd gen Pilot LX/EX (without remote start). 4-button smart key. 434 MHz. KR5V2X. PN: 72147-TG7-A01. Does NOT have remote start button. Honda HDS or aftermarket.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-4B1_480x480.jpg',
  lishiTool: 'Lishi HON66'
});

// ---------------------------------------------------------------
// 4.4 Honda Pilot 2019-2022: 4-button KR5V44 variant (base trims)
// Currently has 5-button KR5V44. Missing 4-button for base trims.
// ---------------------------------------------------------------
console.log('-- Honda Pilot 2019-2022: 4-button base variant --');
await insertVariant({
  make: 'Honda',
  modelName: 'Honda Pilot',
  yearStart: 2019,
  yearEnd: 2022,
  keyType: 'smart_key',
  fccId: 'KR5V44',
  icNumber: '7812D-V44',
  buttons: 'Lock, Unlock, Hatch, Panic',
  batteryType: 'CR2032',
  keyBlank: 'HO01',
  emergencyKeyBlank: 'HO01',
  testKeyBlank: 'HO01',
  transponderType: 'Hitag 3',
  chipType: 'ID 47',
  remoteFrequency: '433 MHz',
  pinCodeRequired: false,
  obdProgrammable: true,
  programmingNotes: '3rd gen Pilot LX/EX (without remote start). 4-button smart key. 433 MHz. KR5V44. Does NOT have remote start. Honda HDS or aftermarket tool.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-4B1_480x480.jpg',
  lishiTool: 'Lishi HON66'
});

// ---------------------------------------------------------------
// 4.5 Toyota Sienna 2021-2024: 5-button HYQ14FBX (without power liftgate)
// Currently has 6-button. Missing 5-button variant.
// PN: 8990H-08020 (5-button) vs 8990H-08010 (6-button)
// ---------------------------------------------------------------
console.log('-- Toyota Sienna 2021-2024: 5-button variant --');
await insertVariant({
  make: 'Toyota',
  modelName: 'Toyota Sienna',
  yearStart: 2021,
  yearEnd: 2024,
  keyType: 'smart_key',
  fccId: 'HYQ14FBX',
  icNumber: '1551A-14FBX',
  buttons: 'Lock, Unlock, Left Sliding Door, Right Sliding Door, Panic',
  batteryType: 'CR2450',
  keyBlank: 'TOY51',
  emergencyKeyBlank: 'TOY51',
  testKeyBlank: 'LXP90',
  transponderType: 'Texas Crypto 128-bit AES',
  chipType: 'H Chip (8A)',
  remoteFrequency: '315 MHz',
  pinCodeRequired: false,
  obdProgrammable: false,
  programmingNotes: '5-button smart key for LE/XLE trims without power liftgate. PN: 8990H-08020. Same FCC ID HYQ14FBX as 6-button but without Hatch button. CR2450 battery. Emergency blade EKB-TOY-LK20.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/20_toyota_sienna_5b_smart_480x480.jpg',
  lishiTool: 'Lishi TOY43'
});

// ---------------------------------------------------------------
// 4.6 Toyota Highlander 2014-2019: 3-button HYQ14FBA variant (base LE)
// Currently only has 4-button. Some base LE trims use 3-button (no hatch).
// ---------------------------------------------------------------
console.log('-- Toyota Highlander 2014-2019: 3-button base variant --');
await insertVariant({
  make: 'Toyota',
  modelName: 'Toyota Highlander',
  yearStart: 2014,
  yearEnd: 2019,
  keyType: 'smart_key',
  fccId: 'HYQ14FBA',
  icNumber: '1551A-14FBA',
  buttons: 'Lock, Unlock, Panic',
  batteryType: 'CR2032',
  keyBlank: 'TOY51',
  emergencyKeyBlank: 'TOY51',
  testKeyBlank: 'TOY51',
  transponderType: 'Texas Crypto 128-bit AES',
  chipType: 'H Chip (8A)',
  remoteFrequency: '315 MHz',
  pinCodeRequired: false,
  obdProgrammable: false,
  programmingNotes: '3-button smart key for LE base trim (without power liftgate). AG Board 2110. Same FCC ID HYQ14FBA as 4-button variant but without Hatch button. PN: 89904-0E121. Emergency blade K-TOY-EM36.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/20_toyota_3b_smart_480x480.jpg',
  lishiTool: 'Lishi TOY43'
});

// ---------------------------------------------------------------
// 4.7 Ford F-150 2017-2022: 4-button smart key (without tailgate)
// Currently has 5-button M3N-A2C93142600 with tailgate.
// Some trims had 4-button (no tailgate release).
// ---------------------------------------------------------------
console.log('-- Ford F-150 2017-2022: 4-button smart key (no tailgate) --');
await insertVariant({
  make: 'Ford',
  modelName: 'Ford F-150',
  yearStart: 2017,
  yearEnd: 2022,
  keyType: 'smart_key',
  fccId: 'M3N-A2C93142600',
  icNumber: '7812A-A2C93142600',
  buttons: 'Lock, Unlock, Panic, Remote Start',
  batteryType: 'CR2450',
  keyBlank: 'HU101',
  emergencyKeyBlank: 'HU101',
  testKeyBlank: null,
  transponderType: 'NXP HITAG PRO',
  chipType: 'ID49 128-bit',
  remoteFrequency: '902 MHz',
  pinCodeRequired: false,
  obdProgrammable: true,
  programmingNotes: 'Intelligent Access 4-button smart key (without tailgate release button). 902 MHz. For Lariat/King Ranch trims without bed utility group. Same FCC as 5-button but no tailgate. Ford IDS/FDRS or Autel IM608/SmartPro.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/20_ford_4b_smart_peps_480x480.jpg',
  lishiTool: 'Lishi HU101'
});

// ---------------------------------------------------------------
// 4.8 Ford Explorer 2020-2024: 4-button smart key (without remote start)
// Currently has 5-button only. Some base trims had 4-button.
// ---------------------------------------------------------------
console.log('-- Ford Explorer 2020-2024: 4-button smart key (no remote start) --');
await insertVariant({
  make: 'Ford',
  modelName: 'Ford Explorer',
  yearStart: 2020,
  yearEnd: 2024,
  keyType: 'smart_key',
  fccId: 'M3N-A2C93142600',
  icNumber: '7812A-A2C93142600',
  buttons: 'Lock, Unlock, Panic, Hatch',
  batteryType: 'CR2450',
  keyBlank: 'HU101',
  emergencyKeyBlank: 'HU101',
  testKeyBlank: null,
  transponderType: 'NXP HITAG PRO',
  chipType: 'ID49 128-bit',
  remoteFrequency: '902 MHz',
  pinCodeRequired: false,
  obdProgrammable: true,
  programmingNotes: '6th gen Explorer. 4-button smart key for base/XLT trims without remote start option. PN: 164-R8198. Same FCC as 5-button variant but without Remote Start button. Ford IDS/FDRS or Autel IM608/SmartPro.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/20_ford_4b_smart_peps_480x480.jpg',
  lishiTool: 'Lishi HU101'
});

// ---------------------------------------------------------------
// 4.9 Chevrolet Silverado 2019-2021: 4-button HYQ1EA (base Custom)
// Currently has 5-button (with tailgate). Missing base 4-button.
// ---------------------------------------------------------------
console.log('-- Chevrolet Silverado 2019-2021: 4-button base variant --');
await insertVariant({
  make: 'Chevrolet',
  modelName: 'Chevrolet Silverado',
  yearStart: 2019,
  yearEnd: 2021,
  keyType: 'smart_key',
  fccId: 'HYQ1EA',
  icNumber: '1551A-1EA',
  buttons: 'Lock, Unlock, Remote Start, Panic',
  batteryType: 'CR2032',
  keyBlank: 'HU100',
  emergencyKeyBlank: 'HU100',
  testKeyBlank: 'HU100',
  transponderType: 'HITAG PRO (ID49)',
  chipType: 'NXP HITAG PRO ID49',
  remoteFrequency: '434 MHz',
  pinCodeRequired: false,
  obdProgrammable: true,
  programmingNotes: 'Silverado Custom/LT base. 4-button smart key (without tailgate release). 434 MHz. PN: 13508398 variant. Same FCC HYQ1EA as 5-button but no tailgate button. Push-button start. GM MDI2/SPS2 or Autel/SmartPro.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/20_gm_4b_smart_480x480.jpg',
  lishiTool: 'Lishi HU100'
});

// ---------------------------------------------------------------
// 4.10 Chevrolet Tahoe 2021-2024: 6-button with rear glass
// Currently has 5-button. Missing 6-button (with rear glass).
// PN: 13537962 (6-button) vs 13541559 (5-button)
// ---------------------------------------------------------------
console.log('-- Chevrolet Tahoe 2021-2024: 6-button with rear glass --');
await insertVariant({
  make: 'Chevrolet',
  modelName: 'Chevrolet Tahoe',
  yearStart: 2021,
  yearEnd: 2024,
  keyType: 'smart_key',
  fccId: 'YG0G21TB2',
  icNumber: '4008C-G21TB2',
  buttons: 'Lock, Unlock, Remote Start, Panic, Hatch, Rear Glass',
  batteryType: 'CR2450',
  keyBlank: 'HU100',
  emergencyKeyBlank: 'HU100',
  testKeyBlank: 'HU100',
  transponderType: 'HITAG PRO (ID49)',
  chipType: 'NXP HITAG PRO ID49',
  remoteFrequency: '433 MHz',
  pinCodeRequired: false,
  obdProgrammable: true,
  programmingNotes: '5th gen Tahoe Premier/High Country. 6-button smart key with separate Hatch and Rear Glass buttons. PN: 13537962. HITAG PRO ID49 128-bit. 433 MHz. CR2450. Same key profile as Suburban. GM MDI2/SPS2 or Autel/SmartPro.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/20_gm_6b_smart_480x480.jpg',
  lishiTool: 'Lishi HU100'
});

// ---------------------------------------------------------------
// 4.11 Chevrolet Tahoe 2015-2020: 5-button variant (without rear glass)
// Currently has 6-button HYQ1AA. Missing 5-button for base trims.
// ---------------------------------------------------------------
console.log('-- Chevrolet Tahoe 2015-2020: 5-button (no rear glass) --');
await insertVariant({
  make: 'Chevrolet',
  modelName: 'Chevrolet Tahoe',
  yearStart: 2015,
  yearEnd: 2020,
  keyType: 'smart_key',
  fccId: 'HYQ1AA',
  icNumber: '1551A-1AA',
  buttons: 'Lock, Unlock, Remote Start, Panic, Hatch',
  batteryType: 'CR2032',
  keyBlank: 'HU100',
  emergencyKeyBlank: 'HU100',
  testKeyBlank: 'HU100',
  transponderType: 'PK3+ (Philips 46)',
  chipType: 'Philips 46',
  remoteFrequency: '315 MHz',
  pinCodeRequired: false,
  obdProgrammable: true,
  programmingNotes: 'Tahoe LS/LT base. 5-button smart key (without rear glass release). Same FCC HYQ1AA as 6-button but lacks separate rear glass button. PN: 13508278. GM MDI/SPS or aftermarket tool.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/20_gm_5b_smart_480x480.jpg',
  lishiTool: 'Lishi HU100'
});

// ---------------------------------------------------------------
// 4.12 Chevrolet Suburban 2015-2020: 5-button variant (without rear glass)
// Currently has 6-button HYQ1AA. Missing 5-button for LT base.
// ---------------------------------------------------------------
console.log('-- Chevrolet Suburban 2015-2020: 5-button (no rear glass) --');
await insertVariant({
  make: 'Chevrolet',
  modelName: 'Chevrolet Suburban',
  yearStart: 2015,
  yearEnd: 2020,
  keyType: 'smart_key',
  fccId: 'HYQ1AA',
  icNumber: '1551A-1AA',
  buttons: 'Lock, Unlock, Remote Start, Panic, Hatch',
  batteryType: 'CR2032',
  keyBlank: 'HU100',
  emergencyKeyBlank: 'HU100',
  testKeyBlank: 'HU100',
  transponderType: 'PK3+ (Philips 46)',
  chipType: 'Philips 46',
  remoteFrequency: '315 MHz',
  pinCodeRequired: false,
  obdProgrammable: true,
  programmingNotes: 'Suburban LS/LT base. 5-button smart key (without rear glass release). Same FCC HYQ1AA as 6-button but lacks separate rear glass button. PN: 13508278. GM MDI/SPS or aftermarket tool.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/20_gm_5b_smart_480x480.jpg',
  lishiTool: 'Lishi HU100'
});

// ---------------------------------------------------------------
// 4.13 Honda CR-V 2017-2022: 4-button KR5V2X (LX without remote start)
// Currently has 5-button. Missing 4-button for LX.
// ---------------------------------------------------------------
console.log('-- Honda CR-V 2017-2022: 4-button LX variant --');
await insertVariant({
  make: 'Honda',
  modelName: 'Honda CR-V',
  yearStart: 2017,
  yearEnd: 2022,
  keyType: 'smart_key',
  fccId: 'KR5V2X',
  icNumber: '7812D-V2X',
  buttons: 'Lock, Unlock, Hatch, Panic',
  batteryType: 'CR2032',
  keyBlank: 'HO01',
  emergencyKeyBlank: 'HO01',
  testKeyBlank: 'HO01',
  transponderType: 'Hitag 3',
  chipType: 'ID 47',
  remoteFrequency: '434 MHz',
  pinCodeRequired: false,
  obdProgrammable: true,
  programmingNotes: '5th gen CR-V LX/base (without remote start). 4-button smart key. 434 MHz. KR5V2X. Does NOT have remote start. Honda HDS or aftermarket.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-4B1_480x480.jpg',
  lishiTool: 'Lishi HON66'
});

// ---------------------------------------------------------------
// 4.14 Ford F-150 2023-2025: 4-button smart key (without tailgate)
// Currently only has 5-button M3N-A3C108397.
// ---------------------------------------------------------------
console.log('-- Ford F-150 2023-2025: 4-button variant --');
await insertVariant({
  make: 'Ford',
  modelName: 'Ford F-150',
  yearStart: 2023,
  yearEnd: 2025,
  keyType: 'smart_key',
  fccId: 'M3N-A3C108397',
  icNumber: '7812-A3C108397',
  buttons: 'Lock, Unlock, Panic, Remote Start',
  batteryType: 'CR2450',
  keyBlank: 'HU101',
  emergencyKeyBlank: 'HU101',
  testKeyBlank: null,
  transponderType: 'NXP HITAG PRO',
  chipType: 'ID49 128-bit',
  remoteFrequency: '434 MHz',
  pinCodeRequired: false,
  obdProgrammable: true,
  programmingNotes: '14th gen F-150. 4-button smart key (without tailgate release). 434 MHz. For Lariat trims without bed utility group. PN: 164-R8330 variant. Ford FDRS or latest aftermarket tools.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/20_ford_4b_smart_peps_480x480.jpg',
  lishiTool: 'Lishi HU101'
});

// ---------------------------------------------------------------
// 4.15 Chevrolet Silverado 2022-2024: Already has both 4-button and 5-button. Good.
// But let's add HYQ1ES 2021 variant since the DB has HYQ1EA for 2019-2021 only
// ---------------------------------------------------------------
console.log('-- Chevrolet Silverado 2021: HYQ1ES variant --');
await insertVariant({
  make: 'Chevrolet',
  modelName: 'Chevrolet Silverado',
  yearStart: 2021,
  yearEnd: 2021,
  keyType: 'smart_key',
  fccId: 'HYQ1ES',
  icNumber: '1551A-1ES',
  buttons: 'Lock, Unlock, Remote Start, Panic, Tailgate',
  batteryType: 'CR2032',
  keyBlank: 'HU100',
  emergencyKeyBlank: 'HU100',
  testKeyBlank: 'HU100',
  transponderType: 'HITAG PRO (ID49)',
  chipType: 'NXP HITAG PRO ID49',
  remoteFrequency: '434 MHz',
  pinCodeRequired: false,
  obdProgrammable: true,
  programmingNotes: 'Silverado 1500 (2021 refresh). 5-button smart key with tailgate. 434 MHz. HYQ1ES (updated FCC from HYQ1EA). PN: 13541559. GM MDI2/SPS2 or Autel/SmartPro.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products/20_gm_5b_smart_480x480.jpg',
  lishiTool: 'Lishi HU100'
});

// ---------------------------------------------------------------
// 4.16 Toyota Sienna 2011-2020: Add a 5-button variant without hatch
// The 6-button has Left/Right doors + Hatch. Some LE trims
// had 5 buttons only (Lock, Unlock, L Door, R Door, Panic).
// ---------------------------------------------------------------
console.log('-- Toyota Sienna 2011-2020: 5-button variant (no hatch) --');
await insertVariant({
  make: 'Toyota',
  modelName: 'Toyota Sienna',
  yearStart: 2011,
  yearEnd: 2020,
  keyType: 'smart_key',
  fccId: 'HYQ14ADR',
  icNumber: '1551A-14ADR',
  buttons: 'Lock, Unlock, Left Sliding Door, Right Sliding Door, Panic',
  batteryType: 'CR2032',
  keyBlank: 'TOY51',
  emergencyKeyBlank: 'TOY51',
  testKeyBlank: 'TOY40',
  transponderType: 'Texas Crypto 128-bit AES',
  chipType: 'H Chip (8A)',
  remoteFrequency: '315 MHz',
  pinCodeRequired: false,
  obdProgrammable: false,
  programmingNotes: 'Sienna LE/XLE base (without power liftgate). 5-button smart key with sliding door controls but NO hatch button. Same FCC HYQ14ADR as 6-button. PN: 89904-08010 variant. Emergency blade EKB-TOY-SIENNA.',
  imageUrl: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/20_toyota_sienna_5b_smart_480x480.jpg',
  lishiTool: 'Lishi TOY43'
});

// ============================================================
// PART 5: FIX test_key_blank CONFUSION
// For Honda smart keys, test_key_blank should be HO01 (test key for locksmith)
// emergency_key_blank is the blade inside the fob - also HO01 for older, LXP90 for 2022+
// These are the same blank in Honda's case. Just ensure consistency.
// ============================================================
console.log('\n=== PART 5: CONSISTENCY CHECKS ===\n');

// Ensure Honda smart keys have consistent test_key_blank
const hondaSmartTest = await client.query(
  `SELECT id, model_name, year_start, year_end, test_key_blank, key_blank
   FROM automotive_keys
   WHERE manufacturer_id = $1 AND key_type = 'smart_key' AND test_key_blank IS NULL`,
  [mfgIds.Honda]
);
for (const row of hondaSmartTest.rows) {
  let testBlank = 'HO01';
  if (row.key_blank === 'LXP90') testBlank = 'LXP90';
  if (row.key_blank === 'HU100') testBlank = 'HU100'; // Prologue
  await client.query(`UPDATE automotive_keys SET test_key_blank = $1 WHERE id = $2`, [testBlank, row.id]);
  changes.updates.push(`Honda ${row.model_name} ${row.year_start}: Set test_key_blank = ${testBlank}`);
  console.log(`  FIX TEST: Honda ${row.model_name} ${row.year_start}-${row.year_end}: set test_key_blank = ${testBlank}`);
}

// ============================================================
// SUMMARY
// ============================================================
console.log('\n\n========================================');
console.log('         CHANGE SUMMARY');
console.log('========================================\n');

console.log(`INSERTS (new variant rows): ${changes.inserts.length}`);
changes.inserts.forEach((desc, i) => console.log(`  ${i + 1}. ${desc}`));

console.log(`\nUPDATES (field fixes): ${changes.updates.length}`);
changes.updates.forEach((desc, i) => console.log(`  ${i + 1}. ${desc}`));

if (changes.errors.length > 0) {
  console.log(`\nERRORS: ${changes.errors.length}`);
  changes.errors.forEach((desc, i) => console.log(`  ${i + 1}. ${desc}`));
}

console.log(`\nTOTAL CHANGES: ${changes.inserts.length + changes.updates.length}`);

// Verify final counts
for (const [brand, id] of Object.entries(mfgIds)) {
  const res = await client.query(`SELECT COUNT(*) FROM automotive_keys WHERE manufacturer_id = $1`, [id]);
  console.log(`  ${brand}: ${res.rows[0].count} rows`);
}

await client.end();
console.log('\nDone.');
