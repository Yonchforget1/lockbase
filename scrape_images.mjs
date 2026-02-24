import pg from 'pg';
import https from 'https';
import http from 'http';
import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';

const { Client } = pg;

const DB_CONFIG = {
  host: 'db.eptnkprttskodgnfeasg.supabase.co',
  port: 5432, database: 'postgres', user: 'postgres',
  password: 'Yonchforget1!', ssl: { rejectUnauthorized: false }
};

const SUPABASE_URL = 'https://eptnkprttskodgnfeasg.supabase.co';
const SUPABASE_SERVICE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVwdG5rcHJ0dHNrb2RnbmZlYXNnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE4OTk0OTEsImV4cCI6MjA4NzQ3NTQ5MX0.hvBkzBs139gRyaJL2zQkdtUzUdk9GYZH0wnCYR0F0ms';

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

const LOG_FILE = path.join(process.cwd(), 'scrape_log.txt');

// ---- Logging ----
function log(msg) {
  const line = `[${new Date().toISOString()}] ${msg}`;
  console.log(line);
  fs.appendFileSync(LOG_FILE, line + '\n');
}

// ---- Helpers ----

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

// UHS Hardware (uhshardware.com)
async function searchUHS(query) {
  try {
    const searchUrl = `https://www.uhshardware.com/search?q=${encodeURIComponent(query)}`;
    const html = await fetchText(searchUrl);

    // Find product image
    const imgMatch = html.match(/src="(https:\/\/(?:www\.)?uhshardware\.com\/cdn\/shop\/(?:files|products)\/[^"?\s]+\.(?:jpg|png|webp))/i);
    if (imgMatch) return imgMatch[1];

    // Try product page
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

// KeylessFactory (keylessfactory.com)
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

// iKeyless (ikeyless.com)
async function searchIKeyless(query) {
  try {
    const searchUrl = `https://www.ikeyless.com/catalogsearch/result/?q=${encodeURIComponent(query)}`;
    const html = await fetchText(searchUrl);

    // Magento-based site
    const imgMatch = html.match(/src="(https:\/\/(?:www\.)?ikeyless\.com\/(?:media|pub)\/[^"?\s]+\.(?:jpg|png|webp))/i);
    if (imgMatch) return imgMatch[1];

    // Try product page link
    const productMatch = html.match(/href="(https:\/\/(?:www\.)?ikeyless\.com\/[^"]+\.html)"/);
    if (productMatch) {
      const productHtml = await fetchText(productMatch[1]);
      const imgMatch2 = productHtml.match(/src="(https:\/\/(?:www\.)?ikeyless\.com\/(?:media|pub)\/[^"?\s]+\.(?:jpg|png|webp))/i);
      if (imgMatch2) return imgMatch2[1];
    }
    return null;
  } catch { return null; }
}

// locksmithkeyless.com
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

// CLK Supplies
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

// Try all sources for an automotive key image
async function findKeyImage(keyBlank, modelName) {
  const searchTerm = keyBlank.replace(/-PT$/, '');
  const queries = [
    `${searchTerm} key blank`,
    `${keyBlank} automotive key fob`,
    `${modelName} key fob remote`,
  ];

  // Try each source in priority order
  const sources = [
    { name: 'UHS', fn: searchUHS },
    { name: 'KeylessFactory', fn: searchKeylessFactory },
    { name: 'iKeyless', fn: searchIKeyless },
    { name: 'LocksmithKeyless', fn: searchLocksmithKeyless },
    { name: 'CLK', fn: searchCLK },
  ];

  for (const source of sources) {
    for (const q of queries) {
      try {
        const url = await source.fn(q);
        if (url) {
          log(`    Found via ${source.name}: "${q}"`);
          return url;
        }
      } catch { /* continue */ }
      await sleep(300);
    }
  }
  return null;
}

// Try all sources for a residential lock image
async function findLockImage(mfrName, lockName, lockType) {
  const queries = [
    `${mfrName} ${lockName}`,
    `${mfrName} ${lockName} ${lockType}`,
    `${lockName} lock`,
  ];

  const sources = [
    { name: 'CLK', fn: searchCLK },
    { name: 'LocksmithKeyless', fn: searchLocksmithKeyless },
    { name: 'UHS', fn: searchUHS },
  ];

  for (const source of sources) {
    for (const q of queries) {
      try {
        const url = await source.fn(q);
        if (url) {
          log(`    Found via ${source.name}: "${q}"`);
          return url;
        }
      } catch { /* continue */ }
      await sleep(300);
    }
  }
  return null;
}

// ---- Supabase Storage ----

async function ensureBucket() {
  const { data, error } = await supabase.storage.getBucket('product-images');
  if (error) {
    log('Creating product-images bucket...');
    const { error: createErr } = await supabase.storage.createBucket('product-images', {
      public: true,
      fileSizeLimit: 5242880, // 5MB
    });
    if (createErr) {
      log(`  Bucket creation error: ${createErr.message}`);
      // May already exist, continue anyway
    } else {
      log('  Bucket created successfully.');
    }
  } else {
    log('product-images bucket already exists.');
  }
}

async function uploadToStorage(imageUrl, storagePath) {
  try {
    const buf = await fetchUrl(imageUrl);

    // Determine content type from URL
    let contentType = 'image/jpeg';
    if (imageUrl.includes('.png')) contentType = 'image/png';
    else if (imageUrl.includes('.webp')) contentType = 'image/webp';

    const { data, error } = await supabase.storage
      .from('product-images')
      .upload(storagePath, buf, {
        contentType,
        upsert: true,
      });

    if (error) {
      log(`    Storage upload error: ${error.message}`);
      // Return the original URL as fallback
      return imageUrl;
    }

    // Get public URL
    const { data: urlData } = supabase.storage
      .from('product-images')
      .getPublicUrl(storagePath);

    return urlData.publicUrl;
  } catch (err) {
    log(`    Download/upload failed: ${err.message}`);
    return imageUrl; // Fallback to source URL
  }
}

// ---- Main ----

async function main() {
  // Clear log
  fs.writeFileSync(LOG_FILE, `=== LOCKBASE IMAGE SCRAPER - ${new Date().toISOString()} ===\n\n`);

  const client = new Client(DB_CONFIG);
  await client.connect();
  log('Connected to database.');

  // Ensure storage bucket exists
  await ensureBucket();

  // ============================================================
  // AUTOMOTIVE KEYS
  // ============================================================
  log('\n========================================');
  log('AUTOMOTIVE KEYS - Image Scraping');
  log('========================================\n');

  const { rows: allKeys } = await client.query(`
    SELECT ak.id, ak.key_blank, ak.model_name, ak.fcc_id, ak.ic_number,
           ak.battery_type, ak.buttons, ak.emergency_key_blank,
           ak.test_key_blank, ak.image_url, ak.key_type, ak.transponder_type,
           ak.year_start, ak.year_end
    FROM public.automotive_keys ak
    ORDER BY ak.model_name, ak.year_start
  `);

  log(`Total automotive keys: ${allKeys.length}`);
  const keysNeedingImages = allKeys.filter(k => !k.image_url || k.image_url === '');
  log(`Keys needing images: ${keysNeedingImages.length}`);

  // Process by unique key_blank to avoid redundant searches
  const blankToImage = {};
  const processedBlanks = new Set();
  const skipBlanks = new Set(['N/A', 'N/A (Key Card)', 'N/A (Key Fob)', 'N/A (Smart Fob Only)', 'Smart Key Fob', 'Smart Key Fob Only']);

  let keyImagesFound = 0;
  let keyImagesNotFound = 0;

  for (let i = 0; i < keysNeedingImages.length; i++) {
    const key = keysNeedingImages[i];
    const blank = key.key_blank;

    // Skip if we already searched this blank
    if (processedBlanks.has(blank)) {
      if (blankToImage[blank]) {
        // Apply cached result
        await client.query('UPDATE public.automotive_keys SET image_url = $1 WHERE id = $2', [blankToImage[blank], key.id]);
      }
      continue;
    }
    processedBlanks.add(blank);

    if (skipBlanks.has(blank)) {
      log(`  [${i + 1}/${keysNeedingImages.length}] ${key.model_name} (${blank}): SKIP (smart fob)`);
      continue;
    }

    log(`  [${i + 1}/${keysNeedingImages.length}] Searching for: ${key.model_name} / ${blank}...`);

    const sourceUrl = await findKeyImage(blank, key.model_name);

    if (sourceUrl) {
      // Upload to Supabase Storage
      const ext = sourceUrl.match(/\.(jpg|png|webp)/i)?.[1] || 'jpg';
      const storagePath = `automotive/${blank.toLowerCase().replace(/[^a-z0-9]/g, '-')}.${ext}`;
      const finalUrl = await uploadToStorage(sourceUrl, storagePath);

      blankToImage[blank] = finalUrl;

      // Update all keys with this blank
      const res = await client.query(
        "UPDATE public.automotive_keys SET image_url = $1 WHERE key_blank = $2 AND (image_url IS NULL OR image_url = '')",
        [finalUrl, blank]
      );
      keyImagesFound++;
      log(`    FOUND - Updated ${res.rowCount} keys with ${blank}`);
    } else {
      keyImagesNotFound++;
      log(`    NOT FOUND for ${blank}`);
    }

    await sleep(500); // Rate limit between blanks
  }

  // Handle smart fobs - search for generic fob images by model
  log('\nSearching for smart fob images by FCC ID...');
  const { rows: fobKeys } = await client.query(`
    SELECT DISTINCT fcc_id, model_name FROM public.automotive_keys
    WHERE (image_url IS NULL OR image_url = '')
    AND fcc_id IS NOT NULL AND fcc_id != 'N/A' AND fcc_id != ''
    ORDER BY model_name
  `);

  for (const fob of fobKeys) {
    log(`  Searching fob for ${fob.model_name} (FCC: ${fob.fcc_id})...`);
    const queries = [
      `${fob.fcc_id} key fob`,
      `${fob.model_name} smart key fob`,
    ];

    let found = false;
    for (const q of queries) {
      for (const fn of [searchKeylessFactory, searchIKeyless, searchLocksmithKeyless]) {
        const url = await fn(q);
        if (url) {
          const ext = url.match(/\.(jpg|png|webp)/i)?.[1] || 'jpg';
          const safeName = fob.fcc_id.toLowerCase().replace(/[^a-z0-9]/g, '-');
          const storagePath = `automotive/fob-${safeName}.${ext}`;
          const finalUrl = await uploadToStorage(url, storagePath);

          await client.query(
            "UPDATE public.automotive_keys SET image_url = $1 WHERE fcc_id = $2 AND (image_url IS NULL OR image_url = '')",
            [finalUrl, fob.fcc_id]
          );
          log(`    FOUND for FCC ${fob.fcc_id}`);
          found = true;
          break;
        }
        await sleep(300);
      }
      if (found) break;
    }
    if (!found) log(`    NOT FOUND for FCC ${fob.fcc_id}`);
    await sleep(300);
  }

  // ============================================================
  // RESIDENTIAL LOCKS
  // ============================================================
  log('\n========================================');
  log('RESIDENTIAL LOCKS - Image Scraping');
  log('========================================\n');

  const { rows: locks } = await client.query(`
    SELECT rl.id, rl.name, rl.slug, rl.lock_type, rl.image_url, m.name as mfr_name
    FROM public.residential_locks rl
    JOIN public.manufacturers m ON m.id = rl.manufacturer_id
    WHERE rl.image_url IS NULL OR rl.image_url = ''
    ORDER BY m.name, rl.name
  `);

  log(`Residential locks needing images: ${locks.length}`);

  let lockImagesFound = 0;
  let lockImagesNotFound = 0;

  for (let i = 0; i < locks.length; i++) {
    const lock = locks[i];
    log(`  [${i + 1}/${locks.length}] ${lock.mfr_name} ${lock.name}...`);

    const sourceUrl = await findLockImage(lock.mfr_name, lock.name, lock.lock_type);

    if (sourceUrl) {
      const ext = sourceUrl.match(/\.(jpg|png|webp)/i)?.[1] || 'jpg';
      const storagePath = `residential/${lock.slug}.${ext}`;
      const finalUrl = await uploadToStorage(sourceUrl, storagePath);

      await client.query('UPDATE public.residential_locks SET image_url = $1 WHERE id = $2', [finalUrl, lock.id]);
      lockImagesFound++;
      log(`    FOUND`);
    } else {
      lockImagesNotFound++;
      log(`    NOT FOUND`);
    }

    await sleep(500);
  }

  // ============================================================
  // FILL MISSING FIELDS
  // ============================================================
  log('\n========================================');
  log('FILLING MISSING FIELDS');
  log('========================================\n');

  // Fill missing battery_type, buttons, ic_number based on FCC ID patterns
  // Common patterns from the data we have:
  const fccToData = {
    // Honda/Acura
    'KR5TP-4': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start' },
    'KR5V1X': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'KR5V2X': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'ACJ932HK1210A': { battery_type: 'CR1616', buttons: 'Lock, Unlock, Panic, Trunk' },
    'CWTWB1U545': { battery_type: 'CR1616', buttons: 'Lock, Unlock, Panic, Trunk' },
    // Toyota/Lexus
    'HYQ14FBA': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'HYQ14FBC': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'HYQ14FBN': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic' },
    'HYQ14FBP': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start' },
    'HYQ12BDP': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'HYQ12BBY': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic' },
    'HYQ14AAB': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'HYQ14AAF': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'HYQ14FLA': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic' },
    'HYQ14FLR': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic' },
    'HYQ14FLC': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic' },
    // Ford/Lincoln
    'M3N5WY8609': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start' },
    'M3N-A2C93142300': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start' },
    'M3N-A2C931426': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start' },
    'M3N5WY8610': { battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start' },
    '164-R8154': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start' },
    '164-R8182': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start' },
    // Nissan/Infiniti
    'KR5TXN7': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start' },
    'KR5S180144014': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'KR5TXN1': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'CWTWB1U415': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'CWTWB1G744': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    // GM
    'HYQ1AA': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Trunk' },
    'HYQ1EA': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Trunk' },
    'YG0G20TB1': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Trunk' },
    'OHT01060512': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start' },
    // Hyundai/Kia/Genesis
    'SY5SKFGE04': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'TQ8-FOB-4F11': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'TQ8-FOB-4F35': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'NYOSYEC4TX1611': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'CQOFD00120': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    // Subaru
    'HYQ14AHK': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    'HYQ14AHC': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    // Mazda
    'WAZSKE13D03': { battery_type: 'CR2025', buttons: 'Lock, Unlock, Panic, Trunk' },
    'WAZSKE13D01': { battery_type: 'CR2025', buttons: 'Lock, Unlock, Panic, Trunk' },
    // VW/Audi
    'NBGFS12P71': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    '5K0959753': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk' },
    // BMW
    'YGOHUF5662': { battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk' },
    'YGOHUF5767': { battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk' },
    'N5F-ID2A': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk' },
    // Chrysler/Dodge/Jeep/Ram
    'M3N-40821302': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Trunk' },
    'M3N5WY783X': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start' },
    'GQ4-54T': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start' },
    'OHT692427AA': { battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Hatch' },
    // Volvo
    'KR55WK49264': { battery_type: 'CR2430', buttons: 'Lock, Unlock, Panic, Trunk' },
    'KR55WK49266': { battery_type: 'CR2430', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start' },
    // Mercedes
    'IYZDC07': { battery_type: 'CR2025', buttons: 'Lock, Unlock, Panic, Trunk' },
    'IYZDC10': { battery_type: 'CR2025', buttons: 'Lock, Unlock, Panic, Trunk' },
    'IYZDC12K': { battery_type: 'CR2025', buttons: 'Lock, Unlock, Panic, Trunk' },
  };

  let fieldsUpdated = 0;
  for (const [fccId, data] of Object.entries(fccToData)) {
    const setClauses = [];
    const values = [];
    let paramIdx = 1;

    if (data.battery_type) {
      setClauses.push(`battery_type = $${paramIdx}`);
      values.push(data.battery_type);
      paramIdx++;
    }
    if (data.buttons) {
      setClauses.push(`buttons = $${paramIdx}`);
      values.push(data.buttons);
      paramIdx++;
    }

    if (setClauses.length > 0) {
      values.push(fccId);
      const res = await client.query(
        `UPDATE public.automotive_keys SET ${setClauses.join(', ')} WHERE fcc_id = $${paramIdx} AND (battery_type IS NULL OR battery_type = '' OR battery_type = 'N/A')`,
        values
      );
      if (res.rowCount > 0) {
        fieldsUpdated += res.rowCount;
        log(`  Updated ${res.rowCount} keys with FCC ${fccId}: battery=${data.battery_type}, buttons=${data.buttons}`);
      }
    }
  }
  log(`Total field updates: ${fieldsUpdated}`);

  // ============================================================
  // FINAL REPORT
  // ============================================================
  log('\n========================================');
  log('FINAL REPORT');
  log('========================================\n');

  const counts = await Promise.all([
    client.query('SELECT COUNT(*) FROM public.automotive_keys'),
    client.query("SELECT COUNT(*) FROM public.automotive_keys WHERE image_url IS NOT NULL AND image_url != ''"),
    client.query("SELECT COUNT(*) FROM public.automotive_keys WHERE fcc_id IS NOT NULL AND fcc_id != '' AND fcc_id != 'N/A'"),
    client.query("SELECT COUNT(*) FROM public.automotive_keys WHERE battery_type IS NOT NULL AND battery_type != '' AND battery_type != 'N/A'"),
    client.query("SELECT COUNT(*) FROM public.automotive_keys WHERE buttons IS NOT NULL AND buttons != '' AND buttons != 'N/A'"),
    client.query('SELECT COUNT(*) FROM public.residential_locks'),
    client.query("SELECT COUNT(*) FROM public.residential_locks WHERE image_url IS NOT NULL AND image_url != ''"),
  ]);

  log(`Automotive keys total:       ${counts[0].rows[0].count}`);
  log(`  With image_url:            ${counts[1].rows[0].count}`);
  log(`  With FCC ID:               ${counts[2].rows[0].count}`);
  log(`  With battery_type:         ${counts[3].rows[0].count}`);
  log(`  With buttons:              ${counts[4].rows[0].count}`);
  log(`Residential locks total:     ${counts[5].rows[0].count}`);
  log(`  With image_url:            ${counts[6].rows[0].count}`);

  await client.end();
  log('\nDone!');
}

main().catch(err => { console.error('Fatal:', err); process.exit(1); });
