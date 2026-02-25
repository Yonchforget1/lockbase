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

const MITSUBISHI_ID = '0c04ce96-efeb-4f7c-8d71-69b12eb6ff1d';
const SUZUKI_ID    = '91503fe3-b3f8-4ea1-9a47-6e414a01b6c1';
const SCION_ID     = '9a35ee59-6a26-42d8-a029-b987a47bf12e';

// ============================================================
//  Existing vehicle_model IDs (from database)
// ============================================================
const EXISTING_MODELS = {
  // Mitsubishi
  'Eclipse Cross':    '1102d0d9-fb3e-482c-a52e-5863c6cc26eb',
  'Lancer':           '0da240f3-ec43-47dd-b252-709d607c1492',
  'Mirage':           '00f220cc-7622-40a2-8e26-3ec5e832c30f',
  'Outlander':        '3af33117-6627-4778-b766-22cd973b1c94',
  'Outlander Sport':  'b6105e16-79e2-4fdc-b2f8-fb7745a0a52a',
  // Suzuki
  'Aerio':            '6f72bf6a-5ba5-4a09-b202-1f07200f4914',
  'Forenza':          '49383293-acef-4f2b-8f66-8290d76661dc',
  'Grand Vitara':     '060879f9-2243-46e9-9736-f029edbf91fa',
  'Kizashi':          '480b8050-e4fb-45b5-b83a-b173dd225155',
  'Reno':             '789665f5-6523-4c8a-bccf-0a2349e48811',
  'SX4':              '749aba2c-6a3a-4a8f-ba10-35c54ba66c49',
  'XL-7':             '6b6d5b1c-52dc-4ac2-858d-03ccbd43a0a7',
  // Scion
  'FR-S':             'a3616dd4-442d-4358-8349-f1eefc64d74f',
  'iA':               'c0060d72-be79-44fa-83d3-2f1b4eebc908',
  'iM':               '507a5f4a-97a0-4ae9-8944-ed145ad3c70a',
  'tC':               '3ec4edfa-6f87-4005-9f66-ce199d574162',
  'xB':               '9761e680-5c10-442e-a99b-335f92f9e84d',
  'xD':               '7bfa2b31-6aa9-41de-b729-ea8ad3183bdc',
};

// Models that need to be created (not in vehicle_models yet)
const MODELS_TO_CREATE = [
  // Mitsubishi missing models
  { name: 'Eclipse',   slug: 'eclipse',   mfr_id: MITSUBISHI_ID },
  { name: 'Endeavor',  slug: 'endeavor',  mfr_id: MITSUBISHI_ID },
  { name: 'Galant',    slug: 'galant',    mfr_id: MITSUBISHI_ID },
  { name: 'i-MiEV',    slug: 'i-miev',    mfr_id: MITSUBISHI_ID },
  { name: 'Montero',   slug: 'montero',   mfr_id: MITSUBISHI_ID },
  { name: 'Raider',    slug: 'raider',    mfr_id: MITSUBISHI_ID },
  // Suzuki missing models
  { name: 'Equator',   slug: 'equator',   mfr_id: SUZUKI_ID },
  { name: 'Swift',     slug: 'swift',     mfr_id: SUZUKI_ID },
  { name: 'Vitara',    slug: 'vitara',    mfr_id: SUZUKI_ID },
  // Scion missing models
  { name: 'iQ',        slug: 'iq',        mfr_id: SCION_ID },
  { name: 'xA',        slug: 'xa',        mfr_id: SCION_ID },
];

// Strip manufacturer prefix from model_name to get bare model name
function bareModel(fullName) {
  return fullName.replace(/^(Mitsubishi|Suzuki|Scion)\s+/, '');
}

// ============================================================
//  MITSUBISHI KEY DATA
// ============================================================
const mitsubishiKeys = [

  // ===== MITSUBISHI ECLIPSE =====
  {
    model_name: 'Mitsubishi Eclipse', year_start: 2006, year_end: 2012,
    key_blank: 'MIT3', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Transponder key with Philips 46 chip. OBD programmable with PIN code. PIN obtainable from dealer with VIN. Use Lishi MIT11 for picking/decoding.',
  },
  {
    model_name: 'Mitsubishi Eclipse', year_start: 2006, year_end: 2012,
    key_blank: 'MIT3', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCG8D-620M-A', ic_number: '850G-G8D620MA',
    battery_type: 'CR1616', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Remote head key with 46 chip. 3 buttons: Lock, Unlock, Trunk. OBD programmable with PIN code. Battery CR1616.',
  },

  // ===== MITSUBISHI ECLIPSE CROSS =====
  {
    model_name: 'Mitsubishi Eclipse Cross', year_start: 2018, year_end: 2025,
    key_blank: null, transponder_type: 'Hitag 3', chip_type: '47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUCJ166N', ic_number: '1788D-J166N',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: 'MIT11', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Proximity smart key with 47 chip (Hitag 3). 3 buttons: Lock, Unlock, Panic. Requires Mitsubishi diagnostic tool or aftermarket programmer (Autel, Xtool). Emergency key blade MIT11 inside fob.',
  },
  {
    model_name: 'Mitsubishi Eclipse Cross', year_start: 2018, year_end: 2025,
    key_blank: null, transponder_type: 'Hitag 3', chip_type: '47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUCJ166N', ic_number: '1788D-J166N',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'MIT11', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Proximity smart key with 47 chip (Hitag 3). 4 buttons: Lock, Unlock, Hatch, Panic. Requires Mitsubishi diagnostic tool or aftermarket programmer. Emergency key blade MIT11.',
  },

  // ===== MITSUBISHI ENDEAVOR =====
  {
    model_name: 'Mitsubishi Endeavor', year_start: 2004, year_end: 2011,
    key_blank: 'MIT3', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Transponder key with Philips 46 chip. OBD programmable with PIN code. PIN obtainable from dealer.',
  },
  {
    model_name: 'Mitsubishi Endeavor', year_start: 2004, year_end: 2011,
    key_blank: 'MIT3', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCG8D-620M-A', ic_number: '850G-G8D620MA',
    battery_type: 'CR1616', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Remote head key with 46 chip. 3 buttons: Lock, Unlock, Panic. OBD programmable with PIN code. Battery CR1616.',
  },

  // ===== MITSUBISHI GALANT =====
  {
    model_name: 'Mitsubishi Galant', year_start: 1999, year_end: 2003,
    key_blank: 'MIT6', transponder_type: 'Texas 4D-61', chip_type: '4D-61',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi MIT8',
    programming_notes: 'Transponder key with 4D-61 chip. Not OBD programmable. Requires PIN and specialized tool. Lishi MIT8 for older keyway.',
  },
  {
    model_name: 'Mitsubishi Galant', year_start: 2004, year_end: 2012,
    key_blank: 'MIT3', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Transponder key with Philips 46 chip. OBD programmable with PIN code.',
  },
  {
    model_name: 'Mitsubishi Galant', year_start: 2004, year_end: 2012,
    key_blank: 'MIT3', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCG8D-620M-A', ic_number: '850G-G8D620MA',
    battery_type: 'CR1616', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Remote head key with 46 chip. 3 buttons: Lock, Unlock, Trunk. OBD programmable with PIN. Battery CR1616.',
  },

  // ===== MITSUBISHI i-MiEV =====
  {
    model_name: 'Mitsubishi i-MiEV', year_start: 2012, year_end: 2017,
    key_blank: null, transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUC644M-KEY-N', ic_number: '850G-644MKEYN',
    battery_type: 'CR2032', buttons: 2,
    emergency_key_blank: 'MIT11', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Proximity smart key with 46 chip. 2 buttons: Lock, Unlock. Requires Mitsubishi diagnostic tool with PIN code. Emergency blade MIT11.',
  },

  // ===== MITSUBISHI LANCER =====
  {
    model_name: 'Mitsubishi Lancer', year_start: 2002, year_end: 2007,
    key_blank: 'MIT8', transponder_type: 'Texas 4D-61', chip_type: '4D-61',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi MIT8',
    programming_notes: 'Transponder key with 4D-61 chip. Not OBD programmable. Requires specialized tool and PIN code.',
  },
  {
    model_name: 'Mitsubishi Lancer', year_start: 2008, year_end: 2013,
    key_blank: 'MIT3', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Transponder key with Philips 46 chip. OBD programmable with PIN code.',
  },
  {
    model_name: 'Mitsubishi Lancer', year_start: 2008, year_end: 2013,
    key_blank: 'MIT3', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCG8D-625M-A', ic_number: '850G-G8D625MA',
    battery_type: 'CR1616', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Remote head key with 46 chip. 3 buttons: Lock, Unlock, Trunk. OBD programmable with PIN. Battery CR1616.',
  },
  {
    model_name: 'Mitsubishi Lancer', year_start: 2014, year_end: 2017,
    key_blank: 'MIT3', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCJ166N', ic_number: '1788D-J166N',
    battery_type: 'CR1616', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Remote head key with 46 chip. 3 buttons: Lock, Unlock, Trunk. OBD programmable with PIN. Updated FCC ID from prior generation.',
  },
  {
    model_name: 'Mitsubishi Lancer', year_start: 2008, year_end: 2015,
    key_blank: null, transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUC644M-KEY-N', ic_number: '850G-644MKEYN',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: 'MIT11', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Proximity smart key with 46 chip. 3 buttons: Lock, Unlock, Panic. Available on Lancer Evo and GT models. Requires Mitsubishi diagnostic tool. Emergency blade MIT11.',
  },

  // ===== MITSUBISHI MIRAGE =====
  {
    model_name: 'Mitsubishi Mirage', year_start: 2014, year_end: 2020,
    key_blank: 'MIT11', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Transponder key with Philips 46 chip. OBD programmable with PIN code. Base model key.',
  },
  {
    model_name: 'Mitsubishi Mirage', year_start: 2014, year_end: 2020,
    key_blank: 'MIT11', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCJ166N', ic_number: '1788D-J166N',
    battery_type: 'CR1616', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Remote head key with 46 chip. 3 buttons: Lock, Unlock, Panic. OBD programmable with PIN code. Battery CR1616.',
  },
  {
    model_name: 'Mitsubishi Mirage', year_start: 2021, year_end: 2025,
    key_blank: null, transponder_type: 'Hitag 3', chip_type: '47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUCJ166N', ic_number: '1788D-J166N',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: 'MIT11', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Proximity smart key with 47 chip (Hitag 3). 3 buttons: Lock, Unlock, Panic. Requires Mitsubishi diagnostic tool or aftermarket programmer.',
  },

  // ===== MITSUBISHI MONTERO =====
  {
    model_name: 'Mitsubishi Montero', year_start: 2001, year_end: 2006,
    key_blank: 'MIT8', transponder_type: 'Texas 4D-61', chip_type: '4D-61',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi MIT8',
    programming_notes: 'Transponder key with 4D-61 chip. Not OBD programmable. Requires specialized tool and PIN code. Lishi MIT8 for keyway.',
  },
  {
    model_name: 'Mitsubishi Montero', year_start: 2001, year_end: 2006,
    key_blank: 'MIT8', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi MIT8',
    programming_notes: 'Non-transponder mechanical key. Will turn ignition but not start engine on immobilizer-equipped vehicles. Valet/door key only.',
  },

  // ===== MITSUBISHI OUTLANDER =====
  {
    model_name: 'Mitsubishi Outlander', year_start: 2003, year_end: 2006,
    key_blank: 'MIT8', transponder_type: 'Texas 4D-61', chip_type: '4D-61',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi MIT8',
    programming_notes: 'Transponder key with 4D-61 chip. Not OBD programmable. Requires specialized tool and PIN code.',
  },
  {
    model_name: 'Mitsubishi Outlander', year_start: 2007, year_end: 2013,
    key_blank: 'MIT3', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Transponder key with Philips 46 chip. OBD programmable with PIN code.',
  },
  {
    model_name: 'Mitsubishi Outlander', year_start: 2007, year_end: 2013,
    key_blank: 'MIT3', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCG8D-625M-A', ic_number: '850G-G8D625MA',
    battery_type: 'CR1616', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Remote head key with 46 chip. 3 buttons: Lock, Unlock, Panic. OBD programmable with PIN code.',
  },
  {
    model_name: 'Mitsubishi Outlander', year_start: 2014, year_end: 2021,
    key_blank: null, transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUC644M-KEY-N', ic_number: '850G-644MKEYN',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: 'MIT11', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Proximity smart key with 46 chip. 3 buttons: Lock, Unlock, Panic. Requires Mitsubishi diagnostic tool with PIN. Emergency blade MIT11.',
  },
  {
    model_name: 'Mitsubishi Outlander', year_start: 2014, year_end: 2021,
    key_blank: null, transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUC644M-KEY-N', ic_number: '850G-644MKEYN',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'MIT11', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Proximity smart key with 46 chip. 4 buttons: Lock, Unlock, Hatch, Panic. Requires Mitsubishi diagnostic tool with PIN. Emergency blade MIT11.',
  },
  {
    model_name: 'Mitsubishi Outlander', year_start: 2022, year_end: 2025,
    key_blank: null, transponder_type: 'Hitag 3', chip_type: '47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUCJ166N', ic_number: '1788D-J166N',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: 'MIT11', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Proximity smart key with 47 chip (Hitag 3). 3 buttons: Lock, Unlock, Panic. New generation. Requires Mitsubishi diagnostic tool or advanced aftermarket programmer.',
  },
  {
    model_name: 'Mitsubishi Outlander', year_start: 2022, year_end: 2025,
    key_blank: null, transponder_type: 'Hitag 3', chip_type: '47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUCJ166N', ic_number: '1788D-J166N',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'MIT11', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Proximity smart key with 47 chip (Hitag 3). 4 buttons: Lock, Unlock, Hatch, Panic. New generation Outlander.',
  },

  // ===== MITSUBISHI OUTLANDER SPORT =====
  {
    model_name: 'Mitsubishi Outlander Sport', year_start: 2011, year_end: 2019,
    key_blank: 'MIT3', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCJ166N', ic_number: '1788D-J166N',
    battery_type: 'CR1616', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Remote head key with 46 chip. 3 buttons: Lock, Unlock, Panic. OBD programmable with PIN code.',
  },
  {
    model_name: 'Mitsubishi Outlander Sport', year_start: 2011, year_end: 2019,
    key_blank: null, transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUC644M-KEY-N', ic_number: '850G-644MKEYN',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: 'MIT11', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Proximity smart key with 46 chip. 3 buttons: Lock, Unlock, Panic. Requires Mitsubishi diagnostic tool. Emergency blade MIT11.',
  },
  {
    model_name: 'Mitsubishi Outlander Sport', year_start: 2020, year_end: 2025,
    key_blank: null, transponder_type: 'Hitag 3', chip_type: '47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUCJ166N', ic_number: '1788D-J166N',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: 'MIT11', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Proximity smart key with 47 chip (Hitag 3). 3 buttons: Lock, Unlock, Panic. Requires Mitsubishi diagnostic or advanced aftermarket tool.',
  },
  {
    model_name: 'Mitsubishi Outlander Sport', year_start: 2020, year_end: 2025,
    key_blank: null, transponder_type: 'Hitag 3', chip_type: '47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUCJ166N', ic_number: '1788D-J166N',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'MIT11', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi MIT11',
    programming_notes: 'Proximity smart key with 47 chip (Hitag 3). 4 buttons: Lock, Unlock, Hatch, Panic.',
  },

  // ===== MITSUBISHI RAIDER =====
  {
    model_name: 'Mitsubishi Raider', year_start: 2006, year_end: 2009,
    key_blank: 'Y160', transponder_type: 'Texas 4D-64', chip_type: '4D-64',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: null,
    programming_notes: 'Chrysler platform (shared with Dodge Dakota). Transponder key with 4D-64 chip. OBD programmable with PIN code. Uses Chrysler Y160 keyway.',
  },
  {
    model_name: 'Mitsubishi Raider', year_start: 2006, year_end: 2009,
    key_blank: 'Y160', transponder_type: 'Texas 4D-64', chip_type: '4D-64',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2016', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: null,
    programming_notes: 'Chrysler platform remote head key. 3 buttons: Lock, Unlock, Panic. 4D-64 chip. OBD programmable with PIN. Uses Chrysler keyway Y160.',
  },
];

// ============================================================
//  SUZUKI KEY DATA
// ============================================================
const suzukiKeys = [

  // ===== SUZUKI AERIO =====
  {
    model_name: 'Suzuki Aerio', year_start: 2002, year_end: 2007,
    key_blank: 'SZ11R', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi SZ14',
    programming_notes: 'Non-transponder mechanical key. No immobilizer system. Cut by code or duplicate.',
  },

  // ===== SUZUKI EQUATOR =====
  {
    model_name: 'Suzuki Equator', year_start: 2009, year_end: 2012,
    key_blank: 'NSN14', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    programming_notes: 'Nissan platform (shared with Frontier). Transponder key with 46 chip. OBD programmable with PIN. Uses Nissan NSN14 keyway.',
  },
  {
    model_name: 'Suzuki Equator', year_start: 2009, year_end: 2012,
    key_blank: 'NSN14', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U751', ic_number: '1788D-WB1U751',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NSN14',
    programming_notes: 'Nissan platform remote head key. 3 buttons: Lock, Unlock, Panic. 46 chip. Uses Nissan FCC ID. OBD programmable with PIN.',
  },

  // ===== SUZUKI FORENZA =====
  {
    model_name: 'Suzuki Forenza', year_start: 2004, year_end: 2008,
    key_blank: 'DW04RAP', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    programming_notes: 'Non-transponder mechanical key (Daewoo platform). No immobilizer. Cut by code or duplicate.',
  },

  // ===== SUZUKI GRAND VITARA =====
  {
    model_name: 'Suzuki Grand Vitara', year_start: 1999, year_end: 2005,
    key_blank: 'SZ11R', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi SZ14',
    programming_notes: 'Non-transponder mechanical key. No immobilizer system.',
  },
  {
    model_name: 'Suzuki Grand Vitara', year_start: 2006, year_end: 2013,
    key_blank: 'SZ11R', transponder_type: 'Texas 4D-65', chip_type: '4D-65',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SZ14',
    programming_notes: 'Transponder key with 4D-65 chip. Not OBD programmable. Requires specialized tool with PIN or on-board registration procedure.',
  },
  {
    model_name: 'Suzuki Grand Vitara', year_start: 2006, year_end: 2013,
    key_blank: 'SZ11R', transponder_type: 'Texas 4D-65', chip_type: '4D-65',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KBRTS005', ic_number: null,
    battery_type: 'CR1616', buttons: 2,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SZ14',
    programming_notes: 'Remote head key with 4D-65 chip. 2 buttons: Lock, Unlock. Not OBD programmable. Requires specialized programming tool.',
  },

  // ===== SUZUKI KIZASHI =====
  {
    model_name: 'Suzuki Kizashi', year_start: 2010, year_end: 2013,
    key_blank: 'SZ11R', transponder_type: 'Texas 4D-65', chip_type: '4D-65',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SZ14',
    programming_notes: 'Transponder key with 4D-65 chip. Not OBD programmable. Requires specialized tool with PIN.',
  },
  {
    model_name: 'Suzuki Kizashi', year_start: 2010, year_end: 2013,
    key_blank: null, transponder_type: 'Texas 4D-65', chip_type: '4D-65',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KBRTS009', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'SZ11R', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SZ14',
    programming_notes: 'Proximity smart key with 4D-65 chip. 4 buttons: Lock, Unlock, Trunk, Panic. Requires specialized Suzuki tool. Emergency blade SZ11R.',
  },

  // ===== SUZUKI RENO =====
  {
    model_name: 'Suzuki Reno', year_start: 2005, year_end: 2008,
    key_blank: 'DW04RAP', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    programming_notes: 'Non-transponder mechanical key (Daewoo platform). No immobilizer. Cut by code or duplicate.',
  },

  // ===== SUZUKI SX4 =====
  {
    model_name: 'Suzuki SX4', year_start: 2007, year_end: 2013,
    key_blank: 'SZ11R', transponder_type: 'Texas 4D-65', chip_type: '4D-65',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SZ14',
    programming_notes: 'Transponder key with 4D-65 chip. Not OBD programmable. Requires specialized tool or on-board registration.',
  },
  {
    model_name: 'Suzuki SX4', year_start: 2007, year_end: 2013,
    key_blank: 'SZ11R', transponder_type: 'Texas 4D-65', chip_type: '4D-65',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KBRTS005', ic_number: null,
    battery_type: 'CR1616', buttons: 2,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SZ14',
    programming_notes: 'Remote head key with 4D-65 chip. 2 buttons: Lock, Unlock. Not OBD programmable. Battery CR1616.',
  },

  // ===== SUZUKI SWIFT =====
  {
    model_name: 'Suzuki Swift', year_start: 2004, year_end: 2010,
    key_blank: 'SZ11R', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi SZ14',
    programming_notes: 'Non-transponder mechanical key. No immobilizer system on US-market Swift.',
  },

  // ===== SUZUKI VITARA =====
  {
    model_name: 'Suzuki Vitara', year_start: 1999, year_end: 2004,
    key_blank: 'SZ11R', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi SZ14',
    programming_notes: 'Non-transponder mechanical key. No immobilizer system.',
  },

  // ===== SUZUKI XL-7 =====
  {
    model_name: 'Suzuki XL-7', year_start: 2001, year_end: 2006,
    key_blank: 'SZ11R', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi SZ14',
    programming_notes: 'Non-transponder mechanical key. No immobilizer system on first generation XL-7.',
  },
  {
    model_name: 'Suzuki XL-7', year_start: 2007, year_end: 2009,
    key_blank: 'B111', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    programming_notes: 'GM platform (shared with Saturn Vue/Chevrolet Equinox). 46 chip transponder. OBD programmable using GM 10-minute relearn procedure. Uses GM B111 keyway.',
  },
  {
    model_name: 'Suzuki XL-7', year_start: 2007, year_end: 2009,
    key_blank: 'B111', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUC60270', ic_number: null,
    battery_type: 'CR1616', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    programming_notes: 'GM platform remote head key. 4 buttons: Lock, Unlock, Remote Start, Panic. 46 chip. OBD programmable using GM 10-minute relearn. Battery CR1616.',
  },
];

// ============================================================
//  SCION KEY DATA
// ============================================================
const scionKeys = [

  // ===== SCION FR-S =====
  {
    model_name: 'Scion FR-S', year_start: 2013, year_end: 2016,
    key_blank: 'TOY44G', transponder_type: 'Texas Crypto 4D / G Chip', chip_type: 'G',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Toyota G chip transponder key. OBD programmable via Toyota TIS or aftermarket tool. Subaru/Toyota shared platform.',
  },
  {
    model_name: 'Scion FR-S', year_start: 2013, year_end: 2016,
    key_blank: 'TOY44G', transponder_type: 'Texas Crypto 4D / G Chip', chip_type: 'G',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HYQ12BDM', ic_number: '1551A-12BDM',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Remote head key with Toyota G chip. 4 buttons: Lock, Unlock, Trunk, Panic. OBD programmable. Battery CR2032.',
  },

  // ===== SCION iA =====
  {
    model_name: 'Scion iA', year_start: 2016, year_end: 2016,
    key_blank: null, transponder_type: 'Hitag Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'WAZSKE13D02', ic_number: '1353-SKE13D02',
    battery_type: 'CR2025', buttons: 3,
    emergency_key_blank: 'MAZ24R', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi MAZ24R',
    programming_notes: 'Mazda platform proximity smart key with 49 chip (Hitag Pro). 3 buttons: Lock, Unlock, Panic. Requires Mazda diagnostic tool or aftermarket programmer. Emergency blade MAZ24R.',
  },

  // ===== SCION iM =====
  {
    model_name: 'Scion iM', year_start: 2016, year_end: 2016,
    key_blank: 'TOY44H', transponder_type: 'Texas Crypto 128-bit AES / H Chip', chip_type: 'H',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MOZB52TH', ic_number: '1551A-B52TH',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Remote head key with Toyota H chip (128-bit AES). 4 buttons: Lock, Unlock, Trunk, Panic. OBD programmable via Toyota TIS or aftermarket tool.',
  },
  {
    model_name: 'Scion iM', year_start: 2016, year_end: 2016,
    key_blank: null, transponder_type: 'Texas Crypto 128-bit AES / H Chip', chip_type: 'H',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBA', ic_number: '1551A-14FBA',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'TOY44H', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Proximity smart key with Toyota H chip. 4 buttons: Lock, Unlock, Trunk, Panic. Push-button start models. Requires Toyota diagnostic tool or advanced aftermarket tool. Emergency blade TOY44H.',
  },

  // ===== SCION iQ =====
  {
    model_name: 'Scion iQ', year_start: 2012, year_end: 2015,
    key_blank: 'TOY44G', transponder_type: 'Texas Crypto 4D / G Chip', chip_type: 'G',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Toyota G chip transponder key. OBD programmable. Standard Toyota programming procedure.',
  },
  {
    model_name: 'Scion iQ', year_start: 2012, year_end: 2015,
    key_blank: 'TOY44G', transponder_type: 'Texas Crypto 4D / G Chip', chip_type: 'G',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MOZB41TG', ic_number: '1551A-B41TG',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Remote head key with Toyota G chip. 3 buttons: Lock, Unlock, Panic. OBD programmable. Battery CR2032.',
  },
  {
    model_name: 'Scion iQ', year_start: 2012, year_end: 2015,
    key_blank: null, transponder_type: 'Texas Crypto 4D / G Chip', chip_type: 'G',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14ACX', ic_number: '1551A-14ACX',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: 'TOY44G', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Proximity smart key with Toyota G chip. 3 buttons: Lock, Unlock, Panic. Push-button start models. Requires Toyota diagnostic tool. Emergency blade TOY44G.',
  },

  // ===== SCION tC =====
  {
    model_name: 'Scion tC', year_start: 2005, year_end: 2010,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Transponder key with 4D67 chip. OBD programmable via Toyota TIS or aftermarket tool.',
  },
  {
    model_name: 'Scion tC', year_start: 2005, year_end: 2010,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MOZB31EG', ic_number: '1551A-B31EG',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Remote head key with 4D67 chip. 3 buttons: Lock, Unlock, Panic. OBD programmable. Battery CR2032.',
  },
  {
    model_name: 'Scion tC', year_start: 2011, year_end: 2016,
    key_blank: 'TOY44G', transponder_type: 'Texas Crypto 4D / G Chip', chip_type: 'G',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Toyota G chip transponder key. OBD programmable via Toyota TIS or aftermarket tool. Second generation tC.',
  },
  {
    model_name: 'Scion tC', year_start: 2011, year_end: 2016,
    key_blank: 'TOY44G', transponder_type: 'Texas Crypto 4D / G Chip', chip_type: 'G',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MOZB41TG', ic_number: '1551A-B41TG',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Remote head key with Toyota G chip. 3 buttons: Lock, Unlock, Panic. OBD programmable. Battery CR2032.',
  },

  // ===== SCION xA =====
  {
    model_name: 'Scion xA', year_start: 2004, year_end: 2006,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Transponder key with 4D67 chip. OBD programmable via Toyota TIS or aftermarket tool.',
  },
  {
    model_name: 'Scion xA', year_start: 2004, year_end: 2006,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MOZB31EG', ic_number: '1551A-B31EG',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Remote head key with 4D67 chip. 3 buttons: Lock, Unlock, Panic. OBD programmable. Battery CR2032.',
  },

  // ===== SCION xB =====
  {
    model_name: 'Scion xB', year_start: 2004, year_end: 2006,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Transponder key with 4D67 chip. OBD programmable.',
  },
  {
    model_name: 'Scion xB', year_start: 2004, year_end: 2006,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MOZB31EG', ic_number: '1551A-B31EG',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Remote head key with 4D67 chip. 3 buttons: Lock, Unlock, Panic. OBD programmable. Battery CR2032.',
  },
  {
    model_name: 'Scion xB', year_start: 2008, year_end: 2010,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Transponder key with 4D67 chip. OBD programmable. Second generation xB.',
  },
  {
    model_name: 'Scion xB', year_start: 2008, year_end: 2010,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MOZB31EG', ic_number: '1551A-B31EG',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Remote head key with 4D67 chip. 3 buttons: Lock, Unlock, Panic. OBD programmable.',
  },
  {
    model_name: 'Scion xB', year_start: 2011, year_end: 2015,
    key_blank: 'TOY44G', transponder_type: 'Texas Crypto 4D / G Chip', chip_type: 'G',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Toyota G chip transponder key. OBD programmable.',
  },
  {
    model_name: 'Scion xB', year_start: 2011, year_end: 2015,
    key_blank: 'TOY44G', transponder_type: 'Texas Crypto 4D / G Chip', chip_type: 'G',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MOZB41TG', ic_number: '1551A-B41TG',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Remote head key with Toyota G chip. 3 buttons: Lock, Unlock, Panic. OBD programmable. Battery CR2032.',
  },

  // ===== SCION xD =====
  {
    model_name: 'Scion xD', year_start: 2008, year_end: 2010,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Transponder key with 4D67 chip. OBD programmable.',
  },
  {
    model_name: 'Scion xD', year_start: 2008, year_end: 2010,
    key_blank: 'TOY44D', transponder_type: 'Texas 4D67', chip_type: '4D67',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MOZB31EG', ic_number: '1551A-B31EG',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Remote head key with 4D67 chip. 3 buttons: Lock, Unlock, Panic. OBD programmable.',
  },
  {
    model_name: 'Scion xD', year_start: 2011, year_end: 2014,
    key_blank: 'TOY44G', transponder_type: 'Texas Crypto 4D / G Chip', chip_type: 'G',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Toyota G chip transponder key. OBD programmable.',
  },
  {
    model_name: 'Scion xD', year_start: 2011, year_end: 2014,
    key_blank: 'TOY44G', transponder_type: 'Texas Crypto 4D / G Chip', chip_type: 'G',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MOZB41TG', ic_number: '1551A-B41TG',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    programming_notes: 'Remote head key with Toyota G chip. 3 buttons: Lock, Unlock, Panic. OBD programmable. Battery CR2032.',
  },
];


// ============================================================
//  MAIN EXECUTION
// ============================================================
async function main() {
  await client.connect();
  console.log('Connected to database.');

  try {
    await client.query('BEGIN');

    // ---- Step 1: Delete existing automotive_keys for all 3 manufacturers ----
    const delMit = await client.query('DELETE FROM automotive_keys WHERE manufacturer_id = $1', [MITSUBISHI_ID]);
    console.log(`Deleted ${delMit.rowCount} Mitsubishi key rows.`);

    const delSuz = await client.query('DELETE FROM automotive_keys WHERE manufacturer_id = $1', [SUZUKI_ID]);
    console.log(`Deleted ${delSuz.rowCount} Suzuki key rows.`);

    const delSci = await client.query('DELETE FROM automotive_keys WHERE manufacturer_id = $1', [SCION_ID]);
    console.log(`Deleted ${delSci.rowCount} Scion key rows.`);

    // ---- Step 2: Create missing vehicle_models ----
    const modelIdMap = { ...EXISTING_MODELS };

    for (const m of MODELS_TO_CREATE) {
      const res = await client.query(
        `INSERT INTO vehicle_models (manufacturer_id, name, slug)
         VALUES ($1, $2, $3)
         ON CONFLICT DO NOTHING
         RETURNING id`,
        [m.mfr_id, m.name, m.slug]
      );
      if (res.rows.length > 0) {
        modelIdMap[m.name] = res.rows[0].id;
        console.log(`  Created vehicle_model: ${m.name} => ${res.rows[0].id}`);
      } else {
        // Already existed - look it up
        const lookup = await client.query(
          'SELECT id FROM vehicle_models WHERE manufacturer_id = $1 AND name = $2',
          [m.mfr_id, m.name]
        );
        if (lookup.rows.length > 0) {
          modelIdMap[m.name] = lookup.rows[0].id;
          console.log(`  Found existing vehicle_model: ${m.name} => ${lookup.rows[0].id}`);
        }
      }
    }

    // ---- Step 3: Collect all unique (model, year_start, year_end) combos ----
    const allKeys = [
      ...mitsubishiKeys,
      ...suzukiKeys,
      ...scionKeys,
    ];

    // Build set of unique year ranges per bare model
    const yearRangeSet = new Set();
    for (const k of allKeys) {
      const bm = bareModel(k.model_name);
      yearRangeSet.add(`${bm}|${k.year_start}|${k.year_end}`);
    }

    // ---- Step 4: Ensure vehicle_years exist for each combination ----
    // Cache: "modelName|yearStart|yearEnd" => year_id
    const yearIdCache = {};

    // Pre-load existing vehicle_years
    const existingYears = await client.query(`
      SELECT vy.id, vm.name as model_name, vy.year_start, vy.year_end
      FROM vehicle_years vy
      JOIN vehicle_models vm ON vy.model_id = vm.id
      WHERE vm.manufacturer_id IN ($1, $2, $3)
    `, [MITSUBISHI_ID, SUZUKI_ID, SCION_ID]);

    for (const row of existingYears.rows) {
      const key = `${row.model_name}|${row.year_start}|${row.year_end}`;
      yearIdCache[key] = row.id;
    }

    // Create missing vehicle_years
    for (const combo of yearRangeSet) {
      if (yearIdCache[combo]) continue; // already exists

      const [modelName, ysStr, yeStr] = combo.split('|');
      const modelId = modelIdMap[modelName];
      if (!modelId) {
        console.error(`ERROR: No vehicle_model found for "${modelName}"`);
        continue;
      }

      const res = await client.query(
        `INSERT INTO vehicle_years (model_id, year_start, year_end)
         VALUES ($1, $2, $3)
         RETURNING id`,
        [modelId, parseInt(ysStr), parseInt(yeStr)]
      );
      yearIdCache[combo] = res.rows[0].id;
      console.log(`  Created vehicle_year: ${modelName} ${ysStr}-${yeStr} => ${res.rows[0].id}`);
    }

    // ---- Step 5: Insert all keys with proper year_id ----
    const insertKey = async (mfrId, key) => {
      const bm = bareModel(key.model_name);
      const cacheKey = `${bm}|${key.year_start}|${key.year_end}`;
      const yearId = yearIdCache[cacheKey];

      if (!yearId) {
        console.error(`ERROR: No year_id for ${key.model_name} ${key.year_start}-${key.year_end}`);
        return;
      }

      // key_blank is NOT NULL in the DB. For smart keys, use emergency_key_blank.
      const keyBlank = key.key_blank || key.emergency_key_blank || 'N/A';

      await client.query(`
        INSERT INTO automotive_keys (
          year_id, manufacturer_id, model_name, year_start, year_end,
          key_blank, transponder_type, chip_type,
          remote_frequency, key_type, fcc_id, ic_number,
          battery_type, buttons, emergency_key_blank, test_key_blank,
          obd_programmable, pin_code_required,
          lishi_tool, programming_notes
        ) VALUES (
          $1, $2, $3, $4, $5,
          $6, $7, $8,
          $9, $10, $11, $12,
          $13, $14, $15, $16,
          $17, $18,
          $19, $20
        )
      `, [
        yearId, mfrId, key.model_name, key.year_start, key.year_end,
        keyBlank, key.transponder_type, key.chip_type,
        key.remote_frequency, key.key_type, key.fcc_id, key.ic_number,
        key.battery_type,
        key.buttons != null ? String(key.buttons) : null,
        key.emergency_key_blank, key.test_key_blank,
        key.obd_programmable, key.pin_code_required,
        key.lishi_tool, key.programming_notes,
      ]);
    };

    // Insert Mitsubishi
    for (const key of mitsubishiKeys) {
      await insertKey(MITSUBISHI_ID, key);
    }
    console.log(`\nInserted ${mitsubishiKeys.length} Mitsubishi rows.`);

    // Insert Suzuki
    for (const key of suzukiKeys) {
      await insertKey(SUZUKI_ID, key);
    }
    console.log(`Inserted ${suzukiKeys.length} Suzuki rows.`);

    // Insert Scion
    for (const key of scionKeys) {
      await insertKey(SCION_ID, key);
    }
    console.log(`Inserted ${scionKeys.length} Scion rows.`);

    await client.query('COMMIT');
    console.log('\nTransaction committed successfully!');

    // ---- Step 6: Verification ----
    const countMit = await client.query('SELECT count(*) FROM automotive_keys WHERE manufacturer_id = $1', [MITSUBISHI_ID]);
    const countSuz = await client.query('SELECT count(*) FROM automotive_keys WHERE manufacturer_id = $1', [SUZUKI_ID]);
    const countSci = await client.query('SELECT count(*) FROM automotive_keys WHERE manufacturer_id = $1', [SCION_ID]);

    console.log('\n=== VERIFICATION ===');
    console.log(`Mitsubishi: ${countMit.rows[0].count} rows`);
    console.log(`Suzuki:     ${countSuz.rows[0].count} rows`);
    console.log(`Scion:      ${countSci.rows[0].count} rows`);
    console.log(`Total:      ${Number(countMit.rows[0].count) + Number(countSuz.rows[0].count) + Number(countSci.rows[0].count)} rows`);

    console.log('\n=== MITSUBISHI MODELS ===');
    const mitModels = await client.query("SELECT DISTINCT model_name, count(*) as variants FROM automotive_keys WHERE manufacturer_id = $1 GROUP BY model_name ORDER BY model_name", [MITSUBISHI_ID]);
    mitModels.rows.forEach(r => console.log(`  ${r.model_name}: ${r.variants} variant(s)`));

    console.log('\n=== SUZUKI MODELS ===');
    const suzModels = await client.query("SELECT DISTINCT model_name, count(*) as variants FROM automotive_keys WHERE manufacturer_id = $1 GROUP BY model_name ORDER BY model_name", [SUZUKI_ID]);
    suzModels.rows.forEach(r => console.log(`  ${r.model_name}: ${r.variants} variant(s)`));

    console.log('\n=== SCION MODELS ===');
    const sciModels = await client.query("SELECT DISTINCT model_name, count(*) as variants FROM automotive_keys WHERE manufacturer_id = $1 GROUP BY model_name ORDER BY model_name", [SCION_ID]);
    sciModels.rows.forEach(r => console.log(`  ${r.model_name}: ${r.variants} variant(s)`));

    // Quick data quality check
    console.log('\n=== SAMPLE DATA CHECK ===');
    const sample = await client.query("SELECT model_name, year_start, year_end, key_type, chip_type, buttons, fcc_id FROM automotive_keys WHERE manufacturer_id = $1 ORDER BY model_name, year_start LIMIT 10", [MITSUBISHI_ID]);
    sample.rows.forEach(r => console.log(`  ${r.model_name} ${r.year_start}-${r.year_end} | ${r.key_type} | chip:${r.chip_type} | btn:${r.buttons} | fcc:${r.fcc_id}`));

  } catch (err) {
    await client.query('ROLLBACK');
    console.error('Transaction rolled back due to error:', err.message);
    console.error(err);
    throw err;
  } finally {
    await client.end();
    console.log('\nDatabase connection closed.');
  }
}

main().catch(err => {
  console.error('Fatal error:', err.message);
  process.exit(1);
});
