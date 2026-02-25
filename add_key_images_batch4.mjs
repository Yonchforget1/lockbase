import pg from 'pg';
import https from 'https';
import http from 'http';
import fs from 'fs';

const { Client } = pg;

const DB_CONFIG = {
  host: 'db.eptnkprttskodgnfeasg.supabase.co',
  port: 5432, database: 'postgres', user: 'postgres',
  password: 'Yonchforget1!', ssl: { rejectUnauthorized: false }
};

const LOG_FILE = new URL('./batch4_log.txt', import.meta.url).pathname.replace(/^\/([A-Z]:)/, '$1');

function log(msg) {
  const line = `[${new Date().toISOString()}] ${msg}`;
  console.log(line);
  fs.appendFileSync(LOG_FILE, line + '\n');
}

// ---- HTTP helpers ----

function fetchUrl(url, maxRedirects = 5) {
  return new Promise((resolve, reject) => {
    if (maxRedirects <= 0) return reject(new Error('Too many redirects'));
    const mod = url.startsWith('https') ? https : http;
    const req = mod.get(url, {
      headers: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
      }
    }, (res) => {
      if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
        let loc = res.headers.location;
        if (loc.startsWith('/')) {
          const u = new URL(url);
          loc = `${u.protocol}//${u.host}${loc}`;
        }
        res.resume();
        return fetchUrl(loc, maxRedirects - 1).then(resolve).catch(reject);
      }
      if (res.statusCode !== 200) {
        res.resume();
        return reject(new Error(`HTTP ${res.statusCode}`));
      }
      const chunks = [];
      res.on('data', c => chunks.push(c));
      res.on('end', () => resolve(Buffer.concat(chunks)));
      res.on('error', reject);
    });
    req.on('error', reject);
    req.setTimeout(20000, () => { req.destroy(); reject(new Error('timeout')); });
  });
}

async function fetchText(url) {
  const buf = await fetchUrl(url);
  return buf.toString('utf-8');
}

function sleep(ms) {
  return new Promise(r => setTimeout(r, ms));
}

// ---- Image Source Searchers ----

async function searchUHS(query) {
  try {
    const searchUrl = `https://www.uhshardware.com/search?q=${encodeURIComponent(query)}`;
    const html = await fetchText(searchUrl);
    const imgMatch = html.match(/src="(https:\/\/(?:www\.)?uhshardware\.com\/cdn\/shop\/(?:files|products)\/[^"?\s]+\.(?:jpg|png|webp))/i);
    if (imgMatch) return imgMatch[1];
    const productMatch = html.match(/href="(\/(?:products|collections)\/[^"]+)"/);
    if (productMatch) {
      const productUrl = `https://www.uhshardware.com${productMatch[1]}`;
      const productHtml = await fetchText(productUrl);
      const imgMatch2 = productHtml.match(/src="(https:\/\/(?:www\.)?uhshardware\.com\/cdn\/shop\/(?:files|products)\/[^"?\s]+\.(?:jpg|png|webp))/i);
      if (imgMatch2) return imgMatch2[1];
    }
    return null;
  } catch { return null; }
}

async function searchKeylessFactory(query) {
  try {
    const searchUrl = `https://www.keylessfactory.com/search?q=${encodeURIComponent(query)}`;
    const html = await fetchText(searchUrl);
    const imgMatch = html.match(/src="(https:\/\/(?:www\.)?keylessfactory\.com\/cdn\/shop\/(?:files|products)\/[^"?\s]+\.(?:jpg|png|webp))/i);
    if (imgMatch) return imgMatch[1];
    const productMatch = html.match(/href="(\/products\/[^"]+)"/);
    if (productMatch) {
      const productUrl = `https://www.keylessfactory.com${productMatch[1]}`;
      const productHtml = await fetchText(productUrl);
      const imgMatch2 = productHtml.match(/src="(https:\/\/(?:www\.)?keylessfactory\.com\/cdn\/shop\/(?:files|products)\/[^"?\s]+\.(?:jpg|png|webp))/i);
      if (imgMatch2) return imgMatch2[1];
    }
    return null;
  } catch { return null; }
}

async function searchIKeyless(query) {
  try {
    const searchUrl = `https://www.ikeyless.com/catalogsearch/result/?q=${encodeURIComponent(query)}`;
    const html = await fetchText(searchUrl);
    const imgMatch = html.match(/src="(https:\/\/(?:www\.)?ikeyless\.com\/(?:media|pub)\/[^"?\s]+\.(?:jpg|png|webp))/i);
    if (imgMatch) return imgMatch[1];
    const productMatch = html.match(/href="(https:\/\/(?:www\.)?ikeyless\.com\/[^"]+\.html)"/);
    if (productMatch) {
      const productHtml = await fetchText(productMatch[1]);
      const imgMatch2 = productHtml.match(/src="(https:\/\/(?:www\.)?ikeyless\.com\/(?:media|pub)\/[^"?\s]+\.(?:jpg|png|webp))/i);
      if (imgMatch2) return imgMatch2[1];
    }
    return null;
  } catch { return null; }
}

async function searchLocksmithKeyless(query) {
  try {
    const searchUrl = `https://www.locksmithkeyless.com/search?q=${encodeURIComponent(query)}&type=product`;
    const html = await fetchText(searchUrl);
    const productMatch = html.match(/href="(\/products\/[^"]+)"/);
    if (!productMatch) return null;
    const productUrl = `https://www.locksmithkeyless.com${productMatch[1]}`;
    const productHtml = await fetchText(productUrl);
    const imgMatch = productHtml.match(/(https:\/\/www\.locksmithkeyless\.com\/cdn\/shop\/(?:files|products)\/[^"?\s]+\.(?:jpg|png|webp))/i);
    if (imgMatch) return imgMatch[1];
    return null;
  } catch { return null; }
}

async function searchCLK(query) {
  try {
    const searchUrl = `https://www.clksupplies.com/search?q=${encodeURIComponent(query)}`;
    const html = await fetchText(searchUrl);
    const imgMatch = html.match(/(https:\/\/www\.clksupplies\.com\/cdn\/shop\/(?:files|products)\/[^"?\s]+\.(?:jpg|png|webp))/i);
    if (imgMatch) return imgMatch[1];
    const productMatch = html.match(/href="(\/products\/[^"]+)"/);
    if (!productMatch) return null;
    const productUrl = `https://www.clksupplies.com${productMatch[1]}`;
    const productHtml = await fetchText(productUrl);
    const imgMatch2 = productHtml.match(/(https:\/\/www\.clksupplies\.com\/cdn\/shop\/(?:files|products)\/[^"?\s]+\.(?:jpg|png|webp))/i);
    if (imgMatch2) return imgMatch2[1];
    return null;
  } catch { return null; }
}

async function searchKey4(query) {
  try {
    const searchUrl = `https://www.key4.com/search?q=${encodeURIComponent(query)}`;
    const html = await fetchText(searchUrl);
    // key4 uses thumbnail paths
    const imgMatch = html.match(/(https:\/\/www\.key4\.com\/thumbnail(?:reg)?\/(?:thumb|crop)\/\d+\/\d+\/products\/[^"?\s]+\.(?:jpg|png|webp))/i);
    if (imgMatch) return imgMatch[1];
    // Try finding a product link
    const productMatch = html.match(/href="(\/[^"]*(?:key|remote|fob)[^"]*)" /i);
    if (productMatch) {
      const productUrl = `https://www.key4.com${productMatch[1]}`;
      const productHtml = await fetchText(productUrl);
      const imgMatch2 = productHtml.match(/(https:\/\/www\.key4\.com\/thumbnail(?:reg)?\/thumb\/600\/600\/products\/[^"?\s]+\.(?:jpg|png|webp))/i);
      if (imgMatch2) return imgMatch2[1];
    }
    return null;
  } catch { return null; }
}

// ---- Main search function ----

async function findImageForKey(fccId, keyBlank, modelName, manufacturer, keyType) {
  const sources = [
    { name: 'LocksmithKeyless', fn: searchLocksmithKeyless },
    { name: 'KeylessFactory', fn: searchKeylessFactory },
    { name: 'UHS', fn: searchUHS },
    { name: 'CLK', fn: searchCLK },
    { name: 'Key4', fn: searchKey4 },
    { name: 'iKeyless', fn: searchIKeyless },
  ];

  // Build search queries in priority order
  const queries = [];

  if (fccId && fccId !== 'N/A' && fccId !== '') {
    queries.push(fccId);
    queries.push(`${fccId} key fob`);
    queries.push(`${fccId} ${manufacturer}`);
  }

  if (keyBlank && keyBlank !== 'N/A' && !keyBlank.startsWith('N/A')) {
    const cleanBlank = keyBlank.replace(/-PT$/, '');
    queries.push(`${cleanBlank} key blank`);
    queries.push(`${manufacturer} ${cleanBlank} key`);
  }

  // Brand + model search for smart keys / exotic brands
  if (keyType === 'smart_key' || keyType === 'proximity') {
    queries.push(`${manufacturer} ${modelName} key fob`);
    queries.push(`${modelName} smart key fob`);
  }

  // Generic brand + model
  queries.push(`${manufacturer} ${modelName} key`);

  // Deduplicate queries
  const seen = new Set();
  const uniqueQueries = queries.filter(q => {
    if (seen.has(q)) return false;
    seen.add(q);
    return true;
  });

  for (const source of sources) {
    for (const q of uniqueQueries) {
      try {
        const url = await source.fn(q);
        if (url) {
          log(`    FOUND via ${source.name}: "${q}"`);
          return url;
        }
      } catch { /* continue */ }
      await sleep(250);
    }
  }
  return null;
}

// ---- Main ----

async function main() {
  fs.writeFileSync(LOG_FILE, `=== BATCH 4 IMAGE SCRAPER - ${new Date().toISOString()} ===\n\n`);

  const client = new Client(DB_CONFIG);
  await client.connect();
  log('Connected to database.');

  // Batch 4 manufacturer names
  const batch4Brands = [
    'Buick', 'Pontiac', 'Land Rover', 'Mitsubishi', 'Suzuki', 'Scion',
    'Jaguar', 'Porsche', 'Mini', 'Fiat', 'Saturn', 'Mercury', 'Genesis',
    'Saab', 'Oldsmobile', 'Plymouth', 'Geo', 'Daewoo', 'Eagle', 'Smart',
    'Hummer', 'Isuzu', 'Alfa Romeo', 'Aston Martin', 'Bentley', 'Ferrari',
    'Lamborghini', 'Maserati', 'McLaren', 'Rolls-Royce', 'Maybach', 'Lotus',
    'Polestar', 'Rivian', 'Lucid', 'Tesla', 'Freightliner', 'Kenworth',
    'Peterbilt', 'Mack', 'International'
  ];

  // Get all keys with missing images for batch 4
  const { rows: allKeys } = await client.query(`
    SELECT ak.id, ak.fcc_id, ak.key_blank, ak.model_name, ak.key_type,
           ak.transponder_type, ak.year_start, ak.year_end,
           m.name as manufacturer, m.id as manufacturer_id
    FROM automotive_keys ak
    JOIN manufacturers m ON ak.manufacturer_id = m.id
    WHERE (ak.image_url IS NULL OR ak.image_url = '')
    AND m.name = ANY($1)
    ORDER BY m.name, ak.fcc_id NULLS LAST, ak.key_blank
  `, [batch4Brands]);

  log(`Total batch 4 keys needing images: ${allKeys.length}`);

  // ===================================================================
  //  PHASE 1: GROUP BY FCC ID (keys sharing an FCC ID share an image)
  // ===================================================================
  log('\n========================================');
  log('PHASE 1: Keys with FCC IDs');
  log('========================================\n');

  const byFcc = {};
  const noFcc = [];
  for (const row of allKeys) {
    if (row.fcc_id && row.fcc_id !== 'N/A' && row.fcc_id !== '') {
      if (!byFcc[row.fcc_id]) byFcc[row.fcc_id] = [];
      byFcc[row.fcc_id].push(row);
    } else {
      noFcc.push(row);
    }
  }

  const fccIds = Object.keys(byFcc).sort();
  log(`Unique FCC IDs to search: ${fccIds.length}`);
  log(`Keys without FCC ID: ${noFcc.length}`);

  let fccFound = 0;
  let fccNotFound = 0;
  let totalUpdated = 0;

  for (let i = 0; i < fccIds.length; i++) {
    const fcc = fccIds[i];
    const keys = byFcc[fcc];
    const sample = keys[0];
    log(`[${i + 1}/${fccIds.length}] FCC: ${fcc} (${keys.length} keys) - ${sample.manufacturer} ${sample.model_name}`);

    const imgUrl = await findImageForKey(
      fcc, sample.key_blank, sample.model_name,
      sample.manufacturer, sample.key_type
    );

    if (imgUrl) {
      const res = await client.query(
        `UPDATE automotive_keys SET image_url = $1
         WHERE fcc_id = $2 AND (image_url IS NULL OR image_url = '')`,
        [imgUrl, fcc]
      );
      fccFound++;
      totalUpdated += res.rowCount;
      log(`    Updated ${res.rowCount} keys`);
    } else {
      fccNotFound++;
      log(`    NOT FOUND`);
    }

    await sleep(400);
  }

  log(`\nFCC Phase: Found ${fccFound}/${fccIds.length}, Updated ${totalUpdated} keys`);

  // ===================================================================
  //  PHASE 2: Keys WITHOUT FCC ID - group by key_blank + manufacturer
  // ===================================================================
  log('\n========================================');
  log('PHASE 2: Keys without FCC ID (by key blank)');
  log('========================================\n');

  // Group by manufacturer + key_blank combo
  const blankGroups = {};
  for (const key of noFcc) {
    // Check if this key already got an image from phase 1 (e.g., another key with same ID)
    const groupKey = `${key.manufacturer_id}::${key.key_blank}`;
    if (!blankGroups[groupKey]) blankGroups[groupKey] = [];
    blankGroups[groupKey].push(key);
  }

  const groupKeys = Object.keys(blankGroups).sort();
  log(`Unique blank+manufacturer groups: ${groupKeys.length}`);

  let blankFound = 0;
  let blankNotFound = 0;
  let blankUpdated = 0;

  for (let i = 0; i < groupKeys.length; i++) {
    const gk = groupKeys[i];
    const keys = blankGroups[gk];
    const sample = keys[0];

    // Skip N/A blanks for now (smart keys with no physical key)
    if (sample.key_blank === 'N/A' || sample.key_blank === 'N/A (Key Card)') {
      log(`[${i + 1}/${groupKeys.length}] SKIP: ${sample.manufacturer} ${sample.model_name} (blank: ${sample.key_blank})`);
      continue;
    }

    log(`[${i + 1}/${groupKeys.length}] ${sample.manufacturer} ${sample.model_name} - blank: ${sample.key_blank} (${keys.length} keys)`);

    const imgUrl = await findImageForKey(
      null, sample.key_blank, sample.model_name,
      sample.manufacturer, sample.key_type
    );

    if (imgUrl) {
      // Update all keys in this group
      const ids = keys.map(k => k.id);
      const res = await client.query(
        `UPDATE automotive_keys SET image_url = $1
         WHERE id = ANY($2) AND (image_url IS NULL OR image_url = '')`,
        [imgUrl, ids]
      );
      blankFound++;
      blankUpdated += res.rowCount;
      log(`    Updated ${res.rowCount} keys`);
    } else {
      blankNotFound++;
      log(`    NOT FOUND`);
    }

    await sleep(400);
  }

  log(`\nBlank Phase: Found ${blankFound}/${groupKeys.length}, Updated ${blankUpdated} keys`);

  // ===================================================================
  //  PHASE 3: Handle remaining N/A blank smart keys (Tesla, Rivian, etc.)
  //           Search by brand + model
  // ===================================================================
  log('\n========================================');
  log('PHASE 3: Smart keys with N/A blanks');
  log('========================================\n');

  const { rows: remaining } = await client.query(`
    SELECT ak.id, ak.fcc_id, ak.key_blank, ak.model_name, ak.key_type,
           m.name as manufacturer, m.id as manufacturer_id
    FROM automotive_keys ak
    JOIN manufacturers m ON ak.manufacturer_id = m.id
    WHERE (ak.image_url IS NULL OR ak.image_url = '')
    AND m.name = ANY($1)
    ORDER BY m.name, ak.model_name
  `, [batch4Brands]);

  log(`Remaining keys after phases 1-2: ${remaining.length}`);

  // Group by manufacturer + model_name
  const modelGroups = {};
  for (const key of remaining) {
    const mk = `${key.manufacturer}::${key.model_name}`;
    if (!modelGroups[mk]) modelGroups[mk] = [];
    modelGroups[mk].push(key);
  }

  const modelKeys = Object.keys(modelGroups).sort();
  let phase3Found = 0;
  let phase3Updated = 0;

  for (let i = 0; i < modelKeys.length; i++) {
    const mk = modelKeys[i];
    const keys = modelGroups[mk];
    const sample = keys[0];

    log(`[${i + 1}/${modelKeys.length}] ${sample.manufacturer} ${sample.model_name} (${keys.length} keys)`);

    // Special search queries for specific types
    const queries = [];
    const brand = sample.manufacturer;
    const model = sample.model_name;

    // EV brands
    if (['Tesla', 'Rivian', 'Lucid', 'Polestar'].includes(brand)) {
      queries.push(`${brand} ${model} key card key fob`);
      queries.push(`${brand} key fob replacement`);
    }
    // Exotic/luxury brands
    else if (['Ferrari', 'Lamborghini', 'McLaren', 'Aston Martin', 'Rolls-Royce', 'Bentley', 'Maserati', 'Maybach', 'Lotus'].includes(brand)) {
      queries.push(`${brand} ${model} key fob remote`);
      queries.push(`${brand} key fob smart key`);
    }
    // Commercial trucks
    else if (['Freightliner', 'Kenworth', 'Peterbilt', 'Mack', 'International'].includes(brand)) {
      queries.push(`${brand} truck key`);
      queries.push(`${brand} ${model} ignition key`);
    }
    // Default
    else {
      queries.push(`${brand} ${model} key fob`);
      queries.push(`${brand} ${model} key`);
    }

    const sources = [
      searchLocksmithKeyless,
      searchKeylessFactory,
      searchUHS,
      searchCLK,
      searchKey4,
      searchIKeyless,
    ];

    let found = false;
    for (const q of queries) {
      if (found) break;
      for (const fn of sources) {
        try {
          const url = await fn(q);
          if (url) {
            const ids = keys.map(k => k.id);
            const res = await client.query(
              `UPDATE automotive_keys SET image_url = $1
               WHERE id = ANY($2) AND (image_url IS NULL OR image_url = '')`,
              [url, ids]
            );
            phase3Found++;
            phase3Updated += res.rowCount;
            log(`    FOUND via "${q}": Updated ${res.rowCount} keys`);
            found = true;
            break;
          }
        } catch { /* continue */ }
        await sleep(250);
      }
    }

    if (!found) {
      log(`    NOT FOUND`);
    }

    await sleep(400);
  }

  log(`\nPhase 3: Found ${phase3Found}/${modelKeys.length}, Updated ${phase3Updated} keys`);

  // ===================================================================
  //  PHASE 4: Fallback - try to copy images from same key_blank that
  //           already has an image (from any manufacturer)
  // ===================================================================
  log('\n========================================');
  log('PHASE 4: Copy from same key_blank');
  log('========================================\n');

  const { rows: stillMissing } = await client.query(`
    SELECT ak.id, ak.key_blank, ak.model_name, m.name as manufacturer
    FROM automotive_keys ak
    JOIN manufacturers m ON ak.manufacturer_id = m.id
    WHERE (ak.image_url IS NULL OR ak.image_url = '')
    AND m.name = ANY($1)
    AND ak.key_blank IS NOT NULL AND ak.key_blank != 'N/A'
    ORDER BY m.name
  `, [batch4Brands]);

  log(`Keys still missing images with non-N/A blanks: ${stillMissing.length}`);

  let phase4Updated = 0;
  const blankImageCache = {};

  for (const key of stillMissing) {
    if (!blankImageCache[key.key_blank]) {
      // Find any key with this blank that has an image
      const { rows: existing } = await client.query(`
        SELECT image_url FROM automotive_keys
        WHERE key_blank = $1 AND image_url IS NOT NULL AND image_url != ''
        LIMIT 1
      `, [key.key_blank]);
      blankImageCache[key.key_blank] = existing.length > 0 ? existing[0].image_url : null;
    }

    if (blankImageCache[key.key_blank]) {
      await client.query(
        'UPDATE automotive_keys SET image_url = $1 WHERE id = $2',
        [blankImageCache[key.key_blank], key.id]
      );
      phase4Updated++;
    }
  }

  log(`Phase 4: Copied images for ${phase4Updated} keys from same key_blank`);

  // ===================================================================
  //  PHASE 5: For FCC IDs that share across manufacturers,
  //           copy image from any key with that FCC ID
  // ===================================================================
  log('\n========================================');
  log('PHASE 5: Copy from same FCC ID');
  log('========================================\n');

  const { rows: stillMissing2 } = await client.query(`
    SELECT ak.id, ak.fcc_id, ak.model_name, m.name as manufacturer
    FROM automotive_keys ak
    JOIN manufacturers m ON ak.manufacturer_id = m.id
    WHERE (ak.image_url IS NULL OR ak.image_url = '')
    AND m.name = ANY($1)
    AND ak.fcc_id IS NOT NULL AND ak.fcc_id != 'N/A' AND ak.fcc_id != ''
    ORDER BY m.name
  `, [batch4Brands]);

  log(`Keys still missing with FCC IDs: ${stillMissing2.length}`);

  let phase5Updated = 0;
  const fccImageCache = {};

  for (const key of stillMissing2) {
    if (!fccImageCache[key.fcc_id]) {
      const { rows: existing } = await client.query(`
        SELECT image_url FROM automotive_keys
        WHERE fcc_id = $1 AND image_url IS NOT NULL AND image_url != ''
        LIMIT 1
      `, [key.fcc_id]);
      fccImageCache[key.fcc_id] = existing.length > 0 ? existing[0].image_url : null;
    }

    if (fccImageCache[key.fcc_id]) {
      await client.query(
        'UPDATE automotive_keys SET image_url = $1 WHERE id = $2',
        [fccImageCache[key.fcc_id], key.id]
      );
      phase5Updated++;
    }
  }

  log(`Phase 5: Copied images for ${phase5Updated} keys from same FCC ID`);

  // ===================================================================
  //  FINAL REPORT
  // ===================================================================
  log('\n========================================');
  log('FINAL REPORT');
  log('========================================\n');

  const { rows: finalCounts } = await client.query(`
    SELECT m.name,
           COUNT(*) as total,
           COUNT(CASE WHEN ak.image_url IS NOT NULL AND ak.image_url != '' THEN 1 END) as with_image,
           COUNT(CASE WHEN ak.image_url IS NULL OR ak.image_url = '' THEN 1 END) as without_image
    FROM automotive_keys ak
    JOIN manufacturers m ON ak.manufacturer_id = m.id
    WHERE m.name = ANY($1)
    GROUP BY m.name
    ORDER BY m.name
  `, [batch4Brands]);

  let grandTotal = 0;
  let grandWithImage = 0;
  let grandMissing = 0;

  for (const row of finalCounts) {
    grandTotal += parseInt(row.total);
    grandWithImage += parseInt(row.with_image);
    grandMissing += parseInt(row.without_image);
    if (parseInt(row.without_image) > 0) {
      log(`  ${row.name}: ${row.with_image}/${row.total} have images (${row.without_image} missing)`);
    } else {
      log(`  ${row.name}: ${row.with_image}/${row.total} - COMPLETE`);
    }
  }

  log(`\nGrand Total: ${grandWithImage}/${grandTotal} keys have images (${grandMissing} still missing)`);
  log(`Total keys updated this run: ${totalUpdated + blankUpdated + phase3Updated + phase4Updated + phase5Updated}`);

  // Also show overall database stats
  const { rows: overallStats } = await client.query(`
    SELECT
      COUNT(*) as total,
      COUNT(CASE WHEN image_url IS NOT NULL AND image_url != '' THEN 1 END) as with_image
    FROM automotive_keys
  `);

  log(`\nOverall database: ${overallStats[0].with_image}/${overallStats[0].total} keys have images`);

  await client.end();
  log('\nDone!');
}

main().catch(err => { console.error('Fatal:', err); process.exit(1); });
