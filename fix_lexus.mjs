import pg from 'pg';
const { Client } = pg;
const client = new Client({
  host: 'db.eptnkprttskodgnfeasg.supabase.co', port: 5432,
  database: 'postgres', user: 'postgres', password: 'Yonchforget1!',
  ssl: { rejectUnauthorized: false }
});
const MFR = 'eaeea95b-d833-45c4-ad93-0a1f1229ca5b';
const MODEL_IDS = {
  ES: '9aee3a38-4bce-44fb-bd07-8d25cbc605b6', GX: '57f56795-5bec-4263-b282-3c3dc7fec31e',
  IS: '4e08c003-ac45-47ee-b806-89592367bee5', LC: 'bf26b0ac-e36a-4c3f-a60f-3491510547c3',
  LX: '5ba3e1c9-ad84-42ee-aaa3-2a21d0ea3b34', NX: 'ebf242d6-5c50-4bd9-81e0-afb338b0303a',
  RX: '912304e5-cf5e-47ef-95a7-9eca388f948f', UX: 'a5700c2c-3bb9-4ac0-9456-3279aec6db3c',
  GS: null, LS: null, CT: null, RC: null, SC: null, TX: null,
};
const MISSING = ['GS', 'LS', 'CT', 'RC', 'SC', 'TX'];

// Chip presets: [transponder_type, chip_type, key_blank, key_type, fcc, ic, freq, batt, btns, emg, lishi, obd]
const C = {
  '4C':    ['Texas 4C','4C','TOY48','transponder',null,null,null,null,null,null,'Lishi TOY48',false],
  '4D68':  ['Texas 4D68','4D68','TOY48','transponder',null,null,null,null,null,null,'Lishi TOY48',true],
  '4D68R': ['Texas 4D68','4D68','TOY48','transponder','HYQ12BBT','1551A-12BBT','315 MHz','CR2016',null,null,'Lishi TOY48',true],
  'SK1':   ['Texas 4D 80-bit','4D (Toyota D)','TOY48','smart_key','HYQ14AAB','1551A-14AAB','315 MHz','CR1632','4','TOY48','Lishi TOY48',false],
  'SK1X':  ['Texas 4D 80-bit','4D (Toyota D)','TOY48','smart_key','HYQ14ACX','1551A-14ACX','315 MHz','CR1632','4','TOY48','Lishi TOY48',false],
  'SK2A':  ['Texas Crypto 128-bit AES','H chip (8A)','TOY48','smart_key','HYQ14FBA','1551A-14FBA','315 MHz','CR2032','4','TOY48','Lishi TOY48',false],
  'SK2B':  ['Texas Crypto 128-bit AES','H chip (8A)','TOY48','smart_key','HYQ14FBB','1551A-14FBB','315 MHz','CR2032','4','TOY48','Lishi TOY48',false],
  'SK2C':  ['Texas Crypto 128-bit AES','H chip (8A)','TOY48','smart_key','HYQ14FBC','1551A-14FBC','315 MHz','CR2032','4','TOY48','Lishi TOY48',false],
  'SK2F':  ['Texas Crypto 128-bit AES','H chip (8A)','TOY48','smart_key','HYQ14FBF','1551A-14FBF','315 MHz','CR2032','4','TOY48','Lishi TOY48',false],
  'SK2N':  ['Texas Crypto 128-bit AES','H chip (8A)','TOY48','smart_key','HYQ14FBN','1551A-14FBN','315 MHz','CR2032','4','TOY48','Lishi TOY48',false],
  'SK3Z':  ['Texas Crypto 128-bit AES','8A-HA','TOY51','smart_key','HYQ14FBZ','1551A-14FBZ','315 MHz','CR2032','4','TOY51','Lishi TOY51',false],
  'SK3L':  ['Texas Crypto 128-bit AES','8A-HA','TOY51','smart_key','HYQ14FLC','1551A-14FLC','315 MHz','CR2032','4','TOY51','Lishi TOY51',false],
};

function mk(model, ys, ye, preset, btnsOvr, notes) {
  const p = C[preset];
  return {
    model, year_start: ys, year_end: ye,
    transponder_type: p[0], chip_type: p[1], key_blank: p[2], key_type: p[3],
    fcc_id: p[4], ic_number: p[5], remote_frequency: p[6],
    battery_type: p[7], buttons: btnsOvr || p[8], emergency_key_blank: p[9],
    test_key_blank: p[2], lishi_tool: p[10], obd_programmable: p[11],
    pin_code_required: false, programming_notes: notes,
  };
}

const lexusKeys = [
  // === ES ===
  mk('ES',1997,2001,'4C',null,'Transponder key with 4C chip. Requires dedicated programmer (no OBD).'),
  mk('ES',2002,2003,'4D68',null,'Transponder key with 4D68 chip. OBD programmable.'),
  mk('ES',2004,2006,'4D68R','4','Remote head key. 4D68 chip. 315 MHz. OBD programmable. PN: 89070-33371.'),
  mk('ES',2007,2009,'SK1','4','Smart proximity key. Board 0140. PN: 89904-30270. Requires Techstream or aftermarket tool.'),
  mk('ES',2010,2012,'SK1X','4','Smart proximity key. GNE Board 5290. PN: 89904-30290. Requires Techstream or Autel IM608.'),
  mk('ES',2013,2015,'SK2A','4','Smart key with H chip (8A). AG Board 2110. PN: 89904-30A30.'),
  mk('ES',2016,2018,'SK2B','4','Smart key with H chip (8A). G Board 0010. PN: 89904-30A50.'),
  mk('ES',2019,2021,'SK2N','4','Smart key. Board 3950. PN: 8990H-33020. Requires Techstream or Autel.'),
  mk('ES',2022,2025,'SK3Z','4','Gen 3 smart key. TOY51 blade. PN: 8990H-33330.'),

  // === GS ===
  mk('GS',1998,2000,'4C',null,'Transponder key with 4C chip. Requires dedicated tool.'),
  mk('GS',2001,2005,'4D68',null,'Transponder key with 4D68 chip. OBD programmable.'),
  mk('GS',2006,2011,'SK1','4','Smart key. Board 0140. PN: 89904-30270. 4D 80-bit chip.'),
  mk('GS',2013,2015,'SK2A','4','Smart key with H/8A chip. AG Board 2110. PN: 89904-30A30.'),
  mk('GS',2016,2020,'SK2B','4','Smart key with H/8A chip. G Board 0010. FCC: HYQ14FBB.'),

  // === GX ===
  mk('GX',2003,2005,'4D68',null,'GX 470 transponder key with 4D68 chip. OBD programmable.'),
  mk('GX',2006,2009,'4D68R','3','GX 470 remote head key. 4D68 chip. 315 MHz. OBD programmable.'),
  mk('GX',2010,2015,'SK1X','4','GX 460 smart key. GNE Board 5290. PN: 89904-60590.'),
  mk('GX',2016,2021,'SK2A','4','GX 460 smart key. AG Board 2110. PN: 89904-60K90.'),
  mk('GX',2022,2023,'SK2F','4','GX 460 smart key. FCC: HYQ14FBF. H/8A chip.'),
  mk('GX',2024,2025,'SK3Z','4','GX 550 gen 3 smart key. TOY51 blade.'),

  // === IS ===
  mk('IS',2001,2005,'4D68',null,'Transponder key with 4D68 chip. OBD programmable.'),
  mk('IS',2006,2008,'SK1','4','Smart key. Board 0140. PN: 89904-30270. 4D 80-bit chip.'),
  mk('IS',2009,2013,'SK1X','4','Smart key. GNE Board 5290. PN: 89904-53300.'),
  mk('IS',2014,2015,'SK2A','4','Smart key with H/8A chip. AG Board 2110. PN: 89904-53510.'),
  mk('IS',2016,2020,'SK2B','4','Smart key. G Board 0010. FCC: HYQ14FBB.'),
  mk('IS',2021,2025,'SK2N','4','Smart key. Board 3950. PN: 8990H-53040.'),

  // === LS ===
  mk('LS',1998,2000,'4C',null,'LS 400 transponder key with 4C chip. Requires dedicated tool.'),
  mk('LS',2001,2003,'4D68',null,'LS 430 transponder key with 4D68 chip. OBD programmable.'),
  mk('LS',2004,2006,'SK1','4','LS 430 smart key. Board 0140. Early smart key system.'),
  mk('LS',2007,2012,'SK1','4','LS 460/600h smart key. Board 0140. PN: 89904-50380.'),
  mk('LS',2013,2017,'SK2A','4','LS 460 smart key. AG Board 2110. H/8A chip.'),
  mk('LS',2018,2021,'SK2C','4','LS 500/500h smart key. Board 0351. PN: 8990H-50030.'),
  mk('LS',2022,2025,'SK3Z','4','LS 500 gen 3 smart key. TOY51 blade.'),

  // === LX ===
  mk('LX',1998,2002,'4C',null,'LX 470 transponder key with 4C chip.'),
  mk('LX',2003,2007,'4D68',null,'LX 470 transponder key with 4D68 chip. OBD programmable.'),
  mk('LX',2008,2015,'SK1X','4','LX 570 smart key. GNE Board 5290. PN: 89904-60590.'),
  mk('LX',2016,2021,'SK2A','4','LX 570 smart key. AG Board 2110. H/8A chip.'),
  mk('LX',2022,2025,'SK3Z','4','LX 600 gen 3 smart key. TOY51 blade.'),

  // === NX ===
  mk('NX',2015,2021,'SK2A','4','NX 200t/300 smart key. AG Board 2110. PN: 89904-78460.'),
  mk('NX',2022,2025,'SK3Z','4','NX 250/350/450h+ gen 3 smart key. TOY51 blade.'),

  // === RX ===
  mk('RX',1999,2003,'4C',null,'RX 300 transponder key with 4C chip.'),
  mk('RX',2004,2006,'4D68R','3','RX 330 remote head key. 4D68 chip. 315 MHz. OBD programmable.'),
  mk('RX',2007,2009,'SK1','4','RX 350/400h smart key. Board 0140. PN: 89904-48100.'),
  mk('RX',2010,2015,'SK1X','4','RX 350/450h smart key. GNE Board 5290. PN: 89904-48481.'),
  mk('RX',2016,2019,'SK2A','4','RX 350/450h smart key. AG Board 2110. PN: 89904-48V80.'),
  mk('RX',2020,2022,'SK2F','4','RX 350/450h smart key. FCC: HYQ14FBF. H/8A chip.'),
  mk('RX',2023,2025,'SK3L','4','RX 350/500h gen 3 smart key. TOY51 blade. PN: 8990H-48110.'),

  // === CT 200h ===
  mk('CT',2011,2013,'SK1X','4','CT 200h smart key. GNE Board 5290. 4D 80-bit chip.'),
  mk('CT',2014,2017,'SK2A','4','CT 200h smart key. AG Board 2110. H/8A chip.'),

  // === RC ===
  mk('RC',2015,2020,'SK2A','4','RC 200t/300/350 smart key. AG Board 2110. H/8A chip.'),
  mk('RC',2021,2024,'SK2N','4','RC 300/350 smart key. Board 3950. FCC: HYQ14FBN.'),

  // === SC ===
  mk('SC',1998,2000,'4C',null,'SC 300/400 transponder key with 4C chip.'),
  mk('SC',2001,2005,'4D68',null,'SC 430 transponder key with 4D68 chip. OBD programmable.'),
  mk('SC',2006,2010,'SK1','3','SC 430 smart key. Board 0140. PN: 89904-24020.'),

  // === TX ===
  mk('TX',2024,2025,'SK3Z','4','TX 350/500h gen 3 smart key. TOY51 blade.'),

  // === UX ===
  mk('UX',2019,2021,'SK2C','4','UX 200/250h smart key. Board 0351. PN: 8990H-76040.'),
  mk('UX',2022,2025,'SK3Z','4','UX 250h gen 3 smart key. TOY51 blade.'),
];

// ============================================================
async function main() {
  await client.connect();
  console.log('Connected.\n');
  try {
    const cur = await client.query(`SELECT COUNT(*) FROM automotive_keys WHERE manufacturer_id=$1`, [MFR]);
    console.log(`Current Lexus rows: ${cur.rows[0].count}`);

    // Delete keys
    const dk = await client.query(`DELETE FROM automotive_keys WHERE manufacturer_id=$1`, [MFR]);
    console.log(`Deleted ${dk.rowCount} key rows.`);

    // Delete vehicle_years
    const ids = Object.values(MODEL_IDS).filter(Boolean);
    const dy = await client.query(`DELETE FROM vehicle_years WHERE model_id = ANY($1::uuid[])`, [ids]);
    console.log(`Deleted ${dy.rowCount} vehicle_years rows.`);

    // Create missing models
    for (const name of MISSING) {
      const r = await client.query(
        `INSERT INTO vehicle_models (id, manufacturer_id, name, slug)
         VALUES (gen_random_uuid(), $1, $2, $3)
         ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name=EXCLUDED.name RETURNING id`,
        [MFR, name, name.toLowerCase()]
      );
      MODEL_IDS[name] = r.rows[0].id;
      console.log(`  Model ${name} -> ${MODEL_IDS[name]}`);
    }

    // Insert keys
    console.log('\nInserting Lexus keys...\n');
    let n = 0;
    for (const k of lexusKeys) {
      const mid = MODEL_IDS[k.model];
      if (!mid) { console.error(`No model ID: ${k.model}`); continue; }

      const yr = await client.query(
        `INSERT INTO vehicle_years (id,model_id,year_start,year_end)
         VALUES (gen_random_uuid(),$1,$2,$3)
         ON CONFLICT (model_id,year_start,year_end) DO UPDATE SET year_start=EXCLUDED.year_start
         RETURNING id`, [mid, k.year_start, k.year_end]
      );
      await client.query(
        `INSERT INTO automotive_keys (
          id,year_id,manufacturer_id,model_name,key_blank,transponder_type,chip_type,
          remote_frequency,key_type,fcc_id,ic_number,programming_notes,pin_code_required,
          obd_programmable,emergency_key_blank,year_start,year_end,battery_type,buttons,
          test_key_blank,image_url,lishi_tool
        ) VALUES (
          gen_random_uuid(),$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21
        )`, [
          yr.rows[0].id, MFR, `Lexus ${k.model}`,
          k.key_blank, k.transponder_type, k.chip_type, k.remote_frequency,
          k.key_type, k.fcc_id, k.ic_number, k.programming_notes,
          k.pin_code_required, k.obd_programmable, k.emergency_key_blank,
          k.year_start, k.year_end, k.battery_type, k.buttons,
          k.test_key_blank, null, k.lishi_tool,
        ]
      );
      n++;
      console.log(`  [${n}] Lexus ${k.model} ${k.year_start}-${k.year_end} | ${k.key_type} | ${k.chip_type} | FCC: ${k.fcc_id||'N/A'}`);
    }
    console.log(`\nInserted ${n} rows.`);

    // Verify
    console.log('\n' + '='.repeat(70));
    const v = await client.query(
      `SELECT model_name,year_start,year_end,key_type,key_blank,chip_type,fcc_id,
              remote_frequency,battery_type,buttons,lishi_tool
       FROM automotive_keys WHERE manufacturer_id=$1 ORDER BY model_name,year_start`, [MFR]
    );
    for (const r of v.rows)
      console.log(`${r.model_name} (${r.year_start}-${r.year_end}) | ${r.key_type} | ${r.key_blank} | ${r.chip_type} | FCC:${r.fcc_id||'N/A'} | ${r.remote_frequency||'N/A'} | ${r.battery_type||'N/A'} | btn:${r.buttons||'N/A'} | ${r.lishi_tool||'N/A'}`);
    console.log(`\nTotal: ${v.rows.length} Lexus key rows.`);
  } catch (err) {
    console.error('ERROR:', err.message, err.stack);
  } finally {
    await client.end();
    console.log('Done.');
  }
}
main();
