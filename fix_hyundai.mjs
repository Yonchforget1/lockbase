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

const HYUNDAI_MFR_ID = 'e890a3d6-01a7-4388-b605-b161ec797215';

// Existing model IDs
const MODEL_IDS = {
  'Accent':        '38aa1481-b3ae-4886-a8f7-ab47ec98fc40',
  'Azera':         '0d9e523a-8bff-41cc-88fc-92fd0fd1bb91',
  'Elantra':       'e6c6a844-7d89-4063-ba89-49b525f8fec9',
  'Genesis Coupe': '23728b9e-3839-4cd3-804a-666cf7cc9da4',
  'Ioniq':         '0039e458-2d4a-480c-92f7-bce1e08e56c1',
  'Ioniq 5':       '4b97c16c-64be-4dbf-9666-a3fd59afc2ac',
  'Kona':          'f9d1f9c4-cb2a-4514-b9a2-e705d9e6fabf',
  'Palisade':      '0f438189-5890-4a1d-b2eb-dfb0e7f8e5b1',
  'Santa Cruz':    '6775ccda-6fad-44fe-b777-7f5d648bc45d',
  'Santa Fe':      '8f5d4891-f580-4940-8b4c-e1bf7d992a1c',
  'Sonata':        '7a14f8e2-b4a0-49ce-af4c-1b47150eb45b',
  'Tiburon':       '015c75b9-6a12-47c5-bcfc-bf7847f92c34',
  'Tucson':        '46bac0c4-dee9-478b-86a2-938ed56a6017',
  'Veloster':      '926978bf-2a2f-4ef2-b9f3-05d1a52cc604',
  'Venue':         '9ac970d1-5f21-47ce-8759-fdc716e45da7',
  'Veracruz':      '211aaa84-b561-4dd2-84e0-a953a0c3c0f8',
};

// Models that need to be created
const MISSING_MODELS = [
  { name: 'Elantra GT',     slug: 'elantra-gt' },
  { name: 'Entourage',      slug: 'entourage' },
  { name: 'Equus',          slug: 'equus' },
  { name: 'Genesis',        slug: 'genesis' },
  { name: 'Ioniq 6',        slug: 'ioniq-6' },
  { name: 'Kona Electric',  slug: 'kona-electric' },
  { name: 'Nexo',           slug: 'nexo' },
  { name: 'Santa Fe Sport', slug: 'santa-fe-sport' },
  { name: 'Santa Fe XL',    slug: 'santa-fe-xl' },
  { name: 'XG350',          slug: 'xg350' },
];

// ============================================================
// ACCURATE HYUNDAI KEY DATA
// ============================================================
const hyundaiKeys = [

  // ===== XG350 =====
  {
    model: 'XG350', year_start: 2002, year_end: 2005,
    key_blank: 'HY14', transponder_type: 'Texas Crypto 4D', chip_type: '4D60',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Texas 4D60 transponder chip. Requires PIN code for programming. Use Lishi HYN14R for decode. Standard mechanical key with transponder.',
  },

  // ===== TIBURON =====
  {
    model: 'Tiburon', year_start: 2003, year_end: 2008,
    key_blank: 'HY14', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Philips ID46 transponder. OBD programmable with aftermarket tools. HYN14 keyway.',
  },
  {
    model: 'Tiburon', year_start: 2003, year_end: 2008,
    key_blank: 'HY14', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'OSLOKA-310T', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Remote head key with ID46 chip. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz. OBD programmable.',
  },

  // ===== ACCENT =====
  // 2000-2005 - Non-transponder
  {
    model: 'Accent', year_start: 2000, year_end: 2005,
    key_blank: 'HY14', transponder_type: 'None', chip_type: 'None',
    remote_frequency: null, key_type: 'Non-Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'No immobilizer or transponder system. Standard mechanical key. HY14 key blank.',
  },
  // 2006-2011 - Non-transponder
  {
    model: 'Accent', year_start: 2006, year_end: 2011,
    key_blank: 'HY14', transponder_type: 'None', chip_type: 'None',
    remote_frequency: null, key_type: 'Non-Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'No immobilizer system on US models. Standard mechanical HY14 key blank.',
  },
  // 2012-2017 Accent - Transponder
  {
    model: 'Accent', year_start: 2012, year_end: 2017,
    key_blank: 'HY20', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'ID46 transponder chip. HY20 key blank with TOY48 keyway. OBD programmable.',
  },
  // 2012-2017 Accent - Remote head 4-button
  {
    model: 'Accent', year_start: 2012, year_end: 2017,
    key_blank: 'HY20', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'TQ8-RKE-3F01', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Remote head key, 4 buttons: Lock, Unlock, Trunk, Panic. ID46 chip. 315 MHz remote. OBD programmable.',
  },
  // 2018-2022 Accent - Transponder (4D60 80-bit)
  {
    model: 'Accent', year_start: 2018, year_end: 2022,
    key_blank: 'KK12', transponder_type: 'Texas Crypto DST80', chip_type: '4D60 80-Bit',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: '4D60 80-bit transponder. KK12 key blank. Requires PIN code. Not OBD programmable for transponder - use SmartPro or equivalent.',
  },
  // 2018-2020 Accent - Flip remote
  {
    model: 'Accent', year_start: 2018, year_end: 2020,
    key_blank: 'KK12', transponder_type: 'Texas Crypto DST80', chip_type: '4D60 80-Bit',
    remote_frequency: '433 MHz', key_type: 'Remote Head',
    fcc_id: 'TQ8-RKE-4F25', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Flip remote key, 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. 4D60 80-bit chip. Requires PIN.',
  },

  // ===== AZERA =====
  // 2006-2011 - Transponder
  {
    model: 'Azera', year_start: 2006, year_end: 2011,
    key_blank: 'HY20', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Philips ID46 transponder. HY20 key blank. OBD programmable with aftermarket tools.',
  },
  // 2006-2011 Azera - Remote separate
  {
    model: 'Azera', year_start: 2006, year_end: 2011,
    key_blank: 'HY20', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'SY55WY8212', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Remote head key with ID46 chip. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz.',
  },
  // 2012-2017 Azera - Smart key
  {
    model: 'Azera', year_start: 2012, year_end: 2017,
    key_blank: null, transponder_type: 'Texas DST AES', chip_type: 'HITAG-AES',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5HMFNA04', ic_number: '267AL-HMFNA04',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz. Emergency key blade HY22. Requires diagnostic tool for programming.',
  },

  // ===== ELANTRA =====
  // 2001-2006 - Non-transponder
  {
    model: 'Elantra', year_start: 2001, year_end: 2006,
    key_blank: 'HY14', transponder_type: 'None', chip_type: 'None',
    remote_frequency: null, key_type: 'Non-Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'No immobilizer. Standard mechanical key HY14.',
  },
  // 2007-2010 Elantra - Transponder
  {
    model: 'Elantra', year_start: 2007, year_end: 2010,
    key_blank: 'HY14', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Philips ID46 transponder (PCF7936). HYN14 keyway. OBD programmable.',
  },
  // 2007-2010 Elantra - Remote head
  {
    model: 'Elantra', year_start: 2007, year_end: 2010,
    key_blank: 'HY14', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'OSLOKA-310T', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Trunk, Panic. ID46 chip. 315 MHz.',
  },
  // 2011-2016 Elantra - Transponder
  {
    model: 'Elantra', year_start: 2011, year_end: 2016,
    key_blank: 'HY20', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'ID46 transponder. HY20 key blank (TOY48 keyway). OBD programmable.',
  },
  // 2011-2013 Elantra - Smart Key 4 button
  {
    model: 'Elantra', year_start: 2011, year_end: 2013,
    key_blank: null, transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5HMFNA04', ic_number: '267AL-HMFNA04',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz. PCF7952 chip. Emergency blade HY22.',
  },
  // 2014-2016 Elantra - Smart key
  {
    model: 'Elantra', year_start: 2014, year_end: 2016,
    key_blank: null, transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5MDFNA433', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. Requires PIN code for programming.',
  },
  // 2017-2020 Elantra - Smart key
  {
    model: 'Elantra', year_start: 2017, year_end: 2020,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD00120', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. ID47 HITAG3 chip. Requires PIN code.',
  },
  // 2021-2023 Elantra - Smart key
  {
    model: 'Elantra', year_start: 2021, year_end: 2023,
    key_blank: null, transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F27', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip. KK12 emergency blade. Requires PIN.',
  },
  // 2024-2025 Elantra - Flip Key
  {
    model: 'Elantra', year_start: 2024, year_end: 2025,
    key_blank: 'KK12', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Remote Head',
    fcc_id: 'MBEC3TX2004', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Flip remote key. 3 buttons: Lock, Unlock, Trunk. 433 MHz. HITAG-AES 4A chip (DST-AES ID8A). Requires PIN.',
  },

  // ===== ELANTRA GT =====
  {
    model: 'Elantra GT', year_start: 2013, year_end: 2017,
    key_blank: null, transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5HMFNA04', ic_number: '267AL-HMFNA04',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. PCF7952 chip.',
  },
  {
    model: 'Elantra GT', year_start: 2018, year_end: 2020,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'NYOSYEC4FOB1608', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. ID47 chip. Requires PIN.',
  },

  // ===== ENTOURAGE =====
  {
    model: 'Entourage', year_start: 2007, year_end: 2009,
    key_blank: 'HY14', transponder_type: 'Philips Crypto', chip_type: '46',
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
    model: 'Entourage', year_start: 2007, year_end: 2009,
    key_blank: 'HY14', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'SY55WY8212', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Remote head key. 5 buttons: Lock, Unlock, Sliding Door L, Sliding Door R, Panic. 315 MHz. ID46 chip.',
  },

  // ===== EQUUS =====
  {
    model: 'Equus', year_start: 2011, year_end: 2016,
    key_blank: null, transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5HMFNA04', ic_number: '267AL-HMFNA04',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz. Philips ID46 chip. Emergency blade HY22. Requires dealer or locksmith programming.',
  },

  // ===== GENESIS (Sedan) =====
  {
    model: 'Genesis', year_start: 2009, year_end: 2014,
    key_blank: null, transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5HMFNA04', ic_number: '267AL-HMFNA04',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz. ID46 chip. Emergency HY22 blade.',
  },
  {
    model: 'Genesis', year_start: 2015, year_end: 2016,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5DHFNA433', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. HITAG3 ID47 chip. Requires PIN.',
  },

  // ===== GENESIS COUPE =====
  {
    model: 'Genesis Coupe', year_start: 2010, year_end: 2013,
    key_blank: 'HY20', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'ID46 transponder. HY20 key blank. OBD programmable.',
  },
  {
    model: 'Genesis Coupe', year_start: 2010, year_end: 2013,
    key_blank: 'HY20', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'PINHA-T008', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz. ID46 chip.',
  },
  {
    model: 'Genesis Coupe', year_start: 2014, year_end: 2016,
    key_blank: null, transponder_type: 'Philips Crypto 2', chip_type: '46',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5RBFNA433', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. ID46 chip. Emergency blade HY22.',
  },

  // ===== IONIQ =====
  {
    model: 'Ioniq', year_start: 2017, year_end: 2022,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD00120', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. ID47 HITAG3 chip. Requires PIN.',
  },

  // ===== IONIQ 5 =====
  // 6-button variant
  {
    model: 'Ioniq 5', year_start: 2022, year_end: 2024,
    key_blank: null, transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD01470', ic_number: null,
    battery_type: 'CR2032', buttons: 6,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 6 buttons: Lock, Unlock, Hatch, Charge Port, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip. KK12 emergency blade.',
  },
  // 8-button variant
  {
    model: 'Ioniq 5', year_start: 2022, year_end: 2024,
    key_blank: null, transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD01480', ic_number: null,
    battery_type: 'CR2032', buttons: 8,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 8 buttons: Lock, Unlock, Charge Port, Hatch, Panic, Park Assist In, Park Assist Out, Remote Start. 433 MHz. HITAG-AES 4A chip.',
  },

  // ===== IONIQ 6 =====
  {
    model: 'Ioniq 6', year_start: 2023, year_end: 2025,
    key_blank: null, transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'NYOMBEC7FOB2208', ic_number: null,
    battery_type: 'CR2450', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip. CR2450 battery. KK12 emergency blade.',
  },

  // ===== KONA =====
  {
    model: 'Kona', year_start: 2018, year_end: 2021,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F19', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. HITAG3 ID47 chip. HY22 emergency blade.',
  },
  {
    model: 'Kona', year_start: 2022, year_end: 2023,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F43', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. ID47 chip. KK12 emergency blade.',
  },
  {
    model: 'Kona', year_start: 2024, year_end: 2025,
    key_blank: null, transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F61M43', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. HITAG-AES 4A chip. KK12 emergency blade.',
  },

  // ===== KONA ELECTRIC =====
  {
    model: 'Kona Electric', year_start: 2019, year_end: 2021,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F19', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. Same as gas Kona. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. ID47 chip.',
  },
  {
    model: 'Kona Electric', year_start: 2024, year_end: 2025,
    key_blank: null, transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F61M43', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. HITAG-AES 4A chip. KK12 emergency blade.',
  },

  // ===== NEXO =====
  {
    model: 'Nexo', year_start: 2019, year_end: 2024,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F19', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. HITAG3 ID47 chip. Hydrogen fuel cell vehicle.',
  },

  // ===== PALISADE =====
  // 5-button (no remote start)
  {
    model: 'Palisade', year_start: 2020, year_end: 2022,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '434 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F29', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 434 MHz. HITAG3 ID47 chip. KK12 emergency blade.',
  },
  // 7-button variant
  {
    model: 'Palisade', year_start: 2022, year_end: 2024,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '434 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F28', ic_number: null,
    battery_type: 'CR2032', buttons: 7,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 7 buttons: Lock, Unlock, Hatch, Panic, Remote Start, Park In, Park Out. 434 MHz. ID47 chip. KK12 emergency blade.',
  },
  // 2023-2024 5-button
  {
    model: 'Palisade', year_start: 2023, year_end: 2024,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '434 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F27', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 434 MHz. ID47 chip. KK12 emergency blade.',
  },

  // ===== SANTA CRUZ =====
  {
    model: 'Santa Cruz', year_start: 2022, year_end: 2024,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F27', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Tailgate, Remote Start, Panic. 433 MHz. ID47 chip. KK12 emergency blade.',
  },
  {
    model: 'Santa Cruz', year_start: 2025, year_end: 2025,
    key_blank: null, transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F61M43', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Tailgate, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip. KK12 emergency blade.',
  },

  // ===== SANTA FE =====
  // 2001-2006 - Transponder
  {
    model: 'Santa Fe', year_start: 2001, year_end: 2006,
    key_blank: 'HY14', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'ID46 transponder. HYN14 keyway. OBD programmable.',
  },
  // 2007-2012 Santa Fe - Remote head
  {
    model: 'Santa Fe', year_start: 2007, year_end: 2012,
    key_blank: 'HY14', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'PINHA-T038', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. ID46 chip.',
  },
  // 2013-2018 Santa Fe - Smart key
  {
    model: 'Santa Fe', year_start: 2013, year_end: 2018,
    key_blank: null, transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5DMFNA04', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. ID46 chip. HY22 emergency blade.',
  },
  // 2019-2020 Santa Fe - Smart key
  {
    model: 'Santa Fe', year_start: 2019, year_end: 2020,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F19', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. ID47 chip. KK12 emergency blade.',
  },
  // 2021-2024 Santa Fe - Smart key 5 button
  {
    model: 'Santa Fe', year_start: 2021, year_end: 2024,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F27', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. ID47 chip. KK12 emergency blade.',
  },
  // 2025 Santa Fe
  {
    model: 'Santa Fe', year_start: 2025, year_end: 2025,
    key_blank: null, transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F89U44', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. HITAG-AES 4A chip. All-new generation.',
  },

  // ===== SANTA FE SPORT =====
  {
    model: 'Santa Fe Sport', year_start: 2013, year_end: 2018,
    key_blank: null, transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5DMFNA04', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. Same FCC as Santa Fe. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. ID46 chip.',
  },

  // ===== SANTA FE XL =====
  {
    model: 'Santa Fe XL', year_start: 2019, year_end: 2019,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F19', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. Last year for XL trim. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. ID47 chip.',
  },

  // ===== SONATA =====
  // 2002-2005 - Transponder
  {
    model: 'Sonata', year_start: 2002, year_end: 2005,
    key_blank: 'HY14', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Philips ID46 transponder. HYN14 keyway. OBD programmable.',
  },
  // 2006-2010 - Transponder
  {
    model: 'Sonata', year_start: 2006, year_end: 2010,
    key_blank: 'HY20', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'ID46 transponder. HY20 key blank (TOY48 keyway). OBD programmable.',
  },
  // 2006-2010 - Remote head
  {
    model: 'Sonata', year_start: 2006, year_end: 2010,
    key_blank: 'HY20', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'OSLOKA-310T', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz. ID46 chip.',
  },
  // 2011-2014 - Smart key
  {
    model: 'Sonata', year_start: 2011, year_end: 2014,
    key_blank: null, transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5HMFNA04', ic_number: '267AL-HMFNA04',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 315 MHz. PCF7952 ID46 chip. Emergency HY22 blade.',
  },
  // 2015-2017 - Smart key
  {
    model: 'Sonata', year_start: 2015, year_end: 2017,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD00120', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. HITAG3 ID47 chip. Requires PIN.',
  },
  // 2018-2019 - Smart key
  {
    model: 'Sonata', year_start: 2018, year_end: 2019,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD00120', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. 433 MHz. HITAG3 ID47 chip. Requires PIN.',
  },
  // 2020-2024 - Smart key 5-button
  {
    model: 'Sonata', year_start: 2020, year_end: 2024,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F27', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. 433 MHz. ID47 chip. KK12 emergency blade.',
  },

  // ===== TUCSON =====
  // 2005-2009 - Transponder
  {
    model: 'Tucson', year_start: 2005, year_end: 2009,
    key_blank: 'HY14', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Philips ID46 transponder. HYN14 keyway. OBD programmable.',
  },
  // 2005-2009 - Remote head
  {
    model: 'Tucson', year_start: 2005, year_end: 2009,
    key_blank: 'HY14', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'OSLOKA-310T', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. ID46 chip.',
  },
  // 2010-2015 - Transponder
  {
    model: 'Tucson', year_start: 2010, year_end: 2015,
    key_blank: 'HY20', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: null, key_type: 'Transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'ID46 transponder. HY20 key blank. OBD programmable.',
  },
  // 2010-2015 - Remote head
  {
    model: 'Tucson', year_start: 2010, year_end: 2015,
    key_blank: 'HY20', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'TQ8-RKE-3F01', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. ID46.',
  },
  // 2016-2018 - Smart key
  {
    model: 'Tucson', year_start: 2016, year_end: 2018,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F07', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. ID47 chip. HY22 emergency blade.',
  },
  // 2019-2021 - Smart key
  {
    model: 'Tucson', year_start: 2019, year_end: 2021,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F11', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. ID47 chip. HY22 emergency blade.',
  },
  // 2022-2024 - Smart key
  {
    model: 'Tucson', year_start: 2022, year_end: 2024,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F28', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. ID47 chip. KK12 emergency blade.',
  },
  // 2025 Tucson
  {
    model: 'Tucson', year_start: 2025, year_end: 2025,
    key_blank: null, transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F61M43', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. HITAG-AES 4A chip. All-new generation.',
  },

  // ===== VELOSTER =====
  {
    model: 'Veloster', year_start: 2012, year_end: 2017,
    key_blank: 'HY20', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'NYOSEKS-TF10ATX', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. ID46 chip.',
  },
  {
    model: 'Veloster', year_start: 2012, year_end: 2017,
    key_blank: null, transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5HMFNA04', ic_number: '267AL-HMFNA04',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key (push-to-start trims). 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. ID46 chip.',
  },
  {
    model: 'Veloster', year_start: 2019, year_end: 2021,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'CQOFD00120', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. ID47 chip. Requires PIN.',
  },

  // ===== VENUE =====
  {
    model: 'Venue', year_start: 2020, year_end: 2021,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F18', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. ID47 chip.',
  },
  {
    model: 'Venue', year_start: 2022, year_end: 2024,
    key_blank: null, transponder_type: 'HITAG3', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'Smart Key',
    fcc_id: 'TQ8-FOB-4F27', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'KK12', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Hatch, Panic. 433 MHz. ID47 chip. KK12 emergency blade.',
  },

  // ===== VERACRUZ =====
  {
    model: 'Veracruz', year_start: 2007, year_end: 2012,
    key_blank: 'HY14', transponder_type: 'Philips Crypto', chip_type: '46',
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
    model: 'Veracruz', year_start: 2007, year_end: 2012,
    key_blank: 'HY14', transponder_type: 'Philips Crypto', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'Remote Head',
    fcc_id: 'SY55WY8212', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HYN14R',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz. ID46 chip.',
  },
  {
    model: 'Veracruz', year_start: 2010, year_end: 2012,
    key_blank: null, transponder_type: 'Philips Crypto 2', chip_type: '46 (PCF7952)',
    remote_frequency: '315 MHz', key_type: 'Smart Key',
    fcc_id: 'SY5HMFNA04', ic_number: '267AL-HMFNA04',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Smart proximity key (select trims). 4 buttons: Lock, Unlock, Hatch, Panic. 315 MHz.',
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
      [HYUNDAI_MFR_ID]
    );
    console.log(`Current Hyundai key rows: ${currentRes.rows[0].count}`);

    // 2. Delete ALL existing Hyundai keys
    console.log('\nDeleting all existing Hyundai key rows...');
    const deleteRes = await client.query(
      `DELETE FROM automotive_keys WHERE manufacturer_id = $1`,
      [HYUNDAI_MFR_ID]
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
        [HYUNDAI_MFR_ID, m.name, m.slug]
      );
      if (res.rows.length > 0) {
        MODEL_IDS[m.name] = res.rows[0].id;
        console.log(`  Created model: ${m.name} (${res.rows[0].id})`);
      } else {
        // Already exists, fetch id
        const existing = await client.query(
          `SELECT id FROM vehicle_models WHERE manufacturer_id = $1 AND name = $2`,
          [HYUNDAI_MFR_ID, m.name]
        );
        if (existing.rows.length > 0) {
          MODEL_IDS[m.name] = existing.rows[0].id;
          console.log(`  Model already exists: ${m.name} (${existing.rows[0].id})`);
        }
      }
    }

    // 4. Delete existing vehicle_years for Hyundai models
    const hyundaiModelIds = Object.values(MODEL_IDS);
    console.log('\nDeleting existing Hyundai vehicle_years...');
    const deleteYearsRes = await client.query(
      `DELETE FROM vehicle_years WHERE model_id = ANY($1::uuid[])`,
      [hyundaiModelIds]
    );
    console.log(`Deleted ${deleteYearsRes.rowCount} vehicle_years rows.`);

    // 5. Insert new data
    console.log('\nInserting new accurate Hyundai key data...\n');
    let insertedCount = 0;

    for (const key of hyundaiKeys) {
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

      // key_blank is NOT NULL - use emergency_key_blank for smart keys, or 'N/A'
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
          HYUNDAI_MFR_ID,
          `Hyundai ${key.model}`,
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
      console.log(`  [${insertedCount}] Hyundai ${key.model} ${key.year_start}-${key.year_end} | ${key.key_type} | FCC: ${key.fcc_id || 'N/A'} | ${key.chip_type}`);
    }

    console.log(`\nInserted ${insertedCount} new Hyundai key rows.`);

    // 6. Verify
    const verifyRes = await client.query(
      `SELECT COUNT(*) as count FROM automotive_keys WHERE manufacturer_id = $1`,
      [HYUNDAI_MFR_ID]
    );
    console.log(`\nVerification: ${verifyRes.rows[0].count} Hyundai rows in database.`);

    const sampleRes = await client.query(
      `SELECT model_name, year_start, year_end, key_type, fcc_id, chip_type, buttons
       FROM automotive_keys WHERE manufacturer_id = $1
       ORDER BY model_name, year_start LIMIT 10`,
      [HYUNDAI_MFR_ID]
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
