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

const CADILLAC_MFR_ID = '47cdc256-7e6a-450d-ba9b-c267432cccf7';
const JEEP_MFR_ID = '7613f885-319a-4a0d-8167-e930804c4431';

// ============================================================
// Existing vehicle_models we already have:
//
// CADILLAC:
//   ATS:      47b5883e-1897-4473-bc4e-020106830e6d
//   CT4:      73c96a59-f57c-43fc-915c-5e85a97e6321
//   CT5:      3e130b83-21c2-435d-8697-cc99b75ae82b
//   CTS:      c02b1793-4e7f-4c73-8ea9-2491209bdf54
//   DeVille:  a70e9fd1-d75c-40fb-8850-5f273747a357
//   DTS:      e2aa6a1b-8886-49df-87c7-1fdc0ef87db6
//   Escalade: 72a2c819-6dc9-45fb-be6a-44d29077e9fc
//   Escalade ESV: 2de312a4-7ad2-448b-9756-99d2c1053345
//   Lyriq:    6b9e0e46-4aa1-4155-a11c-f00e8f012043
//   SRX:      f7456302-4732-4c7e-81b9-5df4873e5e21
//   STS:      20526a7d-0bc7-40a3-aa75-8212f1480d02
//   XT4:      34497d79-2c90-421b-b787-46a64dfc89ad
//   XT5:      f00a3c50-49f5-4d09-94fc-1388e134e077
//   XT6:      ae6e6b26-fbaf-4d94-819a-2c5fa8c4f7eb
//   (Missing: Eldorado, Seville, ELR, CT6, XTS)
//
// JEEP:
//   Cherokee:       98a69702-08db-46ba-b554-71c0b3383f7a
//   Commander:      8b7c0d8f-73d3-4573-af10-599cb9b17565
//   Compass:        56f8807c-879e-4eb0-8c54-a444d909e279
//   Gladiator:      73c7a91b-6aab-4959-9a7e-6e9394a14383
//   Grand Cherokee: 4cbd8714-ebc8-40fa-8eb1-8caec72461a2
//   Grand Wagoneer: a4da2c7c-0258-4ab3-8f0f-841c6e0602d1
//   Liberty:        fecda1bd-953e-4867-84e3-3f308b832371
//   Patriot:        4cc0951f-a4b9-4506-834b-20eb7d139f56
//   Renegade:       710d02f6-75fa-49be-8f67-baed840f086f
//   Wagoneer:       bcf97ef5-3788-457f-b7cf-30cc631bf0cc
//   Wrangler:       86460246-4193-4b0c-8281-f2ae50aeac09
//   (Missing: Grand Cherokee L)
// ============================================================

// Models that need to be created
const newCadillacModels = [
  { name: 'Eldorado', slug: 'eldorado' },
  { name: 'Seville',  slug: 'seville' },
  { name: 'ELR',      slug: 'elr' },
  { name: 'CT6',      slug: 'ct6' },
  { name: 'XTS',      slug: 'xts' },
];

const newJeepModels = [
  { name: 'Grand Cherokee L', slug: 'grand-cherokee-l' },
];

// ============================================================
// CADILLAC KEY DATA
// Sourced from: UHS Hardware, Tom's Key, Keyless Entry Remote,
// STRATTEC, Locksmith Charley, iKeyless, American Key Supply
// ============================================================
// Each key entry uses `_model` to reference an existing or new vehicle_model name,
// and `_yearRange` to match a vehicle_years entry.
const cadillacKeys = [

  // =====================================================
  // CADILLAC DEVILLE (model: DeVille)
  // =====================================================
  {
    _model: 'DeVille', _yearRange: [1997, 1999],
    model_name: 'Cadillac DeVille', year_start: 1997, year_end: 1999,
    key_blank: 'B97-PT', transponder_type: 'PK3 VATS', chip_type: 'Megamos 13',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3 (Passkey 3) transponder system. Requires 10-minute relearn per key (3 cycles = 30 min). Tech2 or equivalent for all-keys-lost. B97 key blank.',
  },
  {
    _model: 'DeVille', _yearRange: [2000, 2005],
    model_name: 'Cadillac DeVille', year_start: 2000, year_end: 2005,
    key_blank: 'B99-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3+ system with Megamos 48 chip. 10-minute relearn procedure (3 cycles). Tech2 or Autel for all-keys-lost. B99 key blade.',
  },

  // =====================================================
  // CADILLAC ELDORADO (model: Eldorado) - NEW
  // =====================================================
  {
    _model: 'Eldorado', _yearRange: [1997, 2002],
    model_name: 'Cadillac Eldorado', year_start: 1997, year_end: 2002,
    key_blank: 'B97-PT', transponder_type: 'PK3 VATS', chip_type: 'Megamos 13',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3 VATS system. 10-minute relearn procedure (3 cycles = 30 min). Tech2 for all-keys-lost. Last model year 2002.',
  },

  // =====================================================
  // CADILLAC SEVILLE (model: Seville) - NEW
  // =====================================================
  {
    _model: 'Seville', _yearRange: [1997, 2004],
    model_name: 'Cadillac Seville', year_start: 1997, year_end: 2004,
    key_blank: 'B97-PT', transponder_type: 'PK3 VATS', chip_type: 'Megamos 13',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3 VATS system with Megamos 13 chip. 10-minute relearn procedure. Tech2 for all-keys-lost. Last model year 2004.',
  },

  // =====================================================
  // CADILLAC DTS (model: DTS)
  // =====================================================
  {
    _model: 'DTS', _yearRange: [2006, 2011],
    model_name: 'Cadillac DTS', year_start: 2006, year_end: 2011,
    key_blank: 'B111-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3+ system. Transponder key only (no remote). 10-minute relearn procedure. B111 key blade.',
  },
  {
    _model: 'DTS', _yearRange: [2006, 2011],
    model_name: 'Cadillac DTS', year_start: 2006, year_end: 2011,
    key_blank: 'B111-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUC6000066', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start',
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Smart key with push-button start. 4 buttons: Lock, Unlock, Panic, Remote Start. PK3+ system. Program via Tech2 or Autel IM508/IM608.',
  },

  // =====================================================
  // CADILLAC CTS (model: CTS)
  // =====================================================
  // CTS 2003-2007 - Transponder key
  {
    _model: 'CTS', _yearRange: [2003, 2007],
    model_name: 'Cadillac CTS', year_start: 2003, year_end: 2007,
    key_blank: 'B106-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3+ transponder system. 10-minute relearn procedure (3 cycles = 30 min). Tech2 or Autel for all-keys-lost. B106 key blank.',
  },
  // CTS 2008-2013 - Smart Key 4 button (OUC6000066)
  {
    _model: 'CTS', _yearRange: [2008, 2013],
    model_name: 'Cadillac CTS', year_start: 2008, year_end: 2013,
    key_blank: 'B111-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUC6000066', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start',
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Remote head key / proximity key. 4 buttons: Lock, Unlock, Panic, Remote Start. PK3+ system. 10-minute relearn for transponder. Program remote via Tech2 or Autel IM508/IM608.',
  },
  // CTS 2014-2019 - Smart Key HYQ2AB 5 button
  {
    _model: 'CTS', _yearRange: [2014, 2019],
    model_name: 'Cadillac CTS', year_start: 2014, year_end: 2019,
    key_blank: 'HU100', transponder_type: 'Hitag2', chip_type: 'PCF7937E',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'HYQ2AB', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Trunk',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. FCC: HYQ2AB. Program with Autel IM508/IM608 or VVDI Key Tool. Push-button start.',
  },

  // =====================================================
  // CADILLAC STS (model: STS)
  // =====================================================
  {
    _model: 'STS', _yearRange: [2005, 2011],
    model_name: 'Cadillac STS', year_start: 2005, year_end: 2007,
    key_blank: 'B106-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3+ transponder system. 10-minute relearn procedure. Tech2 or Autel for all-keys-lost. B106 key blank.',
  },
  {
    _model: 'STS', _yearRange: [2005, 2011],
    model_name: 'Cadillac STS', year_start: 2005, year_end: 2011,
    key_blank: 'B111-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUC6000066', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start',
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Smart key / remote head key with keyless entry. 4 buttons: Lock, Unlock, Panic, Remote Start. Program via Tech2 or Autel.',
  },

  // =====================================================
  // CADILLAC SRX (model: SRX)
  // =====================================================
  // SRX 2004-2009 - Transponder
  {
    _model: 'SRX', _yearRange: [2004, 2009],
    model_name: 'Cadillac SRX', year_start: 2004, year_end: 2006,
    key_blank: 'B106-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3+ transponder system. 10-minute relearn procedure. B106 key blank.',
  },
  {
    _model: 'SRX', _yearRange: [2004, 2009],
    model_name: 'Cadillac SRX', year_start: 2007, year_end: 2009,
    key_blank: 'B111-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUC6000066', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Remote head key with PK3+ transponder. 4 buttons. B111 key blank. 10-minute relearn for transponder. Program remote via Tech2 or Autel.',
  },
  // SRX 2010-2016 - Smart Key 5 button
  {
    _model: 'SRX', _yearRange: [2010, 2016],
    model_name: 'Cadillac SRX', year_start: 2010, year_end: 2016,
    key_blank: 'B111-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'NBG009768T', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Hatch',
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Smart proximity key with push-button start. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. FCC: NBG009768T. Program via Tech2 or Autel IM508/IM608. Replaced by XT5 in 2017.',
  },

  // =====================================================
  // CADILLAC ESCALADE (model: Escalade)
  // =====================================================
  // Escalade 1999-2006 - PK3/PK3+ Transponder
  {
    _model: 'Escalade', _yearRange: [1999, 2006],
    model_name: 'Cadillac Escalade', year_start: 1999, year_end: 2002,
    key_blank: 'B97-PT', transponder_type: 'PK3', chip_type: 'Megamos 13',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3 system. 10-minute relearn procedure. Tech2 for all-keys-lost. Uses separate key fob remote.',
  },
  {
    _model: 'Escalade', _yearRange: [1999, 2006],
    model_name: 'Cadillac Escalade', year_start: 2003, year_end: 2006,
    key_blank: 'B99-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3+ system with Megamos 48 chip. 10-minute relearn procedure. Tech2 for all-keys-lost. B99 key blade.',
  },
  // Escalade 2007-2014 - Remote Head Key / OUC6000066
  {
    _model: 'Escalade', _yearRange: [2007, 2014],
    model_name: 'Cadillac Escalade', year_start: 2007, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUC6000066', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start',
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Remote Start, Panic. PK3+ system with 10-minute relearn. Program remote via Tech2 or Autel.',
  },
  // Escalade 2015-2020 - Smart Key HYQ2AB 5 button
  {
    _model: 'Escalade', _yearRange: [2015, 2020],
    model_name: 'Cadillac Escalade', year_start: 2015, year_end: 2020,
    key_blank: 'HU100', transponder_type: 'Hitag2', chip_type: 'PCF7937E',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'HYQ2AB', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. FCC: HYQ2AB. Program with Autel IM508/IM608 or VVDI.',
  },
  // Escalade 2021-2024 - Smart Key YG0G20TB1 5 button
  {
    _model: 'Escalade', _yearRange: [2021, 2024],
    model_name: 'Cadillac Escalade', year_start: 2021, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'NCF29A1M', chip_type: 'NCF29A1M',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'YG0G20TB1', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'New generation smart key. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. Requires Autel IM608 Pro II, XTOOL, or dealer tool. NOT OBD programmable - requires online IMMO pairing.',
  },

  // =====================================================
  // CADILLAC ESCALADE ESV (model: Escalade ESV)
  // Same keys as Escalade, separate model entry
  // =====================================================
  {
    _model: 'Escalade ESV', _yearRange: [2007, 2014],
    model_name: 'Cadillac Escalade ESV', year_start: 2007, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUC6000066', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start',
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Extended version of Escalade. Remote head key. Same key as standard Escalade. 4 buttons: Lock, Unlock, Remote Start, Panic. PK3+ with 10-minute relearn.',
  },
  {
    _model: 'Escalade ESV', _yearRange: [2015, 2020],
    model_name: 'Cadillac Escalade ESV', year_start: 2015, year_end: 2020,
    key_blank: 'HU100', transponder_type: 'Hitag2', chip_type: 'PCF7937E',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'HYQ2AB', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Extended version of Escalade. Smart proximity key. Same key as standard Escalade. FCC: HYQ2AB. Program with Autel IM508/IM608.',
  },
  {
    _model: 'Escalade ESV', _yearRange: [2021, 2024],
    model_name: 'Cadillac Escalade ESV', year_start: 2021, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'NCF29A1M', chip_type: 'NCF29A1M',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'YG0G20TB1', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Extended version of Escalade. New generation smart key. NOT OBD programmable - requires online IMMO pairing. Autel IM608 Pro II or dealer.',
  },

  // =====================================================
  // CADILLAC ATS (model: ATS)
  // =====================================================
  // ATS 2013-2014 - Smart Key OUC6000066
  {
    _model: 'ATS', _yearRange: [2013, 2019],
    model_name: 'Cadillac ATS', year_start: 2013, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'OUC6000066', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Trunk',
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Smart key with push-button start. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. PK3+ system. Program via Tech2 or Autel IM508/IM608.',
  },
  // ATS 2015-2019 - Smart Key HYQ2AB
  {
    _model: 'ATS', _yearRange: [2013, 2019],
    model_name: 'Cadillac ATS', year_start: 2015, year_end: 2019,
    key_blank: 'HU100', transponder_type: 'Hitag2', chip_type: 'PCF7937E',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'HYQ2AB', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Trunk',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. FCC: HYQ2AB. Program with Autel IM508/IM608 or VVDI Key Tool.',
  },

  // =====================================================
  // CADILLAC XTS (model: XTS) - NEW MODEL
  // =====================================================
  // XTS 2013-2014 - Smart Key OUC6000066
  {
    _model: 'XTS', _yearRange: [2013, 2019],
    model_name: 'Cadillac XTS', year_start: 2013, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'OUC6000066', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Trunk',
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Smart key with push-button start. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. PK3+ system. Program via Tech2 or Autel.',
  },
  // XTS 2015-2019 - Smart Key HYQ2AB
  {
    _model: 'XTS', _yearRange: [2013, 2019],
    model_name: 'Cadillac XTS', year_start: 2015, year_end: 2019,
    key_blank: 'HU100', transponder_type: 'Hitag2', chip_type: 'PCF7937E',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'HYQ2AB', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Trunk',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. FCC: HYQ2AB. Program with Autel IM508/IM608.',
  },

  // =====================================================
  // CADILLAC ELR (model: ELR) - NEW MODEL
  // =====================================================
  {
    _model: 'ELR', _yearRange: [2014, 2016],
    model_name: 'Cadillac ELR', year_start: 2014, year_end: 2016,
    key_blank: 'B111-PT', transponder_type: 'PK3+', chip_type: 'Megamos 48',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'NBG009768T', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Trunk',
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Extended-range EV coupe. Smart key with push-button start. 5 buttons. Program via Tech2 or Autel. Based on Chevrolet Volt platform.',
  },

  // =====================================================
  // CADILLAC CT6 (model: CT6) - NEW MODEL
  // =====================================================
  {
    _model: 'CT6', _yearRange: [2016, 2020],
    model_name: 'Cadillac CT6', year_start: 2016, year_end: 2020,
    key_blank: 'HU100', transponder_type: 'Hitag2', chip_type: 'PCF7937E',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'HYQ2EB', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Trunk',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Flagship sedan. Smart proximity key. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. FCC: HYQ2EB. Program with Autel IM508/IM608 or VVDI Key Tool.',
  },

  // =====================================================
  // CADILLAC CT5 (model: CT5)
  // =====================================================
  {
    _model: 'CT5', _yearRange: [2020, 2024],
    model_name: 'Cadillac CT5', year_start: 2020, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'NCF29A1M', chip_type: 'NCF29A1M',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'YG0G20TB1', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Trunk',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'New generation smart key. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. NOT OBD programmable - online IMMO pairing required. Autel IM608 Pro II or dealer.',
  },

  // =====================================================
  // CADILLAC CT4 (model: CT4)
  // =====================================================
  {
    _model: 'CT4', _yearRange: [2020, 2024],
    model_name: 'Cadillac CT4', year_start: 2020, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'NCF29A1M', chip_type: 'NCF29A1M',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'YG0G20TB1', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Trunk',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'New generation smart key. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. NOT OBD programmable - online IMMO pairing required. Autel IM608 Pro II or dealer.',
  },

  // =====================================================
  // CADILLAC XT5 (model: XT5)
  // =====================================================
  // XT5 2017-2019 - Smart Key HYQ2AB
  {
    _model: 'XT5', _yearRange: [2017, 2019],
    model_name: 'Cadillac XT5', year_start: 2017, year_end: 2019,
    key_blank: 'HU100', transponder_type: 'Hitag2', chip_type: 'PCF7937E',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'HYQ2AB', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. FCC: HYQ2AB. Program with Autel IM508/IM608.',
  },
  // XT5 2020-2024 - Smart Key YG0G20TB1
  {
    _model: 'XT5', _yearRange: [2020, 2024],
    model_name: 'Cadillac XT5', year_start: 2020, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'NCF29A1M', chip_type: 'NCF29A1M',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'YG0G20TB1', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'New generation smart key. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. NOT OBD programmable - requires Autel IM608 Pro II or dealer for online IMMO pairing.',
  },

  // =====================================================
  // CADILLAC XT4 (model: XT4)
  // =====================================================
  {
    _model: 'XT4', _yearRange: [2019, 2024],
    model_name: 'Cadillac XT4', year_start: 2019, year_end: 2019,
    key_blank: 'HU100', transponder_type: 'Hitag2', chip_type: 'PCF7937E',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'HYQ2AB', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. FCC: HYQ2AB. Program with Autel IM508/IM608.',
  },
  {
    _model: 'XT4', _yearRange: [2019, 2024],
    model_name: 'Cadillac XT4', year_start: 2020, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'NCF29A1M', chip_type: 'NCF29A1M',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'YG0G20TB1', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'New generation smart key. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. NOT OBD programmable - requires Autel IM608 Pro II or dealer.',
  },

  // =====================================================
  // CADILLAC XT6 (model: XT6)
  // =====================================================
  {
    _model: 'XT6', _yearRange: [2020, 2024],
    model_name: 'Cadillac XT6', year_start: 2020, year_end: 2024,
    key_blank: 'HU100', transponder_type: 'NCF29A1M', chip_type: 'NCF29A1M',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'YG0G20TB1', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. NOT OBD programmable - requires Autel IM608 Pro II or dealer for online IMMO pairing.',
  },

  // =====================================================
  // CADILLAC LYRIQ (model: Lyriq)
  // =====================================================
  {
    _model: 'Lyriq', _yearRange: [2023, 2025],
    model_name: 'Cadillac Lyriq', year_start: 2023, year_end: 2025,
    key_blank: 'HU100', transponder_type: 'NCF29A1M', chip_type: 'NCF29A1M',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'YG0G21TB2', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'All-electric luxury SUV. Smart key with 4 buttons: Lock, Unlock, Liftgate, Panic. NOT OBD programmable. Requires dealer or Autel IM608 Pro II with online pairing.',
  },
];

// ============================================================
// JEEP KEY DATA
// Sourced from: UHS Hardware, Tom's Key, Keyless Entry Remote,
// STRATTEC, iKeyless, LocksmithResource, American Key Supply
// ============================================================
const jeepKeys = [

  // =====================================================
  // JEEP CHEROKEE (model: Cherokee)
  // XJ era: 1997-2001, KL era: 2014-2024
  // =====================================================
  // Cherokee XJ 1997-2001 - Transponder
  {
    _model: 'Cherokee', _yearRange: [1997, 2001],
    model_name: 'Jeep Cherokee XJ', year_start: 1997, year_end: 2001,
    key_blank: 'Y159-PT', transponder_type: 'Texas Fixed Code', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'SKIM (Sentry Key Immobilizer Module) with 4C chip. Requires DRB3 or equivalent for programming. PIN code required from dealer. Y159 key blade.',
  },
  // Cherokee KL 2014-2024 - Smart Key GQ4-54T 4 button
  {
    _model: 'Cherokee', _yearRange: [2014, 2024],
    model_name: 'Jeep Cherokee KL', year_start: 2014, year_end: 2018,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'GQ4-54T', ic_number: '7812A-54T',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Liftgate, Panic. FCC: GQ4-54T. Requires PIN code from dealer or Chrysler WITECH. Program with Autel IM508/IM608 or VVDI.',
  },
  // Cherokee KL 2014-2018 - Smart Key GQ4-54T 5 button (with Remote Start)
  {
    _model: 'Cherokee', _yearRange: [2014, 2024],
    model_name: 'Jeep Cherokee KL', year_start: 2014, year_end: 2018,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'GQ4-54T', ic_number: '7812A-54T',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key with Remote Start. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. FCC: GQ4-54T. Requires PIN code.',
  },
  // Cherokee KL 2019-2023 - Smart Key M3N-40821302 4 button
  {
    _model: 'Cherokee', _yearRange: [2014, 2024],
    model_name: 'Jeep Cherokee KL', year_start: 2019, year_end: 2023,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Updated smart key. 4 buttons: Lock, Unlock, Liftgate, Panic. FCC: M3N-40821302. Requires PIN code. Program with Autel IM508/IM608.',
  },
  // Cherokee KL 2019-2023 - Smart Key M3N-40821302 5 button (with Remote Start)
  {
    _model: 'Cherokee', _yearRange: [2014, 2024],
    model_name: 'Jeep Cherokee KL', year_start: 2019, year_end: 2023,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Updated smart key with Remote Start. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. FCC: M3N-40821302. Requires PIN code.',
  },

  // =====================================================
  // JEEP COMMANDER (model: Commander)
  // =====================================================
  // Commander 2006-2010 - Transponder only
  {
    _model: 'Commander', _yearRange: [2006, 2010],
    model_name: 'Jeep Commander XK', year_start: 2006, year_end: 2010,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Transponder key only (no remote). SKIM system with 46 chip. PIN code required. Y160 key blade. Program with WiTECH or Autel.',
  },
  // Commander 2006-2010 - Remote Head Key
  {
    _model: 'Commander', _yearRange: [2006, 2010],
    model_name: 'Jeep Commander XK', year_start: 2006, year_end: 2010,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Hatch, Panic. SKIM system with 46 chip. PIN code required. Use WiTECH or Autel IM508/IM608.',
  },

  // =====================================================
  // JEEP COMPASS (model: Compass)
  // =====================================================
  // Compass MK 2007-2016 - Transponder (Mitsubishi platform)
  {
    _model: 'Compass', _yearRange: [2007, 2016],
    model_name: 'Jeep Compass', year_start: 2007, year_end: 2016,
    key_blank: 'MIT14-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    image_url: null,
    programming_notes: 'Transponder key with 46 chip. PIN code required. Uses Mitsubishi MIT14 key blade (Mitsubishi platform). Program with Autel or WiTECH.',
  },
  // Compass MK 2007-2016 - Remote Head Key 3 button
  {
    _model: 'Compass', _yearRange: [2007, 2016],
    model_name: 'Jeep Compass', year_start: 2007, year_end: 2016,
    key_blank: 'MIT14-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT692713AA', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    image_url: null,
    programming_notes: 'Remote head key. 3 buttons: Lock, Unlock, Panic. 46 chip. PIN code required. Mitsubishi-based platform, uses MIT14 blade.',
  },
  // Compass MP 2017-2024 - Smart Key M3N-40821302 4 button
  {
    _model: 'Compass', _yearRange: [2017, 2024],
    model_name: 'Jeep Compass MP', year_start: 2017, year_end: 2024,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Liftgate, Panic. FCC: M3N-40821302. Requires PIN code. Program with Autel IM508/IM608.',
  },
  // Compass MP 2017-2024 - Smart Key 5 button (Remote Start)
  {
    _model: 'Compass', _yearRange: [2017, 2024],
    model_name: 'Jeep Compass MP', year_start: 2017, year_end: 2024,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key with Remote Start. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. FCC: M3N-40821302. Requires PIN code.',
  },

  // =====================================================
  // JEEP PATRIOT (model: Patriot)
  // =====================================================
  // Patriot MK 2007-2017 - Transponder
  {
    _model: 'Patriot', _yearRange: [2007, 2017],
    model_name: 'Jeep Patriot MK', year_start: 2007, year_end: 2017,
    key_blank: 'MIT14-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    image_url: null,
    programming_notes: 'Transponder key with 46 chip. PIN code required. Mitsubishi-based platform, uses MIT14 blade. Program with Autel or WiTECH.',
  },
  // Patriot MK 2007-2017 - Remote Head Key 3 button
  {
    _model: 'Patriot', _yearRange: [2007, 2017],
    model_name: 'Jeep Patriot MK', year_start: 2007, year_end: 2017,
    key_blank: 'MIT14-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692713AA', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi MIT11',
    image_url: null,
    programming_notes: 'Remote head key. 3 buttons: Lock, Unlock, Panic. 46 chip, PIN code required. Mitsubishi platform, MIT14 blade.',
  },

  // =====================================================
  // JEEP LIBERTY (model: Liberty)
  // =====================================================
  // Liberty KJ 2002-2007 - Transponder
  {
    _model: 'Liberty', _yearRange: [2002, 2007],
    model_name: 'Jeep Liberty KJ', year_start: 2002, year_end: 2004,
    key_blank: 'Y160-PT', transponder_type: 'Texas Fixed Code', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'SKIM system with 4C chip. Requires DRB3 or equivalent for programming. PIN code required from dealer. Y160 key blade.',
  },
  {
    _model: 'Liberty', _yearRange: [2002, 2007],
    model_name: 'Jeep Liberty KJ', year_start: 2005, year_end: 2007,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'SKIM system upgraded to 46 chip. PIN code required. OBD programmable with Autel or WiTECH. Y160 key blade.',
  },
  // Liberty KJ 2002-2007 - Remote Head Key 3 button
  {
    _model: 'Liberty', _yearRange: [2002, 2007],
    model_name: 'Jeep Liberty KJ', year_start: 2005, year_end: 2007,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Remote head key. 3 buttons: Lock, Unlock, Panic. 46 chip. PIN code required.',
  },
  // Liberty KK 2008-2012 - Transponder
  {
    _model: 'Liberty', _yearRange: [2008, 2012],
    model_name: 'Jeep Liberty KK', year_start: 2008, year_end: 2012,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Transponder key only (no remote). SKIM system with 46 chip. PIN code required.',
  },
  // Liberty KK 2008-2012 - Remote Head Key 4 button (Hatch)
  {
    _model: 'Liberty', _yearRange: [2008, 2012],
    model_name: 'Jeep Liberty KK', year_start: 2008, year_end: 2012,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Hatch, Panic. 46 chip. PIN code required. Program with Autel IM508/IM608 or WiTECH.',
  },

  // =====================================================
  // JEEP RENEGADE (model: Renegade)
  // =====================================================
  // Renegade BU 2015-2024 - Smart Key 4 button
  {
    _model: 'Renegade', _yearRange: [2015, 2024],
    model_name: 'Jeep Renegade BU', year_start: 2015, year_end: 2024,
    key_blank: 'SIP22', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi SIP22',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Liftgate, Panic. FCC: M3N-40821302. Requires PIN code. Uses SIP22 (Fiat) emergency blade. Program with Autel IM508/IM608.',
  },
  // Renegade BU 2015-2024 - Smart Key 5 button (Remote Start)
  {
    _model: 'Renegade', _yearRange: [2015, 2024],
    model_name: 'Jeep Renegade BU', year_start: 2015, year_end: 2024,
    key_blank: 'SIP22', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi SIP22',
    image_url: null,
    programming_notes: 'Smart proximity key with Remote Start. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. Uses SIP22 (Fiat) emergency blade. Requires PIN code.',
  },

  // =====================================================
  // JEEP GRAND CHEROKEE (model: Grand Cherokee)
  // =====================================================
  // Grand Cherokee WJ 1999-2004 - Transponder
  {
    _model: 'Grand Cherokee', _yearRange: [1999, 2004],
    model_name: 'Jeep Grand Cherokee WJ', year_start: 1999, year_end: 2004,
    key_blank: 'Y159-PT', transponder_type: 'Texas Fixed Code', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'SKIM system with 4C chip. Requires DRB3 or equivalent for programming. PIN code required from dealer. Y159 key blade.',
  },
  // Grand Cherokee WK 2005-2007 - Transponder
  {
    _model: 'Grand Cherokee', _yearRange: [2005, 2013],
    model_name: 'Jeep Grand Cherokee WK', year_start: 2005, year_end: 2007,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'SKIM system with 46 chip. PIN code required. OBD programmable with Autel or WiTECH. Y160 key blade.',
  },
  // Grand Cherokee WK 2005-2007 - Remote Head Key 3 button
  {
    _model: 'Grand Cherokee', _yearRange: [2005, 2013],
    model_name: 'Jeep Grand Cherokee WK', year_start: 2005, year_end: 2007,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Hatch, Panic. 46 chip. PIN code required. Y160 blade.',
  },
  // Grand Cherokee WK 2008-2010 - Remote Head Key IYZ-C01C
  {
    _model: 'Grand Cherokee', _yearRange: [2005, 2013],
    model_name: 'Jeep Grand Cherokee WK', year_start: 2008, year_end: 2010,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ-C01C', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Remote head key. 4 buttons: Lock, Unlock, Hatch, Panic. FCC: IYZ-C01C. 46 chip. PIN code required.',
  },
  // Grand Cherokee WK2 2011-2013 - Smart Key M3N-40821302
  {
    _model: 'Grand Cherokee', _yearRange: [2005, 2013],
    model_name: 'Jeep Grand Cherokee WK2', year_start: 2011, year_end: 2013,
    key_blank: 'CY24', transponder_type: 'Hitag2', chip_type: '46 chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Liftgate, Panic. FCC: M3N-40821302. PIN code required. Program with Autel IM508/IM608.',
  },
  // Grand Cherokee WK2 2011-2013 - Smart Key M3N-40821302 5 button (Remote Start)
  {
    _model: 'Grand Cherokee', _yearRange: [2005, 2013],
    model_name: 'Jeep Grand Cherokee WK2', year_start: 2011, year_end: 2013,
    key_blank: 'CY24', transponder_type: 'Hitag2', chip_type: '46 chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key with Remote Start. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. FCC: M3N-40821302. PIN code required.',
  },
  // Grand Cherokee WK2 2014-2021 - Smart Key GQ4-54T 4 button
  {
    _model: 'Grand Cherokee', _yearRange: [2014, 2021],
    model_name: 'Jeep Grand Cherokee WK2', year_start: 2014, year_end: 2021,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'GQ4-54T', ic_number: '7812A-54T',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Liftgate, Panic. FCC: GQ4-54T. Requires PIN code.',
  },
  // Grand Cherokee WK2 2014-2021 - Smart Key GQ4-54T 5 button (Remote Start)
  {
    _model: 'Grand Cherokee', _yearRange: [2014, 2021],
    model_name: 'Jeep Grand Cherokee WK2', year_start: 2014, year_end: 2021,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'GQ4-54T', ic_number: '7812A-54T',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key with Remote Start. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. FCC: GQ4-54T. Requires PIN code. Program with Autel IM508/IM608 or VVDI.',
  },
  // Grand Cherokee WL 2022-2024 - Smart Key M3N-97395900 4 button
  {
    _model: 'Grand Cherokee', _yearRange: [2022, 2024],
    model_name: 'Jeep Grand Cherokee WL', year_start: 2022, year_end: 2024,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-97395900', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'New generation smart key. 4 buttons: Lock, Unlock, Liftgate, Panic. FCC: M3N-97395900. PIN code required.',
  },
  // Grand Cherokee WL 2022-2024 - Smart Key M3N-97395900 5 button (Remote Start)
  {
    _model: 'Grand Cherokee', _yearRange: [2022, 2024],
    model_name: 'Jeep Grand Cherokee WL', year_start: 2022, year_end: 2024,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-97395900', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'New generation smart key with Remote Start. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. FCC: M3N-97395900. Program with Autel IM608 Pro.',
  },

  // =====================================================
  // JEEP GRAND CHEROKEE L (model: Grand Cherokee L) - NEW
  // =====================================================
  {
    _model: 'Grand Cherokee L', _yearRange: [2021, 2024],
    model_name: 'Jeep Grand Cherokee L', year_start: 2021, year_end: 2024,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-97395900', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: '3-row Grand Cherokee. Smart proximity key. 4 buttons: Lock, Unlock, Liftgate, Panic. FCC: M3N-97395900. PIN code required.',
  },
  {
    _model: 'Grand Cherokee L', _yearRange: [2021, 2024],
    model_name: 'Jeep Grand Cherokee L', year_start: 2021, year_end: 2024,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-97395900', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: '3-row Grand Cherokee. Smart proximity key with Remote Start. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. FCC: M3N-97395900. PIN code required.',
  },

  // =====================================================
  // JEEP WRANGLER TJ 1997-2006 (model: Wrangler, yearRange [1997,2006])
  // =====================================================
  {
    _model: 'Wrangler', _yearRange: [1997, 2006],
    model_name: 'Jeep Wrangler TJ', year_start: 1997, year_end: 2006,
    key_blank: 'Y159-PT', transponder_type: 'Texas Fixed Code', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'SKIM system with 4C chip. Requires DRB3 or equivalent for programming. PIN code required from dealer. Y159 key blade. No remote available on TJ.',
  },

  // =====================================================
  // JEEP WRANGLER JK 2007-2017 (model: Wrangler, yearRange [2007,2017])
  // =====================================================
  // Wrangler JK - Transponder only
  {
    _model: 'Wrangler', _yearRange: [2007, 2017],
    model_name: 'Jeep Wrangler JK', year_start: 2007, year_end: 2017,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Transponder key only (no remote). SKIM system with 46 chip. PIN code required. OBD programmable with Autel or WiTECH. Y160 key blade.',
  },
  // Wrangler JK - Remote Head Key 3 button
  {
    _model: 'Wrangler', _yearRange: [2007, 2017],
    model_name: 'Jeep Wrangler JK', year_start: 2007, year_end: 2017,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46 chip',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2016', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Remote head key. 3 buttons: Lock, Unlock, Panic. 46 chip. PIN code required. FCC: OHT692427AA. Program with Autel IM508/IM608.',
  },

  // =====================================================
  // JEEP WRANGLER JL 2018-2024 (model: Wrangler, yearRange [2018,2024])
  // =====================================================
  // Wrangler JL - Smart Key 4 button (Doors Off)
  {
    _model: 'Wrangler', _yearRange: [2018, 2024],
    model_name: 'Jeep Wrangler JL', year_start: 2018, year_end: 2024,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'OHT1130261', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Doors Off',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Doors Off (removes doors feature), Panic. FCC: OHT1130261. Requires PIN code. Program with Autel IM508/IM608.',
  },
  // Wrangler JL - Smart Key 5 button (Remote Start + Doors Off)
  {
    _model: 'Wrangler', _yearRange: [2018, 2024],
    model_name: 'Jeep Wrangler JL', year_start: 2018, year_end: 2024,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'OHT1130261', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Doors Off, Remote Start',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key with Remote Start. 5 buttons: Lock, Unlock, Doors Off, Remote Start, Panic. FCC: OHT1130261. Requires PIN code.',
  },
  // Wrangler JL - Transponder only (emergency/valet key)
  {
    _model: 'Wrangler', _yearRange: [2018, 2024],
    model_name: 'Jeep Wrangler JL', year_start: 2018, year_end: 2024,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Transponder key only - emergency/valet key. 4A chip. PIN code required. CY24 key blade. Can be used to start vehicle without fob.',
  },

  // =====================================================
  // JEEP GLADIATOR (model: Gladiator)
  // =====================================================
  // Gladiator JT 2020-2024 - Smart Key 4 button (Doors Off)
  {
    _model: 'Gladiator', _yearRange: [2020, 2024],
    model_name: 'Jeep Gladiator JT', year_start: 2020, year_end: 2024,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'OHT1130261', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Doors Off',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key. Same key as Wrangler JL. 4 buttons: Lock, Unlock, Doors Off, Panic. FCC: OHT1130261. Requires PIN code. Program with Autel IM508/IM608.',
  },
  // Gladiator JT 2020-2024 - Smart Key 5 button (Remote Start)
  {
    _model: 'Gladiator', _yearRange: [2020, 2024],
    model_name: 'Jeep Gladiator JT', year_start: 2020, year_end: 2024,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'OHT1130261', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Doors Off, Remote Start',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key with Remote Start. 5 buttons: Lock, Unlock, Doors Off, Remote Start, Panic. FCC: OHT1130261. Requires PIN code.',
  },

  // =====================================================
  // JEEP WAGONEER (model: Wagoneer)
  // =====================================================
  {
    _model: 'Wagoneer', _yearRange: [2022, 2024],
    model_name: 'Jeep Wagoneer', year_start: 2022, year_end: 2024,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-97395900', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. FCC: M3N-97395900. Requires PIN code. Program with Autel IM608 Pro.',
  },

  // =====================================================
  // JEEP GRAND WAGONEER (model: Grand Wagoneer)
  // =====================================================
  {
    _model: 'Grand Wagoneer', _yearRange: [2022, 2024],
    model_name: 'Jeep Grand Wagoneer', year_start: 2022, year_end: 2024,
    key_blank: 'CY24', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-97395900', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Premium full-size SUV. Smart proximity key. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. FCC: M3N-97395900. Requires PIN code. Program with Autel IM608 Pro.',
  },
];

// ============================================================
// HELPER: Find or create vehicle_year entry
// ============================================================
// Cache: { "ModelName|startYear-endYear": year_id }
const yearIdCache = {};

async function getOrCreateYearId(client, mfrId, modelName, yearStart, yearEnd) {
  const cacheKey = `${modelName}|${yearStart}-${yearEnd}`;
  if (yearIdCache[cacheKey]) return yearIdCache[cacheKey];

  // Look for existing vehicle_years entry that covers this range
  const res = await client.query(`
    SELECT vy.id
    FROM vehicle_years vy
    JOIN vehicle_models vm ON vy.model_id = vm.id
    WHERE vm.manufacturer_id = $1
      AND vm.name = $2
      AND vy.year_start = $3
      AND vy.year_end = $4
    LIMIT 1
  `, [mfrId, modelName, yearStart, yearEnd]);

  if (res.rows.length > 0) {
    yearIdCache[cacheKey] = res.rows[0].id;
    return res.rows[0].id;
  }

  // Try to find any vehicle_years for this model that overlaps
  const overlap = await client.query(`
    SELECT vy.id
    FROM vehicle_years vy
    JOIN vehicle_models vm ON vy.model_id = vm.id
    WHERE vm.manufacturer_id = $1
      AND vm.name = $2
      AND vy.year_start <= $4
      AND vy.year_end >= $3
    ORDER BY vy.year_start
    LIMIT 1
  `, [mfrId, modelName, yearStart, yearEnd]);

  if (overlap.rows.length > 0) {
    yearIdCache[cacheKey] = overlap.rows[0].id;
    return overlap.rows[0].id;
  }

  // Need to find or create vehicle_model first
  let modelId;
  const modelRes = await client.query(`
    SELECT id FROM vehicle_models
    WHERE manufacturer_id = $1 AND name = $2
    LIMIT 1
  `, [mfrId, modelName]);

  if (modelRes.rows.length > 0) {
    modelId = modelRes.rows[0].id;
  } else {
    // Create new model
    const slug = modelName.toLowerCase().replace(/\s+/g, '-');
    const ins = await client.query(`
      INSERT INTO vehicle_models (manufacturer_id, name, slug)
      VALUES ($1, $2, $3)
      RETURNING id
    `, [mfrId, modelName, slug]);
    modelId = ins.rows[0].id;
    console.log(`  Created vehicle_model: ${modelName} (${modelId})`);
  }

  // Create vehicle_years entry
  const vyIns = await client.query(`
    INSERT INTO vehicle_years (model_id, year_start, year_end)
    VALUES ($1, $2, $3)
    RETURNING id
  `, [modelId, yearStart, yearEnd]);
  const yearId = vyIns.rows[0].id;
  yearIdCache[cacheKey] = yearId;
  console.log(`  Created vehicle_year: ${modelName} ${yearStart}-${yearEnd} (${yearId})`);
  return yearId;
}

// ============================================================
// MAIN EXECUTION
// ============================================================
async function main() {
  await client.connect();
  console.log('Connected to database.');

  try {
    await client.query('BEGIN');

    // Delete all existing Cadillac rows
    const delCadillac = await client.query(
      'DELETE FROM automotive_keys WHERE manufacturer_id = $1',
      [CADILLAC_MFR_ID]
    );
    console.log(`Deleted ${delCadillac.rowCount} existing Cadillac rows.`);

    // Delete all existing Jeep rows
    const delJeep = await client.query(
      'DELETE FROM automotive_keys WHERE manufacturer_id = $1',
      [JEEP_MFR_ID]
    );
    console.log(`Deleted ${delJeep.rowCount} existing Jeep rows.`);

    // Insert Cadillac keys
    console.log('\n--- Inserting Cadillac keys ---');
    let cadillacCount = 0;
    for (const k of cadillacKeys) {
      const yearId = await getOrCreateYearId(
        client, CADILLAC_MFR_ID, k._model, k._yearRange[0], k._yearRange[1]
      );

      await client.query(
        `INSERT INTO automotive_keys (
          year_id, manufacturer_id, model_name, year_start, year_end,
          key_blank, transponder_type, chip_type,
          remote_frequency, key_type, fcc_id, ic_number,
          battery_type, buttons,
          emergency_key_blank, test_key_blank,
          obd_programmable, pin_code_required,
          lishi_tool, image_url, programming_notes
        ) VALUES (
          $1, $2, $3, $4, $5,
          $6, $7, $8,
          $9, $10, $11, $12,
          $13, $14,
          $15, $16,
          $17, $18,
          $19, $20, $21
        )`,
        [
          yearId, CADILLAC_MFR_ID, k.model_name, k.year_start, k.year_end,
          k.key_blank, k.transponder_type, k.chip_type,
          k.remote_frequency, k.key_type, k.fcc_id, k.ic_number,
          k.battery_type, k.buttons,
          k.emergency_key_blank, k.test_key_blank,
          k.obd_programmable, k.pin_code_required,
          k.lishi_tool, k.image_url, k.programming_notes
        ]
      );
      cadillacCount++;
    }
    console.log(`Inserted ${cadillacCount} Cadillac rows.`);

    // Insert Jeep keys
    console.log('\n--- Inserting Jeep keys ---');
    let jeepCount = 0;
    for (const k of jeepKeys) {
      const yearId = await getOrCreateYearId(
        client, JEEP_MFR_ID, k._model, k._yearRange[0], k._yearRange[1]
      );

      await client.query(
        `INSERT INTO automotive_keys (
          year_id, manufacturer_id, model_name, year_start, year_end,
          key_blank, transponder_type, chip_type,
          remote_frequency, key_type, fcc_id, ic_number,
          battery_type, buttons,
          emergency_key_blank, test_key_blank,
          obd_programmable, pin_code_required,
          lishi_tool, image_url, programming_notes
        ) VALUES (
          $1, $2, $3, $4, $5,
          $6, $7, $8,
          $9, $10, $11, $12,
          $13, $14,
          $15, $16,
          $17, $18,
          $19, $20, $21
        )`,
        [
          yearId, JEEP_MFR_ID, k.model_name, k.year_start, k.year_end,
          k.key_blank, k.transponder_type, k.chip_type,
          k.remote_frequency, k.key_type, k.fcc_id, k.ic_number,
          k.battery_type, k.buttons,
          k.emergency_key_blank, k.test_key_blank,
          k.obd_programmable, k.pin_code_required,
          k.lishi_tool, k.image_url, k.programming_notes
        ]
      );
      jeepCount++;
    }
    console.log(`Inserted ${jeepCount} Jeep rows.`);

    await client.query('COMMIT');
    console.log('\nTransaction committed successfully.');

    // Verify counts
    const cadVerify = await client.query(
      'SELECT COUNT(*) as cnt FROM automotive_keys WHERE manufacturer_id = $1',
      [CADILLAC_MFR_ID]
    );
    console.log(`\nVerification - Cadillac rows in DB: ${cadVerify.rows[0].cnt}`);

    const jeepVerify = await client.query(
      'SELECT COUNT(*) as cnt FROM automotive_keys WHERE manufacturer_id = $1',
      [JEEP_MFR_ID]
    );
    console.log(`Verification - Jeep rows in DB: ${jeepVerify.rows[0].cnt}`);

    // Show breakdown by model
    console.log('\n--- CADILLAC BREAKDOWN ---');
    const cadModels = await client.query(
      `SELECT model_name, COUNT(*) as cnt
       FROM automotive_keys
       WHERE manufacturer_id = $1
       GROUP BY model_name
       ORDER BY model_name`,
      [CADILLAC_MFR_ID]
    );
    for (const row of cadModels.rows) {
      console.log(`  ${row.model_name}: ${row.cnt} variant(s)`);
    }

    console.log('\n--- JEEP BREAKDOWN ---');
    const jeepModels = await client.query(
      `SELECT model_name, COUNT(*) as cnt
       FROM automotive_keys
       WHERE manufacturer_id = $1
       GROUP BY model_name
       ORDER BY model_name`,
      [JEEP_MFR_ID]
    );
    for (const row of jeepModels.rows) {
      console.log(`  ${row.model_name}: ${row.cnt} variant(s)`);
    }

    const totalVerify = await client.query(
      'SELECT COUNT(*) as cnt FROM automotive_keys WHERE manufacturer_id IN ($1, $2)',
      [CADILLAC_MFR_ID, JEEP_MFR_ID]
    );
    console.log(`\nTOTAL Cadillac + Jeep rows: ${totalVerify.rows[0].cnt}`);

  } catch (err) {
    await client.query('ROLLBACK');
    console.error('Error - transaction rolled back:', err.message);
    console.error(err);
    throw err;
  } finally {
    await client.end();
    console.log('\nDatabase connection closed.');
  }
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
