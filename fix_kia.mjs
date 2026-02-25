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

const KIA_MFR_ID = 'd8aae657-5699-4a79-bf3a-cb6ed2fc4483';

// Existing model IDs
const MODEL_IDS = {
  'Amanti':    '73ed4c30-6ca9-4a3d-9923-0297495ec874',
  'Cadenza':   '3138c9cf-b70e-488a-b26e-dcc9726c8406',
  'Carnival':  'cedbc9f6-8814-4f09-9e1b-a98684f61a77',
  'EV6':       '13e1ce30-7a74-4ff1-97f5-9c8a8d7503d5',
  'Forte':     'c0db7939-2ab1-4c40-af1c-a1a4a33173a9',
  'K5':        'fe91ebd9-165f-438c-8b6e-6ef9b6c5f0ba',
  'Optima':    '5115238d-284e-4797-b3cd-2ff31ba199b6',
  'Rio':       '6bbeb319-23d8-4597-802a-eb5be63cc919',
  'Sedona':    'ffbe6cb7-5211-4c46-91cb-43e8f73b2a5e',
  'Seltos':    '02a24925-ee46-482a-b40e-e4163c932ce3',
  'Sorento':   'f0be136b-dee1-4113-bcfb-b40881b9d3a9',
  'Soul':      '3a888012-d40b-49cf-b6c4-eda4f057d2ad',
  'Spectra':   'fe0e9ac5-c211-408a-b6cb-315ff042edd2',
  'Sportage':  'ed493303-cef2-4124-80dd-9e2ff436cdd1',
  'Stinger':   'ac4bc164-0d15-4a4b-86fb-3a4ed49c23ee',
  'Telluride': 'a5e53125-6b7e-4964-a5d8-3188d3a856eb',
};

// Models that need to be created
const MISSING_MODELS = [
  { name: 'Borrego',  slug: 'borrego' },
  { name: 'EV9',      slug: 'ev9' },
  { name: 'K900',     slug: 'k900' },
  { name: 'Niro',     slug: 'niro' },
  { name: 'Niro EV',  slug: 'niro-ev' },
  { name: 'Rondo',    slug: 'rondo' },
  { name: 'Soul EV',  slug: 'soul-ev' },
];

// ============================================================
// ACCURATE KIA KEY DATA
// ============================================================
const kiaKeys = [

  // ===== AMANTI =====
  {
    model: 'Amanti', year_start: 2004, year_end: 2006,
    key_blank: 'HY14', transponder_type: 'Texas Crypto 4D', chip_type: '4D60',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Texas 4D60 transponder chip. Requires PIN code for programming. HYN14 keyway.',
  },
  {
    model: 'Amanti', year_start: 2007, year_end: 2009,
    key_blank: 'HY14', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Philips ID46 transponder. HYN14 keyway. OBD programmable.',
  },
  {
    model: 'Amanti', year_start: 2007, year_end: 2009,
    key_blank: 'HY14', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'SY55WY8212', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz. ID46 chip.',
  },

  // ===== BORREGO =====
  {
    model: 'Borrego', year_start: 2009, year_end: 2011,
    key_blank: 'HY14', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Philips ID46 transponder. HYN14 keyway. OBD programmable.',
  },
  {
    model: 'Borrego', year_start: 2009, year_end: 2011,
    key_blank: 'HY14', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'PINHA-T036', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. ID46 chip.',
  },

  // ===== CADENZA =====
  {
    model: 'Cadenza', year_start: 2014, year_end: 2016,
    key_blank: 'HY22', transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5KHFNA433', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. PCF7952 ID46 chip.',
  },
  {
    model: 'Cadenza', year_start: 2017, year_end: 2020,
    key_blank: 'KK12', transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F10', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. HITAG3 ID47 chip. KK12 emergency blade.',
  },

  // ===== CARNIVAL =====
  {
    model: 'Carnival', year_start: 2022, year_end: 2024,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5MQ4FGE05', ic_number: null,
    battery_type: 'CR2032', buttons: 7,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 7 buttons: Lock, Unlock, Sliding Door L, Sliding Door R, Hatch, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip.',
  },

  // ===== EV6 =====
  {
    model: 'EV6', year_start: 2022, year_end: 2024,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD01470', ic_number: null,
    battery_type: 'CR2032', buttons: 7,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 7 buttons: Lock, Unlock, Frunk, Hatch, Panic, Remote Start, Charge Port. 433 MHz. HITAG-AES 4A chip.',
  },
  // 4-button variant
  {
    model: 'EV6', year_start: 2022, year_end: 2024,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD01480', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key (base). 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. HITAG-AES 4A chip.',
  },

  // ===== EV9 =====
  {
    model: 'EV9', year_start: 2024, year_end: 2025,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F81U44', ic_number: null,
    battery_type: 'CR2032', buttons: 6,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 6 buttons: Lock, Unlock, Hatch, Frunk, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip.',
  },
  // 8-button variant
  {
    model: 'EV9', year_start: 2024, year_end: 2025,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F61U44', ic_number: null,
    battery_type: 'CR2032', buttons: 8,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 8 buttons: Lock, Unlock, Hatch, Panic, Remote Start, Frunk, Park In, Park Out. 433 MHz. HITAG-AES 4A chip.',
  },

  // ===== FORTE =====
  // 2010-2013 - Transponder
  {
    model: 'Forte', year_start: 2010, year_end: 2013,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'ID46 transponder (PCF7952A). HY20 key blank. OBD programmable.',
  },
  // 2010-2013 - Smart key
  {
    model: 'Forte', year_start: 2010, year_end: 2013,
    key_blank: 'HY22', transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5HMFNA04', ic_number: '267AL-HMFNA04',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz. PCF7952 ID46 chip.',
  },
  // 2014-2018 - Transponder
  {
    model: 'Forte', year_start: 2014, year_end: 2018,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'ID46 transponder. HY20 key blank. OBD programmable.',
  },
  // 2014-2018 - Remote head (flip)
  {
    model: 'Forte', year_start: 2014, year_end: 2018,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'OSLOKA-875T', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Flip remote key. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz. ID46 chip.',
  },
  // 2019-2021 - Flip key
  {
    model: 'Forte', year_start: 2019, year_end: 2021,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Remote Head',
    fcc_id: 'CQOTD00660', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Flip remote key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. HITAG-AES 4A chip. Requires PIN.',
  },
  // 2019-2023 - Smart key
  {
    model: 'Forte', year_start: 2019, year_end: 2023,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '434 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD00430', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 434 MHz. HITAG-AES 4A chip. KK12 emergency blade.',
  },
  // 2022-2024 - Flip key
  {
    model: 'Forte', year_start: 2022, year_end: 2024,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Remote Head',
    fcc_id: 'CQOTD00660', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Flip remote key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. HITAG-AES 4A chip.',
  },
  // 2022-2024 - Smart key 5 button
  {
    model: 'Forte', year_start: 2022, year_end: 2024,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD00790', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip.',
  },

  // ===== K5 =====
  {
    model: 'K5', year_start: 2021, year_end: 2024,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD00790', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip. Successor to Optima.',
  },
  // K5 flip key
  {
    model: 'K5', year_start: 2021, year_end: 2024,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Remote Head',
    fcc_id: 'CQOTD00660', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Flip remote key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. HITAG-AES 4A chip.',
  },

  // ===== K900 =====
  {
    model: 'K900', year_start: 2015, year_end: 2017,
    key_blank: 'HY22', transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5KHFNA433', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. PCF7952 ID46 chip.',
  },
  {
    model: 'K900', year_start: 2019, year_end: 2020,
    key_blank: 'KK12', transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F17', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. HITAG3 ID47 chip.',
  },

  // ===== NIRO =====
  {
    model: 'Niro', year_start: 2017, year_end: 2019,
    key_blank: 'KK12', transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F08', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. HITAG3 ID47 chip.',
  },
  {
    model: 'Niro', year_start: 2020, year_end: 2022,
    key_blank: 'KK12', transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F24', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. HITAG3 ID47 chip.',
  },
  {
    model: 'Niro', year_start: 2023, year_end: 2025,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'FD01330', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip. All-new generation.',
  },

  // ===== NIRO EV =====
  {
    model: 'Niro EV', year_start: 2019, year_end: 2022,
    key_blank: 'KK12', transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F24', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. HITAG3 ID47 chip.',
  },
  {
    model: 'Niro EV', year_start: 2023, year_end: 2025,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'FD01340', ic_number: null,
    battery_type: 'CR2032', buttons: 7,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 7 buttons: Lock, Unlock, Hatch, Remote Start, Panic, Park In, Park Out. 433 MHz. HITAG-AES 4A chip.',
  },

  // ===== OPTIMA =====
  // 2001-2006 - Transponder
  {
    model: 'Optima', year_start: 2001, year_end: 2006,
    key_blank: 'HY14', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'ID46 transponder. HYN14 keyway. OBD programmable.',
  },
  // 2007-2010 - Transponder
  {
    model: 'Optima', year_start: 2007, year_end: 2010,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'ID46 transponder. HY20 key blank. OBD programmable.',
  },
  // 2011-2013 - Smart key
  {
    model: 'Optima', year_start: 2011, year_end: 2013,
    key_blank: 'HY22', transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5HMFNA04', ic_number: '267AL-HMFNA04',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz. PCF7952 ID46 chip.',
  },
  // 2014-2015 - Smart key 433
  {
    model: 'Optima', year_start: 2014, year_end: 2015,
    key_blank: 'HY22', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5XMFNA433', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. ID46 chip.',
  },
  // 2016-2020 - Smart key
  {
    model: 'Optima', year_start: 2016, year_end: 2020,
    key_blank: 'KK12', transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5JFFGE04', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. HITAG3 ID47 chip. KK12 emergency blade.',
  },

  // ===== RIO =====
  // 2006-2011 - Transponder
  {
    model: 'Rio', year_start: 2006, year_end: 2011,
    key_blank: 'HY14', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'ID46 transponder. HYN14 keyway. OBD programmable.',
  },
  // 2012-2017 - Transponder
  {
    model: 'Rio', year_start: 2012, year_end: 2017,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'ID46 transponder. HY20 key blank. OBD programmable.',
  },
  // 2014-2017 - Flip remote
  {
    model: 'Rio', year_start: 2014, year_end: 2017,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'TQ8-RKE-3F05', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Flip remote key. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz. ID46 chip.',
  },
  // 2018-2022 - Transponder
  {
    model: 'Rio', year_start: 2018, year_end: 2022,
    key_blank: 'KK12', transponder_type: 'Texas Crypto DST80', chip_type: '4D60 80-Bit',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: '4D60 80-bit transponder. KK12 key blank. Requires PIN code.',
  },
  // 2018-2022 - Flip remote
  {
    model: 'Rio', year_start: 2018, year_end: 2022,
    key_blank: 'KK12', transponder_type: 'Texas Crypto DST80', chip_type: '4D60 80-Bit',
    remote_frequency: '433 MHz', key_type: 'Remote Head',
    fcc_id: 'TQ8-RKE-4F25', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Flip remote key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. 4D60 80-bit chip.',
  },

  // ===== RONDO =====
  {
    model: 'Rondo', year_start: 2007, year_end: 2010,
    key_blank: 'HY14', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'ID46 transponder. HYN14 keyway. OBD programmable.',
  },
  {
    model: 'Rondo', year_start: 2007, year_end: 2010,
    key_blank: 'HY14', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'PLNHM-T011', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. ID46 chip.',
  },

  // ===== SEDONA =====
  // 2002-2005 - Transponder
  {
    model: 'Sedona', year_start: 2002, year_end: 2005,
    key_blank: 'HY14', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'ID46 transponder. HYN14 keyway. OBD programmable.',
  },
  // 2006-2014 - Transponder
  {
    model: 'Sedona', year_start: 2006, year_end: 2014,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'ID46 transponder. HY20 key blank. OBD programmable.',
  },
  // 2006-2014 - Remote head
  {
    model: 'Sedona', year_start: 2006, year_end: 2014,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'SV3-VQTXNA0', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Remote head key. 5 buttons: Lock, Unlock, Sliding Door L, Sliding Door R, Panic. 315 MHz. ID46.',
  },
  // 2015-2021 - Smart key (minivan)
  {
    model: 'Sedona', year_start: 2015, year_end: 2021,
    key_blank: 'KK12', transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5YPFGE06', ic_number: null,
    battery_type: 'CR2032', buttons: 6,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 6 buttons: Lock, Unlock, Sliding Door L, Sliding Door R, Hatch, Panic. 433 MHz. ID47 chip.',
  },

  // ===== SELTOS =====
  {
    model: 'Seltos', year_start: 2021, year_end: 2024,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'NYOSYEC5FOB1907', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. HITAG-AES 4A chip.',
  },

  // ===== SORENTO =====
  // 2003-2006 - Transponder
  {
    model: 'Sorento', year_start: 2003, year_end: 2006,
    key_blank: 'HY14', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'ID46 transponder. HYN14 keyway. OBD programmable.',
  },
  // 2007-2009 - Transponder
  {
    model: 'Sorento', year_start: 2007, year_end: 2009,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'ID46 transponder. HY20 key blank. OBD programmable.',
  },
  // 2010-2013 - Smart key
  {
    model: 'Sorento', year_start: 2010, year_end: 2013,
    key_blank: 'HY22', transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5HMFNA04', ic_number: '267AL-HMFNA04',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. PCF7952 ID46 chip.',
  },
  // 2014-2015 - Flip key
  {
    model: 'Sorento', year_start: 2014, year_end: 2015,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'TQ8-RKE-3F05', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Flip remote key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. ID46 chip.',
  },
  // 2016-2020 - Smart key
  {
    model: 'Sorento', year_start: 2016, year_end: 2020,
    key_blank: 'KK12', transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F06', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. HITAG3 ID47 chip.',
  },
  // 2021-2023 - Smart key 5 button
  {
    model: 'Sorento', year_start: 2021, year_end: 2023,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5MQ4FGE05', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip.',
  },
  // 2024-2025 - Smart key
  {
    model: 'Sorento', year_start: 2024, year_end: 2025,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F81M44', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip.',
  },

  // ===== SOUL =====
  // 2010-2013 - Transponder
  {
    model: 'Soul', year_start: 2010, year_end: 2013,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'ID46 transponder (PCF7952A). HY20 key blank. OBD programmable.',
  },
  // 2010-2013 - Remote (separate)
  {
    model: 'Soul', year_start: 2010, year_end: 2013,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'NYOSEKS-AM08TX', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Remote head key. 3 buttons: Lock, Unlock, Panic. 315 MHz. ID46 chip.',
  },
  // 2014-2019 - Transponder
  {
    model: 'Soul', year_start: 2014, year_end: 2019,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'ID46 transponder. HY20 key blank. OBD programmable.',
  },
  // 2014-2019 - Flip remote
  {
    model: 'Soul', year_start: 2014, year_end: 2019,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'OSLOKA-875T', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Flip remote key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. ID46 chip.',
  },
  // 2020-2024 - Smart key
  {
    model: 'Soul', year_start: 2020, year_end: 2024,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD00430', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip.',
  },

  // ===== SOUL EV =====
  {
    model: 'Soul EV', year_start: 2015, year_end: 2019,
    key_blank: 'HY22', transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F06', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. HITAG3 ID47 chip.',
  },
  {
    model: 'Soul EV', year_start: 2020, year_end: 2024,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD00430', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip.',
  },

  // ===== SPECTRA =====
  {
    model: 'Spectra', year_start: 2004, year_end: 2009,
    key_blank: 'HY14', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'ID46 transponder. HYN14 keyway. OBD programmable.',
  },

  // ===== SPORTAGE =====
  // 2005-2010 - Transponder
  {
    model: 'Sportage', year_start: 2005, year_end: 2010,
    key_blank: 'HY14', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'ID46 transponder. HYN14 keyway. OBD programmable.',
  },
  // 2011-2013 - Smart key
  {
    model: 'Sportage', year_start: 2011, year_end: 2013,
    key_blank: 'HY22', transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5HMFNA04', ic_number: '267AL-HMFNA04',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. PCF7952 ID46 chip.',
  },
  // 2014-2016 - Flip key
  {
    model: 'Sportage', year_start: 2014, year_end: 2016,
    key_blank: 'HY20', transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'TQ8-RKE-3F05', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Flip remote key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. ID46 chip.',
  },
  // 2017-2021 - Smart key
  {
    model: 'Sportage', year_start: 2017, year_end: 2021,
    key_blank: 'KK12', transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F08', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. HITAG3 ID47 chip.',
  },
  // 2022-2024 - Smart key 5 button
  {
    model: 'Sportage', year_start: 2022, year_end: 2024,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5MQ4FGE05', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip.',
  },
  // 2022-2025 - Flip key
  {
    model: 'Sportage', year_start: 2022, year_end: 2025,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Remote Head',
    fcc_id: 'SY5SKRGE03', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Flip remote key. 3 buttons: Lock, Unlock, Hatch. 433 MHz. HITAG-AES 4A chip.',
  },

  // ===== STINGER =====
  {
    model: 'Stinger', year_start: 2018, year_end: 2023,
    key_blank: 'KK12', transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F15', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. HITAG3 ID47 chip. Performance sedan.',
  },

  // ===== TELLURIDE =====
  {
    model: 'Telluride', year_start: 2020, year_end: 2022,
    key_blank: 'KK12', transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F24', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. HITAG3 ID47 chip.',
  },
  {
    model: 'Telluride', year_start: 2023, year_end: 2025,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5MQ4FGE05', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip.',
  },
];

// ============================================================
// MAIN EXECUTION
// ============================================================
async function main() {
  await client.connect();
  console.log('Connected to database.\n');

  try {
    // 1. Show current count
    const currentRes = await client.query(
      `SELECT COUNT(*) as count FROM automotive_keys WHERE manufacturer_id = $1`,
      [KIA_MFR_ID]
    );
    console.log(`Current Kia key rows: ${currentRes.rows[0].count}`);

    // 2. Delete ALL existing Kia keys
    console.log('\nDeleting all existing Kia key rows...');
    const deleteRes = await client.query(
      `DELETE FROM automotive_keys WHERE manufacturer_id = $1`,
      [KIA_MFR_ID]
    );
    console.log(`Deleted ${deleteRes.rowCount} rows.`);

    // 3. Create missing vehicle_models
    console.log('\nCreating missing vehicle models...');
    for (const m of MISSING_MODELS) {
      const res = await client.query(
        `INSERT INTO vehicle_models (id, manufacturer_id, name, slug)
         VALUES (gen_random_uuid(), $1, $2, $3)
         ON CONFLICT DO NOTHING
         RETURNING id, name`,
        [KIA_MFR_ID, m.name, m.slug]
      );
      if (res.rows.length > 0) {
        MODEL_IDS[m.name] = res.rows[0].id;
        console.log(`  Created model: ${m.name} (${res.rows[0].id})`);
      } else {
        const existing = await client.query(
          `SELECT id FROM vehicle_models WHERE manufacturer_id = $1 AND name = $2`,
          [KIA_MFR_ID, m.name]
        );
        if (existing.rows.length > 0) {
          MODEL_IDS[m.name] = existing.rows[0].id;
          console.log(`  Model already exists: ${m.name} (${existing.rows[0].id})`);
        }
      }
    }

    // 4. Delete existing vehicle_years for Kia models
    const kiaModelIds = Object.values(MODEL_IDS);
    console.log('\nDeleting existing Kia vehicle_years...');
    const deleteYearsRes = await client.query(
      `DELETE FROM vehicle_years WHERE model_id = ANY($1::uuid[])`,
      [kiaModelIds]
    );
    console.log(`Deleted ${deleteYearsRes.rowCount} vehicle_years rows.`);

    // 5. Insert new data
    console.log('\nInserting new accurate Kia key data...\n');
    let insertedCount = 0;

    for (const key of kiaKeys) {
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

      // Convert buttons to string if number
      const buttonsVal = key.buttons !== null ? String(key.buttons) : null;

      // key_blank is NOT NULL
      const keyBlankVal = key.key_blank || key.emergency_key_blank || 'N/A';

      // Map key_type to allowed constraint values
      const keyTypeMap = {
        'Non-Transponder': 'standard',
        'Transponder': 'transponder',
        'Remote Head': 'transponder',
        'Smart Key': 'smart_key',
      };
      const mappedKeyType = keyTypeMap[key.key_type] || key.key_type;

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
          KIA_MFR_ID,
          `Kia ${key.model}`,
          keyBlankVal,
          key.transponder_type,
          key.chip_type,
          key.remote_frequency,
          mappedKeyType,
          key.fcc_id,
          key.ic_number,
          key.programming_notes,
          key.pin_code_required,
          key.obd_programmable,
          key.emergency_key_blank,
          key.year_start,
          key.year_end,
          key.battery_type,
          buttonsVal,
          key.test_key_blank,
          key.image_url,
          key.lishi_tool,
        ]
      );

      insertedCount++;
      console.log(`  [${insertedCount}] Kia ${key.model} ${key.year_start}-${key.year_end} | ${key.key_type} | FCC: ${key.fcc_id || 'N/A'} | ${key.chip_type}`);
    }

    console.log(`\nInserted ${insertedCount} new Kia key rows.`);

    // 6. Verify
    const verifyRes = await client.query(
      `SELECT COUNT(*) as count FROM automotive_keys WHERE manufacturer_id = $1`,
      [KIA_MFR_ID]
    );
    console.log(`\nVerification: ${verifyRes.rows[0].count} Kia rows in database.`);

    const sampleRes = await client.query(
      `SELECT model_name, year_start, year_end, key_type, fcc_id, chip_type, buttons
       FROM automotive_keys WHERE manufacturer_id = $1
       ORDER BY model_name, year_start LIMIT 10`,
      [KIA_MFR_ID]
    );
    console.log('\nSample rows:');
    sampleRes.rows.forEach(r => console.log(`  ${r.model_name} ${r.year_start}-${r.year_end} | ${r.key_type} | FCC: ${r.fcc_id || 'N/A'} | chip: ${r.chip_type} | buttons: ${r.buttons || 'N/A'}`));

  } catch (err) {
    console.error('Error:', err);
    throw err;
  } finally {
    await client.end();
    console.log('\nDone.');
  }
}

main();
