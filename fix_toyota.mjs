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

const TOYOTA_MFR_ID = '66d71230-7c63-4e78-a835-8146f75fc3d3';

const MODEL_IDS = {
  '4Runner':      'de93eb63-938d-4a6f-bf18-62aebc6a1510',
  'Avalon':       'fc7c0be8-cc69-4a16-9b3d-bc4288494e97',
  'bZ4X':         '66573f72-b716-475e-a4fb-2703f3b3a80f',
  'C-HR':         'd20660e2-2ccb-4526-a405-51a293ddb4cc',
  'Camry':        'fcb33652-9057-4f67-8cdb-ca163f889b89',
  'Celica':       '7d25d4e5-ce3c-4d66-83a5-c5aa6af9efd7',
  'Corolla':      '4f33e040-0f4b-469a-be23-4079dedc6bb1',
  'Crown':        'ca800fbb-1403-4f09-92ff-95cc337d9d36',
  'Echo':         '281bd2c6-db19-4e2f-a2b5-66cf1db43e1b',
  'FJ Cruiser':   '876b6603-56e0-455d-83f5-458b0f50e6f9',
  'GR86':         '84566a95-0fb5-480a-a3e3-a878ba1b678c',
  'Highlander':   'a81c755c-e7b7-40b0-9707-8708dd3b2a8d',
  'Land Cruiser': 'a13fba08-7256-4f55-9340-8811aa23a079',
  'Matrix':       '73634546-2797-4c8f-a9c5-14bf7d74e7ed',
  'Prius':        '5199d6b3-c7a4-4009-a0fd-3026078687af',
  'RAV4':         '60634214-14b2-445e-b2a9-5c6e8306e64f',
  'Sequoia':      '7e671d4c-65ec-41ac-a80d-158001d0ef8b',
  'Sienna':       '770acca5-663d-4fac-b9dd-79bb62759554',
  'Solara':       '534ec450-7d1b-4630-a837-856291ea7428',
  'Supra':        '07e36cb3-030a-450b-b266-3a4882565479',
  'Tacoma':       '6284edbc-fecb-421d-a80a-ca8ef5d89947',
  'Tundra':       '6e9deb7e-51b9-4bbb-8a9d-95648c8904e9',
  'Venza':        'e34e8871-8338-47e7-a2ad-89d8f3602cab',
  'Yaris':        '1b84387a-2a4e-438f-a1c6-ea0668217513',
};

// ============================================================
// ACCURATE TOYOTA KEY DATA - Sourced from UHS Hardware
// ============================================================
const toyotaKeys = [

  // ===== TOYOTA CAMRY =====
  // 1998-2002 Camry - Transponder only (4C chip)
  {
    model: 'Camry', year_start: 1998, year_end: 2002,
    key_blank: 'TOY43', transponder_type: 'Texas 4C', chip_type: '4C',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY43AT4.jpg?v=1608746319',
    programming_notes: 'Transponder-only key with Texas 4C chip. Requires Toyota TIS or aftermarket tool for programming. Standard keyway TR47.',
  },
  // 2003-2006 Camry - Transponder only (4D67 chip)
  {
    model: 'Camry', year_start: 2003, year_end: 2006,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable via Toyota TIS or aftermarket tool.',
  },
  // 2007-2010 Camry - Remote Head Key (4D67 chip)
  {
    model: 'Camry', year_start: 2007, year_end: 2010,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HYQ12BBY', ic_number: '1551A-12BBY',
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-TOY-401_A.jpg',
    programming_notes: '4-button remote head key with Texas 4D67 chip. 315 MHz. OBD programmable. Board 1491. PN: 89070-06231/89070-06232.',
  },
  // 2007-2010 Camry - Smart Key (higher trims)
  {
    model: 'Camry', year_start: 2007, year_end: 2010,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit', chip_type: 'D4 (Toyota Smart)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AAB', ic_number: '1551A-14AAB',
    battery_type: 'CR1632', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2007-2010-toyota-avalon-camry-4-button-smart-key-pn-89904-06041-hyq14aab-0140-oem-475.jpg?v=1628175077',
    programming_notes: '4-button smart proximity key. Board 0140. PN: 89904-06041. Requires Toyota TIS or Autel IM608/IM508 for programming. Emergency blade TOY51 included.',
  },
  // 2011 Camry - Remote Head Key (G chip)
  {
    model: 'Camry', year_start: 2011, year_end: 2011,
    key_blank: 'TOY44G', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HYQ12BBY', ic_number: '1551A-12BBY',
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/toyota-toy44g-transponder-key-g-chip-oem-keys-815.jpg?v=1628516498',
    programming_notes: '4-button remote head key with Texas 4D72 G chip. 315 MHz. OBD programmable via Toyota G chip dongle or aftermarket tool.',
  },
  // 2012-2014 Camry - Remote Head Key (G chip, HYQ12BDM)
  {
    model: 'Camry', year_start: 2012, year_end: 2014,
    key_blank: 'TOY44G', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HYQ12BDM', ic_number: '1551A-12BDM',
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RHK-TOY-BDM-H-4_197531a0-c2bb-4a84-957c-18fe2dd03c86.jpg?v=1570459894',
    programming_notes: '4-button remote head key with G chip. PN: 89070-06420. Note: first-half 2014 may use G chip, second-half uses H chip. OBD programmable.',
  },
  // 2015-2017 Camry - Remote Head Key (H chip, HYQ12BDM)
  {
    model: 'Camry', year_start: 2015, year_end: 2017,
    key_blank: 'TOY44H', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HYQ12BDM', ic_number: '1551A-12BDM',
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RHK-TOY-BDM-H-4.jpg?v=1570459893',
    programming_notes: '4-button remote head key with H chip (8A). 315 MHz. OBD programmable via Toyota H chip dongle or Autel IM608.',
  },
  // 2018-2024 Camry - Smart Key (HYQ14FBC)
  {
    model: 'Camry', year_start: 2018, year_end: 2024,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBC', ic_number: '1551A-14FBC',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-TOY-AVA19_efd882ee-5e52-4310-9374-8b56c277ff79.jpg?v=1609433735',
    programming_notes: '4-button smart proximity key. Board 0351. PN: 89904-06220. Requires Toyota TIS or Autel/Xtool for programming. Emergency blade EKB-TOY-004.',
  },
  // 2025 Camry - Smart Key (HYQ14FBW)
  {
    model: 'Camry', year_start: 2025, year_end: 2025,
    key_blank: 'TOY51', transponder_type: 'HITAG-AES', chip_type: '4A Chip',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBW', ic_number: '1551A-14FBW',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY-AQ010_OEMNEW_1065fb30-c21a-4445-a5ef-14c40467af79.jpg?v=1719509214',
    programming_notes: '2025+ Camry uses new HITAG-AES 4A chip platform. PN: 8990H-AQ010. CR2450 battery. Requires latest tooling for programming.',
  },

  // ===== TOYOTA COROLLA =====
  // 1998-2002 Corolla - Transponder only (4C chip)
  {
    model: 'Corolla', year_start: 1998, year_end: 2002,
    key_blank: 'TOY43', transponder_type: 'Texas 4C', chip_type: '4C',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY43AT4.jpg?v=1608746319',
    programming_notes: 'Transponder-only key with Texas 4C chip. No remote. Standard keyway.',
  },
  // 2003-2008 Corolla - Transponder only (4D67 chip)
  {
    model: 'Corolla', year_start: 2003, year_end: 2008,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },
  // 2009-2010 Corolla - Remote Head Key (4D67 chip)
  {
    model: 'Corolla', year_start: 2009, year_end: 2010,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HYQ12BBY', ic_number: '1551A-12BBY',
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-TOY-401_A.jpg',
    programming_notes: '4-button remote head key with 4D67. For Corolla VINs starting with J. 315 MHz.',
  },
  // 2010-2013 Corolla - Transponder only (G chip)
  {
    model: 'Corolla', year_start: 2010, year_end: 2013,
    key_blank: 'TOY44G', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/toyota-toy44g-transponder-key-g-chip-oem-keys-815.jpg?v=1628516498',
    programming_notes: 'Transponder-only key with G chip. OBD programmable via G chip dongle.',
  },
  // 2014-2019 Corolla - Remote Head Key (H chip, HYQ12BDM)
  {
    model: 'Corolla', year_start: 2014, year_end: 2019,
    key_blank: 'TOY44H', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HYQ12BDM', ic_number: '1551A-12BDM',
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RHK-TOY-BDM-H-4.jpg?v=1570459893',
    programming_notes: '4-button remote head key with H chip (8A). 315 MHz. OBD programmable via H chip dongle or aftermarket tool.',
  },
  // 2020-2021 Corolla - Flip Key (H chip, HYQ12BFB)
  {
    model: 'Corolla', year_start: 2020, year_end: 2021,
    key_blank: 'TOY44H', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HYQ12BFB', ic_number: '1551A-12BFB',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'LXP90',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2020-2021-toyota-corolla-4-button-flip-key-pn-89070-06791-hyq12bfb-h-chip-oem-202.jpg',
    programming_notes: '4-button flip key with H chip (8A). PN: 89070-06791. 315 MHz. Includes flip blade FKB-TOY-13.',
  },
  // 2019-2022 Corolla - Smart Key (HYQ14FBN)
  {
    model: 'Corolla', year_start: 2019, year_end: 2022,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBN', ic_number: '1551A-14FBN',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2019-2021-toyota-corolla-4-button-smart-key-pn-8990h-12040-hyq14fbn-oem-567.jpg?v=1628175118',
    programming_notes: '4-button smart proximity key. PN: 8990H-12040. Emergency blade EKB-TOY-004. Requires Autel IM608 or Toyota TIS.',
  },
  // 2023-2025 Corolla - Smart Key (HYQ14FBW)
  {
    model: 'Corolla', year_start: 2023, year_end: 2025,
    key_blank: 'TOY51', transponder_type: 'HITAG-AES', chip_type: '4A Chip',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBW', ic_number: '1551A-14FBW',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY-12350_1.jpg?v=1685564766',
    programming_notes: 'New HITAG-AES 4A chip platform. PN: 8990H-12350. CR2450 battery. Requires latest generation tooling.',
  },

  // ===== TOYOTA RAV4 =====
  // 1996-2000 RAV4 - Transponder only (4C chip)
  {
    model: 'RAV4', year_start: 1996, year_end: 2000,
    key_blank: 'TOY43', transponder_type: 'Texas 4C', chip_type: '4C',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY43AT4.jpg?v=1608746319',
    programming_notes: 'Transponder-only key with Texas 4C chip.',
  },
  // 2001-2005 RAV4 - Transponder only (4D67 chip)
  {
    model: 'RAV4', year_start: 2001, year_end: 2005,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },
  // 2006-2013 RAV4 - Transponder (G chip)
  {
    model: 'RAV4', year_start: 2006, year_end: 2013,
    key_blank: 'TOY44G', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/toyota-toy44g-transponder-key-g-chip-oem-keys-815.jpg?v=1628516498',
    programming_notes: 'Transponder-only key with G chip. OBD programmable via G chip dongle.',
  },
  // 2013-2018 RAV4 - Smart Key (HYQ14FBA)
  {
    model: 'RAV4', year_start: 2013, year_end: 2018,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBA', ic_number: '1551A-14FBA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2013-2018-toyota-rav4-4-button-smart-key-pn-89904-0r080-hyq14fba-0020-oem-766.jpg',
    programming_notes: '4-button smart key. G Board 0020. PN: 89904-0R080. Emergency blade K-TOY-EM36. Requires Autel IM608 or Toyota TIS.',
  },
  // 2019-2021 RAV4 - Smart Key (HYQ14FBC, 3-button)
  {
    model: 'RAV4', year_start: 2019, year_end: 2021,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBC', ic_number: '1551A-14FBC',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2019-2020-toyota-rav4-3-button-smart-key-pn-8990h-0r010-hyq14fbc-0351-oem-886.jpg',
    programming_notes: '3-button smart key. Board 0351. PN: 8990H-0R010. Emergency blade EKB-TOY-004.',
  },
  // 2022-2024 RAV4 - Smart Key (HYQ14FLA)
  {
    model: 'RAV4', year_start: 2022, year_end: 2024,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FLA', ic_number: '1551A-14FLA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY-42690.jpg?v=1709670723',
    programming_notes: '4-button smart key. PN: 8990H-42690. Emergency blade EKB-TOY-004. Requires latest gen tooling.',
  },

  // ===== TOYOTA HIGHLANDER =====
  // 2001-2003 Highlander - Transponder (4C chip)
  {
    model: 'Highlander', year_start: 2001, year_end: 2003,
    key_blank: 'TOY43', transponder_type: 'Texas 4C', chip_type: '4C',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY43AT4.jpg?v=1608746319',
    programming_notes: 'Transponder-only key with Texas 4C chip.',
  },
  // 2004-2007 Highlander - Transponder (4D67 chip)
  {
    model: 'Highlander', year_start: 2004, year_end: 2007,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },
  // 2008-2013 Highlander - Transponder (G chip)
  {
    model: 'Highlander', year_start: 2008, year_end: 2013,
    key_blank: 'TOY44G', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/toyota-toy44g-transponder-key-g-chip-oem-keys-815.jpg?v=1628516498',
    programming_notes: 'Transponder-only key with G chip. OBD programmable.',
  },
  // 2014-2019 Highlander - Smart Key (HYQ14FBA)
  {
    model: 'Highlander', year_start: 2014, year_end: 2019,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBA', ic_number: '1551A-14FBA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2014-2021-toyota-highlander-sequoia-4-button-smart-key-pn-89904-0e121-hyq14fba-2110-oem-492.jpg',
    programming_notes: '4-button smart key. AG Board 2110. PN: 89904-0E121. Emergency blade K-TOY-EM36.',
  },
  // 2020-2022 Highlander - Smart Key (HYQ14FBC)
  {
    model: 'Highlander', year_start: 2020, year_end: 2022,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBC', ic_number: '1551A-14FBC',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2020-2021-toyota-highlander-4-button-smart-key-pn-8990h-0e020-hyq14fbc-board-0351-oem-699.jpg',
    programming_notes: '4-button smart key. Board 0351. PN: 8990H-0E020. Emergency blade EKB-TOY-004.',
  },
  // 2023-2024 Highlander - Smart Key (HYQ14FLA)
  {
    model: 'Highlander', year_start: 2023, year_end: 2024,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FLA', ic_number: '1551A-14FLA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2020-2021-toyota-highlander-4-button-smart-key-pn-8990h-0e020-hyq14fbc-board-0351-oem-699.jpg',
    programming_notes: '4-button smart key. PN: 8990H-0E370. HYQ14FLA platform.',
  },

  // ===== TOYOTA 4RUNNER =====
  // 1996-2002 4Runner - Transponder (4C chip)
  {
    model: '4Runner', year_start: 1996, year_end: 2002,
    key_blank: 'TOY43', transponder_type: 'Texas 4C', chip_type: '4C',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY43AT4.jpg?v=1608746319',
    programming_notes: 'Transponder-only key with Texas 4C chip.',
  },
  // 2003-2009 4Runner - Transponder (4D67 chip)
  {
    model: '4Runner', year_start: 2003, year_end: 2009,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },
  // 2010-2019 4Runner - Smart Key (HYQ14ACX)
  {
    model: '4Runner', year_start: 2010, year_end: 2019,
    key_blank: 'TOY51', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14ACX', ic_number: '1551A-14ACX',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY-CX3-1.jpg?v=1693317218',
    programming_notes: '3-button smart key. GNE Board 5290. PN: 89904-47230. Emergency blade K-TOY-EM28.',
  },
  // 2020-2022 4Runner - Smart Key (HYQ14FBB)
  {
    model: '4Runner', year_start: 2020, year_end: 2022,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBB', ic_number: '1551A-14FBB',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2021-toyota-4runner-3-button-smart-key-pn-89904-35060-hyq14fbb-g-board-oem-782.jpg',
    programming_notes: '3-button smart key. G Board 0010. PN: 89904-35060. Emergency blade K-TOY-EM36.',
  },
  // 2023-2024 4Runner - Smart Key (HYQ14FLA)
  {
    model: '4Runner', year_start: 2023, year_end: 2024,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FLA', ic_number: '1551A-14FLA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-TOY-5010.png?v=1658246035',
    programming_notes: '3-button smart key. PN: 8990H-35010. Emergency blade EKB-TOY-004.',
  },

  // ===== TOYOTA TACOMA =====
  // 1995-2004 Tacoma - Transponder (4C chip)
  {
    model: 'Tacoma', year_start: 1995, year_end: 2004,
    key_blank: 'TOY43', transponder_type: 'Texas 4C', chip_type: '4C',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY43AT4.jpg?v=1608746319',
    programming_notes: 'Transponder-only key with Texas 4C chip.',
  },
  // 2005-2009 Tacoma - Transponder (4D67 chip)
  {
    model: 'Tacoma', year_start: 2005, year_end: 2009,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },
  // 2010-2015 Tacoma - Transponder (G chip)
  {
    model: 'Tacoma', year_start: 2010, year_end: 2015,
    key_blank: 'TOY44G', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/toyota-toy44g-transponder-key-g-chip-oem-keys-815.jpg?v=1628516498',
    programming_notes: 'Transponder-only key with G chip. OBD programmable.',
  },
  // 2016-2020 Tacoma - Remote Head Key (H chip, HYQ12BDP)
  {
    model: 'Tacoma', year_start: 2016, year_end: 2020,
    key_blank: 'TOY44H', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HYQ12BDP', ic_number: '1551A-12BDP',
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2016-2020-toyota-tacoma-3-button-remote-head-key-pn-89070-04020-hyq12bdp-h-chip-oem-595.jpg',
    programming_notes: '3-button remote head key with H chip. PN: 89070-04020. 315 MHz. OBD programmable.',
  },
  // 2016-2022 Tacoma - Smart Key (HYQ14FBB)
  {
    model: 'Tacoma', year_start: 2016, year_end: 2022,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBB', ic_number: '1551A-14FBB',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2021-toyota-4runner-3-button-smart-key-pn-89904-35060-hyq14fbb-g-board-oem-782.jpg',
    programming_notes: '3-button smart key (push-button start trims). G Board 0010. PN: 89904-35060. Emergency blade K-TOY-EM36.',
  },
  // 2024-2025 Tacoma - Smart Card Key (HYQ14CBP)
  {
    model: 'Tacoma', year_start: 2024, year_end: 2025,
    key_blank: 'N/A', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14CBP', ic_number: '1551A-14CBP',
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY-366.jpg?v=1709735191',
    programming_notes: 'Smart card key (no buttons, wallet-style). PN: TDY1-67-5RYA. 315 MHz. No emergency key included. New for 2024 redesign.',
  },

  // ===== TOYOTA TUNDRA =====
  // 2000-2006 Tundra - Transponder (4D67 chip)
  {
    model: 'Tundra', year_start: 2000, year_end: 2006,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },
  // 2007-2009 Tundra - Transponder (4D67 chip)
  {
    model: 'Tundra', year_start: 2007, year_end: 2009,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with 4D67 chip. 2nd gen Tundra. OBD programmable.',
  },
  // 2010-2017 Tundra - Transponder (G chip)
  {
    model: 'Tundra', year_start: 2010, year_end: 2017,
    key_blank: 'TOY44G', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/toyota-toy44g-transponder-key-g-chip-oem-keys-815.jpg?v=1628516498',
    programming_notes: 'Transponder-only key with G chip. OBD programmable via G chip dongle.',
  },
  // 2018-2021 Tundra - Smart Key (HYQ14FBB)
  {
    model: 'Tundra', year_start: 2018, year_end: 2021,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBB', ic_number: '1551A-14FBB',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2021-toyota-4runner-3-button-smart-key-pn-89904-35060-hyq14fbb-g-board-oem-782.jpg',
    programming_notes: '3-button smart key. G Board 0010. PN: 89904-35060. Emergency blade K-TOY-EM36.',
  },
  // 2022-2024 Tundra - Smart Key (HYQ14FBX)
  {
    model: 'Tundra', year_start: 2022, year_end: 2024,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBX', ic_number: '1551A-14FBX',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Tailgate',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-TOY-0C010.png?v=1658253254',
    programming_notes: '4-button smart key. PN: 8990H-0C010. CR2450 battery. Emergency blade EKB-TOY-LK20. New 3rd gen platform.',
  },

  // ===== TOYOTA SIENNA =====
  // 1998-2003 Sienna - Transponder (4C chip)
  {
    model: 'Sienna', year_start: 1998, year_end: 2003,
    key_blank: 'TOY43', transponder_type: 'Texas 4C', chip_type: '4C',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY43AT4.jpg?v=1608746319',
    programming_notes: 'Transponder-only key with Texas 4C chip.',
  },
  // 2004-2010 Sienna - Transponder (4D67 chip)
  {
    model: 'Sienna', year_start: 2004, year_end: 2010,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },
  // 2011-2020 Sienna - Smart Key (HYQ14ADR, 6-button)
  {
    model: 'Sienna', year_start: 2011, year_end: 2020,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14ADR', ic_number: '1551A-14ADR',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Left Sliding Door, Right Sliding Door, Hatch, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY40',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2011-2020-toyota-sienna-6-button-smart-key-pn-89904-08010-hyq14adr-oem-717.jpg',
    programming_notes: '6-button smart key with sliding door controls. PN: 89904-08010. Emergency blade EKB-TOY-SIENNA.',
  },
  // 2021-2024 Sienna - Smart Key (HYQ14FBX, 6-button)
  {
    model: 'Sienna', year_start: 2021, year_end: 2024,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBX', ic_number: '1551A-14FBX',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Hatch, Panic, Left Sliding Door, Right Sliding Door',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2021-toyota-sienna-6-button-smart-key-pn-8990h-08010-hyq14fbx-blue-hybrid-logo-oem-384.jpg?v=1628175267',
    programming_notes: '6-button smart key with blue hybrid logo. PN: 8990H-08010. CR2450 battery. Emergency blade EKB-TOY-LK20.',
  },

  // ===== TOYOTA PRIUS =====
  // 2001-2003 Prius - Transponder (4C chip)
  {
    model: 'Prius', year_start: 2001, year_end: 2003,
    key_blank: 'TOY43', transponder_type: 'Texas 4C', chip_type: '4C',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY43AT4.jpg?v=1608746319',
    programming_notes: 'Transponder-only key with Texas 4C chip. 1st gen Prius.',
  },
  // 2004-2009 Prius - Smart Key (MOZB31EG)
  {
    model: 'Prius', year_start: 2004, year_end: 2009,
    key_blank: 'TOY43', transponder_type: 'Texas 4D', chip_type: '4D',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'MOZB31EG', ic_number: '2584A-B31EG',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'TOY43', test_key_blank: 'TR47',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-TOY-PRS49.jpg',
    programming_notes: '3-button smart key. PN: 89994-47061. Emergency blade EKB-TOY-001. 2nd gen Prius.',
  },
  // 2010-2015 Prius - Smart Key (HYQ14ACX/HYQ14AAB)
  {
    model: 'Prius', year_start: 2010, year_end: 2015,
    key_blank: 'TOY51', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14ACX', ic_number: '1551A-14ACX',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY-CX3-1.jpg?v=1693317218',
    programming_notes: '3-button smart key. GNE Board. PN: 89904-47230. Emergency blade K-TOY-EM28. 3rd gen Prius.',
  },
  // 2016-2021 Prius - Smart Key (HYQ14FBC)
  {
    model: 'Prius', year_start: 2016, year_end: 2021,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBC', ic_number: '1551A-14FBC',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2016-2021-toyota-prius-3-button-smart-key-pn-89904-47530-hyq14fbc-0351-oem-520.jpg',
    programming_notes: '3-button smart key. Board 0351. PN: 89904-47530. Emergency blade EKB-TOY-004. 4th gen Prius.',
  },
  // 2023-2024 Prius - Smart Key (HYQ14FBX)
  {
    model: 'Prius', year_start: 2023, year_end: 2024,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBX', ic_number: '1551A-14FBX',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY-47120_1.jpg',
    programming_notes: '3-button smart key. PN: 8990H-47120. Emergency blade EKB-TOY-LK20. 5th gen Prius redesign.',
  },

  // ===== TOYOTA AVALON =====
  // 1998-2004 Avalon - Transponder (4C chip)
  {
    model: 'Avalon', year_start: 1998, year_end: 2004,
    key_blank: 'TOY43', transponder_type: 'Texas 4C', chip_type: '4C',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY43AT4.jpg?v=1608746319',
    programming_notes: 'Transponder-only key with Texas 4C chip.',
  },
  // 2005-2007 Avalon - Smart Key (HYQ14AAF)
  {
    model: 'Avalon', year_start: 2005, year_end: 2007,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto', chip_type: 'D4 (Toyota Smart)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AAF', ic_number: '1551A-14AAF',
    battery_type: 'CR1632', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2005-2007-toyota-avalon-4-button-smart-key-pn-89904-07030-hyq14aaf-oem-211.jpg?v=1628175161',
    programming_notes: '4-button smart key. PN: 89904-07030. Emergency blade K-TOY-EM28.',
  },
  // 2008-2012 Avalon - Smart Key (HYQ14AAB/HYQ14AEM)
  {
    model: 'Avalon', year_start: 2008, year_end: 2012,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto', chip_type: 'D4 (Toyota Smart)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AEM', ic_number: '1551A-14AEM',
    battery_type: 'CR1632', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY-AEM-4T-1.jpg?v=1693317291',
    programming_notes: '4-button smart key. PN: 89904-06131. Emergency blade K-TOY-EM28.',
  },
  // 2013-2018 Avalon - Smart Key (HYQ14FBA)
  {
    model: 'Avalon', year_start: 2013, year_end: 2018,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBA', ic_number: '1551A-14FBA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2014-2021-toyota-highlander-sequoia-4-button-smart-key-pn-89904-0e121-hyq14fba-2110-oem-492.jpg',
    programming_notes: '4-button smart key. Board 0020. Emergency blade K-TOY-EM36.',
  },
  // 2019 Avalon - Smart Key (HYQ14FBE)
  {
    model: 'Avalon', year_start: 2019, year_end: 2019,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBE', ic_number: '1551A-14FBE',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2019-toyota-avalon-4-button-smart-key-pn-8990h-07010-hyq14fbe-0410-for-non-hybrid-models-silver-logo-oem-733.jpg',
    programming_notes: '4-button smart key. Board 0410. PN: 8990H-07010. Emergency blade EKB-TOY-004.',
  },
  // 2020-2022 Avalon - Smart Key (HYQ14FBC)
  {
    model: 'Avalon', year_start: 2020, year_end: 2022,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBC', ic_number: '1551A-14FBC',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2020-2021-toyota-avalon-4-button-smart-key-pn-8990h-07070-hyq14fbc-0351-oem-765.jpg',
    programming_notes: '4-button smart key. Board 0351. PN: 8990H-07070. Emergency blade EKB-TOY-004. Last model year Avalon.',
  },

  // ===== TOYOTA SEQUOIA =====
  // 2001-2007 Sequoia - Transponder (4D67 chip)
  {
    model: 'Sequoia', year_start: 2001, year_end: 2007,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },
  // 2008-2019 Sequoia - Transponder (G chip)
  {
    model: 'Sequoia', year_start: 2008, year_end: 2019,
    key_blank: 'TOY44G', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/toyota-toy44g-transponder-key-g-chip-oem-keys-815.jpg?v=1628516498',
    programming_notes: 'Transponder-only key with G chip. OBD programmable.',
  },
  // 2020-2022 Sequoia - Smart Key (HYQ14FBA/HYQ14FBB)
  {
    model: 'Sequoia', year_start: 2020, year_end: 2022,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBA', ic_number: '1551A-14FBA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2014-2021-toyota-highlander-sequoia-4-button-smart-key-pn-89904-0e121-hyq14fba-2110-oem-492.jpg',
    programming_notes: '4-button smart key. AG Board 2110. PN: 89904-0E121. Emergency blade K-TOY-EM36.',
  },
  // 2023-2025 Sequoia - Smart Key (HYQ14FBX)
  {
    model: 'Sequoia', year_start: 2023, year_end: 2025,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBX', ic_number: '1551A-14FBX',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY358-RC.jpg?v=1732913561',
    programming_notes: '4-button smart key. PN: 8990H-0C020. Emergency blade EKB-TOY-LK20. New TNGA-F platform.',
  },

  // ===== TOYOTA LAND CRUISER =====
  // 1998-2002 Land Cruiser - Transponder (4C chip)
  {
    model: 'Land Cruiser', year_start: 1998, year_end: 2002,
    key_blank: 'TOY43', transponder_type: 'Texas 4C', chip_type: '4C',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY43AT4.jpg?v=1608746319',
    programming_notes: 'Transponder-only key with Texas 4C chip.',
  },
  // 2003-2007 Land Cruiser - Transponder (4D67 chip)
  {
    model: 'Land Cruiser', year_start: 2003, year_end: 2007,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with 4D67 chip. OBD programmable.',
  },
  // 2008-2015 Land Cruiser - Smart Key (HYQ14AEM)
  {
    model: 'Land Cruiser', year_start: 2008, year_end: 2015,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto', chip_type: 'D4 (Toyota Smart)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AEM', ic_number: '1551A-14AEM',
    battery_type: 'CR1632', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2008-2015-toyota-land-cruiser-3-button-smart-key-pn-89904-60770-hyq14aem-oem-786.jpg',
    programming_notes: '3-button smart key. PN: 89904-60770. Emergency blade K-TOY-EM28. Also interchangeable w/ HYQ14AAB E Board.',
  },
  // 2016-2019 Land Cruiser - Smart Key (HYQ14FBA)
  {
    model: 'Land Cruiser', year_start: 2016, year_end: 2019,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBA', ic_number: '1551A-14FBA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2014-2021-toyota-highlander-sequoia-4-button-smart-key-pn-89904-0e121-hyq14fba-2110-oem-492.jpg',
    programming_notes: '4-button smart key. AG Board 2110. PN: 89904-60M80. Emergency blade K-TOY-EM36.',
  },
  // 2020-2021 Land Cruiser - Smart Key (HYQ14FBB)
  {
    model: 'Land Cruiser', year_start: 2020, year_end: 2021,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBB', ic_number: '1551A-14FBB',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2020-2021-toyota-land-cruiser-4-button-smart-key-pn-89904-60x40-hyq14fbb-0110-oem-347.jpg',
    programming_notes: '4-button smart key. G Board 0010. PN: 89904-60X40. Emergency blade EKB-TOY-LK20.',
  },
  // 2024-2025 Land Cruiser - Smart Key (HYQ14FBX)
  {
    model: 'Land Cruiser', year_start: 2024, year_end: 2025,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBX', ic_number: '1551A-14FBX',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY-60790.jpg',
    programming_notes: '4-button smart key. PN: 8990H-60790. CR2450 battery. New J300 platform.',
  },

  // ===== TOYOTA C-HR =====
  // 2018-2020 C-HR - Flip Key (MOZB97TZ)
  {
    model: 'C-HR', year_start: 2018, year_end: 2020,
    key_blank: 'TOY44H', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MOZB97TZ', ic_number: '2584A-B97TZ',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: 'LXP90',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2018-2020-toyota-c-hr-3-button-flip-key-pn-89070-f4080-mozb97tz-chip-id-4d-h-oem-504.jpg',
    programming_notes: '3-button flip key with H chip. PN: 89070-F4080. 315 MHz. Includes flip blade FKB-TOY-090.',
  },
  // 2018-2022 C-HR - Smart Key (MOZBR1ET)
  {
    model: 'C-HR', year_start: 2018, year_end: 2022,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'MOZBR1ET', ic_number: '2584A-BR1ET',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/ILCO-AX00013630_A.jpg?v=1637005219',
    programming_notes: '3-button smart key. PN: 89904-F4020. 315 MHz. Push-button start trims.',
  },

  // ===== TOYOTA VENZA =====
  // 2009-2016 Venza - Smart Key (HYQ14ACX)
  {
    model: 'Venza', year_start: 2009, year_end: 2016,
    key_blank: 'TOY51', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14ACX', ic_number: '1551A-14ACX',
    battery_type: 'CR1632', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2009-2016-toyota-venza-4-button-smart-key-pn-89904-0t020-hyq14acx-5290-oem-541.jpg',
    programming_notes: '4-button smart key. GNE Board 5290. PN: 89904-0T020. Emergency blade K-TOY-EM28.',
  },
  // 2021-2023 Venza - Smart Key (HYQ14FBX)
  {
    model: 'Venza', year_start: 2021, year_end: 2023,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBX', ic_number: '1551A-14FBX',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2021-toyota-venza-4-button-smart-key-pn-8990h-48050-hyq14fbx-blue-hybrid-logo-oem-185.jpg?v=1628175259',
    programming_notes: '4-button smart key. Blue hybrid logo. PN: 8990H-48050. Emergency blade EKB-TOY-LK20.',
  },

  // ===== TOYOTA GR86 =====
  // 2022-2024 GR86 - Smart Key (HYQ14AHK)
  {
    model: 'GR86', year_start: 2022, year_end: 2024,
    key_blank: 'TOY51', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHK', ic_number: '1551A-14AHK',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'SUB', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY-10030-_3.jpg',
    programming_notes: '4-button smart key. Subaru platform - uses 434 MHz (not standard Toyota 315 MHz). PN: SU003-10030. Emergency blade EKB-SUB-002. Requires Subaru SSM or Autel IM608.',
  },

  // ===== TOYOTA SUPRA =====
  // 2020-2025 Supra - Smart Key (BMW platform, N5F-ID21A)
  {
    model: 'Supra', year_start: 2020, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'Hitag Pro', chip_type: 'ID49 (PCF7953)',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'N5F-ID21A', ic_number: '3248A-ID21A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY-10030-_3.jpg',
    programming_notes: 'BMW Z4 platform. Uses BMW key system - NOT standard Toyota. 434 MHz. FCC N5F-ID21A. Requires BMW ISTA or Autel IM608 with BMW license. Emergency key is HU100R (BMW style).',
  },

  // ===== TOYOTA bZ4X =====
  // 2023-2025 bZ4X - Smart Key (HYQ14FBX)
  {
    model: 'bZ4X', year_start: 2023, year_end: 2025,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBX', ic_number: '1551A-14FBX',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, A/C, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY-42510_1.jpg?v=1685562047',
    programming_notes: '4-button smart key with A/C button for pre-conditioning. PN: 8990H-42510. CR2450 battery. Emergency blade EKB-TOY-LK20. Toyota BEV platform.',
  },

  // ===== TOYOTA CROWN =====
  // 2023-2024 Crown - Smart Key (HYQ14FBX)
  {
    model: 'Crown', year_start: 2023, year_end: 2024,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBX', ic_number: '1551A-14FBX',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-TOY-30190.jpg?v=1694113616',
    programming_notes: '4-button smart key. PN: 8990H-30190. CR2450 battery. Emergency blade EKB-TOY-LK20.',
  },
  // 2025 Crown - Smart Key (HYQ14FGZ, 433 MHz)
  {
    model: 'Crown', year_start: 2025, year_end: 2025,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FGZ', ic_number: '1551A-14FGZ',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'LXP90',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/2025ToyotaCrown4-ButtonSmartKeyPN8990H-30260FCCHYQ14FGZMHz433_OEM.jpg',
    programming_notes: '4-button smart key. PN: 8990H-30260. 433 MHz (new frequency for Crown). CR2450 battery. Emergency blade EKB-TOY-M20.',
  },

  // ===== TOYOTA CELICA =====
  // 2000-2005 Celica - Transponder (4D67 chip)
  {
    model: 'Celica', year_start: 2000, year_end: 2005,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },

  // ===== TOYOTA ECHO =====
  // 2000-2005 Echo - Transponder (4D67 chip)
  {
    model: 'Echo', year_start: 2000, year_end: 2005,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },

  // ===== TOYOTA FJ CRUISER =====
  // 2007-2009 FJ Cruiser - Transponder (4D67 chip)
  {
    model: 'FJ Cruiser', year_start: 2007, year_end: 2009,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },
  // 2010-2014 FJ Cruiser - Transponder (G chip)
  {
    model: 'FJ Cruiser', year_start: 2010, year_end: 2014,
    key_blank: 'TOY44G', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/toyota-toy44g-transponder-key-g-chip-oem-keys-815.jpg?v=1628516498',
    programming_notes: 'Transponder-only key with G chip. OBD programmable via G chip dongle.',
  },

  // ===== TOYOTA MATRIX =====
  // 2003-2008 Matrix - Transponder (4D67 chip)
  {
    model: 'Matrix', year_start: 2003, year_end: 2008,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },
  // 2009-2014 Matrix - Transponder (G chip)
  {
    model: 'Matrix', year_start: 2009, year_end: 2014,
    key_blank: 'TOY44G', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/toyota-toy44g-transponder-key-g-chip-oem-keys-815.jpg?v=1628516498',
    programming_notes: 'Transponder-only key with G chip. OBD programmable.',
  },

  // ===== TOYOTA SOLARA =====
  // 1999-2003 Solara - Transponder (4C chip)
  {
    model: 'Solara', year_start: 1999, year_end: 2003,
    key_blank: 'TOY43', transponder_type: 'Texas 4C', chip_type: '4C',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY43AT4.jpg?v=1608746319',
    programming_notes: 'Transponder-only key with Texas 4C chip.',
  },
  // 2004-2008 Solara - Transponder (4D67 chip)
  {
    model: 'Solara', year_start: 2004, year_end: 2008,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },

  // ===== TOYOTA YARIS =====
  // 2007-2010 Yaris - Transponder (4D67 chip)
  {
    model: 'Yaris', year_start: 2007, year_end: 2010,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-TOY44D.jpg?v=1609862712',
    programming_notes: 'Transponder-only key with Texas 4D67 chip. OBD programmable.',
  },
  // 2011-2014 Yaris - Remote Head Key (G chip)
  {
    model: 'Yaris', year_start: 2011, year_end: 2014,
    key_blank: 'TOY44G', transponder_type: 'Texas 4D72 G', chip_type: 'G Chip',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HYQ12BBY', ic_number: '1551A-12BBY',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RHK-TOY049-RC.jpg',
    programming_notes: '4-button remote head key with G chip. PN: 89070-33C40. 315 MHz. OBD programmable.',
  },
  // 2015-2019 Yaris - Remote Head Key (H chip)
  {
    model: 'Yaris', year_start: 2015, year_end: 2019,
    key_blank: 'TOY44H', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HYQ12BBY', ic_number: '1551A-12BBY',
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-TOY-BBYH_A.jpg?v=1609432386',
    programming_notes: '3-button remote head key with H chip (8A). PN: 89070-52G50. 315 MHz. OBD programmable.',
  },
];


async function main() {
  await client.connect();
  console.log('Connected to database.\n');

  try {
    // 1. Show current Toyota keys count
    const currentRes = await client.query(
      "SELECT COUNT(*) as count FROM automotive_keys WHERE model_name ILIKE '%Toyota%'"
    );
    console.log(`Current Toyota key rows: ${currentRes.rows[0].count}`);

    // 2. Delete ALL existing Toyota keys
    console.log('\nDeleting all existing Toyota key rows...');
    const deleteRes = await client.query(
      "DELETE FROM automotive_keys WHERE model_name ILIKE '%Toyota%'"
    );
    console.log(`Deleted ${deleteRes.rowCount} rows.`);

    // 3. Delete existing Toyota vehicle_years entries
    const toyotaModelIds = Object.values(MODEL_IDS);
    console.log('\nDeleting existing Toyota vehicle_years...');
    const deleteYearsRes = await client.query(
      `DELETE FROM vehicle_years WHERE model_id = ANY($1::uuid[])`,
      [toyotaModelIds]
    );
    console.log(`Deleted ${deleteYearsRes.rowCount} vehicle_years rows.`);

    // 4. Insert new accurate Toyota keys
    console.log('\nInserting new accurate Toyota key data from UHS Hardware...\n');

    let insertedCount = 0;

    for (const key of toyotaKeys) {
      const modelId = MODEL_IDS[key.model];
      if (!modelId) {
        console.error(`ERROR: No model ID found for model: ${key.model}`);
        continue;
      }

      // Create or reuse vehicle_year entry
      const yearRes = await client.query(
        `INSERT INTO vehicle_years (id, model_id, year_start, year_end)
         VALUES (gen_random_uuid(), $1, $2, $3)
         ON CONFLICT (model_id, year_start, year_end) DO UPDATE SET year_start = EXCLUDED.year_start
         RETURNING id`,
        [modelId, key.year_start, key.year_end]
      );
      const yearId = yearRes.rows[0].id;

      // Insert the automotive_keys entry
      await client.query(
        `INSERT INTO automotive_keys (
          id, year_id, manufacturer_id, model_name,
          key_blank, transponder_type, chip_type, remote_frequency,
          key_type, fcc_id, ic_number, programming_notes,
          pin_code_required, obd_programmable, emergency_key_blank,
          year_start, year_end, battery_type, buttons,
          test_key_blank, image_url, lishi_tool
        ) VALUES (
          gen_random_uuid(), $1, $2, $3,
          $4, $5, $6, $7,
          $8, $9, $10, $11,
          $12, $13, $14,
          $15, $16, $17, $18,
          $19, $20, $21
        )`,
        [
          yearId,
          TOYOTA_MFR_ID,
          `Toyota ${key.model}`,
          key.key_blank,
          key.transponder_type,
          key.chip_type,
          key.remote_frequency,
          key.key_type,
          key.fcc_id,
          key.ic_number,
          key.programming_notes,
          key.pin_code_required,
          key.obd_programmable,
          key.emergency_key_blank,
          key.year_start,
          key.year_end,
          key.battery_type,
          key.buttons,
          key.test_key_blank,
          key.image_url,
          key.lishi_tool,
        ]
      );

      insertedCount++;
      console.log(`  [${insertedCount}] Toyota ${key.model} ${key.year_start}-${key.year_end} | ${key.key_type} | FCC: ${key.fcc_id || 'N/A'} | ${key.remote_frequency || 'N/A'} | ${key.chip_type}`);
    }

    console.log(`\nInserted ${insertedCount} new Toyota key rows.`);

    // 5. Verify
    console.log('\n' + '='.repeat(80));
    console.log('VERIFICATION - All Toyota keys now in database:');
    console.log('='.repeat(80) + '\n');

    const verifyRes = await client.query(
      `SELECT model_name, year_start, year_end, key_type, key_blank,
              chip_type, fcc_id, remote_frequency, battery_type, buttons,
              ic_number, emergency_key_blank, lishi_tool, image_url
       FROM automotive_keys
       WHERE model_name ILIKE '%Toyota%'
       ORDER BY model_name, year_start, key_type`
    );

    for (const row of verifyRes.rows) {
      console.log(`${row.model_name} (${row.year_start}-${row.year_end})`);
      console.log(`  Type: ${row.key_type} | Blank: ${row.key_blank} | Chip: ${row.chip_type || 'N/A'}`);
      console.log(`  FCC: ${row.fcc_id || 'N/A'} | IC: ${row.ic_number || 'N/A'} | Freq: ${row.remote_frequency || 'N/A'}`);
      console.log(`  Battery: ${row.battery_type || 'N/A'} | Buttons: ${row.buttons || 'N/A'}`);
      console.log(`  Emergency: ${row.emergency_key_blank || 'N/A'} | Lishi: ${row.lishi_tool || 'N/A'}`);
      console.log(`  Image: ${row.image_url ? 'YES' : 'MISSING'}`);
      console.log('');
    }

    console.log(`\nTotal Toyota key rows: ${verifyRes.rows.length}`);

  } catch (err) {
    console.error('ERROR:', err.message);
    console.error(err.stack);
  } finally {
    await client.end();
    console.log('\nDatabase connection closed.');
  }
}

main();
