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

// Nissan manufacturer_id
const NISSAN_MFR_ID = '1154589b-9474-4f95-b255-865ffc02793d';

// UHS Hardware Shopify CDN base
const UHS_CDN = 'https://cdn.shopify.com/s/files/1/0525/3955/6651';

// Image URLs sourced from UHS Hardware product pages
const IMG = {
  // NI04 transponder key (DA34 keyway, ID46 chip) - 2003-2019
  ni04_46:                `${UHS_CDN}/products/2002-2019-Nissan-Infiniti-NI04T-Transponder-Key-Chip-46-AFTERMARKET.jpg`,
  // NI04 OEM transponder (DA34 keyway)
  ni04_oem:               `${UHS_CDN}/products/2003-2018-Nissan-NI04-Transponder-Key-DA34-Chip-ID46-OEM.jpg`,

  // Remote head key 3-button CWTWB1U751 (NSN14 keyway, ID46)
  rhk_3b_751:             `${UHS_CDN}/products/2003-2019-Nissan-3-Button-Remote-Head-Key-CWTWB1U751-AFTERMARKET.jpg`,
  // Remote head key 4-button CWTWB1U751
  rhk_4b_751:             `${UHS_CDN}/products/2003-2019-Nissan-4-Button-Remote-Head-Key-CWTWB1U751-AFTERMARKET.jpg`,
  // Remote head key 3-button CWTWB1U751 - Juke/Cube/Rogue
  rhk_3b_751_juke:        `${UHS_CDN}/products/2009-2018-Nissan-Cube-Juke-Rogue-3-Button-Remote-Head-Key-CWTWB1U751-AFTERMARKET.jpg`,

  // Nissan/Infiniti smart key KR55WK48903 / KR55WK49622 (4-button, 315 MHz, ID46)
  smart_4b_903:           `${UHS_CDN}/products/2007-2015-Nissan-Infiniti-4-Button-Smart-Key-KR55WK48903-9622-AFTERMARKET.jpg`,
  // 370Z 3-button smart key KR55WK49622
  smart_3b_370z:          `${UHS_CDN}/products/2019-2020-Nissan-370Z-3-Button-Smart-Key-KR55WK49622-OEM.jpg`,

  // KR5S180144014 smart key 4-button (Altima/Maxima 2013-2018, Murano/Pathfinder/Titan 2015-2020)
  smart_4b_014:           `${UHS_CDN}/products/2016-2018-Nissan-Altima-Maxima-4-Button-Smart-Key-KR5S180144014-AFTERMARKET.jpg`,
  // KR5S180144014 smart key 5-button
  smart_5b_014:           `${UHS_CDN}/products/2013-2015-Nissan-Maxima-Altima-5-Button-Smart-Key-KR5S180144014-AFTERMARKET.jpg`,
  // KR5S180144014 smart key 3-button (Pathfinder/Murano/Titan)
  smart_3b_014:           `${UHS_CDN}/products/2013-2016-Nissan-Pathfinder-3-Button-Smart-Key-KR5S180144014-OEM.jpg`,
  // KR5S180144014 4-button (Murano/Pathfinder/Titan with RS)
  smart_4b_014_rs:        `${UHS_CDN}/products/2015-2020-Nissan-Murano-Pathfinder-Titan-4-Button-Smart-Key-KR5S180144014-AFTERMARKET.jpg`,

  // KR5S180144106 smart key 4-button (Rogue 2014-2020)
  smart_4b_106:           `${UHS_CDN}/products/2014-2016-Nissan-Rogue-4-Button-Smart-Key-KR5S180144106-AFTERMARKET.jpg`,

  // CWTWB1U840 smart key 4-button (Sentra/Versa/Leaf 2013-2019)
  smart_4b_840:           `${UHS_CDN}/products/2013-2019-Nissan-Sentra-Versa-4-Button-Smart-Key-CWTWB1U840-AFTERMARKET.jpg`,
  // CWTWB1U840 OEM (Sentra/Versa)
  smart_4b_840_oem:       `${UHS_CDN}/products/2013-2019-Nissan-Sentra-Versa-4-Button-Smart-Key-CWTWB1U840-OEM.jpg`,

  // CWTWB1U815 smart key 4-button (Sentra 2013)
  smart_4b_815:           `${UHS_CDN}/products/2013-Nissan-Sentra-4-Button-Smart-Key-CWTWB1U815-OEM.jpg`,

  // Juke smart key CWTWB1U840 (3-button, 315 MHz)
  smart_3b_840_juke:      `${UHS_CDN}/products/2013-2017-Nissan-4-Button-Smart-Key-CWTWB1U840-OEM.jpg`,

  // KR5TXN4 smart key 5-button (Altima/Sentra/Versa 2019+, 4A chip)
  smart_5b_txn4:          `${UHS_CDN}/products/2019-2023-Nissan-Altima-Sentra-5-Button-Smart-Key-KR5TXN4-AFTERMARKET.jpg`,
  // KR5TXN4 smart key 5-button OEM
  smart_5b_txn4_oem:      `${UHS_CDN}/products/2019-2023-Nissan-Altima-Sentra-5-Button-Smart-Key-KR5TXN4-OEM.jpg`,

  // KR5TXN1 smart key 3-button (Kicks/Rogue 2018-2021)
  smart_3b_txn1:          `${UHS_CDN}/products/2018-2021-Nissan-Kicks-Rogue-3-Button-Smart-Key-KR5TXN1-AFTERMARKET.jpg`,
  // KR5TXN3 smart key 4-button (Kicks/Rogue 2018-2021 w/ RS)
  smart_4b_txn3:          `${UHS_CDN}/products/2018-2021-Nissan-Kicks-Rogue-4-Button-Smart-Key-KR5TXN3-AFTERMARKET.jpg`,

  // KR5TXN7 smart key 3-button (Murano/Pathfinder/Titan 2019-2020)
  smart_3b_txn7:          `${UHS_CDN}/products/2019-2020-Nissan-Murano-Pathfinder-3-Button-Smart-Key-KR5TXN7-OEM.jpg`,
  // KR5TXN7 smart key 4-button (Frontier/Titan 2022+)
  smart_4b_txn7:          `${UHS_CDN}/products/2022-Nissan-Frontier-4-Button-Smart-Key-KR5TXN7-OEM.jpg`,
  // KR5TXN7 smart key 5-button (Maxima 2019-2023)
  smart_5b_txn7:          `${UHS_CDN}/products/2019-2021-Nissan-Maxima-5-Button-Smart-Key-KR5TXN7-OEM.jpg`,
  // KR5TXN7 smart key 3-button (Frontier 2022)
  smart_3b_txn7_frontier: `${UHS_CDN}/products/2022-Nissan-Frontier-3-Button-Smart-Key-KR5TXN7-OEM.jpg`,

  // KR5TXPZ3 smart key 4-button (Rogue/Pathfinder/Kicks 2022+)
  smart_4b_pz3:           `${UHS_CDN}/products/2022-2024-Nissan-Pathfinder-Rogue-Kicks-4-Button-Smart-Key-KR5TXPZ3-AFTERMARKET.jpg`,
  // KR5TXPZ3 smart key 5-button (Pathfinder/Rogue 2022+)
  smart_5b_pz3:           `${UHS_CDN}/products/2022-2023-Nissan-Pathfinder-5-Button-Smart-Key-KR5TXPZ3-OEM.jpg`,

  // KR5TXPZ3 smart key 4-button (Versa/Sentra 2022+)
  smart_4b_pz3_versa:     `${UHS_CDN}/products/2022-2024-Nissan-Versa-4-Button-Smart-Key-KR5TXPZ3-AFTERMARKET.jpg`,

  // Armada smart key CWTWBU624 (2005-2015)
  smart_4b_armada_old:    `${UHS_CDN}/products/2009-2018-Nissan-Cube-Armada-3-Button-Smart-Key-CWTWB1U773-CWTWB1U825-OEM.jpg`,

  // Armada smart key CWTWB1U787 (2017-2024)
  smart_4b_armada_787:    `${UHS_CDN}/products/2017-2018-Nissan-Armada-4-Button-Smart-Key-CWTWB1U787-AFTERMARKET.jpg`,
  // Armada smart key CWTWB1G744 (2017-2024, 5-button)
  smart_5b_armada_744:    `${UHS_CDN}/products/2017-2018-Nissan-Armada-5-Button-Smart-Key-CWTWB1G744-AFTERMARKET.jpg`,

  // Quest smart key CWTWB1U818 (2011-2017, 5-button)
  smart_5b_quest:         `${UHS_CDN}/products/2011-2017-Nissan-Quest-5-Button-Smart-Key-CWTWB1U818-OEM.jpg`,
  // Quest smart key CWTWB1U789 (2011-2017, 6-button)
  smart_6b_quest:         `${UHS_CDN}/products/2011-2017-Nissan-Quest-6-Button-Smart-Key-CWTWB1U789-OEM.jpg`,

  // Quest remote KBRASTU51 (2004-2009)
  remote_6b_quest:        `${UHS_CDN}/products/2004-2010-Nissan-Quest-6-Button-Keyless-Entry-Remote-KBRASTU51-OEM.jpg`,

  // CWTWB1G0168 Leaf smart key (2018+)
  smart_4b_leaf:          `${UHS_CDN}/products/2018-2020-Nissan-Leaf-4-Button-Smart-Key-CWTWB1G0168-OEM.jpg`,

  // Nissan 350Z transponder key (NI04, DA34, ID46)
  ni04_350z:              `${UHS_CDN}/products/2003-2018-Nissan-NI04-Transponder-Key-DA34-Chip-ID46-OEM.jpg`,
};

// ============================================================
// ACCURATE NISSAN KEY DATA
// Sourced from: UHS Hardware (uhs-hardware.com), Locksmith Keyless,
// American Key Supply, AB Keys, Royal Key Supply, Transpondery.com
// ============================================================
const nissanKeys = [

  // =====================================================
  // NISSAN ALTIMA
  // =====================================================

  // 1998-2001 Altima - No transponder (standard key)
  {
    model: 'Nissan Altima', year_start: 1998, year_end: 2001,
    key_blank: 'NSN11', transponder_type: 'None', chip_type: null,
    remote_frequency: '315 MHz', key_type: 'standard',
    fcc_id: 'KBRASTU15', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN11',
    image_url: IMG.rhk_3b_751,
    programming_notes: 'No transponder immobilizer. NSN11 keyway (old Nissan 6-cut). Separate keyless entry remote (KBRASTU15) 315 MHz. Key is cut only, no chip programming needed.',
  },

  // 2002-2006 Altima - Transponder (Philips 41 / 4D-60)
  {
    model: 'Nissan Altima', year_start: 2002, year_end: 2006,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KBRASTU15', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.ni04_46,
    programming_notes: 'NATS (Nissan Anti-Theft System) with Philips ID46 transponder. NI04/DA34 keyway (8-cut). Separate keyless entry remote (KBRASTU15, 315 MHz). PIN code required from BCM for transponder registration. Some early 2002 may use Philips 41 chip - verify with VIN.',
  },

  // 2007-2012 Altima - Smart Key (KR55WK48903, 315 MHz, ID46)
  {
    model: 'Nissan Altima', year_start: 2007, year_end: 2012,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK48903', ic_number: '1788D-FWK48903',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_903,
    programming_notes: 'Nissan Intelligent Key (push-button start). 4-button smart proximity key. 315 MHz. Philips ID46 PCF7952 chip. PN: 285E3-JA02A / 285E3-JA05A. PIN required from BCM (20-digit). Autel IM608, SmartPro, or dealer SBT for programming. Also uses KR55WK49622 (interchangeable).',
  },

  // 2013-2015 Altima - Smart Key (KR5S180144014, 433 MHz, ID46)
  {
    model: 'Nissan Altima', year_start: 2013, year_end: 2015,
    key_blank: 'NSN14', transponder_type: 'HITAG-3 / ID47', chip_type: 'HITAG-3 (PCF7952XTT)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5S180144014', ic_number: '7812D-S180014',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_014,
    programming_notes: 'Nissan Intelligent Key. 4-button proximity smart key. 433 MHz. Continental S180144020. PN: 285E3-9HP4B / 285E3-3TP0A. HITAG-3 chip (often still read as ID46). PIN required. Autel IM608/SmartPro for programming. 5-button variant with remote start also available (PN: 285E3-3TP5A).',
  },

  // 2016-2018 Altima - Smart Key (KR5S180144014, 433 MHz)
  {
    model: 'Nissan Altima', year_start: 2016, year_end: 2018,
    key_blank: 'NSN14', transponder_type: 'HITAG-3 / ID47', chip_type: 'HITAG-3 (PCF7952XTT)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5S180144014', ic_number: '7812D-S180204',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_014,
    programming_notes: 'Nissan Intelligent Key. 4-button smart key. 433 MHz. Continental S180144204. PN: 285E3-4RA0B. IC 204 variant. HITAG-3 chip. PIN required from BCM. Autel IM608/SmartPro for programming. 5-button variant (285E3-4RA0C) with remote start available.',
  },

  // 2019-2021 Altima - Smart Key (KR5TXN4, 433 MHz, 4A/HITAG-AES)
  {
    model: 'Nissan Altima', year_start: 2019, year_end: 2021,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN4', ic_number: '7812D-TXN4',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_5b_txn4,
    programming_notes: 'Nissan Intelligent Key. 5-button smart key. 433 MHz. Continental S180144803. PN: 285E3-6CA6A. HITAG-AES 4A chip (128-bit encryption). PIN required. Autel IM608 Pro/SmartPro/KPROG for programming. Also fits 2020-2021 Sentra/Versa.',
  },

  // 2022-2024 Altima - Smart Key (KR5TXN4, 433 MHz, 4A)
  {
    model: 'Nissan Altima', year_start: 2022, year_end: 2024,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN4', ic_number: '7812D-TXN4',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_5b_txn4,
    programming_notes: 'Nissan Intelligent Key. 5-button smart key. 433 MHz. PN: 285E3-6LS5A. HITAG-AES 4A chip. PIN required. Autel IM608 Pro/SmartPro/KPROG. Updated part number from prior gen but same FCC ID.',
  },

  // =====================================================
  // NISSAN MAXIMA
  // =====================================================

  // 1995-1999 Maxima - Transponder (Philips 41)
  {
    model: 'Nissan Maxima', year_start: 1995, year_end: 1999,
    key_blank: 'DA34', transponder_type: 'Philips 41', chip_type: 'Philips 41 (PCF7930)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.ni04_46,
    programming_notes: 'Early NATS system with Philips 41 (fixed code) transponder. DA34 keyway. No keyless remote standard. PIN code from BCM for programming. SBT/Consult-II required.',
  },

  // 2000-2003 Maxima - Transponder (Philips 41 / ID46)
  {
    model: 'Nissan Maxima', year_start: 2000, year_end: 2003,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KBRASTU15', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.ni04_46,
    programming_notes: 'NATS with Philips ID46 transponder. NI04/DA34 keyway. Separate keyless entry remote (KBRASTU15, 315 MHz). PIN code required from BCM. Some 2000 models may have Philips 41.',
  },

  // 2004-2006 Maxima - Smart Key (KBRASTU15 remote + NI04 transponder)
  {
    model: 'Nissan Maxima', year_start: 2004, year_end: 2006,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWBU624', ic_number: null,
    battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NI04', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_armada_old,
    programming_notes: '6th gen Maxima. First gen Nissan Intelligent Key system. 4-button proximity smart key. 315 MHz. Philips ID46 chip. Emergency NI04 insert key. PIN required from BCM. SBT/Consult-III for programming.',
  },

  // 2007-2008 Maxima - Smart Key (KR55WK48903)
  {
    model: 'Nissan Maxima', year_start: 2007, year_end: 2008,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK48903', ic_number: '1788D-FWK48903',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_903,
    programming_notes: '6th gen Maxima (late). Intelligent Key. 4-button proximity key. 315 MHz. Philips ID46 PCF7952. PN: 285E3-EW81D / 285E3-EW82D. Also uses KR55WK49622. PIN required from BCM.',
  },

  // 2009-2014 Maxima - Smart Key (KR55WK48903, 315 MHz)
  {
    model: 'Nissan Maxima', year_start: 2009, year_end: 2014,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK48903', ic_number: '1788D-FWK48903',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_903,
    programming_notes: '7th gen Maxima. Intelligent Key. 4-button proximity smart key. 315 MHz. Philips ID46 PCF7952. PN: 285E3-JA05A / 285E3-JA02A. Interchangeable with KR55WK49622. PIN required. Autel IM608/SmartPro for programming.',
  },

  // 2015 Maxima - Smart Key (KR5S180144014, 433 MHz)
  // Note: 2015 was a transition year; 8th gen started mid-2015
  // 2016-2018 Maxima - Smart Key (KR5S180144014, 433 MHz)
  {
    model: 'Nissan Maxima', year_start: 2016, year_end: 2018,
    key_blank: 'NSN14', transponder_type: 'HITAG-3 / ID47', chip_type: 'HITAG-3 (PCF7952XTT)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5S180144014', ic_number: '7812D-S180204',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_5b_014,
    programming_notes: '8th gen Maxima. Intelligent Key. 5-button smart key with remote start. 433 MHz. Continental S180144204. PN: 285E3-4RA0C. HITAG-3 chip. PIN required. Autel IM608/SmartPro for programming.',
  },

  // 2019-2021 Maxima - Smart Key (KR5TXN7, 433 MHz, 4A)
  {
    model: 'Nissan Maxima', year_start: 2019, year_end: 2021,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN7', ic_number: '7812D-TXN7',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_5b_txn7,
    programming_notes: '8th gen Maxima facelift. 5-button smart key. 433 MHz. PN: 285E3-9DJ3B. HITAG-AES 4A 128-bit. PIN required. Autel IM608 Pro/SmartPro for programming.',
  },

  // 2022-2023 Maxima - Smart Key (KR5TXN7, 433 MHz, 4A)
  {
    model: 'Nissan Maxima', year_start: 2022, year_end: 2023,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN7', ic_number: '7812D-TXN7',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_5b_txn7,
    programming_notes: '8th gen Maxima final years. 5-button smart key. 433 MHz. PN: 285E3-9DL5A. HITAG-AES 4A. PIN required. Autel IM608 Pro/SmartPro. Maxima discontinued after 2023.',
  },

  // =====================================================
  // NISSAN SENTRA
  // =====================================================

  // 2000-2006 Sentra - Transponder (Philips 41 transitioning to ID46)
  {
    model: 'Nissan Sentra', year_start: 2000, year_end: 2006,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KBRASTU15', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.ni04_46,
    programming_notes: 'NATS with Philips ID46 transponder (some early 2000 may be Philips 41). NI04/DA34 keyway. Separate keyless remote (KBRASTU15, 315 MHz). PIN from BCM needed. SBT or Consult for programming.',
  },

  // 2007-2012 Sentra - Remote Head Key (CWTWB1U751, 315 MHz, ID46)
  {
    model: 'Nissan Sentra', year_start: 2007, year_end: 2012,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U751', ic_number: '1788D-FWB1U751',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.rhk_4b_751,
    programming_notes: 'Remote head key (key + remote integrated). 4-button. 315 MHz. Philips ID46 chip. NI04/DA34 keyway. PN: H0561-3AA0B. PIN from BCM required for transponder programming.',
  },

  // 2013 Sentra (early build) - Smart Key (CWTWB1U815, 315 MHz, ID46)
  {
    model: 'Nissan Sentra', year_start: 2013, year_end: 2013,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWB1U815', ic_number: '1788D-FWB1U815',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_815,
    programming_notes: '7th gen Sentra (B17). Built before 5/2013 uses CWTWB1U815. 4-button push-button start smart key. 315 MHz. Philips ID46 PCF7952A. PN: 285E3-3AA0A. Verify FCC ID on existing key; built after 5/2013 uses CWTWB1U840.',
  },

  // 2013-2019 Sentra - Smart Key (CWTWB1U840, 315 MHz, ID46)
  {
    model: 'Nissan Sentra', year_start: 2013, year_end: 2019,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWB1U840', ic_number: '1788D-FWB1U840',
    battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_840,
    programming_notes: '7th gen Sentra (B17). Most 2013+ built after 5/2013 use CWTWB1U840. 4-button smart key. 315 MHz. Philips ID46 PCF7952. PN: 285E3-3SG0D. PIN required. Also fits 2013-2019 Versa. Autel/SmartPro for programming.',
  },

  // 2020-2021 Sentra - Smart Key (KR5TXN4, 433 MHz, 4A)
  {
    model: 'Nissan Sentra', year_start: 2020, year_end: 2021,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN4', ic_number: '7812D-TXN4',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_5b_txn4,
    programming_notes: '8th gen Sentra (B18). 5-button smart key. 433 MHz. Continental S180144803. PN: 285E3-6LA6A. HITAG-AES 4A 128-bit. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // 2022-2024 Sentra - Smart Key (KR5TXPZ3, 433 MHz, 4A)
  {
    model: 'Nissan Sentra', year_start: 2022, year_end: 2024,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXPZ3', ic_number: '7812D-TXPZ3',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_pz3_versa,
    programming_notes: '8th gen Sentra continued. 4-button smart key. 433 MHz. PN: 285E3-6LY1E. HITAG-AES 4A. New KR5TXPZ3 FCC ID (replaces KR5TXN4). PIN required. Autel IM608 Pro/SmartPro.',
  },

  // =====================================================
  // NISSAN ROGUE
  // =====================================================

  // 2008-2013 Rogue - Remote Head Key (CWTWB1U751, 315 MHz, ID46)
  {
    model: 'Nissan Rogue', year_start: 2008, year_end: 2013,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U751', ic_number: '1788D-FWB1U751',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.rhk_3b_751_juke,
    programming_notes: '1st gen Rogue (S35). 3-button remote head key. 315 MHz. Philips ID46 chip. NI04/DA34 keyway. PN: H0561-C993A. PIN from BCM required.',
  },

  // 2014-2018 Rogue - Smart Key (KR5S180144106, 433 MHz, 4A/ID46)
  {
    model: 'Nissan Rogue', year_start: 2014, year_end: 2018,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (PCF7953M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5S180144106', ic_number: '7812D-S180106',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_106,
    programming_notes: '2nd gen Rogue (T32). 4-button smart key. 433 MHz. Continental S180144106. PN: 285E3-4CB1C / 285E3-4CB6A. HITAG-AES 4A (128-bit) chip. PIN required. Known BCM defect issue on some 2014-2018 units (recall). Autel IM608/SmartPro.',
  },

  // 2019-2020 Rogue - Smart Key (KR5TXN4, 433 MHz, 4A)
  {
    model: 'Nissan Rogue', year_start: 2019, year_end: 2020,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN4', ic_number: '7812D-TXN4',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_5b_txn4,
    programming_notes: '2nd gen Rogue facelift (T32). 5-button smart key. 433 MHz. Continental S180144507. PN: 285E3-6RR7A. HITAG-AES 4A. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // 2021 Rogue - Smart Key (KR5TXN4, 433 MHz, 4A)
  {
    model: 'Nissan Rogue', year_start: 2021, year_end: 2021,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN4', ic_number: '7812D-TXN4',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_5b_txn4,
    programming_notes: '3rd gen Rogue (T33) first year. 5-button smart key. 433 MHz. PN: 285E3-6TA7B. HITAG-AES 4A. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // 2022-2024 Rogue - Smart Key (KR5TXPZ3, 433 MHz, 4A)
  {
    model: 'Nissan Rogue', year_start: 2022, year_end: 2024,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXPZ3', ic_number: '7812D-TXPZ3',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_pz3,
    programming_notes: '3rd gen Rogue (T33). 4-button smart key. 433 MHz. Continental S180144120. PN: 285E3-6RA5A. New KR5TXPZ3 FCC ID. HITAG-AES 4A. 5-button variant (285E3-7LA7A) with remote start available. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // =====================================================
  // NISSAN PATHFINDER
  // =====================================================

  // 1996-2004 Pathfinder - Transponder (Philips 41 -> ID46)
  {
    model: 'Nissan Pathfinder', year_start: 1996, year_end: 2004,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KBRASTU15', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.ni04_46,
    programming_notes: 'NATS with Philips ID46 transponder (1996-1998 may use Philips 41). NI04/DA34 keyway. Separate keyless remote (KBRASTU15). PIN from BCM required.',
  },

  // 2005-2012 Pathfinder - Remote Head Key (CWTWB1U751, ID46)
  {
    model: 'Nissan Pathfinder', year_start: 2005, year_end: 2012,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U751', ic_number: '1788D-FWB1U751',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.rhk_4b_751,
    programming_notes: '3rd gen Pathfinder (R51). 4-button remote head key. 315 MHz. Philips ID46. NI04/DA34 keyway. PN: H0561-3AA0B. PIN from BCM required.',
  },

  // 2013-2016 Pathfinder - Smart Key (KR5S180144014, 433 MHz)
  {
    model: 'Nissan Pathfinder', year_start: 2013, year_end: 2016,
    key_blank: 'NSN14', transponder_type: 'HITAG-3 / ID47', chip_type: 'HITAG-3 (PCF7952XTT)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5S180144014', ic_number: '7812D-S180014',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_3b_014,
    programming_notes: '4th gen Pathfinder (R52). 3-button smart key. 433 MHz. Continental S180144005. PN: 285E3-9PB3A / 285E3-3KL4A. HITAG-3 chip. PIN required. 5-button variant (285E3-5AA5A) with hatch/RS available.',
  },

  // 2017-2020 Pathfinder - Smart Key (KR5S180144014, 433 MHz)
  {
    model: 'Nissan Pathfinder', year_start: 2017, year_end: 2020,
    key_blank: 'NSN14', transponder_type: 'HITAG-3 / ID47', chip_type: 'HITAG-3 (PCF7952XTT)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5S180144014', ic_number: '7812D-S180204',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_014_rs,
    programming_notes: '4th gen Pathfinder facelift. 4 or 5-button smart key. 433 MHz. Continental S180144308/S180144306. PN: 285E3-5AA3D. IC 204 variant. HITAG-3 chip. PIN required. Autel IM608/SmartPro.',
  },

  // 2022-2024 Pathfinder - Smart Key (KR5TXPZ3, 433 MHz, 4A)
  {
    model: 'Nissan Pathfinder', year_start: 2022, year_end: 2024,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXPZ3', ic_number: '7812D-TXPZ3',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_pz3,
    programming_notes: '5th gen Pathfinder (R53). 4-button smart key. 433 MHz. Continental S180144120. PN: 285E3-6RA5A. HITAG-AES 4A. 5-button variant (285E3-6XR7A / 285E3-7LA7A) with remote start. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // =====================================================
  // NISSAN MURANO
  // =====================================================

  // 2003-2007 Murano - Smart Key (CWTWBU624 / KBRASTU15, 315 MHz, ID46)
  {
    model: 'Nissan Murano', year_start: 2003, year_end: 2007,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWBU624', ic_number: null,
    battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'NI04', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_armada_old,
    programming_notes: '1st gen Murano (Z50). Intelligent Key. 4-button proximity smart key. 315 MHz. Philips ID46. Emergency NI04 insert. PIN from BCM required. SBT/Consult-III for programming.',
  },

  // 2009-2014 Murano - Smart Key (KR55WK48903, 315 MHz, ID46)
  {
    model: 'Nissan Murano', year_start: 2009, year_end: 2014,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK48903', ic_number: '1788D-FWK48903',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_903,
    programming_notes: '2nd gen Murano (Z51). Intelligent Key. 4-button smart key. 315 MHz. Philips ID46 PCF7952. PN: 285E3-1AA7B. Also uses KR55WK49622. PIN required. Autel IM608/SmartPro.',
  },

  // 2015-2018 Murano - Smart Key (KR5S180144014, 433 MHz)
  {
    model: 'Nissan Murano', year_start: 2015, year_end: 2018,
    key_blank: 'NSN14', transponder_type: 'HITAG-3 / ID47', chip_type: 'HITAG-3 (PCF7952XTT)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5S180144014', ic_number: '7812D-S180204',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_014_rs,
    programming_notes: '3rd gen Murano (Z52). 5-button smart key (4-button base). 433 MHz. Continental S180144308. PN: 285E3-5AA5A / 285E3-5AA3D. HITAG-3 chip. PIN required. Autel IM608/SmartPro.',
  },

  // 2019-2020 Murano - Smart Key (KR5TXN7, 433 MHz, 4A)
  {
    model: 'Nissan Murano', year_start: 2019, year_end: 2020,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN7', ic_number: '7812D-TXN7',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_3b_txn7,
    programming_notes: '3rd gen Murano facelift. 3-button base smart key (5-button with hatch/RS available). 433 MHz. Continental S180144902. PN: 285E3-9UF1A. HITAG-AES 4A. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // 2021-2024 Murano - Smart Key (KR5TXN7, 433 MHz, 4A)
  {
    model: 'Nissan Murano', year_start: 2021, year_end: 2024,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN7', ic_number: '7812D-TXN7',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_3b_txn7,
    programming_notes: '3rd gen Murano continued. 5-button smart key (base 3-button). 433 MHz. PN: 285E3-9UF7B. HITAG-AES 4A. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // =====================================================
  // NISSAN FRONTIER
  // =====================================================

  // 1998-2004 Frontier - Transponder (Philips 41 -> ID46)
  {
    model: 'Nissan Frontier', year_start: 1998, year_end: 2004,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.ni04_46,
    programming_notes: '1st gen Frontier (D22). NATS with Philips ID46 transponder (early 1998 may be Philips 41). NI04/DA34 keyway. No standard remote. PIN from BCM required.',
  },

  // 2005-2021 Frontier - Remote Head Key (CWTWB1U751, 315 MHz, ID46) or transponder
  {
    model: 'Nissan Frontier', year_start: 2005, year_end: 2021,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U751', ic_number: '1788D-FWB1U751',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.rhk_3b_751,
    programming_notes: '2nd gen Frontier (D40). 3-button remote head key. 315 MHz. Philips ID46 chip. NI04/DA34 keyway. PN: H0561-C993A. PIN from BCM required. Some models may have 4-button variant (H0561-3AA0B). Long production run; identical key 2005-2021.',
  },

  // 2022-2024 Frontier - Smart Key (KR5TXN7, 433 MHz, 4A)
  {
    model: 'Nissan Frontier', year_start: 2022, year_end: 2024,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN7', ic_number: '7812D-TXN7',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_txn7,
    programming_notes: '3rd gen Frontier (D41). 4-button smart key (3-button base available PN: 285E3-9BU1A). 433 MHz. PN: 285E3-9BU5A. HITAG-AES 4A. Push-button start. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // =====================================================
  // NISSAN TITAN
  // =====================================================

  // 2004-2015 Titan - Remote Head Key (CWTWB1U751, 315 MHz, ID46)
  {
    model: 'Nissan Titan', year_start: 2004, year_end: 2015,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U751', ic_number: '1788D-FWB1U751',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.rhk_4b_751,
    programming_notes: '1st gen Titan (A60). 4-button remote head key. 315 MHz. Philips ID46 chip. NI04/DA34 keyway. PN: H0561-3AA0B. PIN from BCM required. Long production run.',
  },

  // 2016-2018 Titan - Smart Key (KR5S180144014, 433 MHz)
  {
    model: 'Nissan Titan', year_start: 2016, year_end: 2018,
    key_blank: 'NSN14', transponder_type: 'HITAG-3 / ID47', chip_type: 'HITAG-3 (PCF7952XTT)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5S180144014', ic_number: '7812D-S180204',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_014_rs,
    programming_notes: '2nd gen Titan (XD and standard). 3 or 4-button smart key. 433 MHz. Continental S180144313. PN: 285E3-5AA1A / 285E3-5AA3D. HITAG-3 chip. PIN required. Autel IM608/SmartPro.',
  },

  // 2019-2024 Titan - Smart Key (KR5TXN7, 433 MHz, 4A)
  {
    model: 'Nissan Titan', year_start: 2019, year_end: 2024,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN7', ic_number: '7812D-TXN7',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_txn7,
    programming_notes: '2nd gen Titan continued. 3 or 4-button smart key. 433 MHz. Continental S180144902. PN: 285E3-9UF1B / 285E3-9BU5A. HITAG-AES 4A 128-bit. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // =====================================================
  // NISSAN ARMADA
  // =====================================================

  // 2005-2015 Armada - Smart Key (CWTWBU624, 315 MHz, ID46)
  {
    model: 'Nissan Armada', year_start: 2005, year_end: 2015,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWBU624', ic_number: null,
    battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_armada_old,
    programming_notes: '1st gen Armada (WA60). 4-button Intelligent Key. 315 MHz. Philips ID46 chip. PN: 285E3-ZQ30A / 285E3-ZQ31A. Emergency insert key included. PIN required from BCM. SBT/Consult-III or Autel IM608.',
  },

  // 2017-2020 Armada - Smart Key (CWTWB1U787 / CWTWB1G744, 433 MHz, ID46)
  {
    model: 'Nissan Armada', year_start: 2017, year_end: 2020,
    key_blank: 'NSN14', transponder_type: 'HITAG-3 / ID47', chip_type: 'HITAG-3 (PCF7952XTT)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWB1U787', ic_number: '1788D-FWB1U787',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_armada_787,
    programming_notes: '2nd gen Armada (Y62). 4-button smart key (CWTWB1U787). 433 MHz. PN: 285E3-1LP0C. HITAG-3 chip. 5-button variant (CWTWB1G744, PN: 285E3-1LB5A) with hatch+RS also available. PIN required. Autel IM608/SmartPro.',
  },

  // 2021-2024 Armada - Smart Key (CWTWB1U787, 433 MHz)
  {
    model: 'Nissan Armada', year_start: 2021, year_end: 2024,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWB1U787', ic_number: '1788D-FWB1U787',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_armada_787,
    programming_notes: '2nd gen Armada facelift. 4-button smart key. 433 MHz. PN: 285E3-6JU4A. HITAG-AES 4A. 5-button variant (CWTWB1G744) also available. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // =====================================================
  // NISSAN KICKS
  // =====================================================

  // 2018-2021 Kicks - Smart Key (KR5TXN1, 434 MHz, 4A) - base/SV
  {
    model: 'Nissan Kicks', year_start: 2018, year_end: 2021,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN1', ic_number: '7812D-TXN1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_3b_txn1,
    programming_notes: '1st gen Kicks (P15). 3-button base smart key. 434 MHz. PN: 285E3-5RA0A. HITAG-AES 4A. 4-button variant (KR5TXN3, PN: 285E3-5RA6A) with remote start available. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // 2022-2024 Kicks - Smart Key (KR5TXPZ3, 433 MHz, 4A)
  {
    model: 'Nissan Kicks', year_start: 2022, year_end: 2024,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXPZ3', ic_number: '7812D-TXPZ3',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_pz3,
    programming_notes: '1st gen Kicks facelift. 4-button smart key. 433 MHz. PN: 285E3-6RA5A. New KR5TXPZ3 FCC ID. HITAG-AES 4A. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // =====================================================
  // NISSAN VERSA
  // =====================================================

  // 2007-2011 Versa - Remote Head Key (CWTWB1U751, 315 MHz, ID46)
  {
    model: 'Nissan Versa', year_start: 2007, year_end: 2011,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U751', ic_number: '1788D-FWB1U751',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.rhk_3b_751,
    programming_notes: '1st gen Versa (C11). 3-button remote head key. 315 MHz. Philips ID46. NI04/DA34 keyway. PN: H0561-C993A. PIN from BCM required.',
  },

  // 2012-2019 Versa - Smart Key (CWTWB1U840, 315 MHz, ID46)
  {
    model: 'Nissan Versa', year_start: 2012, year_end: 2019,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWB1U840', ic_number: '1788D-FWB1U840',
    battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_840,
    programming_notes: '2nd gen Versa/Versa Note (N17). 4-button smart key. 315 MHz. Philips ID46 PCF7952. PN: 285E3-3SG0D. Also compatible with Sentra 2013-2019. PIN required. Autel/SmartPro.',
  },

  // 2020-2021 Versa - Smart Key (KR5TXN4, 433 MHz, 4A)
  {
    model: 'Nissan Versa', year_start: 2020, year_end: 2021,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN4', ic_number: '7812D-TXN4',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Remote Start, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_5b_txn4,
    programming_notes: '3rd gen Versa (N18). 5-button smart key. 433 MHz. Continental S180144803. PN: 285E3-6CA6A. HITAG-AES 4A. Same key as 2019+ Altima. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // 2022-2024 Versa - Smart Key (KR5TXPZ3, 433 MHz, 4A)
  {
    model: 'Nissan Versa', year_start: 2022, year_end: 2024,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXPZ3', ic_number: '7812D-TXPZ3',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_pz3_versa,
    programming_notes: '3rd gen Versa. 4-button smart key. 433 MHz. PN: 285E3-6LY1E. New KR5TXPZ3 FCC ID. HITAG-AES 4A. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // =====================================================
  // NISSAN LEAF
  // =====================================================

  // 2011-2017 Leaf - Smart Key (CWTWB1U840, 315 MHz, ID46)
  {
    model: 'Nissan Leaf', year_start: 2011, year_end: 2017,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWB1U840', ic_number: '1788D-FWB1U840',
    battery_type: 'CR2025', buttons: 'Lock, Unlock, Charge, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_840,
    programming_notes: '1st gen Leaf (ZE0/AZE0). 4-button smart key with charge/plug-in button. 315 MHz. Philips ID46 PCF7952. PN: 285E3-3NF4A. PIN required. Autel/SmartPro.',
  },

  // 2018-2024 Leaf - Smart Key (CWTWB1G0168, 433 MHz, 4A)
  {
    model: 'Nissan Leaf', year_start: 2018, year_end: 2024,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (PCF7953M)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWB1G0168', ic_number: '1788D-FWB1G016',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Charge, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_leaf,
    programming_notes: '2nd gen Leaf (ZE1). 4-button smart key with plug-in/charge button. 433 MHz. PN: 285E3-5SA1A / 285E3-5SA1B. HITAG-AES 4A (PCF7953M 128-bit). PIN required. Autel IM608 Pro/SmartPro.',
  },

  // =====================================================
  // NISSAN 350Z
  // =====================================================

  // 2003-2005 350Z - Transponder (NI04, ID46) + remote
  {
    model: 'Nissan 350Z', year_start: 2003, year_end: 2005,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KBRASTU15', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.ni04_350z,
    programming_notes: '350Z (Z33) early years. Philips ID46 transponder. NI04/DA34 keyway. Separate keyless entry remote (KBRASTU15, 315 MHz). PIN from BCM required. Some models equipped with Intelligent Key.',
  },

  // 2005-2009 350Z - Smart Key (KR55WK48903/KR55WK49622, 315 MHz, ID46)
  {
    model: 'Nissan 350Z', year_start: 2005, year_end: 2009,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK49622', ic_number: '1788D-FWK49622',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_903,
    programming_notes: '350Z (Z33) with Intelligent Key option. 4-button smart key. 315 MHz. Philips ID46 PCF7952. KR55WK49622 / KR55WK48903 (interchangeable). PIN required from BCM.',
  },

  // =====================================================
  // NISSAN 370Z
  // =====================================================

  // 2009-2018 370Z - Smart Key (KR55WK49622, 315 MHz, ID46)
  {
    model: 'Nissan 370Z', year_start: 2009, year_end: 2018,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK49622', ic_number: '1788D-FWK49622',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_903,
    programming_notes: '370Z (Z34). 4-button Intelligent Key. 315 MHz. Philips ID46 PCF7952. KR55WK49622 (also KR55WK48903 compatible). PN: 285E3-1ET5A. PIN required. Autel IM608/SmartPro.',
  },

  // 2019-2020 370Z - Smart Key (KR55WK49622, 315 MHz, ID46)
  {
    model: 'Nissan 370Z', year_start: 2019, year_end: 2020,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK49622', ic_number: '1788D-FWK49622',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_3b_370z,
    programming_notes: '370Z final years with Z-logo key. 3-button smart key. 315 MHz. Philips ID46. PN: P285E3-1ET5D. PIN required. Same immobilizer system.',
  },

  // =====================================================
  // NISSAN Z (2023+)
  // =====================================================

  // 2023-2024 Z - Smart Key (KR5TXN7, 433 MHz, 4A)
  {
    model: 'Nissan Z', year_start: 2023, year_end: 2024,
    key_blank: 'NSN14', transponder_type: 'HITAG-AES (4A)', chip_type: 'HITAG-AES 4A (NCF29A1M)',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TXN7', ic_number: '7812D-TXN7',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_3b_txn7,
    programming_notes: 'Nissan Z (RZ34). 3-button smart key. 434 MHz. PN: 285E3-9BU1A / 285E3-6GP1A. HITAG-AES 4A 128-bit. PIN required. Autel IM608 Pro/SmartPro.',
  },

  // =====================================================
  // NISSAN JUKE
  // =====================================================

  // 2011-2017 Juke - Remote Head Key or Smart Key
  {
    model: 'Nissan Juke', year_start: 2011, year_end: 2014,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U751', ic_number: '1788D-FWB1U751',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.rhk_3b_751_juke,
    programming_notes: '1st gen Juke (F15). 3-button remote head key (base models). 315 MHz. Philips ID46. NI04/DA34 keyway. PN: H0561-C993A. PIN required. Smart key (CWTWB1U840) on SV/SL trims.',
  },

  // 2015-2017 Juke - Smart Key (CWTWB1U840, 315 MHz, ID46)
  {
    model: 'Nissan Juke', year_start: 2015, year_end: 2017,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWB1U840', ic_number: '1788D-FWB1U840',
    battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_4b_840,
    programming_notes: '1st gen Juke final years. 4-button Intelligent Key. 315 MHz. Philips ID46 PCF7952. PN: 285E3-3SG0D. PIN required. Juke discontinued in US after 2017.',
  },

  // =====================================================
  // NISSAN QUEST
  // =====================================================

  // 2004-2009 Quest - Transponder + Keyless Remote (KBRASTU51)
  {
    model: 'Nissan Quest', year_start: 2004, year_end: 2009,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KBRASTU51', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Sliding Door L, Sliding Door R, Hatch, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.remote_6b_quest,
    programming_notes: '3rd gen Quest (V42). Transponder key + separate 6-button keyless remote (KBRASTU51). 315 MHz. Philips ID46. NI04/DA34 keyway. PN: 28268-5Z200. PIN required from BCM.',
  },

  // 2011-2017 Quest - Smart Key (CWTWB1U818, 315 MHz, ID46)
  {
    model: 'Nissan Quest', year_start: 2011, year_end: 2017,
    key_blank: 'NSN14', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWB1U818', ic_number: '1788D-FWB1U818',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Sliding Door L, Sliding Door R, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'DA34',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.smart_5b_quest,
    programming_notes: '4th gen Quest (RE52). 5-button Intelligent Key (also 6-button variant CWTWB1U789 PN: 285E3-1JA2A with hatch). 315 MHz. Philips ID46 PCF7952. PN: 285E3-1JA1A. PIN required. Quest discontinued after 2017.',
  },

  // =====================================================
  // NISSAN XTERRA
  // =====================================================

  // 2000-2004 Xterra - Transponder (Philips ID46)
  {
    model: 'Nissan Xterra', year_start: 2000, year_end: 2004,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KBRASTU15', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.ni04_46,
    programming_notes: '1st gen Xterra (WD22). NATS with Philips ID46 transponder (early 2000 may be Philips 41). NI04/DA34 keyway. Separate keyless remote (KBRASTU15). PIN from BCM required.',
  },

  // 2005-2015 Xterra - Remote Head Key (CWTWB1U751, 315 MHz, ID46)
  {
    model: 'Nissan Xterra', year_start: 2005, year_end: 2015,
    key_blank: 'NI04-PT', transponder_type: 'Philips ID46', chip_type: 'Philips 46 (PCF7936)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U751', ic_number: '1788D-FWB1U751',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: 'DA34',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    image_url: IMG.rhk_3b_751,
    programming_notes: '2nd gen Xterra (N50). 3-button remote head key. 315 MHz. Philips ID46. NI04/DA34 keyway. PN: H0561-C993A. PIN from BCM required. Xterra discontinued after 2015.',
  },
];

// ============================================================
// MAIN EXECUTION
// ============================================================

async function main() {
  await client.connect();
  console.log('Connected to Supabase.');

  // Get a valid year_id for Nissan
  const yearRes = await client.query(
    `SELECT vy.id FROM vehicle_years vy
     JOIN vehicle_models vm ON vy.model_id = vm.id
     JOIN manufacturers m ON vm.manufacturer_id = m.id
     WHERE m.slug = 'nissan' LIMIT 1;`
  );
  const yearId = yearRes.rows[0].id;
  console.log(`Using year_id: ${yearId}`);

  // Count existing Nissan keys
  const countBefore = await client.query(
    "SELECT COUNT(*) FROM automotive_keys WHERE manufacturer_id = $1",
    [NISSAN_MFR_ID]
  );
  console.log(`\nExisting Nissan keys: ${countBefore.rows[0].count}`);

  // Use a transaction so delete + insert are atomic
  await client.query('BEGIN');

  try {
    // Delete old Nissan keys
    const delRes = await client.query(
      "DELETE FROM automotive_keys WHERE manufacturer_id = $1",
      [NISSAN_MFR_ID]
    );
    console.log(`Deleted ${delRes.rowCount} old Nissan key rows.`);

    // Insert new accurate Nissan keys
    let inserted = 0;
    for (const key of nissanKeys) {
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
          yearId, NISSAN_MFR_ID, key.model, key.key_blank, key.transponder_type,
          key.chip_type, key.remote_frequency, key.key_type, key.fcc_id, key.ic_number,
          key.battery_type, key.buttons, key.emergency_key_blank, key.test_key_blank,
          key.obd_programmable, key.pin_code_required, key.lishi_tool, key.image_url,
          key.programming_notes, key.year_start, key.year_end
        ]
      );
      inserted++;
    }
    console.log(`\nInserted ${inserted} new Nissan key rows.`);

    await client.query('COMMIT');
    console.log('Transaction committed successfully.');
  } catch (txErr) {
    await client.query('ROLLBACK');
    console.error('Transaction rolled back due to error:', txErr.message);
    throw txErr;
  }

  // Verify results
  const verifyRes = await client.query(
    `SELECT model_name, year_start, year_end, key_blank, chip_type, key_type, fcc_id, lishi_tool, remote_frequency, buttons
     FROM automotive_keys
     WHERE manufacturer_id = $1
     ORDER BY model_name, year_start;`,
    [NISSAN_MFR_ID]
  );

  console.log('\n============================================');
  console.log('VERIFICATION - All Nissan Keys:');
  console.log('============================================');

  let currentModel = '';
  for (const row of verifyRes.rows) {
    if (row.model_name !== currentModel) {
      currentModel = row.model_name;
      console.log(`\n--- ${currentModel} ---`);
    }
    console.log(`  ${row.year_start}-${row.year_end} | ${row.key_blank} | ${row.chip_type || 'N/A'} | ${row.key_type} | FCC: ${row.fcc_id || 'N/A'} | ${row.remote_frequency || 'N/A'} | ${row.lishi_tool}`);
  }

  // Summary by model
  const summaryRes = await client.query(
    `SELECT model_name, COUNT(*) as key_count
     FROM automotive_keys
     WHERE manufacturer_id = $1
     GROUP BY model_name
     ORDER BY model_name;`,
    [NISSAN_MFR_ID]
  );

  console.log('\n============================================');
  console.log('SUMMARY BY MODEL:');
  console.log('============================================');
  let totalKeys = 0;
  for (const row of summaryRes.rows) {
    console.log(`  ${row.model_name}: ${row.key_count} key rows`);
    totalKeys += parseInt(row.key_count);
  }
  console.log(`\n  TOTAL: ${totalKeys} Nissan key rows across ${summaryRes.rows.length} models`);

  // Check for any missing image_url
  const missingImg = await client.query(
    `SELECT model_name, year_start, year_end FROM automotive_keys
     WHERE manufacturer_id = $1 AND (image_url IS NULL OR image_url = '')
     ORDER BY model_name;`,
    [NISSAN_MFR_ID]
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
