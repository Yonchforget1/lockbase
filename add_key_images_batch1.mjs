/**
 * add_key_images_batch1.mjs
 *
 * Adds image URLs to Hyundai and Kia automotive keys that are missing images.
 * Images sourced from Locksmith Keyless (locksmithkeyless.com) product pages.
 *
 * Strategy:
 *   - Keys WITH FCC ID: map FCC ID -> verified product image URL
 *   - Keys WITHOUT FCC ID: map by key_blank + key_type -> appropriate image
 */

import pg from 'pg';
const { Client } = pg;

const CONNECTION_STRING = 'postgresql://postgres:Yonchforget1!@db.eptnkprttskodgnfeasg.supabase.co:5432/postgres';

// ============================================================
// FCC ID -> Image URL mapping (all verified working from locksmithkeyless.com)
// ============================================================
const FCC_IMAGE_MAP = {
  // ---- HYUNDAI FCC IDs ----

  // SY5HMFNA04 - 2009-2016 Hyundai/Kia 4-button smart key (shared with Kia)
  'SY5HMFNA04': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-24__1_large.jpg?v=1754517572',

  // CQOFD00120 - 2015-2020 Hyundai 4-button smart key (Sonata, Elantra, Ioniq, Veloster)
  'CQOFD00120': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-43__1_large.jpg?v=1754517407',

  // TQ8-FOB-4F27 - 2020-2024 Hyundai 5-button smart key (Sonata, Santa Fe, Tucson, Elantra, etc.)
  'TQ8-FOB-4F27': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-80__1_large.jpg?v=1754516868',

  // TQ8-FOB-4F28 - 2020-2024 Hyundai 5/7-button smart key (Palisade, Tucson)
  'TQ8-FOB-4F28': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-HYUNDAI-114C__1_329c1cb9-e065-4ac5-aa81-331afcecf72b_large.jpg?v=1754690202',

  // TQ8-FOB-4F19 - 2019-2020 Hyundai 4/5-button smart key (Santa Fe, Kona, Nexo)
  'TQ8-FOB-4F19': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-44n__1_large.jpg?v=1754517401',

  // OSLOKA-310T - 2006-2010 Hyundai keyless entry 4-button remote (Sonata, Elantra, Tucson, Tiburon)
  'OSLOKA-310T': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-10__1_large.jpg?v=1757099157',

  // SY5DMFNA04 - 2013-2018 Hyundai Santa Fe 4-button smart key
  'SY5DMFNA04': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-22__1_5dff8307-afce-4985-b4ad-d3cb518526f6_large.jpg?v=1737038902',

  // TQ8-FOB-4F07 - 2016-2018 Hyundai Tucson 4-button smart key
  'TQ8-FOB-4F07': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-HYUNDAI-42__1_6327cdce-f09f-476d-8f47-6660a01546a7_large.jpg?v=1754517777',

  // TQ8-FOB-4F11 - 2018-2021 Hyundai Tucson 4-button smart key
  'TQ8-FOB-4F11': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-74__1_large.jpg?v=1754516940',

  // TQ8-FOB-4F18 - 2018-2021 Hyundai Kona/Venue 4-button smart key
  'TQ8-FOB-4F18': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-55__1_large.jpg?v=1754517100',

  // TQ8-FOB-4F29 - 2020-2022 Hyundai Palisade 5-button smart key
  'TQ8-FOB-4F29': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-65__1_large.jpg?v=1754516885',

  // TQ8-RKE-4F25 - 2016-2021 Hyundai Tucson/Accent flip key 4-button
  'TQ8-RKE-4F25': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-28__1_large.jpg?v=1754517567',

  // TQ8-RKE-3F01 - 2010-2017 Hyundai Accent/Tucson keyless entry 3-button
  'TQ8-RKE-3F01': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-06__1_large.jpg?v=1754517827',

  // PINHA-T008 - 2008-2016 Hyundai keyless entry 4-button (Genesis Coupe, etc.)
  'PINHA-T008': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-03c__1_large.jpg?v=1754517822',

  // PINHA-T038 - 2007-2012 Hyundai keyless entry 3-button (Santa Fe, etc.)
  'PINHA-T038': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-34__1_large.jpg?v=1754517570',

  // SY55WY8212 - 2007-2012 Hyundai/Kia keyless entry 4/5-button (Veracruz, Azera, Entourage)
  'SY55WY8212': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-38__1_7f73b967-8091-43e2-bb67-bd1484339545_large.jpg?v=1754517797',

  // SY5DHFNA433 - 2015-2016 Hyundai Genesis 4-button smart key
  'SY5DHFNA433': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-39n__1_8e63f849-941e-4dd7-9a78-243cb8414bbd_large.jpg?v=1737038906',

  // SY5MDFNA433 - 2013-2016 Hyundai Elantra 4-button smart key
  'SY5MDFNA433': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-26__1_large.jpg?v=1754517580',

  // SY5RBFNA433 - 2014-2016 Hyundai Genesis Coupe 4-button smart key (same body as SY5HMFNA04)
  'SY5RBFNA433': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-24__1_large.jpg?v=1754517572',

  // NYOSEKS-TF10ATX - 2012-2016 Hyundai Veloster keyless entry 4-button
  'NYOSEKS-TF10ATX': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-04__1_large.jpg?v=1757099158',

  // NYOSYEC4FOB1608 - 2018-2021 Hyundai Elantra GT / Accent smart key 4-button
  'NYOSYEC4FOB1608': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-HYUNDAI-120C__1_3e8521ff-ea73-4e31-bd56-d3b436316878.jpg?v=1757098710',

  // NYOMBEC7FOB2208 - 2023-2025 Hyundai Ioniq 6 smart key 5-button
  'NYOMBEC7FOB2208': 'https://www.locksmithkeyless.com/cdn/shop/products/RC-HYUNDAI-101__1_large.jpg?v=1754516751',

  // TQ8-FOB-4F61M43 - 2024-2025 Hyundai smart key (Kona, Tucson, Santa Cruz, Santa Fe)
  'TQ8-FOB-4F61M43': 'https://www.locksmithkeyless.com/cdn/shop/products/RC-HYUNDAI-103__2_large.jpg?v=1754516749',

  // TQ8-FOB-4F89U44 - 2025 Hyundai Santa Fe smart key (same generation as TQ8-FOB-4F61M43)
  'TQ8-FOB-4F89U44': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-HYUNDAI-162__1_large.jpg?v=1756494653',

  // TQ8-FOB-4F43 - 2022-2023 Hyundai Kona smart key (same generation as TQ8-FOB-4F27)
  'TQ8-FOB-4F43': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-80__1_large.jpg?v=1754516868',

  // CQOFD01470 - 2022-2024 Hyundai Ioniq 5 / Kia EV6 smart key 6/7-button
  'CQOFD01470': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-KIA-118__1_075a1222-8525-4692-a771-5dc5bdee8049_large.jpg?v=1754516619',

  // CQOFD01480 - 2022-2024 Hyundai Ioniq 5 / Kia EV6 smart key 4/8-button
  'CQOFD01480': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-KIA-118__1_075a1222-8525-4692-a771-5dc5bdee8049_large.jpg?v=1754516619',

  // MBEC3TX2004 - 2024-2025 Hyundai Elantra transponder key with remote
  'MBEC3TX2004': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-HYUNDAI-120C__1_3e8521ff-ea73-4e31-bd56-d3b436316878.jpg?v=1757098710',

  // ---- KIA FCC IDs ----

  // CQOFD00430 - 2019-2024 Kia Forte/Soul smart key 4/5-button
  'CQOFD00430': 'https://www.locksmithkeyless.com/cdn/shop/products/RC-KIA-90__1_325df4ec-5c5a-4d0b-b02a-224e39e7057f_large.jpg?v=1751393028',

  // CQOFD00790 - 2021-2024 Kia K5/Forte/EV6 smart key 5-button
  'CQOFD00790': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-KIA-126__1_71fbed66-e497-46ca-821e-66666800a76d.jpg?v=1754516610',

  // CQOTD00660 - 2019-2024 Kia K5/Forte flip key 4-button
  'CQOTD00660': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-KIA-98__1_040b15ad-1f02-4bd5-8048-60d8e5c6c2df_large.jpg?v=1759469417',

  // FD01330 - 2023-2025 Kia Niro smart key 5-button
  'FD01330': 'https://www.locksmithkeyless.com/cdn/shop/products/RC-KIA-91__1_large.jpg?v=1754516742',

  // FD01340 - 2023-2025 Kia Niro EV smart key 7-button (same EV6 generation)
  'FD01340': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-KIA-118__1_075a1222-8525-4692-a771-5dc5bdee8049_large.jpg?v=1754516619',

  // SY5MQ4FGE05 - 2021-2024 Kia Sportage/Telluride/Carnival/Sorento 5/7-button smart key
  'SY5MQ4FGE05': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-KIA-119__1_9177c93d-9663-4cad-a6dc-3f26f2855819_large.jpg?v=1754516618',

  // SY5JFFGE04 - 2016-2020 Kia Optima 4-button smart key
  'SY5JFFGE04': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-68c__1_4b696d8e-50c9-48e7-a525-1cc05a59a34b.jpg?v=1737039219',

  // SY5YPFGE06 - 2015-2021 Kia Sedona 6-button smart key
  'SY5YPFGE06': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-50__1_d4607266-fe21-454f-b988-fdc68c4994f2.jpg?v=1754517460',

  // SY5KHFNA433 - 2014-2017 Kia K900/Cadenza 4-button smart key (same body as SY5HMFNA04)
  'SY5KHFNA433': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-24__1_large.jpg?v=1754517572',

  // SY5XMFNA433 - 2014-2015 Kia Optima 4-button smart key
  'SY5XMFNA433': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-34__1_large.jpg?v=1754517451',

  // TQ8-FOB-4F06 - 2016-2020 Kia Sorento/Soul EV 4-button smart key
  'TQ8-FOB-4F06': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-73__1_large.jpg?v=1754517141',

  // TQ8-FOB-4F08 - 2017-2021 Kia Niro/Sportage 4-button smart key
  'TQ8-FOB-4F08': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-72c__1_03b9ba2e-f95d-4f4a-8df4-d83f6b8ce665_large.jpg?v=1737039142',

  // TQ8-FOB-4F10 - 2017-2020 Kia Cadenza 4-button smart key (same generation as TQ8-FOB-4F08)
  'TQ8-FOB-4F10': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-72c__1_03b9ba2e-f95d-4f4a-8df4-d83f6b8ce665_large.jpg?v=1737039142',

  // TQ8-FOB-4F15 - 2018-2023 Kia Stinger 4-button smart key
  'TQ8-FOB-4F15': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-62__1_large.jpg?v=1754517403',

  // TQ8-FOB-4F17 - 2019-2020 Kia K900 4-button smart key
  'TQ8-FOB-4F17': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-80__1_large.jpg?v=1754516931',

  // TQ8-FOB-4F24 - 2019-2022 Kia Telluride/Niro 4/5-button smart key
  'TQ8-FOB-4F24': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-81__1_large.jpg?v=1754516930',

  // TQ8-FOB-4F61U44 - 2024-2025 Kia EV9 smart key 8-button (same generation as EV6)
  'TQ8-FOB-4F61U44': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-KIA-118__1_075a1222-8525-4692-a771-5dc5bdee8049_large.jpg?v=1754516619',

  // TQ8-FOB-4F81M44 - 2024-2025 Kia Sorento smart key 5-button
  'TQ8-FOB-4F81M44': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-KIA-165C__1_large.jpg?v=1761933587',

  // TQ8-FOB-4F81U44 - 2024-2025 Kia EV9 smart key 6-button (same generation)
  'TQ8-FOB-4F81U44': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-KIA-165C__1_large.jpg?v=1761933587',

  // OSLOKA-875T - 2014-2019 Kia Soul/Forte flip key 4-button
  'OSLOKA-875T': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-07__1_large.jpg?v=1754517459',

  // TQ8-RKE-3F05 - 2014-2017 Kia Sorento/Sportage/Rio flip key 4-button
  'TQ8-RKE-3F05': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-06__1_large.jpg?v=1757099106',

  // PINHA-T036 - 2006-2013 Kia keyless entry 3-button (Sorento, Borrego)
  'PINHA-T036': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-08__1_large.jpg?v=1754517457',

  // PLNHM-T011 - 2007-2010 Kia keyless entry 4-button (Rondo, Sorento)
  'PLNHM-T011': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-58__1_large.jpg?v=1754517132',

  // NYOSEKS-AM08TX - 2010-2013 Kia Soul keyless entry 3-button
  'NYOSEKS-AM08TX': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-kia-32__1_1fef48bc-ccc6-4cab-aa36-29dae0df8c22_large.jpg?v=1754517460',

  // NYOSYEC5FOB1907 - 2021-2024 Kia Seltos smart key 4-button
  'NYOSYEC5FOB1907': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-KIA-128__1_5c825425-edae-41f7-a283-f9f0e4323caf_large.jpg?v=1754516607',

  // SV3-VQTXNA0 - 2006-2014 Kia Sedona keyless entry 5-button (use Hyundai/Kia same era remote)
  'SV3-VQTXNA0': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-38__1_7f73b967-8091-43e2-bb67-bd1484339545_large.jpg?v=1754517797',

  // SY5SKRGE03 - 2022-2025 Kia Sportage/Soul flip key 3-button
  'SY5SKRGE03': 'https://www.locksmithkeyless.com/cdn/shop/files/RC-KIA-138__1_94c11423-c0b4-4594-b0a2-92a754a2d6b0.jpg?v=1754516594',

  // TQ8-RKE-4F25 - shared with Hyundai (Kia Rio 2018-2022)
  'TQ8-RKE-4F25': 'https://www.locksmithkeyless.com/cdn/shop/files/rc-hyundai-28__1_large.jpg?v=1754517567',
};

// ============================================================
// Key blank -> Image URL mapping (for keys without FCC ID)
// ============================================================
const KEY_BLANK_IMAGE_MAP = {
  // HY14 transponder key (ID46 chip) - older Hyundai/Kia models 2001-2010
  'HY14_transponder': 'https://www.locksmithkeyless.com/cdn/shop/files/TK-HYUNDAI-05-ILC__1_large.jpg?v=1759441441',

  // HY14 standard key (no chip) - old Hyundai/Kia
  'HY14_standard': 'https://www.locksmithkeyless.com/cdn/shop/files/BK-HYUNDAI-02-HY14-JMA__1_large.jpg?v=1709754206',

  // HY20 transponder key (ID46 chip) - Hyundai/Kia 2006-2017
  'HY20_transponder': 'https://www.locksmithkeyless.com/cdn/shop/files/TK-HYUNDAI-05-ILC__1_large.jpg?v=1759441441',

  // KK12 transponder key (4D60 80-bit) - newer Hyundai/Kia 2018+
  'KK12_transponder': 'https://www.locksmithkeyless.com/cdn/shop/files/TK-KIA-02LOT02__1_3fb16daa-7e9f-426f-a74c-192c0b8b0fe3_large.jpg?v=1754690396',
};


async function main() {
  const client = new Client({ connectionString: CONNECTION_STRING });
  await client.connect();
  console.log('Connected to database.\n');

  // 1. Query all keys without images for target manufacturers
  const { rows: keysWithoutImages } = await client.query(`
    SELECT ak.id, m.name as manufacturer, ak.fcc_id, ak.key_blank, ak.key_type,
           ak.model_name, ak.year_start, ak.year_end, ak.buttons
    FROM automotive_keys ak
    JOIN manufacturers m ON ak.manufacturer_id = m.id
    WHERE (ak.image_url IS NULL OR ak.image_url = '')
      AND m.name IN ('Honda','Toyota','Ford','Chevrolet','Nissan','BMW','Subaru','Hyundai','Kia')
    ORDER BY m.name, ak.fcc_id NULLS LAST, ak.id
  `);

  console.log(`Found ${keysWithoutImages.length} keys without images.\n`);

  if (keysWithoutImages.length === 0) {
    console.log('Nothing to update.');
    await client.end();
    return;
  }

  // 2. Generate image URL for each key
  const updates = [];
  const unmatched = [];
  const matchCounts = {};

  for (const key of keysWithoutImages) {
    let imageUrl = null;

    // Try FCC ID match first
    if (key.fcc_id && key.fcc_id.trim()) {
      const fcc = key.fcc_id.trim();
      if (FCC_IMAGE_MAP[fcc]) {
        imageUrl = FCC_IMAGE_MAP[fcc];
      }
    }

    // If no FCC match, try key blank + type
    if (!imageUrl) {
      const blankType = `${key.key_blank}_${key.key_type}`;
      if (KEY_BLANK_IMAGE_MAP[blankType]) {
        imageUrl = KEY_BLANK_IMAGE_MAP[blankType];
      }
    }

    if (imageUrl) {
      updates.push({ id: key.id, imageUrl, manufacturer: key.manufacturer });
      matchCounts[key.manufacturer] = (matchCounts[key.manufacturer] || 0) + 1;
    } else {
      unmatched.push(key);
    }
  }

  console.log(`Matched ${updates.length} keys with images.`);
  if (unmatched.length > 0) {
    console.log(`Unmatched ${unmatched.length} keys:`);
    for (const u of unmatched) {
      console.log(`  [${u.id}] ${u.manufacturer} | fcc=${u.fcc_id} | blank=${u.key_blank} | type=${u.key_type} | model=${u.model_name}`);
    }
  }
  console.log('');

  // 3. Batch update using a single query with CASE/WHEN
  if (updates.length > 0) {
    // Process in batches of 50 to avoid overly large queries
    const BATCH_SIZE = 50;
    let totalUpdated = 0;

    for (let i = 0; i < updates.length; i += BATCH_SIZE) {
      const batch = updates.slice(i, i + BATCH_SIZE);

      // Build parameterized CASE expression
      const caseEntries = [];
      const params = [];
      const ids = [];

      batch.forEach((item, idx) => {
        const idParam = idx * 2 + 1;
        const urlParam = idx * 2 + 2;
        params.push(item.id, item.imageUrl);
        ids.push(`$${idParam}`);
        caseEntries.push(`WHEN id = $${idParam} THEN $${urlParam}`);
      });

      const sql = `
        UPDATE automotive_keys
        SET image_url = CASE ${caseEntries.join(' ')} END
        WHERE id IN (${ids.join(',')})
      `;

      const result = await client.query(sql, params);
      totalUpdated += result.rowCount;
      console.log(`  Batch ${Math.floor(i / BATCH_SIZE) + 1}: updated ${result.rowCount} rows`);
    }

    console.log(`\nTotal rows updated: ${totalUpdated}`);
  }

  // 4. Print count of updated rows per manufacturer
  console.log('\n=== Updated rows per manufacturer ===');
  for (const [mfr, count] of Object.entries(matchCounts).sort((a, b) => b[1] - a[1])) {
    console.log(`  ${mfr}: ${count}`);
  }

  // 5. Verify: re-query to confirm updates
  const { rows: verification } = await client.query(`
    SELECT m.name,
           COUNT(*) FILTER (WHERE ak.image_url IS NOT NULL AND ak.image_url != '') as with_images,
           COUNT(*) FILTER (WHERE ak.image_url IS NULL OR ak.image_url = '') as without_images,
           COUNT(*) as total
    FROM automotive_keys ak
    JOIN manufacturers m ON ak.manufacturer_id = m.id
    WHERE m.name IN ('Hyundai','Kia')
    GROUP BY m.name
    ORDER BY m.name
  `);
  console.log('\n=== Verification: Hyundai & Kia image coverage ===');
  verification.forEach(r => {
    console.log(`  ${r.name}: ${r.with_images}/${r.total} have images (${r.without_images} still missing)`);
  });

  await client.end();
  console.log('\nDone.');
}

main().catch(err => {
  console.error('Error:', err);
  process.exit(1);
});
