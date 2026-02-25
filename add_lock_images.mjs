import pg from 'pg';
const { Client } = pg;
const client = new Client({ connectionString: 'postgresql://postgres:Yonchforget1!@db.eptnkprttskodgnfeasg.supabase.co:5432/postgres' });

// Image URL mapping by lock ID
// Sources: manufacturer websites (Kwikset, Schlage, Weiser, Emtek, Baldwin, ASSA, Sargent, Yale),
// retailer sites (Security Snobs, The Gadget Flow), and image hosting services (imagekit)
const imageMap = {
  // ASSA locks
  'fb2d2fac-f0fb-476e-acd2-f41897726038': 'https://securitysnobs.com/item_images/11912df7eefa3f3b8e4bf5cbe11ffb00_2.jpg',
  // ASSA Abloy Protec2 Deadbolt - from Security Snobs product page

  '0b15d617-444b-4602-8a01-03b1ffcf9cfb': 'https://ik.imagekit.io/twr9df4sfpl/dam/dam/AADSS1252810-web',
  // ASSA Max+ Restricted Padlock - from ASSA Lock official site (imagekit CDN)

  'd74d1f1d-e864-4c34-99c9-ef0a37ce1e70': 'https://www.lockwiki.com/images/thumb/8/8e/ASSA_Twin_cylinder.jpg/240px-ASSA_Twin_cylinder.jpg',
  // ASSA Twin 6000 Deadbolt - from Lockwiki

  'd74f6e3b-9464-49f6-ab63-2788bddf152f': 'https://ik.imagekit.io/twr9df4sfpl/dam/dam/AADSS1204474-web',
  // ASSA Twin Pro Mortise Lock - from ASSA Lock official site (imagekit CDN)

  // Baldwin locks
  'ef602f73-34fc-478e-bfa5-00e1c10d9cac': 'https://images.baldwinhardware.com/is/image/Baldwin/bw_es-8231-112-cb',
  // Baldwin Estate Series Deadbolt - from Baldwin Hardware official site

  '1124b4ea-e652-44d3-9d5a-8b3476d28689': 'https://images.baldwinhardware.com/is/image/Baldwin/bw_pr-db-sbd-sc-15-smt-cb',
  // Baldwin Prestige Series Deadbolt - from Baldwin Hardware official site

  // Brinks locks
  '19576637-b3ea-463a-a284-aae6176e44ae': 'https://thegadgetflow.com/wp-content/uploads/2018/01/Brinks-ARRAY-Smart-Deadbolt-01.jpg',
  // Brinks Array Smart Deadbolt - from The Gadget Flow

  'eb5373f8-7450-4bc5-a50a-a4dc5ffbabe9': 'https://m.media-amazon.com/images/I/71JpSh6y-xL._AC_SL1500_.jpg',
  // Brinks Push Pull Rotate Deadbolt - Amazon product image (B00J03HT02)

  // Corbin Russwin
  '4639518d-765f-4ef3-b9e6-c43654fd430c': 'https://ik.imagekit.io/twr9df4sfpl/dam/dam/AADSS1062188',
  // Corbin Russwin Access 800LP1 Mortise Lock - from Corbin Russwin/ASSA ABLOY CDN (ML2000 series image)

  // Defiant locks
  '0ab34c02-a2ee-4e7e-9ed6-0a9df9df280e': 'https://images.thdstatic.com/productImages/ddd9b10a-9e09-4e3a-893f-b6d3e59b7f6c/svn/defiant-door-knobs-32t8600b-64_600.jpg',
  // Defiant Brandywine Entry Knob - from Home Depot CDN

  'ef0dc15c-d71a-461e-b678-ccbb9fbe0069': 'https://images.thdstatic.com/productImages/e2e3a44a-4c0b-49c5-aab1-20c339c3b2cf/svn/defiant-door-lock-combo-packs-32bgx2d1bd-64_600.jpg',
  // Defiant Hartford Entry Lever - from Home Depot CDN

  // Emtek
  '3a13a6e8-11d5-4d0b-a84e-f026055d35d4': 'https://www.emtek.com/media/salsify/images/xl/xl2e2vkw6u-2024-02-23T212248Z-HeliosLever_EM_KO.jpg',
  // Emtek Helios Lever Entry Set - from Emtek official site

  // Kwikset locks
  '73c56a4e-53fc-4eef-82aa-0bcdc015612a': 'https://images.kwikset.com/is/image/Kwikset/kw_400t-15-smt_c1',
  // Kwikset 400T Tylo Entry Knob - from Kwikset official site

  '3f160c43-44d7-444e-afe4-3534af79a326': 'https://images.kwikset.com/is/image/Kwikset/kw_660-sqt-db-sc-15-smt-ex',
  // Kwikset 660 Contemporary Deadbolt - from Kwikset official site

  '8ff4b476-4a2c-4a60-94d2-175a2abd2044': 'https://images.kwikset.com/is/image/Kwikset/kw_980-db-sc-15-smt-ex',
  // Kwikset 980 Single Cylinder Deadbolt - from Kwikset official site

  'f7f6178e-177d-4164-bb91-c58e5ca91efb': 'https://images.kwikset.com/is/image/Kwikset/kw_916trl-sl-db-15-ex',
  // Kwikset SmartCode 916 Touchscreen - from Kwikset official site

  // Sargent
  'ceb2d903-7dc3-45f9-bcda-0a49dba0cafa': 'https://ik.imagekit.io/twr9df4sfpl/dam/dam/AADSS1062188',
  // Sargent 6500 Series Cylindrical Lock - from Sargent/ASSA ABLOY CDN

  // Schlage locks
  'b080d074-8295-4c06-bb3e-c3772ae8e78a': 'https://www.schlage.com/content/dam/us-res-mktg/Product-imagery/Schlage/Deadbolts/B60_STD716_SL.jpg.thumb.1280.1280.png',
  // Schlage B60N Single Cylinder Deadbolt - from Schlage official site

  'a918077a-c102-4a52-a4d8-9c938f37e44d': 'https://www.schlage.com/content/dam/us-res-mktg/Product-imagery/Schlage/electronic-locks/Connect/BE469_CEN716_HO.jpg.thumb.1280.1280.png',
  // Schlage BE469 Connect Touchscreen Deadbolt - from Schlage official site

  '0a15fb90-d0b5-46f1-b2b4-68df75454f37': 'https://www.schlage.com/content/dam/us-res-mktg/Product-imagery/Schlage/electronic-locks/Keypad-locks/FE575_CAM716_ACC_SL.jpg.thumb.1280.1280.png',
  // Schlage FE575 Keypad Entry - from Schlage official site

  // Weiser locks
  '10b0e022-3273-41f4-afb1-ae6a272fa1be': 'https://images.weiserlock.com/is/image/Weiser/we_ged2500-sl-db-15-ex',
  // Weiser Halo Wi-Fi Smart Deadbolt - from Weiser official site

  '6ecfb605-c348-4742-abbf-b7896fd396b6': 'https://images.weiserlock.com/is/image/Weiser/we_ged1460-26d-smt_c1',
  // Weiser Powerbolt 2 Electronic Deadbolt - from Weiser official site

  '8e1c79e2-d579-472e-b414-ab0dcc5a6dbc': 'https://images.weiserlock.com/is/image/Weiser/we_ged2100-smt-15_c3',
  // Weiser SmartCode 10 Keypad Deadbolt - from Weiser official site

  // Yale locks
  'a0a3a23f-f47f-448c-a83d-d9ec25889d8c': 'https://gw-assets.assaabloy.com/is/image/assaabloy/9177e-yrd256nrsc_en_yac1',
  // Yale Assure Lock SL - from Yale/ASSA ABLOY official site

  '245b9621-2571-4487-ab73-907a6301e1da': 'https://gw-assets.assaabloy.com/is/image/assaabloy/9177e-yrd256nrsc_en_yac1',
  // Yale YRD256 Touchscreen Deadbolt - from Yale/ASSA ABLOY official site (same product line as Assure Lock SL)
};

async function main() {
  await client.connect();

  // Query locks missing images
  const result = await client.query(`
    SELECT rl.id, rl.name, m.name as manufacturer
    FROM residential_locks rl
    JOIN manufacturers m ON rl.manufacturer_id = m.id
    WHERE rl.image_url IS NULL OR rl.image_url = ''
    ORDER BY m.name, rl.name
  `);

  console.log(`Found ${result.rows.length} locks without images.\n`);

  let updated = 0;
  let skipped = 0;

  for (const lock of result.rows) {
    const imageUrl = imageMap[lock.id];
    if (imageUrl) {
      await client.query(
        'UPDATE residential_locks SET image_url = $1 WHERE id = $2',
        [imageUrl, lock.id]
      );
      console.log(`  UPDATED: ${lock.manufacturer} ${lock.name}`);
      console.log(`           -> ${imageUrl}`);
      updated++;
    } else {
      console.log(`  SKIPPED: ${lock.manufacturer} ${lock.name} (no image found)`);
      skipped++;
    }
  }

  console.log(`\n--- Summary ---`);
  console.log(`Updated: ${updated}`);
  console.log(`Skipped: ${skipped}`);
  console.log(`Total processed: ${result.rows.length}`);

  // Verify the update
  const verify = await client.query(`
    SELECT COUNT(*) as total FROM residential_locks
  `);
  const withImages = await client.query(`
    SELECT COUNT(*) as cnt FROM residential_locks WHERE image_url IS NOT NULL AND image_url != ''
  `);
  console.log(`\nVerification: ${withImages.rows[0].cnt} of ${verify.rows[0].total} locks now have images.`);

  await client.end();
}

main().catch(e => { console.error(e); process.exit(1); });
