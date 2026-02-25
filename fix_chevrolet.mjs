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

// Chevrolet manufacturer_id
const CHEVY_MFR_ID = '6715ba9c-427d-4ec0-b22c-2add8ef712b4';

// UHS Hardware Shopify CDN base
const UHS_CDN = 'https://cdn.shopify.com/s/files/1/0525/3955/6651';

// Image URLs sourced from UHS Hardware product pages
const IMG = {
  // PK3 transponder keys (B97/B99/B102 - old GM sidewinder)
  b97_pk3:              `${UHS_CDN}/products/GM-B97-PK3-Transponder-Key-Megamos-13-Chip-AFTERMARKET.jpg`,
  b99_pk3:              `${UHS_CDN}/products/GM-B99-PK3-Transponder-Key-Megamos-13-Chip-AFTERMARKET.jpg`,
  b102_pk3:             `${UHS_CDN}/products/GM-B102-Transponder-Key-AFTERMARKET.jpg`,

  // B111 circle-plus transponder (2007+)
  b111_circle_plus:     `${UHS_CDN}/products/GM-B111-Transponder-Key-Chip-46-Circle-Plus-AFTERMARKET.jpg`,

  // GM flip keys (OHT01060512)
  flip_3b_oht:          `${UHS_CDN}/products/2010-2019-Chevy-GMC-3-Button-Remote-Flip-Key-OHT01060512-AFTERMARKET.jpg`,
  flip_4b_oht:          `${UHS_CDN}/products/2010-2019-GM-4-Button-Flip-Key-OHT01060512-46-Chip-AFTERMARKET.jpg`,
  flip_5b_oht:          `${UHS_CDN}/products/2010-2020-GM-5-Button-Flip-Key-OHT01060512-AFTERMARKET.jpg`,

  // GM flip key PEPS (OHT05918179)
  flip_5b_peps:         `${UHS_CDN}/products/2010-2019-Chevrolet-5-Button-Flip-Key-HS-PEPS-OHT05918179-OEM.jpg`,

  // Chevrolet smart keys - HYQ4EA (433 MHz)
  smart_hyq4ea_4b:      `${UHS_CDN}/products/2016-2022-Chevrolet-4-Button-Smart-Key-HYQ4EA-433-Mhz-AFTERMARKET.jpg`,
  smart_hyq4ea_5b:      `${UHS_CDN}/products/2016-2022-Chevrolet-5-Button-Smart-Key-HYQ4EA-AFTERMARKET.jpg`,

  // Chevrolet smart keys - HYQ4AA (315 MHz)
  smart_hyq4aa_3b:      `${UHS_CDN}/products/2016-2021-Chevrolet-3-Button-Smart-Key-HYQ4AA-OEM.jpg`,
  smart_hyq4aa_4b:      `${UHS_CDN}/products/2016-2022-Chevrolet-Bolt-Volt-4-Button-Smart-Key-HYQ4AA.jpg`,
  smart_hyq4aa_5b:      `${UHS_CDN}/products/2018-2022-Chevrolet-Equinox-5-Button-Smart-Key-HYQ4AA-AFTERMARKET.jpg`,
  smart_hyq4aa_5b_trax: `${UHS_CDN}/products/2018-2020-Chevrolet-Trax-5-Button-Smart-Key-HYQ4AA-Strattec.jpg`,

  // Chevrolet smart keys - HYQ4ES (433 MHz, 2021+)
  smart_hyq4es_4b:      `${UHS_CDN}/products/2021-2024-Chevrolet-4-Button-Smart-Key-HYQ4ES-OEM.jpg`,
  smart_hyq4es_5b:      `${UHS_CDN}/products/2021-2024-Chevrolet-5-Button-Smart-Key-HYQ4ES-OEM.jpg`,

  // Silverado/Sierra smart keys - HYQ1EA (434 MHz, 2019+)
  smart_hyq1ea_5b:      `${UHS_CDN}/products/2019-2021-Chevrolet-Silverado-5-Button-Smart-Key-HYQ1EA-434-MHz-AFTERMARKET.jpg`,

  // Tahoe/Suburban smart keys - HYQ1AA (315 MHz, 2015-2020)
  smart_hyq1aa_6b:      `${UHS_CDN}/products/2015-2020-Chevrolet-Suburban-Tahoe-6-Button-Smart-Key-HYQ1AA-OEM.jpg`,

  // 2021+ GM smart keys - YG0G21TB2
  smart_yg0g_4b_silver: `${UHS_CDN}/products/2022-2024-Chevrolet-Silverado-4-Button-Smart-Key-YG0G21TB2-AFTERMARKET.jpg`,
  smart_yg0g_5b_silver: `${UHS_CDN}/products/2021-2025-Chevrolet-Silverado-5-Button-Smart-Key-YG0G21TB2-OEM.jpg`,
  smart_yg0g_4b_tahoe:  `${UHS_CDN}/products/2021-2024-Chevrolet-Suburban-Tahoe-4-Button-Smart-Key-YG0G21TB2-OEM.jpg`,
  smart_yg0g_5b_tahoe:  `${UHS_CDN}/products/2021-2024-Chevrolet-Suburban-Tahoe-5-Button-Smart-Key-YG0G21TB2-OEM.jpg`,
  smart_yg0g_6b_tahoe:  `${UHS_CDN}/products/2021-2024-Chevrolet-Suburban-Tahoe-6-Button-Smart-Key-YG0G21TB2-OEM.jpg`,
  smart_yg0g_5b_prox:   `${UHS_CDN}/products/2021-2024-Chevrolet-5-Button-Proximity-Key-HUFGM2718-YG0G21TB2-AFTERMARKET.jpg`,

  // Corvette smart keys
  corvette_c6_4b:       `${UHS_CDN}/products/2005-2013-Chevrolet-Corvette-4-Button-Smart-Key-M3N-5WY7777A-OEM.jpg`,
  corvette_c8_7b:       `${UHS_CDN}/products/2020-2024-Chevrolet-Corvette-C8-7-Button-Smart-Key-YG0G20TB1-AFTERMARKET.jpg`,
  corvette_c8_6b:       `${UHS_CDN}/products/2020-2022-Chevrolet-Corvette-C8-6-Button-Smart-Key-YG0G20TB1-OEM.jpg`,

  // Keyless entry remotes (M3N-32337100) for Silverado/Colorado 2014-2021
  remote_m3n_4b:        `${UHS_CDN}/products/2014-2021-Chevrolet-Silverado-Colorado-4-Button-Keyless-Entry-Remote-M3N-32337100-OEM.jpg`,
  remote_m3n_6b:        `${UHS_CDN}/products/2015-2019-Chevrolet-Suburban-Tahoe-6-Button-Keyless-Entry-Remote-M3N-32337100-OEM.jpg`,

  // B120 transponder (2019+ Express)
  b120_transponder:     `${UHS_CDN}/products/2015-2021-Chevrolet-Transponder-Key-PT04-5928092-Strattec.jpg`,

  // Spark flip keys
  spark_flip_3b:        `${UHS_CDN}/products/2013-2015-Chevrolet-Spark-3-Button-Flip-Key-A2GM3AFUS03-OEM.jpg`,
  spark_dwo4t:          `${UHS_CDN}/products/2013-2016-Chevrolet-Spark-DWO4T-Transponder-Key-Philips-ID-46.jpg`,

  // Sonic flip keys
  sonic_flip_4b:        `${UHS_CDN}/products/2012-2019-Chevrolet-Sonic-4-Button-Remote-Flip-Key-KR55WK50073-OEM.jpg`,

  // Spark/Sonic/Trax flip key LXP-T003 (2019+)
  flip_lxp_4b:          `${UHS_CDN}/products/2019-2022-Chevrolet-Sonic-Trax-Spark-4-Button-Flip-Key-LXP-T003-OEM.jpg`,

  // Impala flip key PEPS
  impala_flip_5b_peps:  `${UHS_CDN}/products/2012-2018-Chevrolet-Impala-Spark-Sonic-3-Button-Flip-Key-KR55WK50073-OEM.jpg`,
};

// ============================================================
// ACCURATE CHEVROLET KEY DATA
// Sourced from: UHS Hardware (uhs-hardware.com), Best Key Solution,
// Locksmith Keyless, American Key Supply, Transpondery.com
// ============================================================
const chevyKeys = [

  // =====================================================
  // CHEVROLET SILVERADO 1500/2500/3500
  // =====================================================

  // 1999-2006 Silverado - PK3 Transponder (Megamos 13)
  {
    model: 'Chevrolet Silverado', year_start: 1999, year_end: 2006,
    key_blank: 'B102-PT', transponder_type: 'PK3 (Megamos 13)', chip_type: 'Megamos 13',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KOBLEAR1XT', ic_number: '2701A-LEAR1XT',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM39 (B102)',
    image_url: IMG.b102_pk3,
    programming_notes: 'PK3 system with Megamos 13 transponder. B102 10-cut sidewinder keyway. On-board programming with 2 working keys (10-min learn). Separate keyless entry remote (KOBLEAR1XT). Tech2/SPS for all-keys-lost.',
  },

  // 2007-2013 Silverado - Circle Plus (Philips 46)
  {
    model: 'Chevrolet Silverado', year_start: 2007, year_end: 2013,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '5461A-01060512',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_4b_oht,
    programming_notes: 'Circle Plus (PK3+) system with Philips ID 46 chip. B111 high-security HU100 keyway (10-cut). Remote flip key with 4 buttons. On-board programming with 2 working keys. GM Tech2/MDI for all-keys-lost.',
  },

  // 2014-2018 Silverado - Remote + Transponder (M3N-32337100)
  {
    model: 'Chevrolet Silverado', year_start: 2014, year_end: 2018,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'M3N-32337100', ic_number: '7812A-32337100',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.remote_m3n_4b,
    programming_notes: 'Separate transponder key (B111-PT) + keyless entry remote (M3N-32337100). Philips ID 46 Circle+ chip. On-board key learn with 2 working keys. Remote pairing via vehicle DIC menu. GM MDI/SPS for all-keys-lost.',
  },

  // 2019-2021 Silverado - Smart Key (HYQ1EA, 434 MHz)
  {
    model: 'Chevrolet Silverado', year_start: 2019, year_end: 2021,
    key_blank: 'HU100', transponder_type: 'HITAG PRO (ID49)', chip_type: 'NXP HITAG PRO ID49',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ1EA', ic_number: '1551A-1EA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic, Tailgate',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq1ea_5b,
    programming_notes: '5-button smart proximity key with tailgate release. 434 MHz. PN: 13508398. HITAG PRO ID49 128-bit chip. Requires GM MDI2/SPS2 or compatible aftermarket tool (Autel IM608, SmartPro). Push-button start.',
  },

  // 2022-2024 Silverado - Smart Key (YG0G21TB2, 433 MHz) - 4-button
  {
    model: 'Chevrolet Silverado', year_start: 2022, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'HITAG PRO (ID49)', chip_type: 'NXP HITAG PRO ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'YG0G21TB2', ic_number: '4008C-G21TB2',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Tailgate',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_yg0g_4b_silver,
    programming_notes: '4-button smart key (base/Custom/LT). PN: 13548441. HITAG PRO ID49 128-bit. 433 MHz. CR2450 battery. GM MDI2/SPS2 or Autel IM608/SmartPro for programming. Emergency blade: EKB-GM-2021.',
  },

  // 2022-2025 Silverado - Smart Key (YG0G21TB2) - 5-button w/ Remote Start
  {
    model: 'Chevrolet Silverado', year_start: 2022, year_end: 2025,
    key_blank: 'HU100', transponder_type: 'HITAG PRO (ID49)', chip_type: 'NXP HITAG PRO ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'YG0G21TB2', ic_number: '4008C-G21TB2',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Remote Start, Panic, Tailgate',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_yg0g_5b_silver,
    programming_notes: '5-button smart key (LTZ/RST/High Country/ZR2). PN: 13548437. HITAG PRO ID49 128-bit. 433 MHz. CR2450 battery. GM MDI2/SPS2 or aftermarket tool.',
  },

  // =====================================================
  // CHEVROLET TAHOE
  // =====================================================

  // 1999-2006 Tahoe - PK3 (Megamos 13)
  {
    model: 'Chevrolet Tahoe', year_start: 1999, year_end: 2006,
    key_blank: 'B102-PT', transponder_type: 'PK3 (Megamos 13)', chip_type: 'Megamos 13',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KOBLEAR1XT', ic_number: '2701A-LEAR1XT',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM39 (B102)',
    image_url: IMG.b102_pk3,
    programming_notes: 'PK3 system with Megamos 13 transponder. B102 10-cut sidewinder. Separate keyless remote. On-board programming with 2 working keys (10-min learn). Tech2/SPS for all-keys-lost.',
  },

  // 2007-2014 Tahoe - Circle Plus (Philips 46)
  {
    model: 'Chevrolet Tahoe', year_start: 2007, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '5461A-01060512',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_4b_oht,
    programming_notes: 'Circle Plus (PK3+) with Philips 46. B111 HU100 keyway. Remote flip key. On-board programming with 2 working keys. GM Tech2/MDI for all-keys-lost.',
  },

  // 2015-2020 Tahoe - Smart Key (HYQ1AA, 315 MHz)
  {
    model: 'Chevrolet Tahoe', year_start: 2015, year_end: 2020,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46)', chip_type: 'Philips 46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ1AA', ic_number: '1551A-1AA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch, Rear Glass',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq1aa_6b,
    programming_notes: '6-button smart proximity key with hatch and rear glass release. 315 MHz. PN: 13580804/13529633. Philips 46 chip. Push-button start. GM MDI/SPS or aftermarket tool. Also includes separate remote keyless entry.',
  },

  // 2021-2024 Tahoe - Smart Key (YG0G21TB2, 433 MHz) - 5-button
  {
    model: 'Chevrolet Tahoe', year_start: 2021, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'HITAG PRO (ID49)', chip_type: 'NXP HITAG PRO ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'YG0G21TB2', ic_number: '4008C-G21TB2',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_yg0g_5b_tahoe,
    programming_notes: '5th gen Tahoe. 5-button smart key. PN: 13541559. HITAG PRO ID49 128-bit. 433 MHz. CR2450 battery. GM MDI2/SPS2 or Autel/SmartPro.',
  },

  // =====================================================
  // CHEVROLET SUBURBAN
  // =====================================================

  // 1999-2006 Suburban - PK3 (Megamos 13)
  {
    model: 'Chevrolet Suburban', year_start: 1999, year_end: 2006,
    key_blank: 'B102-PT', transponder_type: 'PK3 (Megamos 13)', chip_type: 'Megamos 13',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KOBLEAR1XT', ic_number: '2701A-LEAR1XT',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM39 (B102)',
    image_url: IMG.b102_pk3,
    programming_notes: 'PK3 system with Megamos 13 transponder. B102 10-cut sidewinder. Separate keyless remote. On-board 10-min learn with 2 working keys. Tech2/SPS for all-keys-lost.',
  },

  // 2007-2014 Suburban - Circle Plus (Philips 46)
  {
    model: 'Chevrolet Suburban', year_start: 2007, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '5461A-01060512',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_4b_oht,
    programming_notes: 'Circle Plus (PK3+) with Philips 46. B111 HU100 keyway. Remote flip key. On-board programming with 2 working keys. GM Tech2/MDI for all-keys-lost.',
  },

  // 2015-2020 Suburban - Smart Key (HYQ1AA, 315 MHz)
  {
    model: 'Chevrolet Suburban', year_start: 2015, year_end: 2020,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46)', chip_type: 'Philips 46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ1AA', ic_number: '1551A-1AA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch, Rear Glass',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq1aa_6b,
    programming_notes: '6-button smart proximity key with hatch and rear glass. 315 MHz. PN: 13580804/13529633. Push-button start. GM MDI/SPS or aftermarket tool.',
  },

  // 2021-2024 Suburban - Smart Key (YG0G21TB2, 433 MHz)
  {
    model: 'Chevrolet Suburban', year_start: 2021, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'HITAG PRO (ID49)', chip_type: 'NXP HITAG PRO ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'YG0G21TB2', ic_number: '4008C-G21TB2',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch, Rear Glass',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_yg0g_6b_tahoe,
    programming_notes: '12th gen Suburban. 6-button smart key. PN: 13537962. HITAG PRO ID49 128-bit. 433 MHz. CR2450. GM MDI2/SPS2 or Autel/SmartPro.',
  },

  // =====================================================
  // CHEVROLET EQUINOX
  // =====================================================

  // 2005-2009 Equinox - PK3 (Megamos 13)
  {
    model: 'Chevrolet Equinox', year_start: 2005, year_end: 2009,
    key_blank: 'B102-PT', transponder_type: 'PK3 (Megamos 13)', chip_type: 'Megamos 13',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KOBGT04A', ic_number: '3521A-GT04A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM39 (B102)',
    image_url: IMG.b102_pk3,
    programming_notes: '1st gen Equinox. PK3 system with Megamos 13. B102 sidewinder keyway. Separate keyless remote (KOBGT04A). On-board 10-min learn. Tech2 for all-keys-lost.',
  },

  // 2010-2017 Equinox - Remote Flip Key (OHT01060512, Philips 46)
  {
    model: 'Chevrolet Equinox', year_start: 2010, year_end: 2017,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '5461A-01060512',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_4b_oht,
    programming_notes: '2nd gen Equinox. Remote flip key with Philips 46 Circle+ chip. B111 HU100 keyway. On-board learn with 2 working keys. GM MDI for all-keys-lost.',
  },

  // 2018-2021 Equinox - Smart Key (HYQ4AA, 315 MHz)
  {
    model: 'Chevrolet Equinox', year_start: 2018, year_end: 2021,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: '1551A-4AA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4aa_5b,
    programming_notes: '3rd gen Equinox. 5-button smart proximity key. PN: 13584498. 315 MHz. Philips 46 GM EXT chip. Push-button start. GM MDI2/SPS2 or Autel/SmartPro.',
  },

  // 2022-2024 Equinox - Smart Key (HYQ4ES, 433 MHz)
  {
    model: 'Chevrolet Equinox', year_start: 2022, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'HITAG PRO (ID49)', chip_type: 'NXP HITAG PRO ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4ES', ic_number: '1551A-4ES',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4es_5b,
    programming_notes: '3rd gen Equinox facelift. 5-button smart key. PN: 13522884. HITAG PRO ID49. 433 MHz. GM MDI2/SPS2 or aftermarket tool.',
  },

  // =====================================================
  // CHEVROLET TRAVERSE
  // =====================================================

  // 2009-2017 Traverse - Remote Flip Key (OHT01060512, Philips 46)
  {
    model: 'Chevrolet Traverse', year_start: 2009, year_end: 2017,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '5461A-01060512',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_5b_oht,
    programming_notes: '1st gen Traverse (Lambda platform). 5-button remote flip key. Philips 46 Circle+ chip. B111 HU100 keyway. On-board learn. GM MDI for all-keys-lost.',
  },

  // 2018-2020 Traverse - Smart Key (HYQ4EA, 433 MHz)
  {
    model: 'Chevrolet Traverse', year_start: 2018, year_end: 2020,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4EA', ic_number: '1551A-4EA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4ea_5b,
    programming_notes: '2nd gen Traverse. 5-button smart proximity key. PN: 13529636/13585720. 433 MHz. Philips 46 EXT chip. Push-button start. GM MDI2/SPS2 or Autel/SmartPro.',
  },

  // 2021-2024 Traverse - Smart Key (HYQ4ES, 433 MHz)
  {
    model: 'Chevrolet Traverse', year_start: 2021, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'HITAG PRO (ID49)', chip_type: 'NXP HITAG PRO ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4ES', ic_number: '1551A-4ES',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4es_5b,
    programming_notes: '2nd gen Traverse facelift. 5-button smart key. PN: 13522891. HITAG PRO ID49. 433 MHz. GM MDI2/SPS2 or aftermarket tool.',
  },

  // =====================================================
  // CHEVROLET MALIBU
  // =====================================================

  // 1997-2005 Malibu - PK3 (Megamos 13)
  {
    model: 'Chevrolet Malibu', year_start: 1997, year_end: 2005,
    key_blank: 'B97-PT', transponder_type: 'PK3 (Megamos 13)', chip_type: 'Megamos 13',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KOBUT1BT', ic_number: '3521A-UT1BT',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37 (B97)',
    image_url: IMG.b97_pk3,
    programming_notes: '5th gen Malibu. PK3 system with Megamos 13 transponder. B97 single-sided keyway. Separate keyless remote (KOBUT1BT). On-board 10-min learn.',
  },

  // 2006-2007 Malibu - PK3+ (B97, Philips 46)
  {
    model: 'Chevrolet Malibu', year_start: 2006, year_end: 2007,
    key_blank: 'B97-PT', transponder_type: 'PK3+ (Philips 46)', chip_type: 'Philips 46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KOBGT04A', ic_number: '3521A-GT04A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37 (B97)',
    image_url: IMG.b97_pk3,
    programming_notes: '6th gen Malibu. Transitional year. PK3+ system with Philips 46 chip. B97 keyway still. Separate keyless remote. On-board learn. Tech2 for all-keys-lost.',
  },

  // 2008-2012 Malibu - Remote Flip Key (OHT01060512, Philips 46)
  {
    model: 'Chevrolet Malibu', year_start: 2008, year_end: 2012,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '5461A-01060512',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_4b_oht,
    programming_notes: '7th gen Malibu. Remote flip key. Philips 46 Circle+. B111 HU100 keyway. On-board learn with 2 working keys. GM Tech2/MDI for all-keys-lost.',
  },

  // 2013-2015 Malibu - Remote Flip Key (OHT01060512)
  {
    model: 'Chevrolet Malibu', year_start: 2013, year_end: 2015,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '5461A-01060512',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_4b_oht,
    programming_notes: '8th gen Malibu (non-PEPS trims). Remote flip key. Philips 46 Circle+. B111 HU100 keyway. On-board learn with 2 keys. GM MDI for all-keys-lost.',
  },

  // 2013-2015 Malibu - PEPS Smart Flip Key (OHT05918179)
  {
    model: 'Chevrolet Malibu', year_start: 2013, year_end: 2015,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT05918179', ic_number: '5461A-05918179',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_5b_peps,
    programming_notes: '8th gen Malibu (PEPS/push-button start trims: LTZ/LT w/2LT). 5-button PEPS flip key. Philips 46 EXT. B111 blade. GM MDI/SPS for programming.',
  },

  // 2016-2024 Malibu - Smart Key (HYQ4EA, 433 MHz)
  {
    model: 'Chevrolet Malibu', year_start: 2016, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4EA', ic_number: '1551A-4EA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4ea_5b,
    programming_notes: '9th gen Malibu. 5-button smart proximity key. PN: 13508769. 433 MHz. Philips 46 EXT chip. Push-button start all trims. GM MDI2/SPS2 or Autel IM608/SmartPro.',
  },

  // =====================================================
  // CHEVROLET CAMARO
  // =====================================================

  // 1998-2002 Camaro - PK3 (Megamos 13)
  {
    model: 'Chevrolet Camaro', year_start: 1998, year_end: 2002,
    key_blank: 'B97-PT', transponder_type: 'PK3 (Megamos 13)', chip_type: 'Megamos 13',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37 (B97)',
    image_url: IMG.b97_pk3,
    programming_notes: '4th gen Camaro. PK3 with Megamos 13 transponder. B97 keyway. On-board 10-min learn with 2 working keys. Tech2 for all-keys-lost. Discontinued 2002.',
  },

  // 2010-2015 Camaro - Remote Flip Key (OHT01060512, Philips 46)
  {
    model: 'Chevrolet Camaro', year_start: 2010, year_end: 2015,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '5461A-01060512',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_4b_oht,
    programming_notes: '5th gen Camaro. Remote flip key. Philips 46 Circle+. B111 HU100 keyway. On-board learn with 2 keys. GM Tech2/MDI for all-keys-lost.',
  },

  // 2016-2022 Camaro - Smart Key (HYQ4EA, 433 MHz)
  {
    model: 'Chevrolet Camaro', year_start: 2016, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4EA', ic_number: '1551A-4EA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4ea_5b,
    programming_notes: '6th gen Camaro. 5-button smart proximity key. PN: 13508769/13529662. 433 MHz. Philips 46 EXT. Push-button start. GM MDI2/SPS2 or Autel/SmartPro.',
  },

  // =====================================================
  // CHEVROLET COLORADO
  // =====================================================

  // 2004-2012 Colorado - PK3 (Megamos 13)
  {
    model: 'Chevrolet Colorado', year_start: 2004, year_end: 2012,
    key_blank: 'B102-PT', transponder_type: 'PK3 (Megamos 13)', chip_type: 'Megamos 13',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KOBGT04A', ic_number: '3521A-GT04A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM39 (B102)',
    image_url: IMG.b102_pk3,
    programming_notes: '1st gen Colorado. PK3 with Megamos 13. B102 sidewinder keyway. Separate keyless remote (KOBGT04A). On-board 10-min learn. Tech2 for all-keys-lost.',
  },

  // 2015-2021 Colorado - Remote + Transponder (M3N-32337100)
  {
    model: 'Chevrolet Colorado', year_start: 2015, year_end: 2021,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'M3N-32337100', ic_number: '7812A-32337100',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.remote_m3n_4b,
    programming_notes: '2nd gen Colorado. Separate transponder key (B111-PT) + keyless entry remote (M3N-32337100). Philips 46 Circle+ chip. PN: 13577770. On-board learn. GM MDI for all-keys-lost.',
  },

  // 2023-2025 Colorado - Smart Key (YG0G21TB2, 433 MHz)
  {
    model: 'Chevrolet Colorado', year_start: 2023, year_end: 2025,
    key_blank: 'HU100', transponder_type: 'HITAG PRO (ID49)', chip_type: 'NXP HITAG PRO ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'YG0G21TB2', ic_number: '4008C-G21TB2',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_yg0g_5b_prox,
    programming_notes: '3rd gen Colorado. Smart proximity key. HITAG PRO ID49 128-bit. 433 MHz. CR2450. GM MDI2/SPS2 or Autel/SmartPro.',
  },

  // =====================================================
  // CHEVROLET BLAZER (new, 2019+)
  // =====================================================

  // 2019-2021 Blazer - Smart Key (HYQ4EA, 433 MHz)
  {
    model: 'Chevrolet Blazer', year_start: 2019, year_end: 2021,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4EA', ic_number: '1551A-4EA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4ea_5b,
    programming_notes: 'New Blazer (crossover SUV). 5-button smart proximity key. PN: 13529636. 433 MHz. Philips 46 EXT. Push-button start. GM MDI2/SPS2 or Autel/SmartPro.',
  },

  // 2022-2024 Blazer - Smart Key (HYQ4ES, 433 MHz)
  {
    model: 'Chevrolet Blazer', year_start: 2022, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'HITAG PRO (ID49)', chip_type: 'NXP HITAG PRO ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4ES', ic_number: '1551A-4ES',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4es_5b,
    programming_notes: 'Blazer facelift. 5-button smart key. PN: 13530712. HITAG PRO ID49. 433 MHz. GM MDI2/SPS2 or aftermarket tool.',
  },

  // =====================================================
  // CHEVROLET TRAX
  // =====================================================

  // 2015-2017 Trax - Remote Flip Key (OHT01060512)
  {
    model: 'Chevrolet Trax', year_start: 2015, year_end: 2017,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '5461A-01060512',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_4b_oht,
    programming_notes: '1st gen Trax. Remote flip key. Philips 46 Circle+. B111 HU100 keyway. On-board learn with 2 keys. GM MDI for all-keys-lost.',
  },

  // 2018-2022 Trax - Smart Key (HYQ4AA, 315 MHz)
  {
    model: 'Chevrolet Trax', year_start: 2018, year_end: 2022,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: '1551A-4AA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4aa_5b_trax,
    programming_notes: '1st gen Trax (facelift). 5-button smart proximity key. PN: 5947336. 315 MHz. Philips 46 EXT. Push-button start. GM MDI2/SPS2 or aftermarket tool.',
  },

  // 2024-2025 Trax - Smart Key (HYQ4ES, 433 MHz)
  {
    model: 'Chevrolet Trax', year_start: 2024, year_end: 2025,
    key_blank: 'HU100', transponder_type: 'HITAG PRO (ID49)', chip_type: 'NXP HITAG PRO ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4ES', ic_number: '1551A-4ES',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4es_4b,
    programming_notes: '2nd gen Trax (all-new 2024). 4-button smart key. PN: 13530712. HITAG PRO ID49. 433 MHz. GM MDI2/SPS2 or aftermarket tool.',
  },

  // =====================================================
  // CHEVROLET TRAILBLAZER (new, 2021+)
  // =====================================================

  // 2021 Trailblazer - Smart Key (HYQ4EA, 433 MHz)
  {
    model: 'Chevrolet Trailblazer', year_start: 2021, year_end: 2021,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4EA', ic_number: '1551A-4EA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4ea_5b,
    programming_notes: '1st year Trailblazer (subcompact SUV). 5-button smart key. PN: 13529636. 433 MHz. Philips 46 EXT. Push-button start. GM MDI2/SPS2 or Autel/SmartPro.',
  },

  // 2022-2025 Trailblazer - Smart Key (HYQ4ES, 433 MHz)
  {
    model: 'Chevrolet Trailblazer', year_start: 2022, year_end: 2025,
    key_blank: 'HU100', transponder_type: 'HITAG PRO (ID49)', chip_type: 'NXP HITAG PRO ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4ES', ic_number: '1551A-4ES',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4es_5b,
    programming_notes: 'Trailblazer updated. 5-button smart key. PN: 13530712. HITAG PRO ID49. 433 MHz. GM MDI2/SPS2 or aftermarket tool.',
  },

  // =====================================================
  // CHEVROLET BOLT EV / BOLT EUV
  // =====================================================

  // 2017-2021 Bolt EV - Smart Key (HYQ4AA, 315 MHz)
  {
    model: 'Chevrolet Bolt EV', year_start: 2017, year_end: 2021,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: '1551A-4AA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4aa_4b,
    programming_notes: 'Bolt EV. 4-button smart proximity key. PN: 13585722. 315 MHz. Philips 46 EXT chip. Push-button start. GM MDI2/SPS2 or Autel/SmartPro. Electric vehicle.',
  },

  // 2022-2023 Bolt EV/EUV - Smart Key (HYQ4ES, 433 MHz)
  {
    model: 'Chevrolet Bolt EV', year_start: 2022, year_end: 2023,
    key_blank: 'HU100', transponder_type: 'HITAG PRO (ID49)', chip_type: 'NXP HITAG PRO ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4ES', ic_number: '1551A-4ES',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4es_4b,
    programming_notes: 'Bolt EV/EUV. 4-button smart key. HITAG PRO ID49. 433 MHz. GM MDI2/SPS2 or aftermarket tool. Bolt EUV introduced 2022.',
  },

  // =====================================================
  // CHEVROLET CORVETTE
  // =====================================================

  // 2005-2007 Corvette C6 - Smart Key (M3N65981403, 315 MHz)
  {
    model: 'Chevrolet Corvette', year_start: 2005, year_end: 2007,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46)', chip_type: 'Philips 46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N65981403', ic_number: '267F-65981403',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.corvette_c6_4b,
    programming_notes: 'C6 Corvette (early). 4-button smart key. PN: 10372541. 315 MHz. Philips 46 chip. Push-button start. GM Tech2 for programming.',
  },

  // 2008-2013 Corvette C6 - Smart Key (M3N5WY7777A, 315 MHz)
  {
    model: 'Chevrolet Corvette', year_start: 2008, year_end: 2013,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46)', chip_type: 'Philips 46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N5WY7777A', ic_number: '267F-5WY7777A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.corvette_c6_4b,
    programming_notes: 'C6 Corvette (late). 4-button smart key. PN: 25926480. 315 MHz. Philips 46. Push-button start. GM Tech2/MDI for programming.',
  },

  // 2014-2015 Corvette C7 - Smart Key (G09C04EEC5C, 434 MHz)
  {
    model: 'Chevrolet Corvette', year_start: 2014, year_end: 2015,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'G09C04EEC5C', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.corvette_c6_4b,
    programming_notes: 'C7 Corvette (early). 4-button smart key. PN: 22779879. 434 MHz. Philips 46 EXT. Push-button start. GM MDI for programming.',
  },

  // 2015-2019 Corvette C7 - Smart Key (NBGGD9C04, 434 MHz)
  {
    model: 'Chevrolet Corvette', year_start: 2015, year_end: 2019,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'NBGGD9C04', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.corvette_c6_4b,
    programming_notes: 'C7 Corvette (2015+ models). 5-button smart key. PN: 23465951. 434 MHz. Philips 46 EXT. Push-button start. GM MDI2/SPS2 for programming.',
  },

  // 2020-2024 Corvette C8 - Smart Key (YG0G20TB1, 434 MHz) - 6-button
  {
    model: 'Chevrolet Corvette', year_start: 2020, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'HITAG PRO (ID49)', chip_type: 'NXP HITAG PRO ID49',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'YG0G20TB1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Hood, Remote Start, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.corvette_c8_6b,
    programming_notes: 'C8 Corvette (mid-engine). 6-button smart key. PN: 13536982/13538852. 434 MHz. HITAG PRO ID49 128-bit. CR2450 battery. Push-button start. GM MDI2/SPS2 for programming. Convertible models have 7-button key with top control.',
  },

  // =====================================================
  // CHEVROLET IMPALA
  // =====================================================

  // 2000-2005 Impala - PK3 (Megamos 13)
  {
    model: 'Chevrolet Impala', year_start: 2000, year_end: 2005,
    key_blank: 'B97-PT', transponder_type: 'PK3 (Megamos 13)', chip_type: 'Megamos 13',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KOBUT1BT', ic_number: '3521A-UT1BT',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37 (B97)',
    image_url: IMG.b97_pk3,
    programming_notes: '8th gen Impala. PK3 system with Megamos 13. B97 keyway. Separate keyless remote (KOBUT1BT). On-board 10-min learn. Tech2 for all-keys-lost.',
  },

  // 2006-2013 Impala - Circle Plus (B111, Philips 46)
  {
    model: 'Chevrolet Impala', year_start: 2006, year_end: 2013,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUC60221', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.b111_circle_plus,
    programming_notes: '9th gen Impala. Philips 46 Circle+ transponder key (B111) with separate keyless remote (OUC60221/OUC60270). On-board learn. GM Tech2/MDI for all-keys-lost.',
  },

  // 2014-2020 Impala - PEPS Smart Flip Key (OHT05918179)
  {
    model: 'Chevrolet Impala', year_start: 2014, year_end: 2020,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT05918179', ic_number: '5461A-05918179',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_5b_peps,
    programming_notes: '10th gen Impala. 5-button PEPS smart flip key. PN: 5921873/13586785. 315 MHz. Philips 46 EXT (PCF7936). HU100 blade. Push-button start. GM MDI/SPS for programming.',
  },

  // =====================================================
  // CHEVROLET CRUZE
  // =====================================================

  // 2011-2015 Cruze - Remote Flip Key (OHT01060512)
  {
    model: 'Chevrolet Cruze', year_start: 2011, year_end: 2015,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '5461A-01060512',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_4b_oht,
    programming_notes: '1st gen Cruze. Remote flip key. Philips 46 Circle+. B111 HU100 keyway. On-board learn with 2 keys. GM MDI for all-keys-lost.',
  },

  // 2016-2019 Cruze - Smart Key (HYQ4EA, 433 MHz)
  {
    model: 'Chevrolet Cruze', year_start: 2016, year_end: 2019,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4EA', ic_number: '1551A-4EA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4ea_5b,
    programming_notes: '2nd gen Cruze. 5-button smart proximity key. PN: 13529662/13508769. 433 MHz. Philips 46 EXT. Push-button start. GM MDI2/SPS2 or Autel/SmartPro.',
  },

  // =====================================================
  // CHEVROLET SPARK
  // =====================================================

  // 2013-2015 Spark - Flip Key (A2GM3AFUS03, 315 MHz)
  {
    model: 'Chevrolet Spark', year_start: 2013, year_end: 2015,
    key_blank: 'DWO4T', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'A2GM3AFUS03', ic_number: null,
    battery_type: 'CR2025', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi DWO4',
    image_url: IMG.spark_flip_3b,
    programming_notes: '3rd gen Spark (M300). 3-button remote flip key. DWO4 keyway. PN: 95233524. 315 MHz. Philips 46 EXT chip. GM MDI for programming.',
  },

  // 2016-2021 Spark - Smart Key (HYQ4AA, 315 MHz)
  {
    model: 'Chevrolet Spark', year_start: 2016, year_end: 2022,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: '1551A-4AA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4aa_3b,
    programming_notes: '4th gen Spark (M400). 3-button smart proximity key. PN: 13585723. 315 MHz. Philips 46 EXT chip. Push-button start. GM MDI2/SPS2 or aftermarket tool.',
  },

  // =====================================================
  // CHEVROLET SONIC
  // =====================================================

  // 2012-2018 Sonic - Remote Flip Key (KR55WK50073)
  {
    model: 'Chevrolet Sonic', year_start: 2012, year_end: 2018,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KR55WK50073', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.sonic_flip_4b,
    programming_notes: '1st gen Sonic. 4-button remote flip key. PN: 13584829. Philips 46 Circle+. B111 HU100 keyway. On-board learn. GM MDI for all-keys-lost.',
  },

  // 2019-2020 Sonic - Remote Flip Key (LXP-T003)
  {
    model: 'Chevrolet Sonic', year_start: 2019, year_end: 2020,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LXP-T003', ic_number: '2298A-T003',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_lxp_4b,
    programming_notes: '1st gen Sonic facelift. 4-button remote flip key. PN: 13529043. Philips 46 EXT. B111 HU100 keyway. GM MDI2/SPS2.',
  },

  // =====================================================
  // CHEVROLET EXPRESS VAN
  // =====================================================

  // 1998-2007 Express - PK3 (Megamos 13)
  {
    model: 'Chevrolet Express', year_start: 1998, year_end: 2007,
    key_blank: 'B97-PT', transponder_type: 'PK3 (Megamos 13)', chip_type: 'Megamos 13',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37 (B97)',
    image_url: IMG.b97_pk3,
    programming_notes: 'Express van. PK3 system with Megamos 13. B97 keyway. On-board 10-min learn with 2 working keys. Tech2 for all-keys-lost. No remote typically on work vans.',
  },

  // 2008-2018 Express - Circle Plus (B111, Philips 46)
  {
    model: 'Chevrolet Express', year_start: 2008, year_end: 2018,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.b111_circle_plus,
    programming_notes: 'Express van. Philips 46 Circle+ transponder. B111 HU100 keyway. On-board learn with 2 keys. GM MDI for all-keys-lost. Transponder-only key (no integrated remote).',
  },

  // 2019-2025 Express - Circle Plus (B120, Philips 46)
  {
    model: 'Chevrolet Express', year_start: 2019, year_end: 2025,
    key_blank: 'B120-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.b120_transponder,
    programming_notes: 'Express van (updated key blank). Philips 46 Circle+ chip. B120 HU100 keyway (10-cut). PN: 13520340/23300334. Transponder-only key. On-board learn. GM MDI for all-keys-lost.',
  },

  // =====================================================
  // CHEVROLET AVALANCHE
  // =====================================================

  // 2002-2006 Avalanche - PK3 (Megamos 13)
  {
    model: 'Chevrolet Avalanche', year_start: 2002, year_end: 2006,
    key_blank: 'B102-PT', transponder_type: 'PK3 (Megamos 13)', chip_type: 'Megamos 13',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KOBLEAR1XT', ic_number: '2701A-LEAR1XT',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM39 (B102)',
    image_url: IMG.b102_pk3,
    programming_notes: '1st gen Avalanche. PK3 with Megamos 13. B102 sidewinder. Separate keyless remote. On-board 10-min learn. Tech2 for all-keys-lost.',
  },

  // 2007-2013 Avalanche - Circle Plus (B111, Philips 46)
  {
    model: 'Chevrolet Avalanche', year_start: 2007, year_end: 2013,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '5461A-01060512',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_4b_oht,
    programming_notes: '2nd gen Avalanche. Remote flip key. Philips 46 Circle+. B111 HU100 keyway. On-board learn with 2 keys. GM MDI for all-keys-lost. Discontinued 2013.',
  },

  // =====================================================
  // CHEVROLET COBALT
  // =====================================================

  // 2005-2010 Cobalt - PK3+ (B111, Philips 46)
  {
    model: 'Chevrolet Cobalt', year_start: 2005, year_end: 2010,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KOBGT04A', ic_number: '3521A-GT04A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.b111_circle_plus,
    programming_notes: 'Cobalt. Philips 46 Circle+ transponder (B111). Separate keyless remote (KOBGT04A). On-board learn. GM Tech2/MDI for all-keys-lost.',
  },

  // =====================================================
  // CHEVROLET HHR
  // =====================================================

  // 2006-2011 HHR - PK3+ (B111, Philips 46)
  {
    model: 'Chevrolet HHR', year_start: 2006, year_end: 2011,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KOBGT04A', ic_number: '3521A-GT04A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.b111_circle_plus,
    programming_notes: 'HHR. Philips 46 Circle+ transponder (B111). Separate keyless remote. On-board learn. GM Tech2/MDI for all-keys-lost. Discontinued 2011.',
  },

  // =====================================================
  // CHEVROLET MONTE CARLO
  // =====================================================

  // 2000-2005 Monte Carlo - PK3 (Megamos 13)
  {
    model: 'Chevrolet Monte Carlo', year_start: 2000, year_end: 2005,
    key_blank: 'B97-PT', transponder_type: 'PK3 (Megamos 13)', chip_type: 'Megamos 13',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KOBUT1BT', ic_number: '3521A-UT1BT',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37 (B97)',
    image_url: IMG.b97_pk3,
    programming_notes: '6th gen Monte Carlo. PK3 with Megamos 13. B97 keyway. Separate keyless remote. On-board 10-min learn. Tech2 for all-keys-lost.',
  },

  // 2006-2007 Monte Carlo - PK3+ (B111, Philips 46)
  {
    model: 'Chevrolet Monte Carlo', year_start: 2006, year_end: 2007,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 Circle+)', chip_type: 'Philips 46 Circle+',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUC60221', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'B106',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.b111_circle_plus,
    programming_notes: '7th gen Monte Carlo. Philips 46 Circle+ transponder. B111 HU100 keyway. Separate remote. On-board learn. Discontinued 2007.',
  },

  // =====================================================
  // CHEVROLET S-10
  // =====================================================

  // 1998-2004 S-10 - PK3 (Megamos 13)
  {
    model: 'Chevrolet S-10', year_start: 1998, year_end: 2004,
    key_blank: 'B97-PT', transponder_type: 'PK3 (Megamos 13)', chip_type: 'Megamos 13',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37 (B97)',
    image_url: IMG.b97_pk3,
    programming_notes: 'S-10 pickup. PK3 with Megamos 13. B97 keyway. On-board 10-min learn with 2 keys. Tech2 for all-keys-lost. Replaced by Colorado.',
  },

  // =====================================================
  // CHEVROLET VOLT
  // =====================================================

  // 2011-2015 Volt - PEPS Smart Flip Key (OHT05918179)
  {
    model: 'Chevrolet Volt', year_start: 2011, year_end: 2015,
    key_blank: 'B111-PT', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT05918179', ic_number: '5461A-05918179',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.flip_5b_peps,
    programming_notes: '1st gen Volt (plug-in hybrid). 5-button PEPS smart flip key. Philips 46 EXT. HU100 blade. Push-button start. GM MDI/SPS for programming.',
  },

  // 2016-2019 Volt - Smart Key (HYQ4AA, 315 MHz)
  {
    model: 'Chevrolet Volt', year_start: 2016, year_end: 2019,
    key_blank: 'HU100', transponder_type: 'PK3+ (Philips 46 EXT)', chip_type: 'Philips 46 EXT',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: '1551A-4AA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: IMG.smart_hyq4aa_4b,
    programming_notes: '2nd gen Volt. 4-button smart proximity key. PN: 13585722. 315 MHz. Philips 46 EXT. Push-button start. GM MDI2/SPS2 or aftermarket tool. Discontinued 2019.',
  },
];

// ============================================================
// MAIN EXECUTION
// ============================================================

async function main() {
  await client.connect();
  console.log('Connected to Supabase.');

  // Get a valid year_id for Chevrolet
  const yearRes = await client.query(
    `SELECT vy.id FROM vehicle_years vy
     JOIN vehicle_models vm ON vy.model_id = vm.id
     JOIN manufacturers m ON vm.manufacturer_id = m.id
     WHERE m.slug = 'chevrolet' LIMIT 1;`
  );
  const yearId = yearRes.rows[0].id;
  console.log(`Using year_id: ${yearId}`);

  // Count existing Chevrolet keys
  const countBefore = await client.query(
    "SELECT COUNT(*) FROM automotive_keys WHERE manufacturer_id = $1",
    [CHEVY_MFR_ID]
  );
  console.log(`\nExisting Chevrolet keys: ${countBefore.rows[0].count}`);

  // Use a transaction so delete + insert are atomic
  await client.query('BEGIN');

  try {
    // Delete old Chevrolet keys
    const delRes = await client.query(
      "DELETE FROM automotive_keys WHERE manufacturer_id = $1",
      [CHEVY_MFR_ID]
    );
    console.log(`Deleted ${delRes.rowCount} old Chevrolet key rows.`);

    // Insert new accurate Chevrolet keys
    let inserted = 0;
    for (const key of chevyKeys) {
      await client.query(
        `INSERT INTO automotive_keys (
          year_id, manufacturer_id, model_name, key_blank, transponder_type,
          chip_type, remote_frequency, key_type, fcc_id, ic_number,
          battery_type, buttons, emergency_key_blank, test_key_blank,
          obd_programmable, pin_code_required, lishi_tool, image_url,
          programming_notes, year_start, year_end
        ) VALUES (
          $1, $2, $3, $4, $5,
          $6, $7, $8, $9, $10,
          $11, $12, $13, $14,
          $15, $16, $17, $18,
          $19, $20, $21
        )`,
        [
          yearId, CHEVY_MFR_ID, key.model, key.key_blank, key.transponder_type,
          key.chip_type, key.remote_frequency, key.key_type, key.fcc_id, key.ic_number,
          key.battery_type, key.buttons, key.emergency_key_blank, key.test_key_blank,
          key.obd_programmable, key.pin_code_required, key.lishi_tool, key.image_url,
          key.programming_notes, key.year_start, key.year_end
        ]
      );
      inserted++;
    }
    console.log(`\nInserted ${inserted} new Chevrolet key rows.`);

    await client.query('COMMIT');
    console.log('Transaction committed successfully.');
  } catch (txErr) {
    await client.query('ROLLBACK');
    console.error('Transaction rolled back due to error:', txErr.message);
    throw txErr;
  }

  // Verify results
  const verifyRes = await client.query(
    `SELECT model_name, year_start, year_end, key_blank, chip_type, key_type, fcc_id, lishi_tool
     FROM automotive_keys
     WHERE manufacturer_id = $1
     ORDER BY model_name, year_start;`,
    [CHEVY_MFR_ID]
  );

  console.log('\n============================================');
  console.log('VERIFICATION - All Chevrolet Keys:');
  console.log('============================================');

  let currentModel = '';
  for (const row of verifyRes.rows) {
    if (row.model_name !== currentModel) {
      currentModel = row.model_name;
      console.log(`\n--- ${currentModel} ---`);
    }
    console.log(`  ${row.year_start}-${row.year_end} | ${row.key_blank} | ${row.chip_type || 'N/A'} | ${row.key_type} | FCC: ${row.fcc_id || 'N/A'} | ${row.lishi_tool}`);
  }

  // Summary by model
  const summaryRes = await client.query(
    `SELECT model_name, COUNT(*) as key_count
     FROM automotive_keys
     WHERE manufacturer_id = $1
     GROUP BY model_name
     ORDER BY model_name;`,
    [CHEVY_MFR_ID]
  );

  console.log('\n============================================');
  console.log('SUMMARY BY MODEL:');
  console.log('============================================');
  let totalKeys = 0;
  for (const row of summaryRes.rows) {
    console.log(`  ${row.model_name}: ${row.key_count} key rows`);
    totalKeys += parseInt(row.key_count);
  }
  console.log(`\n  TOTAL: ${totalKeys} Chevrolet key rows across ${summaryRes.rows.length} models`);

  // Check for any missing image_url
  const missingImg = await client.query(
    `SELECT model_name, year_start, year_end FROM automotive_keys
     WHERE manufacturer_id = $1 AND (image_url IS NULL OR image_url = '')
     ORDER BY model_name;`,
    [CHEVY_MFR_ID]
  );
  if (missingImg.rows.length > 0) {
    console.log('\nWARNING - Missing image_url:');
    missingImg.rows.forEach(r => console.log(`  ${r.model_name} ${r.year_start}-${r.year_end}`));
  } else {
    console.log('\nAll rows have image_url set.');
  }

  await client.end();
  console.log('\nDone!');
}

main().catch(err => {
  console.error('Error:', err);
  process.exit(1);
});
