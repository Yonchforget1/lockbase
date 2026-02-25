import pg from 'pg';

const { Client } = pg;

// Mapping of manufacturer name -> logo URL
// Primary source: Wikimedia Commons (stable, high-quality SVGs)
// Fallback: logo.clearbit.com, brandfetch CDN, or other stable sources
const logoMap = {
  // === AUTOMOTIVE MANUFACTURERS ===

  // Acura
  'Acura': 'https://upload.wikimedia.org/wikipedia/commons/8/8b/Acura_%282022%29.svg',

  // Alfa Romeo
  'Alfa Romeo': 'https://upload.wikimedia.org/wikipedia/commons/d/d3/Alfa_Romeo_2015.svg',

  // Aston Martin
  'Aston Martin': 'https://upload.wikimedia.org/wikipedia/commons/4/4e/Aston_Martin_wordmark.svg',

  // Audi
  'Audi': 'https://upload.wikimedia.org/wikipedia/commons/a/ad/Audi-Logo_2016.svg',

  // Bentley
  'Bentley': 'https://upload.wikimedia.org/wikipedia/en/c/c9/Bentley_logo.svg',

  // BMW
  'BMW': 'https://upload.wikimedia.org/wikipedia/commons/4/44/BMW.svg',

  // Buick
  'Buick': 'https://upload.wikimedia.org/wikipedia/commons/e/ef/Buick-logo.svg',

  // Cadillac
  'Cadillac': 'https://upload.wikimedia.org/wikipedia/commons/2/22/Cadillac_Wordmark.svg',

  // Chevrolet
  'Chevrolet': 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Logo_Chevrolet.svg',

  // Chrysler
  'Chrysler': 'https://upload.wikimedia.org/wikipedia/commons/6/63/Chrysler_logo_alt.svg',

  // Daewoo
  'Daewoo': 'https://upload.wikimedia.org/wikipedia/commons/d/de/Daewoo_Motors_logo.svg',

  // Dodge
  'Dodge': 'https://upload.wikimedia.org/wikipedia/commons/1/17/Dodge_logo.svg',

  // Eagle (Chrysler brand)
  'Eagle': 'https://upload.wikimedia.org/wikipedia/en/9/91/Eagle_%28automobile%29_Logo.png',

  // Ferrari
  'Ferrari': 'https://upload.wikimedia.org/wikipedia/en/d/d2/Ferrari_Logo.svg',

  // Fiat
  'Fiat': 'https://upload.wikimedia.org/wikipedia/commons/a/a5/Fiat_Automobiles_logo.svg',

  // Ford
  'Ford': 'https://upload.wikimedia.org/wikipedia/commons/a/a0/Ford_Motor_Company_Logo.svg',

  // Freightliner
  'Freightliner': 'https://upload.wikimedia.org/wikipedia/commons/9/99/Freightliner_logo.svg',

  // Genesis
  'Genesis': 'https://upload.wikimedia.org/wikipedia/en/b/ba/Genesis_division_emblem.svg',

  // Geo
  'Geo': 'https://upload.wikimedia.org/wikipedia/commons/0/04/Geo_car_brand_logo.svg',

  // GMC
  'GMC': 'https://upload.wikimedia.org/wikipedia/commons/6/60/GMC-Logo_2.svg',

  // Honda
  'Honda': 'https://upload.wikimedia.org/wikipedia/commons/7/76/Honda.svg',

  // Hummer
  'Hummer': 'https://upload.wikimedia.org/wikipedia/commons/1/18/Hummer_wordmark.svg',

  // Hyundai
  'Hyundai': 'https://upload.wikimedia.org/wikipedia/commons/4/44/Hyundai_Motor_Company_logo.svg',

  // Infiniti
  'Infiniti': 'https://upload.wikimedia.org/wikipedia/commons/1/12/Infiniti_logo.svg',

  // International (trucks)
  'International': 'https://upload.wikimedia.org/wikipedia/commons/4/47/International_Motors_Logo%2C_October_2024.svg',

  // Isuzu
  'Isuzu': 'https://upload.wikimedia.org/wikipedia/commons/2/20/Isuzu.svg',

  // Jaguar
  'Jaguar': 'https://upload.wikimedia.org/wikipedia/en/4/4f/Jaguar_Cars_logo.svg',

  // Jeep
  'Jeep': 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Jeep_logo.svg',

  // Kenworth
  'Kenworth': 'https://upload.wikimedia.org/wikipedia/en/2/20/Kenworth_logo.png',

  // Kia
  'Kia': 'https://upload.wikimedia.org/wikipedia/commons/4/47/KIA_logo.svg',

  // Lamborghini
  'Lamborghini': 'https://upload.wikimedia.org/wikipedia/en/d/df/Lamborghini_Logo.svg',

  // Land Rover
  'Land Rover': 'https://upload.wikimedia.org/wikipedia/commons/a/a4/Land_Rover_2023.svg',

  // Lexus
  'Lexus': 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Lexus.svg',

  // Lincoln
  'Lincoln': 'https://upload.wikimedia.org/wikipedia/commons/2/2b/Lincoln_logo.svg',

  // Lotus
  'Lotus': 'https://upload.wikimedia.org/wikipedia/en/2/2a/Lotus_Cars_logo.svg',

  // Lucid
  'Lucid': 'https://upload.wikimedia.org/wikipedia/commons/3/31/Lucid_Motors_logo.svg',

  // Mack
  'Mack': 'https://upload.wikimedia.org/wikipedia/en/b/bf/Mack_Trucks_logo.png',

  // Maserati
  'Maserati': 'https://upload.wikimedia.org/wikipedia/commons/2/22/Maserati_logo_2.svg',

  // Maybach
  'Maybach': 'https://upload.wikimedia.org/wikipedia/commons/d/d4/Maybach_symbol.svg',

  // Mazda
  'Mazda': 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Mazda_logo.svg',

  // McLaren
  'McLaren': 'https://upload.wikimedia.org/wikipedia/commons/2/2f/McLaren_Automotive_logo.svg',

  // Mercedes-Benz
  'Mercedes-Benz': 'https://upload.wikimedia.org/wikipedia/commons/9/90/Mercedes-Benz_Logo_2010.svg',

  // Mercury
  'Mercury': 'https://upload.wikimedia.org/wikipedia/commons/e/e4/Mercury_Logo_%28automobile_company%29.svg',

  // Mini
  'Mini': 'https://upload.wikimedia.org/wikipedia/commons/3/37/Mini_logo_2024.svg',

  // Mitsubishi
  'Mitsubishi': 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Mitsubishi_logo.svg',

  // Nissan
  'Nissan': 'https://upload.wikimedia.org/wikipedia/commons/8/8c/Nissan_2020_logo.svg',

  // Oldsmobile
  'Oldsmobile': 'https://upload.wikimedia.org/wikipedia/en/0/09/Oldsmobile_logo.png',

  // Peterbilt
  'Peterbilt': 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Peterbilt_logo.svg',

  // Plymouth
  'Plymouth': 'https://upload.wikimedia.org/wikipedia/commons/a/a9/Plymouth-logo.svg',

  // Polestar
  'Polestar': 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Polestar_Logo.svg',

  // Pontiac
  'Pontiac': 'https://upload.wikimedia.org/wikipedia/commons/9/9c/Pontiac_dart_emblem.svg',

  // Porsche
  'Porsche': 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Porsche_Wortmarke.svg',

  // Ram
  'Ram': 'https://upload.wikimedia.org/wikipedia/en/5/5c/Ram_Trucks_logo.png',

  // Rivian
  'Rivian': 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Rivian_logo_and_wordmark.svg',

  // Rolls-Royce
  'Rolls-Royce': 'https://upload.wikimedia.org/wikipedia/commons/5/52/Rolls-Royce_Motor_Cars_logo.svg',

  // Saab
  'Saab': 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Saab_wordmark_grey.svg',

  // Saturn
  'Saturn': 'https://upload.wikimedia.org/wikipedia/commons/0/02/Saturn-Logo.svg',

  // Scion
  'Scion': 'https://upload.wikimedia.org/wikipedia/en/3/35/Scion_logo2.svg',

  // Smart
  'Smart': 'https://upload.wikimedia.org/wikipedia/commons/3/31/Smart_logo.svg',

  // Subaru
  'Subaru': 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Subaru_logo.svg',

  // Suzuki
  'Suzuki': 'https://upload.wikimedia.org/wikipedia/commons/1/12/Suzuki_logo_2.svg',

  // Tesla
  'Tesla': 'https://upload.wikimedia.org/wikipedia/commons/e/e8/Tesla_logo.png',

  // Toyota
  'Toyota': 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Toyota_EU.svg',

  // Volkswagen
  'Volkswagen': 'https://upload.wikimedia.org/wikipedia/commons/a/a1/Volkswagen_-_Logo.svg',

  // Volvo
  'Volvo': 'https://upload.wikimedia.org/wikipedia/commons/4/44/Volvo_logo.svg',

  // === LOCK / RESIDENTIAL MANUFACTURERS ===

  // ASSA (lock manufacturer)
  'ASSA': 'https://upload.wikimedia.org/wikipedia/commons/8/85/Assa_abloy_logo.svg',

  // Baldwin (hardware)
  'Baldwin': 'https://www.baldwinhardware.com/on/demandware.static/Sites-baldwin-site/-/default/dw3b2a27f1/images/baldwinredesign/header/baldwin-logo-black.svg',

  // Brinks (locks/security)
  'Brinks': 'https://upload.wikimedia.org/wikipedia/commons/1/1b/Brink%27s_logo.svg',

  // Corbin Russwin
  'Corbin Russwin': 'https://www.corbinrusswin.com/on/demandware.static/Sites-yale-site/-/default/dw6c6ae3e9/images/header/corbinrusswin-logo-black.svg',

  // Defiant (Home Depot brand)
  'Defiant': 'https://images.thdstatic.com/catalog/pdfImages/a4/a489ac6c-5c5f-414b-8ee9-4be044eb0bfb.png',

  // Emtek
  'Emtek': 'https://www.emtek.com/on/demandware.static/Sites-emtek-site/-/default/dw5cbe6ab5/images/header/emtek-logo-black.svg',

  // Kwikset
  'Kwikset': 'https://www.kwikset.com/on/demandware.static/Sites-kwikset-site/-/default/dw4eff18d3/images/header/kwikset-logo-black.svg',

  // Medeco
  'Medeco': 'https://www.medeco.com/on/demandware.static/Sites-medeco-site/-/default/dw8393ec1a/images/header/medeco-logo-black.svg',

  // Mul-T-Lock
  'Mul-T-Lock': 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Mul-T-Lock_logo.svg',

  // Sargent
  'Sargent': 'https://www.sargentlock.com/on/demandware.static/Sites-sargent-site/-/default/dwc0ee5f1e/images/header/sargent-logo-black.svg',

  // Schlage
  'Schlage': 'https://www.schlage.com/on/demandware.static/Sites-schlage-site/-/default/dw2a454f2c/images/header/schlage-logo-black.svg',

  // Weiser
  'Weiser': 'https://www.weiserlock.com/on/demandware.static/Sites-weiser-site/-/default/dw07dba668/images/header/weiser-logo-black.svg',

  // Yale
  'Yale': 'https://www.yalelock.com/on/demandware.static/Sites-yale-site/-/default/dw1dca5d2f/images/header/yale-residential-logo-black.svg',
};

async function main() {
  const client = new Client('postgresql://postgres:Yonchforget1!@db.eptnkprttskodgnfeasg.supabase.co:5432/postgres');

  try {
    await client.connect();
    console.log('Connected to database.\n');

    // Query all manufacturers
    const { rows: manufacturers } = await client.query(
      'SELECT id, name, slug, type, logo_url FROM manufacturers ORDER BY name'
    );

    console.log(`Found ${manufacturers.length} manufacturers.\n`);

    // Check coverage
    const missingLogos = manufacturers.filter(m => !logoMap[m.name]);
    if (missingLogos.length > 0) {
      console.log('WARNING: Missing logo URLs for:');
      missingLogos.forEach(m => console.log(`  - ${m.name}`));
      console.log('');
    }

    const mappedCount = manufacturers.filter(m => logoMap[m.name]).length;
    console.log(`Logo URLs mapped: ${mappedCount}/${manufacturers.length}\n`);

    // Update in a transaction
    await client.query('BEGIN');

    let updated = 0;
    let skipped = 0;
    let errors = 0;

    for (const mfr of manufacturers) {
      const logoUrl = logoMap[mfr.name];
      if (!logoUrl) {
        console.log(`SKIP: No logo URL for "${mfr.name}"`);
        skipped++;
        continue;
      }

      try {
        await client.query(
          'UPDATE manufacturers SET logo_url = $1 WHERE id = $2',
          [logoUrl, mfr.id]
        );
        console.log(`OK: ${mfr.name} -> ${logoUrl.substring(0, 80)}...`);
        updated++;
      } catch (err) {
        console.error(`ERROR updating ${mfr.name}: ${err.message}`);
        errors++;
      }
    }

    await client.query('COMMIT');

    console.log('\n=== SUMMARY ===');
    console.log(`Total manufacturers: ${manufacturers.length}`);
    console.log(`Updated: ${updated}`);
    console.log(`Skipped: ${skipped}`);
    console.log(`Errors: ${errors}`);

    // Verify
    const { rows: verified } = await client.query(
      'SELECT name, logo_url FROM manufacturers WHERE logo_url IS NOT NULL ORDER BY name'
    );
    console.log(`\nVerification: ${verified.length} manufacturers now have logo_url set.`);

    if (verified.length < manufacturers.length) {
      const { rows: missing } = await client.query(
        'SELECT name FROM manufacturers WHERE logo_url IS NULL ORDER BY name'
      );
      if (missing.length > 0) {
        console.log('\nStill missing logo_url:');
        missing.forEach(m => console.log(`  - ${m.name}`));
      }
    }

  } catch (err) {
    console.error('Fatal error:', err);
    try { await client.query('ROLLBACK'); } catch(e) {}
    process.exit(1);
  } finally {
    await client.end();
    console.log('\nDone.');
  }
}

main();
