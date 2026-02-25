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

// ============================================================
// MANUFACTURER IDs
// ============================================================
const MFR = {
  FIAT:        'e8f72c70-9cf8-4cde-9cfc-559da7add8fa',
  SATURN:      '9b7f3d08-527c-453d-a2e2-0e66c6e7508e',
  MERCURY:     '4fa99d8a-4ab0-4171-8f43-5a58c723ec46',
  GENESIS:     '17d7207e-55e8-414d-8ed9-40c5d1e31b51',
  SAAB:        'c61d8bd6-d9b5-4fc3-ba0a-f20eb54a3d31',
  OLDSMOBILE:  '3fefc3ca-e4e3-4e8a-894f-55cece056d81',
  PLYMOUTH:    '1d58e729-db6c-43a2-9910-6a5fc8a0d5be',
  GEO:         'db5aa147-318f-4a51-8b0f-ce160f3a721f',
  DAEWOO:      '5bc509f9-516c-4a75-a7b1-523a6a8c3654',
  EAGLE:       '1244c82a-a716-4329-b1f9-4771f47f279f',
  SMART:       'd558ba5d-b9d2-454d-b6a9-d7190d0c3e58',
  HUMMER:      '8c17ec2f-61a3-4e92-8f4a-05a0732b4145',
  ISUZU:       'a00139bd-29aa-49cb-92a4-8d9b4d130527',
};

const ALL_MFR_IDS = Object.values(MFR);

// ============================================================
// KNOWN MODEL IDs (from DB)
// ============================================================
const MODEL_IDS = {
  // Fiat
  '500':           'b7c0ea08-6d36-457d-8d46-a4e69ec87239',
  '500L':          '5dffb731-6bd5-4565-8fd8-cc6a90d094bb',
  '500X':          'd5df0c27-2699-4ec8-86ab-99466b0a4a3c',
  // Saturn
  'Aura':          '1bdd8ae9-17a2-47c8-83a9-cb252873ff45',
  'Ion':           '7f4f8834-2b07-4b0c-94bd-8ce47bda6ef4',
  'Outlook':       'a2aab33b-d1fa-42c6-848a-0960c96ecfc6',
  'Sky':           '6934fbd7-837a-4efb-bcad-d93edacf1aa7',
  'Vue':           '29f994e6-9990-4e41-a3ee-6b1399bfc426',
  // Mercury
  'Grand Marquis': 'c50ce0fe-432c-4c61-b9bc-151de08e280c',
  'Milan':         'c9e62cff-600c-4865-9ea6-3d2fea39a00b',
  'Mountaineer':   'e729c0d7-01cf-472e-98e5-96085833eff3',
  'Sable':         '1ddc6e64-edf3-4e2f-84d9-bff6f638825e',
  // Genesis
  'G70':           '21c87b7d-7774-460b-aeba-c3ac7d43dd99',
  'G80':           'cd23c198-bcfc-4a8b-906a-3d8521a4ee88',
  'GV70':          '2e0b6a17-1862-47ce-8a50-cde25879b9ab',
  'GV80':          '787f12a7-1e8b-4534-8ac7-d850b6752f4b',
  // Saab
  '9-2X':          '0c3dee02-9656-4c2b-badf-ee1bc5f9e410',
  '9-3':           'c090aadc-9565-4cef-b00c-f4877da1356b',
  '9-5':           'ee557ed9-f25c-43b6-a28c-6a4d2ef70767',
  // Oldsmobile
  'Alero':         '7527a1bc-a45a-454a-8c33-b62018861bfb',
  'Aurora':        '3890cc0a-d119-4bf9-9f1f-996de1766e56',
  'Bravada':       '62b794aa-9b36-4f5b-9569-8aafc820c40a',
  'Intrigue':      '21973446-58ef-47e8-be7c-e0979905327d',
  'Silhouette':    '68e7ff05-c86f-45fd-a66d-3065386249f5',
  // Plymouth
  'Breeze':        'e3a7139c-400d-4740-a6d6-559d131dff1f',
  'Neon':          '727cdcff-1921-4af1-b11e-5b8eb2109bba',
  'Prowler':       'cc70319b-b57f-4384-8a25-40b42568d697',
  'Voyager':       'a7ded1d4-01f0-4b7e-b55c-e83277139d55',
  // Geo
  'Metro':         'bea560a5-7cb8-4fff-928f-f9e22b0d8317',
  'Prizm':         '25bf993d-a41c-42b3-8663-fb850a4a7931',
  'Tracker':       'a0c47171-bd13-4c66-b8f6-9ae51d8fc448',
  // Daewoo
  'Lanos':         'e7be9dd7-87ac-475c-b69a-2914fcccf244',
  'Leganza':       '3f94f32d-5a76-4c95-a9e5-233f719c44f3',
  'Nubira':        'cb264851-d132-4eff-ad7f-89bbebd376c2',
  // Eagle
  'Summit':        'b9985095-b0f6-4c7c-9b5d-778f9d03e9a6',
  'Talon':         '3567f200-93e2-4f3a-a4c7-1e7643af1839',
  'Vision':        'b82048f2-ecc3-4457-bb33-35a7aa8d9f28',
  // Smart
  'Fortwo':        'e4c3af21-788d-4652-aae5-08ce23d4c4ea',
  // Hummer
  'H2':            'a2df0d13-23d6-4b78-8b30-ac5948123117',
  'H3':            '2d938d9e-69a8-46d9-b57e-14e98e17227b',
  // Isuzu
  'Ascender':      'f626e960-8989-42ab-88f4-da5935c04556',
  'Rodeo':         '6d0a58ef-6190-4d39-b5dc-77368a25c76a',
  'Trooper':       '9ce4e281-7138-478f-8f48-03264aace2d6',
};

// Models that need to be created
const MODELS_TO_CREATE = [
  { name: '124 Spider', slug: '124-spider', mfr: MFR.FIAT },
  { name: 'Astra',      slug: 'astra',      mfr: MFR.SATURN },
  { name: 'L-Series',   slug: 'l-series',   mfr: MFR.SATURN },
  { name: 'Relay',      slug: 'relay',       mfr: MFR.SATURN },
  { name: 'S-Series',   slug: 's-series',    mfr: MFR.SATURN },
  { name: 'Mariner',    slug: 'mariner',     mfr: MFR.MERCURY },
  { name: 'Montego',    slug: 'montego',     mfr: MFR.MERCURY },
  { name: 'Monterey',   slug: 'monterey',    mfr: MFR.MERCURY },
  { name: 'G90',        slug: 'g90',         mfr: MFR.GENESIS },
  { name: 'GV60',       slug: 'gv60',        mfr: MFR.GENESIS },
  { name: '9-7X',       slug: '9-7x',        mfr: MFR.SAAB },
  { name: 'Cutlass',    slug: 'cutlass',     mfr: MFR.OLDSMOBILE },
  { name: 'i-Series',   slug: 'i-series',    mfr: MFR.ISUZU },
];


// ============================================================
// KEY DATA
// ============================================================

// key_type must be: 'standard', 'transponder', 'smart_key', 'proximity'
// buttons = integer count as string (column is text)

const allKeys = [

  // ============================================================
  // FIAT
  // ============================================================

  // Fiat 500 2012-2015 - Non-transponder flip remote (Delphi BCM, Megamos 48)
  {
    mfr: MFR.FIAT, model: '500', year_start: 2012, year_end: 2015,
    key_blank: 'SIP22', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 48 (ID48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LTQFI2AM433TX', ic_number: '7812A-FI2AM433T',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'SIP22',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi SIP22',
    image_url: null,
    programming_notes: 'Delphi BCM system. Megamos 48 transponder chip. 3-button flip remote key (Lock, Unlock, Trunk). 315 MHz. PIN code from BCM required. OBD programmable with Zedfull, Abrites, or VVDI2.',
  },
  // Fiat 500 2016-2019 - Smart key proximity
  {
    mfr: MFR.FIAT, model: '500', year_start: 2016, year_end: 2019,
    key_blank: 'SIP22', transponder_type: 'Megamos AES', chip_type: 'Megamos AES (MQB)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-32337200', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'SIP22', test_key_blank: 'SIP22',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22',
    image_url: null,
    programming_notes: 'Proximity smart key. 4-button (Lock, Unlock, Trunk, Panic). Megamos AES chip. 315 MHz. Requires PIN from BCM. Program with Abrites, Zedfull, or VVDI2 with Fiat adapter.',
  },

  // Fiat 500L 2014-2020 - Flip remote transponder
  {
    mfr: MFR.FIAT, model: '500L', year_start: 2014, year_end: 2020,
    key_blank: 'SIP22', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 48 (ID48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LTQFI2AM433TX', ic_number: '7812A-FI2AM433T',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'SIP22',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi SIP22',
    image_url: null,
    programming_notes: 'Delphi BCM. 3-button flip remote (Lock, Unlock, Trunk). Megamos 48 chip. 315 MHz. PIN code required from BCM. OBD programmable with Zedfull or Abrites.',
  },

  // Fiat 500X 2016-2023 - Smart key proximity
  {
    mfr: MFR.FIAT, model: '500X', year_start: 2016, year_end: 2023,
    key_blank: 'SIP22', transponder_type: 'Megamos AES', chip_type: 'Megamos AES (MQB)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'SIP22', test_key_blank: 'SIP22',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22',
    image_url: null,
    programming_notes: 'Proximity smart key. 4-button (Lock, Unlock, Hatch, Panic). Megamos AES chip. 433 MHz. PIN code from BCM required. Program with Abrites or VVDI2.',
  },

  // Fiat 124 Spider 2017-2020 - Uses Mazda platform (same as MX-5)
  {
    mfr: MFR.FIAT, model: '124 Spider', year_start: 2017, year_end: 2020,
    key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'WAZSKE13D02', ic_number: null,
    battery_type: 'CR2025', buttons: 3,
    emergency_key_blank: 'MAZ24R', test_key_blank: 'MAZ24R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi MAZ24R',
    image_url: null,
    programming_notes: 'Built on Mazda MX-5 platform. Uses Mazda smart key system. 3-button proximity (Lock, Unlock, Trunk). 315 MHz. ID49 chip. Program with Autel IM608, SmartPro, or Xtool.',
  },

  // ============================================================
  // SATURN
  // ============================================================

  // Saturn S-Series 1991-2002 - Non-transponder
  {
    mfr: MFR.SATURN, model: 'S-Series', year_start: 1991, year_end: 2002,
    key_blank: 'B88', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'B88',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. No programming required. Cut by code or duplicate.',
  },

  // Saturn L-Series 2000-2005 - PK3 transponder
  {
    mfr: MFR.SATURN, model: 'L-Series', year_start: 2000, year_end: 2005,
    key_blank: 'B97', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'B97',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM PK3 (Passkey 3) transponder. Megamos 13 chip. 10-minute relearn procedure via OBD. No PIN required.',
  },

  // Saturn Ion 2003-2007 - PK3 transponder
  {
    mfr: MFR.SATURN, model: 'Ion', year_start: 2003, year_end: 2007,
    key_blank: 'B97', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'B97',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM PK3 (Passkey 3) transponder. Megamos 13 chip. B97 sidewinder blade. 10-minute relearn procedure via OBD.',
  },

  // Saturn Ion 2003-2007 - Remote keyless entry (separate remote)
  {
    mfr: MFR.SATURN, model: 'Ion', year_start: 2003, year_end: 2007,
    key_blank: 'B97', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'L2C0005T', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'B97',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'PK3 transponder key + separate 4-button remote fob (Lock, Unlock, Trunk, Panic). 315 MHz. Remote programmed via OBD relearn.',
  },

  // Saturn Vue 2002-2005 - PK3 transponder
  {
    mfr: MFR.SATURN, model: 'Vue', year_start: 2002, year_end: 2005,
    key_blank: 'B97', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'B97',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM PK3 (Passkey 3) transponder. Megamos 13 chip. B97 sidewinder blade. 10-minute relearn via OBD.',
  },

  // Saturn Vue 2006-2007 - PK3+ transponder
  {
    mfr: MFR.SATURN, model: 'Vue', year_start: 2006, year_end: 2007,
    key_blank: 'B99', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3+)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'B99',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM PK3+ transponder. Megamos 13 chip. B99 blade. 10-minute relearn via OBD.',
  },

  // Saturn Vue 2008-2010 - GM Circle Plus transponder (Theta platform)
  {
    mfr: MFR.SATURN, model: 'Vue', year_start: 2008, year_end: 2010,
    key_blank: 'B111', transponder_type: 'Philips 46', chip_type: 'PCF7936 (ID46)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'B111',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM Circle Plus (PK3M) system. ID46 chip. 3-button flip remote key (Lock, Unlock, Panic). 315 MHz. OBD programmable with Tech2 or aftermarket tools.',
  },

  // Saturn Aura 2007-2009 - PK3+ transponder
  {
    mfr: MFR.SATURN, model: 'Aura', year_start: 2007, year_end: 2009,
    key_blank: 'B111', transponder_type: 'Philips 46', chip_type: 'PCF7936 (ID46)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'B111',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM Epsilon platform. ID46 (Circle Plus) transponder. 4-button flip remote key (Lock, Unlock, Trunk, Panic). 315 MHz. OBD programmable.',
  },

  // Saturn Astra 2008-2009 - Uses Opel/GM Europe system
  {
    mfr: MFR.SATURN, model: 'Astra', year_start: 2008, year_end: 2009,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: 'PCF7941 (ID46)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Based on Opel Astra. HU100 blade. ID46 chip. 3-button flip remote (Lock, Unlock, Panic). 315 MHz. OBD programmable with Tech2.',
  },

  // Saturn Outlook 2007-2010 - GM Circle Plus
  {
    mfr: MFR.SATURN, model: 'Outlook', year_start: 2007, year_end: 2010,
    key_blank: 'B111', transponder_type: 'Philips 46', chip_type: 'PCF7936 (ID46)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: null, test_key_blank: 'B111',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM Lambda platform. ID46 (Circle Plus) transponder. 5-button flip remote key (Lock, Unlock, Hatch, Remote Start, Panic). 315 MHz. OBD programmable.',
  },

  // Saturn Relay 2005-2007 - PK3 transponder
  {
    mfr: MFR.SATURN, model: 'Relay', year_start: 2005, year_end: 2007,
    key_blank: 'B99', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3+)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'L2C0007T', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: null, test_key_blank: 'B99',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM U-body minivan. PK3+ transponder. 5-button remote (Lock, Unlock, Left Slide, Right Slide, Panic). 315 MHz. 10-minute relearn via OBD.',
  },

  // Saturn Sky 2007-2010 - GM Circle Plus
  {
    mfr: MFR.SATURN, model: 'Sky', year_start: 2007, year_end: 2010,
    key_blank: 'B111', transponder_type: 'Philips 46', chip_type: 'PCF7936 (ID46)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'B111',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM Kappa platform. ID46 (Circle Plus) transponder. 4-button flip remote key (Lock, Unlock, Trunk, Panic). 315 MHz. OBD programmable.',
  },

  // ============================================================
  // MERCURY
  // ============================================================

  // Mercury Grand Marquis 1998-2005 - PATS transponder (8-cut)
  {
    mfr: MFR.MERCURY, model: 'Grand Marquis', year_start: 1998, year_end: 2005,
    key_blank: 'H75', transponder_type: 'Texas Crypto', chip_type: 'Texas 4C (ID4C)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'H75',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi H75',
    image_url: null,
    programming_notes: 'Ford PATS (Passive Anti-Theft System). Texas 4C transponder. H75 8-cut blade. 2-key on-board programming or PATS via OBD with Ford IDS/Forscan.',
  },

  // Mercury Grand Marquis 2006-2011 - PATS transponder (80-bit)
  {
    mfr: MFR.MERCURY, model: 'Grand Marquis', year_start: 2006, year_end: 2011,
    key_blank: 'H92', transponder_type: 'Texas Crypto', chip_type: 'Texas ID 4D-63 (80-bit)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'H92',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Ford PATS with 80-bit Texas 4D-63 chip. H92 blade (10-cut). 2-key on-board programming or via OBD with Forscan/IDS.',
  },

  // Mercury Grand Marquis 1998-2011 - Remote (separate fob)
  {
    mfr: MFR.MERCURY, model: 'Grand Marquis', year_start: 1998, year_end: 2011,
    key_blank: 'H75', transponder_type: 'Texas Crypto', chip_type: 'Texas 4C/4D',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U345', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'H75',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi H75',
    image_url: null,
    programming_notes: 'Separate 4-button keyless entry remote (Lock, Unlock, Trunk, Panic). 315 MHz. PATS transponder key + fob combo. Remote self-programmable with 2 existing keys.',
  },

  // Mercury Sable 1996-2005 - PATS transponder
  {
    mfr: MFR.MERCURY, model: 'Sable', year_start: 1996, year_end: 2005,
    key_blank: 'H73', transponder_type: 'Texas Crypto', chip_type: 'Texas 4C (ID4C)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'H73',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi H75',
    image_url: null,
    programming_notes: 'Ford PATS transponder. Texas 4C chip. H73 blade (8-cut). 2-key on-board programming or via OBD.',
  },

  // Mercury Sable 2008-2009 - PATS 80-bit
  {
    mfr: MFR.MERCURY, model: 'Sable', year_start: 2008, year_end: 2009,
    key_blank: 'H92', transponder_type: 'Texas Crypto', chip_type: 'Texas ID 4D-63 (80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'H92',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Ford PATS 80-bit. 4-button remote head key (Lock, Unlock, Trunk, Panic). 315 MHz. H92 10-cut blade. OBD programmable with 2-key method or Forscan.',
  },

  // Mercury Milan 2006-2011 - PATS 80-bit remote head key
  {
    mfr: MFR.MERCURY, model: 'Milan', year_start: 2006, year_end: 2011,
    key_blank: 'H92', transponder_type: 'Texas Crypto', chip_type: 'Texas ID 4D-63 (80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'H92',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Ford PATS 80-bit. 4-button remote head key (Lock, Unlock, Trunk, Panic). 315 MHz. H92 10-cut blade. OBD programmable.',
  },

  // Mercury Montego 2005-2007 - PATS 80-bit
  {
    mfr: MFR.MERCURY, model: 'Montego', year_start: 2005, year_end: 2007,
    key_blank: 'H92', transponder_type: 'Texas Crypto', chip_type: 'Texas ID 4D-63 (80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'H92',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Ford PATS 80-bit. 4-button remote head key (Lock, Unlock, Trunk, Panic). 315 MHz. H92 10-cut blade. Ford Freestyle/Five Hundred platform.',
  },

  // Mercury Monterey 2004-2007 - PATS transponder
  {
    mfr: MFR.MERCURY, model: 'Monterey', year_start: 2004, year_end: 2007,
    key_blank: 'H86', transponder_type: 'Texas Crypto', chip_type: 'Texas ID 4D-63 (80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: null, test_key_blank: 'H86',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi H75',
    image_url: null,
    programming_notes: 'Ford PATS 80-bit. 5-button remote head key (Lock, Unlock, Sliding Doors, Hatch, Panic). 315 MHz. Ford Freestar platform. OBD programmable.',
  },

  // Mercury Mountaineer 2002-2005 - PATS 4C
  {
    mfr: MFR.MERCURY, model: 'Mountaineer', year_start: 2002, year_end: 2005,
    key_blank: 'H75', transponder_type: 'Texas Crypto', chip_type: 'Texas 4C (ID4C)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U345', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'H75',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi H75',
    image_url: null,
    programming_notes: 'Ford PATS. Texas 4C chip. H75 blade. 4-button separate remote fob (Lock, Unlock, Hatch, Panic). 315 MHz. 2-key on-board programming.',
  },

  // Mercury Mountaineer 2006-2010 - PATS 80-bit remote head key
  {
    mfr: MFR.MERCURY, model: 'Mountaineer', year_start: 2006, year_end: 2010,
    key_blank: 'H92', transponder_type: 'Texas Crypto', chip_type: 'Texas ID 4D-63 (80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'H92',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Ford PATS 80-bit. 4-button remote head key (Lock, Unlock, Hatch/Glass, Panic). 315 MHz. H92 10-cut blade. OBD programmable.',
  },

  // Mercury Mariner 2005-2008 - PATS 80-bit
  {
    mfr: MFR.MERCURY, model: 'Mariner', year_start: 2005, year_end: 2008,
    key_blank: 'H92', transponder_type: 'Texas Crypto', chip_type: 'Texas ID 4D-63 (80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'H92',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Ford PATS 80-bit. 3-button remote head key (Lock, Unlock, Panic). 315 MHz. H92 10-cut blade. Ford Escape platform. OBD programmable.',
  },

  // Mercury Mariner 2009-2011 - PATS 80-bit with 4 buttons
  {
    mfr: MFR.MERCURY, model: 'Mariner', year_start: 2009, year_end: 2011,
    key_blank: 'H92', transponder_type: 'Texas Crypto', chip_type: 'Texas ID 4D-63 (80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'H92',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Ford PATS 80-bit. 4-button remote head key (Lock, Unlock, Hatch, Panic). 315 MHz. H92 10-cut blade. OBD programmable.',
  },

  // ============================================================
  // GENESIS
  // ============================================================

  // Genesis G70 2019-2021 - Smart key
  {
    mfr: MFR.GENESIS, model: 'G70', year_start: 2019, year_end: 2021,
    key_blank: 'HY22', transponder_type: 'HITAG 3', chip_type: 'PCF7952 (ID47)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'TQ8-FOB-4F17', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: 'HY22',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Hyundai/Genesis smart key system. 4-button proximity (Lock, Unlock, Trunk, Panic). 433 MHz. ID47 chip. PIN required. Program with Autel IM608, K518, or SmartPro.',
  },

  // Genesis G70 2022-2025 - Smart key (updated)
  {
    mfr: MFR.GENESIS, model: 'G70', year_start: 2022, year_end: 2025,
    key_blank: 'HY22', transponder_type: 'HITAG 3', chip_type: 'PCF7952 (ID47)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'TQ8-FOB-4F35', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: 'HY22',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Updated Genesis smart key. 4-button proximity (Lock, Unlock, Trunk, Panic). 433 MHz. ID47 chip. PIN required. Autel IM608 or K518.',
  },

  // Genesis G80 2017-2020 - Smart key
  {
    mfr: MFR.GENESIS, model: 'G80', year_start: 2017, year_end: 2020,
    key_blank: 'HY22', transponder_type: 'HITAG 3', chip_type: 'PCF7952 (ID47)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'TQ8-FOB-4F17', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: 'HY22',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Genesis smart key. 4-button proximity (Lock, Unlock, Trunk, Panic). 433 MHz. ID47 chip. PIN from immobilizer. Program with Autel IM608 or K518.',
  },

  // Genesis G80 2021-2025 - Smart key (new generation)
  {
    mfr: MFR.GENESIS, model: 'G80', year_start: 2021, year_end: 2025,
    key_blank: 'HY22', transponder_type: 'HITAG 3', chip_type: 'PCF7952 (ID47)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'TQ8-FOB-4F35', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: 'HY22',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'New-gen Genesis smart key. 4-button proximity (Lock, Unlock, Trunk, Panic). 433 MHz. ID47 chip. PIN required. Autel IM608 or K518.',
  },

  // Genesis G90 2017-2020 - Smart key
  {
    mfr: MFR.GENESIS, model: 'G90', year_start: 2017, year_end: 2020,
    key_blank: 'HY22', transponder_type: 'HITAG 3', chip_type: 'PCF7952 (ID47)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'TQ8-FOB-4F17', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: 'HY22',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Genesis flagship smart key. 4-button proximity (Lock, Unlock, Trunk, Panic). 433 MHz. ID47 chip. PIN required. Program with Autel IM608 or K518.',
  },

  // Genesis G90 2021-2025 - Smart key (new generation)
  {
    mfr: MFR.GENESIS, model: 'G90', year_start: 2021, year_end: 2025,
    key_blank: 'HY22', transponder_type: 'HITAG 3', chip_type: 'PCF7952 (ID47)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'TQ8-FOB-4F35', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: 'HY22',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'New-gen G90 smart key. 4-button proximity (Lock, Unlock, Trunk, Panic). 433 MHz. ID47 chip. PIN required. Autel IM608 or K518.',
  },

  // Genesis GV60 2023-2025 - EV smart key
  {
    mfr: MFR.GENESIS, model: 'GV60', year_start: 2023, year_end: 2025,
    key_blank: 'HY22', transponder_type: 'HITAG 3', chip_type: 'PCF7952 (ID47)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'TQ8-FOB-4F35', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: 'HY22',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Genesis EV smart key. 4-button proximity (Lock, Unlock, Frunk, Panic). 433 MHz. ID47 chip. PIN required. Autel IM608 or K518. Also supports digital key via phone.',
  },

  // Genesis GV70 2022-2025 - Smart key
  {
    mfr: MFR.GENESIS, model: 'GV70', year_start: 2022, year_end: 2025,
    key_blank: 'HY22', transponder_type: 'HITAG 3', chip_type: 'PCF7952 (ID47)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'TQ8-FOB-4F35', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: 'HY22',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Genesis GV70 smart key. 4-button proximity (Lock, Unlock, Hatch, Panic). 433 MHz. ID47 chip. PIN required. Program with Autel IM608 or K518.',
  },

  // Genesis GV80 2021-2025 - Smart key
  {
    mfr: MFR.GENESIS, model: 'GV80', year_start: 2021, year_end: 2025,
    key_blank: 'HY22', transponder_type: 'HITAG 3', chip_type: 'PCF7952 (ID47)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'TQ8-FOB-4F35', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'HY22', test_key_blank: 'HY22',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HY22',
    image_url: null,
    programming_notes: 'Genesis GV80 smart key. 4-button proximity (Lock, Unlock, Hatch, Panic). 433 MHz. ID47 chip. PIN required. Autel IM608 or K518.',
  },

  // ============================================================
  // SAAB
  // ============================================================

  // Saab 9-2X 2005-2006 - Subaru platform (WRX-based), transponder
  {
    mfr: MFR.SAAB, model: '9-2X', year_start: 2005, year_end: 2006,
    key_blank: 'SUB3', transponder_type: 'Texas Fixed', chip_type: 'Texas 4D-62 (ID62)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NHVWB1U711', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'SUB3',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Subaru Impreza WRX platform. Texas 4D-62 chip. 3-button remote head key (Lock, Unlock, Panic). 315 MHz. Requires Subaru select monitor or SmartPro. PIN required.',
  },

  // Saab 9-3 2003-2007 - Transponder key
  {
    mfr: MFR.SAAB, model: '9-3', year_start: 2003, year_end: 2007,
    key_blank: 'WT7R', transponder_type: 'Philips Crypto', chip_type: 'PCF7946 (ID46)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LTQSAAM433TX', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'WT7R',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Saab CIM (Column Integration Module). ID46 chip. 4-button flip remote (Lock, Unlock, Trunk, Panic). 315 MHz. PIN from CIM required. Program with Tech2 or Abrites.',
  },

  // Saab 9-3 2008-2011 - Smart key proximity
  {
    mfr: MFR.SAAB, model: '9-3', year_start: 2008, year_end: 2011,
    key_blank: 'WT7R', transponder_type: 'Philips Crypto', chip_type: 'PCF7946 (ID46)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'LTQSAAM433TX', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'WT7R', test_key_blank: 'WT7R',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Saab CIM smart key with proximity. 4-button (Lock, Unlock, Trunk, Panic). ID46 chip. 315 MHz. PIN from CIM required. Program with Tech2 or Abrites.',
  },

  // Saab 9-5 1999-2009 - Transponder key
  {
    mfr: MFR.SAAB, model: '9-5', year_start: 1999, year_end: 2009,
    key_blank: 'WT7R', transponder_type: 'Philips Crypto', chip_type: 'PCF7946 (ID46)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LTQSAAM433TX', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'WT7R',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Saab TWICE module. ID46 chip. 4-button flip remote (Lock, Unlock, Trunk, Panic). 315 MHz. PIN from TWICE required. Program with Tech2 or Abrites.',
  },

  // Saab 9-5 2010-2011 - New generation, smart key
  {
    mfr: MFR.SAAB, model: '9-5', year_start: 2010, year_end: 2011,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: 'PCF7952 (ID46)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBG009768T', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'New-gen 9-5 on GM Epsilon II platform. 5-button proximity smart key (Lock, Unlock, Trunk, Remote Start, Panic). ID46 chip. HU100 emergency blade. 315 MHz. PIN required. Program with Tech2.',
  },

  // Saab 9-7X 2005-2009 - GM Trailblazer platform, PK3+
  {
    mfr: MFR.SAAB, model: '9-7X', year_start: 2005, year_end: 2009,
    key_blank: 'B99', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3+)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'L2C0007T', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'B99',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM TrailBlazer platform. PK3+ transponder. Megamos 13 chip. 4-button remote fob (Lock, Unlock, Hatch, Panic). 315 MHz. 10-minute relearn via OBD. No PIN needed.',
  },

  // ============================================================
  // OLDSMOBILE
  // ============================================================

  // Oldsmobile Cutlass 1997-1999 - PK3 transponder
  {
    mfr: MFR.OLDSMOBILE, model: 'Cutlass', year_start: 1997, year_end: 1999,
    key_blank: 'B97', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'B97',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM PK3 (Passkey 3) transponder. Megamos 13 chip. B97 sidewinder blade. 10-minute relearn via OBD.',
  },

  // Oldsmobile Alero 1999-2004 - PK3 transponder
  {
    mfr: MFR.OLDSMOBILE, model: 'Alero', year_start: 1999, year_end: 2004,
    key_blank: 'B97', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'B97',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM PK3 transponder. Megamos 13 chip. B97 sidewinder blade. 10-minute relearn via OBD. No PIN required.',
  },

  // Oldsmobile Alero 1999-2004 - With remote fob
  {
    mfr: MFR.OLDSMOBILE, model: 'Alero', year_start: 1999, year_end: 2004,
    key_blank: 'B97', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'L2C0005T', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'B97',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'PK3 transponder key + separate 4-button remote (Lock, Unlock, Trunk, Panic). 315 MHz. 10-minute relearn for transponder. Remote self-programmable.',
  },

  // Oldsmobile Aurora 1995-1999 - VATS/PK3
  {
    mfr: MFR.OLDSMOBILE, model: 'Aurora', year_start: 1995, year_end: 1999,
    key_blank: 'B82', transponder_type: 'VATS', chip_type: 'VATS Resistor',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'B82',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM VATS (Vehicle Anti-Theft System). Resistor pellet in key blade. 15 resistance values. Measure resistance and match replacement key. B82 double-sided blade.',
  },

  // Oldsmobile Aurora 2001-2003 - PK3
  {
    mfr: MFR.OLDSMOBILE, model: 'Aurora', year_start: 2001, year_end: 2003,
    key_blank: 'B97', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'B97',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM PK3 transponder. Megamos 13 chip. B97 sidewinder blade. 10-minute relearn via OBD.',
  },

  // Oldsmobile Intrigue 1998-2002 - PK3
  {
    mfr: MFR.OLDSMOBILE, model: 'Intrigue', year_start: 1998, year_end: 2002,
    key_blank: 'B97', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'B97',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM PK3 transponder. Megamos 13 chip. B97 sidewinder blade. 10-minute relearn via OBD.',
  },

  // Oldsmobile Intrigue 1998-2002 - With remote
  {
    mfr: MFR.OLDSMOBILE, model: 'Intrigue', year_start: 1998, year_end: 2002,
    key_blank: 'B97', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KOBUT1BT', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'B97',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'PK3 transponder + separate 4-button remote fob (Lock, Unlock, Trunk, Panic). 315 MHz. 10-minute relearn for transponder.',
  },

  // Oldsmobile Bravada 1999-2004 - PK3
  {
    mfr: MFR.OLDSMOBILE, model: 'Bravada', year_start: 1999, year_end: 2004,
    key_blank: 'B97', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'L2C0005T', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'B97',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM PK3 transponder + separate 3-button remote (Lock, Unlock, Panic). 315 MHz. B97 sidewinder. 10-minute relearn for transponder.',
  },

  // Oldsmobile Silhouette 1999-2004 - PK3
  {
    mfr: MFR.OLDSMOBILE, model: 'Silhouette', year_start: 1999, year_end: 2004,
    key_blank: 'B97', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'L2C0005T', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: null, test_key_blank: 'B97',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM PK3 transponder + separate 5-button remote (Lock, Unlock, Left Slide, Right Slide, Panic). Minivan. 315 MHz. 10-minute relearn.',
  },

  // ============================================================
  // PLYMOUTH
  // ============================================================

  // Plymouth Breeze 1996-2000 - Non-transponder
  {
    mfr: MFR.PLYMOUTH, model: 'Breeze', year_start: 1996, year_end: 2000,
    key_blank: 'Y157', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'Y157',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. Chrysler 8-cut Y157 blade. No programming required. Cut by code or duplicate.',
  },

  // Plymouth Breeze 1996-2000 - With remote
  {
    mfr: MFR.PLYMOUTH, model: 'Breeze', year_start: 1996, year_end: 2000,
    key_blank: 'Y157', transponder_type: null, chip_type: null,
    remote_frequency: '315 MHz', key_type: 'standard',
    fcc_id: 'GQ43VT7T', ic_number: null,
    battery_type: 'CR2016', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'Y157',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder key + separate 3-button remote fob (Lock, Unlock, Panic). 315 MHz. Remote self-programmable via DRB-III or OBD procedure.',
  },

  // Plymouth Neon 1995-1999 - Non-transponder
  {
    mfr: MFR.PLYMOUTH, model: 'Neon', year_start: 1995, year_end: 1999,
    key_blank: 'Y157', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'Y157',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. Chrysler Y157 blade. No programming required.',
  },

  // Plymouth Neon 2000-2001 - Transponder (SKIM)
  {
    mfr: MFR.PLYMOUTH, model: 'Neon', year_start: 2000, year_end: 2001,
    key_blank: 'Y160', transponder_type: 'Texas Fixed', chip_type: 'Texas 4D-64',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'Y160',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Chrysler SKIM (Sentry Key Immobilizer Module). Texas 4D-64 chip. Y160 blade. PIN code from SKIM required. OBD programmable with wiTECH or aftermarket tools.',
  },

  // Plymouth Prowler 1997-2002 - Non-transponder
  {
    mfr: MFR.PLYMOUTH, model: 'Prowler', year_start: 1997, year_end: 2002,
    key_blank: 'Y157', transponder_type: null, chip_type: null,
    remote_frequency: '315 MHz', key_type: 'standard',
    fcc_id: 'GQ43VT7T', ic_number: null,
    battery_type: 'CR2016', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'Y157',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder key + 3-button remote fob (Lock, Unlock, Panic). 315 MHz. No immobilizer system.',
  },

  // Plymouth Voyager 1996-2000 - Non-transponder
  {
    mfr: MFR.PLYMOUTH, model: 'Voyager', year_start: 1996, year_end: 2000,
    key_blank: 'Y159', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'Y159',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. Chrysler Y159 blade. No programming required.',
  },

  // Plymouth Voyager 1996-2000 - With remote
  {
    mfr: MFR.PLYMOUTH, model: 'Voyager', year_start: 1996, year_end: 2000,
    key_blank: 'Y159', transponder_type: null, chip_type: null,
    remote_frequency: '315 MHz', key_type: 'standard',
    fcc_id: 'GQ43VT6T', ic_number: null,
    battery_type: 'CR2016', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'Y159',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder key + separate 4-button remote fob (Lock, Unlock, Sliding Door, Panic). Minivan. 315 MHz.',
  },

  // ============================================================
  // GEO
  // ============================================================

  // Geo Metro 1989-1997 - Non-transponder
  {
    mfr: MFR.GEO, model: 'Metro', year_start: 1989, year_end: 1997,
    key_blank: 'SUZ14', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'SUZ14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. Suzuki-based platform. SUZ14 blade. No programming required. Cut by code or duplicate.',
  },

  // Geo Prizm 1989-1997 - Non-transponder
  {
    mfr: MFR.GEO, model: 'Prizm', year_start: 1989, year_end: 1997,
    key_blank: 'TR47', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'TR47',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. Toyota Corolla platform. TR47 blade (Toyota keyway). No programming required.',
  },

  // Geo Tracker 1989-1997 - Non-transponder
  {
    mfr: MFR.GEO, model: 'Tracker', year_start: 1989, year_end: 1997,
    key_blank: 'SUZ14', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'SUZ14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. Suzuki Sidekick platform. SUZ14 blade. No programming required.',
  },

  // ============================================================
  // DAEWOO
  // ============================================================

  // Daewoo Lanos 1999-2002 - Non-transponder
  {
    mfr: MFR.DAEWOO, model: 'Lanos', year_start: 1999, year_end: 2002,
    key_blank: 'DW04', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'DW04',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi DW04/DW05',
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. DW04 blade. No programming required. Cut by code or duplicate.',
  },

  // Daewoo Leganza 1999-2002 - Non-transponder
  {
    mfr: MFR.DAEWOO, model: 'Leganza', year_start: 1999, year_end: 2002,
    key_blank: 'DW04', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'DW04',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi DW04/DW05',
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. DW04 blade. No programming required.',
  },

  // Daewoo Nubira 1999-2002 - Non-transponder
  {
    mfr: MFR.DAEWOO, model: 'Nubira', year_start: 1999, year_end: 2002,
    key_blank: 'DW04', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'DW04',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi DW04/DW05',
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. DW04 blade. No programming required.',
  },

  // ============================================================
  // EAGLE
  // ============================================================

  // Eagle Summit 1989-1996 - Non-transponder (Mitsubishi platform)
  {
    mfr: MFR.EAGLE, model: 'Summit', year_start: 1989, year_end: 1996,
    key_blank: 'MIT1', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'MIT1',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. Mitsubishi Mirage platform. MIT1 blade. No programming required.',
  },

  // Eagle Talon 1990-1998 - Non-transponder (Mitsubishi/DSM platform)
  {
    mfr: MFR.EAGLE, model: 'Talon', year_start: 1990, year_end: 1998,
    key_blank: 'MIT1', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'MIT1',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. Mitsubishi Eclipse DSM platform. MIT1 blade. No programming required.',
  },

  // Eagle Vision 1993-1997 - Non-transponder
  {
    mfr: MFR.EAGLE, model: 'Vision', year_start: 1993, year_end: 1997,
    key_blank: 'Y155', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'Y155',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. Chrysler LH platform. Y155 blade. No programming required.',
  },

  // Eagle Vision 1993-1997 - With remote
  {
    mfr: MFR.EAGLE, model: 'Vision', year_start: 1993, year_end: 1997,
    key_blank: 'Y155', transponder_type: null, chip_type: null,
    remote_frequency: '315 MHz', key_type: 'standard',
    fcc_id: 'GQ43VT5T', ic_number: null,
    battery_type: 'CR2016', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'Y155',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder key + separate 3-button remote fob (Lock, Unlock, Panic). 315 MHz. Chrysler LH platform.',
  },

  // ============================================================
  // SMART
  // ============================================================

  // Smart ForTwo 2008-2015 (451) - Transponder key
  {
    mfr: MFR.SMART, model: 'Fortwo', year_start: 2008, year_end: 2015,
    key_blank: 'HU64', transponder_type: 'Texas Crypto', chip_type: 'Texas ID 4D-61',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KR55WK45144', ic_number: null,
    battery_type: 'CR2016', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    image_url: null,
    programming_notes: 'Smart 451 generation. Mercedes-based system. 3-button remote head key (Lock, Unlock, Panic). 315 MHz. Texas 4D-61 chip. HU64 blade. Program with VVDI MB or CGDI MB.',
  },

  // Smart ForTwo 2016-2019 (453) - Smart key proximity
  {
    mfr: MFR.SMART, model: 'Fortwo', year_start: 2016, year_end: 2019,
    key_blank: 'HU64', transponder_type: 'HITAG PRO', chip_type: 'PCF7961M (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWB1G767', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    image_url: null,
    programming_notes: 'Smart 453 generation. Uses Renault/Nissan platform. 3-button proximity smart key (Lock, Unlock, Panic). 315 MHz. ID49 chip. HU64 emergency blade. Program with Autel IM608 or Xtool.',
  },

  // ============================================================
  // HUMMER
  // ============================================================

  // Hummer H2 2003-2007 - PK3+ transponder
  {
    mfr: MFR.HUMMER, model: 'H2', year_start: 2003, year_end: 2007,
    key_blank: 'B99', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3+)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LHJ011', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'B99',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM PK3+ transponder. Megamos 13 chip. B99 blade. 3-button separate remote fob (Lock, Unlock, Panic). 315 MHz. 10-minute relearn via OBD.',
  },

  // Hummer H2 2008-2009 - PK3+ transponder (later production)
  {
    mfr: MFR.HUMMER, model: 'H2', year_start: 2008, year_end: 2009,
    key_blank: 'B99', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3+)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LHJ011', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'B99',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM PK3+ transponder. Megamos 13 chip. B99 blade. 3-button remote (Lock, Unlock, Panic). 315 MHz. 10-minute relearn via OBD.',
  },

  // Hummer H3 2006-2010 - GM Circle Plus / PK3M
  {
    mfr: MFR.HUMMER, model: 'H3', year_start: 2006, year_end: 2010,
    key_blank: 'B111', transponder_type: 'Philips 46', chip_type: 'PCF7936 (ID46)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'B111',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM Circle Plus (PK3M) system. ID46 chip. B111 blade. 3-button flip remote key (Lock, Unlock, Panic). 315 MHz. OBD programmable with Tech2 or aftermarket tools.',
  },

  // Hummer H3 2008-2010 - GM Circle Plus with 4 buttons
  {
    mfr: MFR.HUMMER, model: 'H3', year_start: 2008, year_end: 2010,
    key_blank: 'B111', transponder_type: 'Philips 46', chip_type: 'PCF7936 (ID46)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: 'B111',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM Circle Plus system. ID46 chip. B111 blade. 4-button flip remote key (Lock, Unlock, Remote Start, Panic). 315 MHz. OBD programmable.',
  },

  // ============================================================
  // ISUZU
  // ============================================================

  // Isuzu Rodeo 1998-2004 - Transponder
  {
    mfr: MFR.ISUZU, model: 'Rodeo', year_start: 1998, year_end: 2004,
    key_blank: 'MIT6', transponder_type: 'Texas Crypto', chip_type: 'Texas 4D-65',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'MIT6',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Texas 4D-65 transponder chip. MIT6 blade. Requires Isuzu-specific programming tool or SmartPro.',
  },

  // Isuzu Rodeo 1991-1997 - Non-transponder
  {
    mfr: MFR.ISUZU, model: 'Rodeo', year_start: 1991, year_end: 1997,
    key_blank: 'MIT6', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'MIT6',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. MIT6 blade. No programming required.',
  },

  // Isuzu Trooper 1992-2002 - Non-transponder
  {
    mfr: MFR.ISUZU, model: 'Trooper', year_start: 1992, year_end: 2002,
    key_blank: 'MIT6', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 0,
    emergency_key_blank: null, test_key_blank: 'MIT6',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. MIT6 blade. No programming required.',
  },

  // Isuzu Ascender 2003-2008 - GM PK3+ transponder
  {
    mfr: MFR.ISUZU, model: 'Ascender', year_start: 2003, year_end: 2008,
    key_blank: 'B99', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 13 (PK3+)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'L2C0007T', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'B99',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM TrailBlazer platform. PK3+ transponder. Megamos 13 chip. B99 blade. 3-button remote (Lock, Unlock, Panic). 315 MHz. 10-minute relearn via OBD.',
  },

  // Isuzu i-Series (i-280/i-290/i-350/i-370) 2006-2008 - GM Circle Plus
  {
    mfr: MFR.ISUZU, model: 'i-Series', year_start: 2006, year_end: 2008,
    key_blank: 'B111', transponder_type: 'Philips 46', chip_type: 'PCF7936 (ID46)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: 'B111',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null,
    image_url: null,
    programming_notes: 'GM Colorado/Canyon platform. GM Circle Plus (PK3M) system. ID46 chip. B111 blade. 3-button flip remote (Lock, Unlock, Panic). 315 MHz. OBD programmable.',
  },
];


// ============================================================
// MAIN
// ============================================================
async function main() {
  await client.connect();
  console.log('Connected to database.');

  // Count existing rows
  const countBefore = await client.query(
    'SELECT manufacturer_id, COUNT(*) FROM automotive_keys WHERE manufacturer_id = ANY($1) GROUP BY manufacturer_id',
    [ALL_MFR_IDS]
  );
  console.log('\nExisting key counts per manufacturer:');
  countBefore.rows.forEach(r => console.log(`  ${r.manufacturer_id}: ${r.count}`));
  const totalBefore = countBefore.rows.reduce((s, r) => s + parseInt(r.count), 0);
  console.log(`  TOTAL existing: ${totalBefore}`);

  await client.query('BEGIN');

  try {
    // ── Create missing vehicle_models ──
    for (const m of MODELS_TO_CREATE) {
      const res = await client.query(
        `INSERT INTO vehicle_models (id, manufacturer_id, name, slug)
         VALUES (gen_random_uuid(), $1, $2, $3)
         ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
         RETURNING id`,
        [m.mfr, m.name, m.slug]
      );
      MODEL_IDS[m.name] = res.rows[0].id;
      console.log(`Model "${m.name}" -> ${res.rows[0].id}`);
    }

    // ── Delete all existing keys for these manufacturers ──
    const delRes = await client.query(
      'DELETE FROM automotive_keys WHERE manufacturer_id = ANY($1)',
      [ALL_MFR_IDS]
    );
    console.log(`\nDeleted ${delRes.rowCount} old key rows.`);

    // ── Build model-name-to-manufacturer lookup ──
    const mfrByModel = {};
    // Fiat
    ['500', '500L', '500X', '124 Spider'].forEach(m => mfrByModel[m] = MFR.FIAT);
    // Saturn
    ['Astra', 'Aura', 'Ion', 'L-Series', 'Outlook', 'Relay', 'S-Series', 'Sky', 'Vue'].forEach(m => mfrByModel[m] = MFR.SATURN);
    // Mercury
    ['Grand Marquis', 'Mariner', 'Milan', 'Montego', 'Monterey', 'Mountaineer', 'Sable'].forEach(m => mfrByModel[m] = MFR.MERCURY);
    // Genesis
    ['G70', 'G80', 'G90', 'GV60', 'GV70', 'GV80'].forEach(m => mfrByModel[m] = MFR.GENESIS);
    // Saab
    ['9-2X', '9-3', '9-5', '9-7X'].forEach(m => mfrByModel[m] = MFR.SAAB);
    // Oldsmobile
    ['Alero', 'Aurora', 'Bravada', 'Cutlass', 'Intrigue', 'Silhouette'].forEach(m => mfrByModel[m] = MFR.OLDSMOBILE);
    // Plymouth
    ['Breeze', 'Neon', 'Prowler', 'Voyager'].forEach(m => mfrByModel[m] = MFR.PLYMOUTH);
    // Geo
    ['Metro', 'Prizm', 'Tracker'].forEach(m => mfrByModel[m] = MFR.GEO);
    // Daewoo
    ['Lanos', 'Leganza', 'Nubira'].forEach(m => mfrByModel[m] = MFR.DAEWOO);
    // Eagle
    ['Summit', 'Talon', 'Vision'].forEach(m => mfrByModel[m] = MFR.EAGLE);
    // Smart
    ['Fortwo'].forEach(m => mfrByModel[m] = MFR.SMART);
    // Hummer
    ['H2', 'H3'].forEach(m => mfrByModel[m] = MFR.HUMMER);
    // Isuzu
    ['Ascender', 'i-Series', 'Rodeo', 'Trooper'].forEach(m => mfrByModel[m] = MFR.ISUZU);

    // ── Insert new keys ──
    let inserted = 0;
    for (const key of allKeys) {
      const modelId = MODEL_IDS[key.model];
      if (!modelId) {
        console.error(`ERROR: No model ID for "${key.model}". Skipping.`);
        continue;
      }

      // Upsert vehicle_years
      const yearRes = await client.query(
        `INSERT INTO vehicle_years (id, model_id, year_start, year_end)
         VALUES (gen_random_uuid(), $1, $2, $3)
         ON CONFLICT (model_id, year_start, year_end) DO UPDATE SET year_start = EXCLUDED.year_start
         RETURNING id`,
        [modelId, key.year_start, key.year_end]
      );
      const yearId = yearRes.rows[0].id;

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
          yearId, key.mfr, key.model,
          key.key_blank, key.transponder_type, key.chip_type, key.remote_frequency,
          key.key_type, key.fcc_id, key.ic_number, key.programming_notes,
          key.pin_code_required, key.obd_programmable, key.emergency_key_blank,
          key.year_start, key.year_end, key.battery_type, key.buttons === 0 ? null : String(key.buttons),
          key.test_key_blank, key.image_url, key.lishi_tool,
        ]
      );
      inserted++;
    }

    console.log(`\nInserted ${inserted} new key rows.`);

    await client.query('COMMIT');
    console.log('Transaction committed successfully.\n');

    // ── Verify ──
    const countAfter = await client.query(
      'SELECT manufacturer_id, COUNT(*) FROM automotive_keys WHERE manufacturer_id = ANY($1) GROUP BY manufacturer_id ORDER BY manufacturer_id',
      [ALL_MFR_IDS]
    );

    const mfrNames = {
      [MFR.FIAT]: 'Fiat',
      [MFR.SATURN]: 'Saturn',
      [MFR.MERCURY]: 'Mercury',
      [MFR.GENESIS]: 'Genesis',
      [MFR.SAAB]: 'Saab',
      [MFR.OLDSMOBILE]: 'Oldsmobile',
      [MFR.PLYMOUTH]: 'Plymouth',
      [MFR.GEO]: 'Geo',
      [MFR.DAEWOO]: 'Daewoo',
      [MFR.EAGLE]: 'Eagle',
      [MFR.SMART]: 'Smart',
      [MFR.HUMMER]: 'Hummer',
      [MFR.ISUZU]: 'Isuzu',
    };

    console.log('=== VERIFICATION ===');
    let totalAfter = 0;
    for (const r of countAfter.rows) {
      const name = mfrNames[r.manufacturer_id] || r.manufacturer_id;
      console.log(`  ${name}: ${r.count} keys`);
      totalAfter += parseInt(r.count);
    }
    console.log(`  TOTAL: ${totalAfter} keys`);

  } catch (txErr) {
    await client.query('ROLLBACK');
    console.error('Transaction rolled back:', txErr.message);
    throw txErr;
  } finally {
    await client.end();
    console.log('\nDone.');
  }
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
