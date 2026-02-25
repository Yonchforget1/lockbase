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

const BMW_MFR_ID = 'cf586faf-7ba2-4438-87c2-11e70ea0fb14';
const SUBARU_MFR_ID = '9be9be5e-22fd-46cc-95b1-2dad7dbc92d6';

const BMW_MODEL_IDS = {
  '2 Series':  '179d52e2-9939-4c4e-8a36-a1f9498934ac',
  '3 Series':  '9abd1d8b-b7e6-4def-b92f-de7c60f1df85',
  '4 Series':  'bc12573a-4919-4ee3-995c-647b051b7c52',
  '5 Series':  '4aa8ab1d-d645-4764-a6b5-b6a637aed85a',
  '6 Series':  'e37d5674-4cb2-459f-bd65-47df096aaa19',
  '7 Series':  '3363e9a2-278c-4ccc-a6bc-2e9984725812',
  '8 Series':  '5d37471b-1af6-4192-afa0-be1f764a8ad7',
  'i4':        'c68ba05c-9155-4772-965d-cad504a8f375',
  'iX':        '13f31c14-c583-4b97-bb04-7353f080cc50',
  'X1':        'efcdf4b8-2aa5-432d-aee0-8a94c57cfe94',
  'X2':        '9acf3426-443d-472c-b2fd-7f42bc509a1e',
  'X3':        'f6ef2f77-08f7-4679-8825-888973d06633',
  'X4':        'cdf3344d-66c5-4e89-b400-c420ad53ee2d',
  'X5':        '4bdebde4-e7c9-4f24-acdf-b76c64d11570',
  'X6':        '0749aacc-db65-4a12-8326-ea06d4546b5e',
  'X7':        '43d45ae9-6863-4026-9f47-47fd6f4c3841',
  'Z4':        'a8ee645e-c948-443c-b997-d26a4280527d',
};

const SUBARU_MODEL_IDS = {
  'Ascent':    'd3d52f2a-0a9f-46cc-a59f-2884fd5bcc1b',
  'Baja':      '7e92bd99-0651-43d5-9ca2-c50401f2ce3b',
  'BRZ':       'f695bfa2-fa23-476e-9407-ed2912db28c6',
  'Crosstrek': '74929189-787e-4241-98bc-4ca80f30eb08',
  'Forester':  'bb11b543-7996-4e83-a2fe-de5f850ebeb6',
  'Impreza':   'cf3801e3-374c-4b4e-8a80-44183d54d48b',
  'Legacy':    'e12a31ea-5a17-45eb-ac31-c28e9cdddfe8',
  'Outback':   '88e7cb8a-ee89-495a-b2a3-105565335eee',
  'Solterra':  'ec089756-6103-4df8-a75c-80f16ab5390f',
  'Tribeca':   '4f2e9230-e402-42ec-84b7-e672cfb26a03',
  'WRX':       '2c840da7-479f-442c-9aa2-534ffcba3990',
};

// UHS Hardware Shopify CDN base
const CDN = 'https://cdn.shopify.com/s/files/1/0052/5395/5651';

// ============================================================
// ACCURATE BMW KEY DATA
// ============================================================
const bmwKeys = [

  // ===== BMW 3 SERIES =====
  // 1995-2005 3 Series (E36/E46) - EWS Transponder - HU58
  {
    model: '3 Series', year_start: 1995, year_end: 2005,
    key_blank: 'HU58', transponder_type: 'Philips Crypto', chip_type: 'PCF7935 (ID44)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: 'HU58',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU58',
    image_url: `${CDN}/products/K-HU58.jpg`,
    programming_notes: 'EWS system transponder key. PCF7935 ID44 chip. 3-button remote head key. 315 MHz. Requires EWS programmer (AK90+, VVDI2, or CGDI BMW).',
  },
  // 2000-2005 3 Series (E46) - EWS Transponder - HU92
  {
    model: '3 Series', year_start: 2000, year_end: 2005,
    key_blank: 'HU92', transponder_type: 'Philips Crypto', chip_type: 'PCF7935 (ID44)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: 'HU92',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/K-HU92.jpg`,
    programming_notes: 'EWS system transponder key. HU92 2-track blade (newer E46 models). PCF7935 ID44 chip. Requires EWS programmer.',
  },
  // 2006-2011 3 Series (E90) - CAS3 Smart Key - 3 button
  {
    model: '3 Series', year_start: 2006, year_end: 2011,
    key_blank: 'HU92', transponder_type: 'Philips Crypto 46', chip_type: 'PCF7945 (ID46)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK49127', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU92', test_key_blank: 'HU92',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-CAS3-3B.jpg`,
    programming_notes: 'CAS3 slot key (non-proximity). 3-button. 315 MHz. PCF7945 ID46 chip. Does NOT have comfort access. Requires VVDI2, CGDI BMW, or Autel IM608.',
  },
  // 2006-2011 3 Series (E90) - CAS3 Smart Key - 4 button (Comfort Access)
  {
    model: '3 Series', year_start: 2006, year_end: 2011,
    key_blank: 'HU92', transponder_type: 'Philips Crypto 46', chip_type: 'PCF7945 (ID46)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK49123', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92', test_key_blank: 'HU92',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-CAS3-4B.jpg`,
    programming_notes: 'CAS3 smart key with Comfort Access (proximity). 4-button. 315 MHz. PCF7945 ID46 chip. Requires VVDI2, CGDI BMW, or Autel IM608.',
  },
  // 2012-2018 3 Series (F30) - CAS4/FEM Smart Key - 3 button
  {
    model: '3 Series', year_start: 2012, year_end: 2018,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-3B.jpg`,
    programming_notes: 'CAS4/CAS4+/FEM system. 3-button smart key. 315 MHz (NA). PCF7953 HITAG PRO ID49 chip. HU92R emergency blade. Requires VVDI2, CGDI BMW, Autel IM608, or Yanhua ACDP.',
  },
  // 2012-2018 3 Series (F30) - CAS4/FEM Smart Key - 4 button
  {
    model: '3 Series', year_start: 2012, year_end: 2018,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-4B.jpg`,
    programming_notes: 'CAS4/CAS4+/FEM system. 4-button smart key with Comfort Access. 315 MHz (NA). PCF7953 HITAG PRO ID49 chip. Requires VVDI2, CGDI BMW, Autel IM608, or Yanhua ACDP.',
  },
  // 2019-2025 3 Series (G20) - BDC Smart Key - 3 button
  {
    model: '3 Series', year_start: 2019, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-3B.jpg`,
    programming_notes: 'BDC system. 3-button smart key. 315 MHz (NA). HU100R emergency blade. Requires Autel IM608 w/ G-BOX3, CGDI BMW, or Yanhua ACDP2.',
  },
  // 2019-2025 3 Series (G20) - BDC Smart Key - 4 button
  {
    model: '3 Series', year_start: 2019, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-4B.jpg`,
    programming_notes: 'BDC system. 4-button smart key with Comfort Access. 315 MHz (NA). HU100R emergency blade. Requires Autel IM608 w/ G-BOX3, CGDI BMW, or Yanhua ACDP2.',
  },

  // ===== BMW 5 SERIES =====
  // 1997-2003 5 Series (E39) - EWS - HU58
  {
    model: '5 Series', year_start: 1997, year_end: 2003,
    key_blank: 'HU58', transponder_type: 'Philips Crypto', chip_type: 'PCF7935 (ID44)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: 'HU58',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU58',
    image_url: `${CDN}/products/K-HU58.jpg`,
    programming_notes: 'EWS system transponder key. HU58 4-track blade. PCF7935 ID44 chip. 315 MHz remote. Requires EWS programmer.',
  },
  // 2004-2010 5 Series (E60) - CAS2/CAS3 Smart Key - 3 button
  {
    model: '5 Series', year_start: 2004, year_end: 2010,
    key_blank: 'HU92', transponder_type: 'Philips Crypto 46', chip_type: 'PCF7945 (ID46)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK49127', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU92', test_key_blank: 'HU92',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-CAS3-3B.jpg`,
    programming_notes: 'CAS2/CAS3 slot key. 3-button. 315 MHz. PCF7945 ID46 chip. Non-proximity. Requires VVDI2, CGDI BMW, or Autel IM608.',
  },
  // 2004-2010 5 Series (E60) - CAS2/CAS3 Smart Key - 4 button (Comfort Access)
  {
    model: '5 Series', year_start: 2004, year_end: 2010,
    key_blank: 'HU92', transponder_type: 'Philips Crypto 46', chip_type: 'PCF7945 (ID46)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK49123', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92', test_key_blank: 'HU92',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-CAS3-4B.jpg`,
    programming_notes: 'CAS2/CAS3 smart key with Comfort Access (proximity). 4-button. 315 MHz. PCF7945 ID46 chip.',
  },
  // 2011-2016 5 Series (F10) - CAS4 Smart Key - 3 button
  {
    model: '5 Series', year_start: 2011, year_end: 2016,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-3B.jpg`,
    programming_notes: 'CAS4/CAS4+ system. 3-button smart key. 315 MHz (NA). PCF7953 HITAG PRO ID49 chip. HU92R emergency blade.',
  },
  // 2011-2016 5 Series (F10) - CAS4 Smart Key - 4 button
  {
    model: '5 Series', year_start: 2011, year_end: 2016,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-4B.jpg`,
    programming_notes: 'CAS4/CAS4+ system. 4-button smart key with Comfort Access. 315 MHz (NA). PCF7953 HITAG PRO ID49.',
  },
  // 2017-2025 5 Series (G30) - FEM/BDC Smart Key - 3 button
  {
    model: '5 Series', year_start: 2017, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-3B.jpg`,
    programming_notes: 'FEM/BDC system. 3-button smart key. 315 MHz (NA). HU100R emergency blade.',
  },
  // 2017-2025 5 Series (G30) - FEM/BDC Smart Key - 4 button
  {
    model: '5 Series', year_start: 2017, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-4B.jpg`,
    programming_notes: 'FEM/BDC system. 4-button smart key with Comfort Access. 315 MHz (NA). HU100R emergency blade.',
  },

  // ===== BMW 7 SERIES =====
  // 1995-2001 7 Series (E38) - EWS - HU58
  {
    model: '7 Series', year_start: 1995, year_end: 2001,
    key_blank: 'HU58', transponder_type: 'Philips Crypto', chip_type: 'PCF7935 (ID44)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: 'HU58',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU58',
    image_url: `${CDN}/products/K-HU58.jpg`,
    programming_notes: 'EWS system transponder key. HU58 blade. PCF7935 ID44 chip.',
  },
  // 2002-2008 7 Series (E65/E66) - CAS1/CAS2 Smart Key
  {
    model: '7 Series', year_start: 2002, year_end: 2008,
    key_blank: 'HU92', transponder_type: 'Philips Crypto 46', chip_type: 'PCF7942 (ID46)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'LX8FZV', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92', test_key_blank: 'HU92',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-CAS3-4B.jpg`,
    programming_notes: 'CAS1/CAS2 system. 4-button smart key. PCF7942 ID46 chip. First BMW with Comfort Access.',
  },
  // 2009-2015 7 Series (F01/F02) - CAS4 Smart Key - 4 button
  {
    model: '7 Series', year_start: 2009, year_end: 2015,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-4B.jpg`,
    programming_notes: 'CAS4 system. 4-button smart key with Comfort Access. 315 MHz (NA). PCF7953 HITAG PRO ID49.',
  },
  // 2016-2025 7 Series (G11/G70) - FEM/BDC Smart Key - 4 button
  {
    model: '7 Series', year_start: 2016, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'N5F-ID2A', ic_number: '3248A-ID2A',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-N5F-4B.jpg`,
    programming_notes: 'FEM/BDC system. 4-button smart key. 315 MHz (NA). HU100R emergency blade. PN: N5F-ID2A. Requires Autel IM608 w/ G-BOX3, CGDI BMW, or Yanhua ACDP2.',
  },

  // ===== BMW 2 SERIES =====
  // 2014-2019 2 Series (F22/F45) - CAS4+/FEM - 3 button
  {
    model: '2 Series', year_start: 2014, year_end: 2019,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-3B.jpg`,
    programming_notes: 'CAS4+/FEM system. 3-button smart key. 315 MHz (NA). PCF7953 HITAG PRO ID49.',
  },
  // 2014-2019 2 Series (F22/F45) - CAS4+/FEM - 4 button
  {
    model: '2 Series', year_start: 2014, year_end: 2019,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-4B.jpg`,
    programming_notes: 'CAS4+/FEM system. 4-button smart key with Comfort Access. 315 MHz (NA). PCF7953 HITAG PRO ID49.',
  },
  // 2020-2025 2 Series (F44/G42) - BDC - 3 button
  {
    model: '2 Series', year_start: 2020, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-3B.jpg`,
    programming_notes: 'BDC system. 3-button smart key. 315 MHz (NA). HU100R emergency blade.',
  },
  // 2020-2025 2 Series (F44/G42) - BDC - 4 button
  {
    model: '2 Series', year_start: 2020, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-4B.jpg`,
    programming_notes: 'BDC system. 4-button smart key with Comfort Access. 315 MHz (NA). HU100R emergency blade.',
  },

  // ===== BMW 4 SERIES =====
  // 2014-2020 4 Series (F32/F36) - CAS4+/FEM - 3 button
  {
    model: '4 Series', year_start: 2014, year_end: 2020,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-3B.jpg`,
    programming_notes: 'CAS4+/FEM system. 3-button smart key. 315 MHz (NA). PCF7953 HITAG PRO ID49.',
  },
  // 2014-2020 4 Series (F32/F36) - CAS4+/FEM - 4 button
  {
    model: '4 Series', year_start: 2014, year_end: 2020,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-4B.jpg`,
    programming_notes: 'CAS4+/FEM system. 4-button smart key with Comfort Access. 315 MHz (NA). PCF7953 HITAG PRO ID49.',
  },
  // 2021-2025 4 Series (G22) - BDC - 4 button
  {
    model: '4 Series', year_start: 2021, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-4B.jpg`,
    programming_notes: 'BDC system. 4-button smart key with Comfort Access. 315 MHz (NA). HU100R emergency blade.',
  },

  // ===== BMW 6 SERIES =====
  // 2004-2010 6 Series (E63/E64) - CAS2/CAS3
  {
    model: '6 Series', year_start: 2004, year_end: 2010,
    key_blank: 'HU92', transponder_type: 'Philips Crypto 46', chip_type: 'PCF7945 (ID46)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK49127', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU92', test_key_blank: 'HU92',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-CAS3-3B.jpg`,
    programming_notes: 'CAS2/CAS3 system. 3-button slot key. 315 MHz. PCF7945 ID46 chip.',
  },
  // 2012-2018 6 Series (F06/F12/F13) - CAS4+/FEM - 4 button
  {
    model: '6 Series', year_start: 2012, year_end: 2018,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-4B.jpg`,
    programming_notes: 'CAS4+/FEM system. 4-button smart key. 315 MHz (NA). PCF7953 HITAG PRO ID49.',
  },

  // ===== BMW 8 SERIES =====
  // 2019-2025 8 Series (G14/G15/G16) - BDC - 4 button
  {
    model: '8 Series', year_start: 2019, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'N5F-ID2A', ic_number: '3248A-ID2A',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-N5F-4B.jpg`,
    programming_notes: 'BDC system. 4-button smart key. 315 MHz (NA). HU100R emergency blade.',
  },

  // ===== BMW X1 =====
  // 2013-2015 X1 (E84) - CAS3+ - 3 button
  {
    model: 'X1', year_start: 2013, year_end: 2015,
    key_blank: 'HU92', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK49863', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU92', test_key_blank: 'HU92',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-CAS3-3B.jpg`,
    programming_notes: 'CAS3+ system. 3-button smart key. 315 MHz. PCF7953 ID49 chip.',
  },
  // 2016-2022 X1 (F48) - FEM/BDC - 3 button
  {
    model: 'X1', year_start: 2016, year_end: 2022,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-3B.jpg`,
    programming_notes: 'FEM/BDC system. 3-button smart key. 315 MHz (NA). HU100R blade.',
  },
  // 2023-2025 X1 (U11) - BDC - 4 button
  {
    model: 'X1', year_start: 2023, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-4B.jpg`,
    programming_notes: 'BDC system. 4-button smart key. 315 MHz (NA). HU100R blade. New U11 platform.',
  },

  // ===== BMW X2 =====
  // 2018-2024 X2 (F39/U10) - FEM/BDC - 4 button
  {
    model: 'X2', year_start: 2018, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-4B.jpg`,
    programming_notes: 'FEM/BDC system. 4-button smart key with Comfort Access. 315 MHz (NA). HU100R blade.',
  },

  // ===== BMW X3 =====
  // 2004-2010 X3 (E83) - CAS2/CAS3 - 3 button
  {
    model: 'X3', year_start: 2004, year_end: 2010,
    key_blank: 'HU92', transponder_type: 'Philips Crypto 46', chip_type: 'PCF7945 (ID46)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK49127', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU92', test_key_blank: 'HU92',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-CAS3-3B.jpg`,
    programming_notes: 'CAS2/CAS3 slot key. 3-button. 315 MHz. PCF7945 ID46 chip.',
  },
  // 2011-2017 X3 (F25) - CAS4/FEM - 3 button
  {
    model: 'X3', year_start: 2011, year_end: 2017,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-3B.jpg`,
    programming_notes: 'CAS4/FEM system. 3-button smart key. 315 MHz (NA). PCF7953 HITAG PRO ID49.',
  },
  // 2011-2017 X3 (F25) - CAS4/FEM - 4 button
  {
    model: 'X3', year_start: 2011, year_end: 2017,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-4B.jpg`,
    programming_notes: 'CAS4/FEM system. 4-button smart key with Comfort Access. 315 MHz (NA). PCF7953 HITAG PRO ID49.',
  },
  // 2018-2025 X3 (G01) - FEM/BDC - 4 button
  {
    model: 'X3', year_start: 2018, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-4B.jpg`,
    programming_notes: 'FEM/BDC system. 4-button smart key with Comfort Access. 315 MHz (NA). HU100R blade.',
  },

  // ===== BMW X4 =====
  // 2015-2018 X4 (F26) - CAS4+/FEM - 4 button
  {
    model: 'X4', year_start: 2015, year_end: 2018,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-4B.jpg`,
    programming_notes: 'CAS4+/FEM system. 4-button smart key. 315 MHz (NA). PCF7953 HITAG PRO ID49.',
  },
  // 2019-2025 X4 (G02) - BDC - 4 button
  {
    model: 'X4', year_start: 2019, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-4B.jpg`,
    programming_notes: 'BDC system. 4-button smart key. 315 MHz (NA). HU100R blade.',
  },

  // ===== BMW X5 =====
  // 2000-2006 X5 (E53) - EWS - HU58
  {
    model: 'X5', year_start: 2000, year_end: 2006,
    key_blank: 'HU58', transponder_type: 'Philips Crypto', chip_type: 'PCF7935 (ID44)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: 'HU58',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU58',
    image_url: `${CDN}/products/K-HU58.jpg`,
    programming_notes: 'EWS system transponder key. HU58 blade. PCF7935 ID44 chip. 315 MHz remote.',
  },
  // 2007-2013 X5 (E70) - CAS3 Smart Key - 3 button
  {
    model: 'X5', year_start: 2007, year_end: 2013,
    key_blank: 'HU92', transponder_type: 'Philips Crypto 46', chip_type: 'PCF7945 (ID46)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK49127', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU92', test_key_blank: 'HU92',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-CAS3-3B.jpg`,
    programming_notes: 'CAS3 system. 3-button slot key (non-proximity). 315 MHz. PCF7945 ID46 chip.',
  },
  // 2007-2013 X5 (E70) - CAS3 Smart Key - 4 button (Comfort Access)
  {
    model: 'X5', year_start: 2007, year_end: 2013,
    key_blank: 'HU92', transponder_type: 'Philips Crypto 46', chip_type: 'PCF7945 (ID46)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK49123', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92', test_key_blank: 'HU92',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-CAS3-4B.jpg`,
    programming_notes: 'CAS3 smart key with Comfort Access. 4-button. 315 MHz. PCF7945 ID46 chip.',
  },
  // 2014-2018 X5 (F15) - FEM/BDC - 4 button
  {
    model: 'X5', year_start: 2014, year_end: 2018,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-4B.jpg`,
    programming_notes: 'FEM/BDC system. 4-button smart key with Comfort Access. 315 MHz (NA). PCF7953 HITAG PRO ID49. Also FCC N5F-ID2A.',
  },
  // 2019-2025 X5 (G05) - BDC - 4 button
  {
    model: 'X5', year_start: 2019, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'N5F-ID2A', ic_number: '3248A-ID2A',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-N5F-4B.jpg`,
    programming_notes: 'BDC system. 4-button smart key. 315 MHz (NA). HU100R blade. Requires Autel IM608 w/ G-BOX3, CGDI BMW, or Yanhua ACDP2.',
  },

  // ===== BMW X6 =====
  // 2008-2014 X6 (E71) - CAS3/CAS4 - 4 button
  {
    model: 'X6', year_start: 2008, year_end: 2014,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-4B.jpg`,
    programming_notes: 'CAS3+/CAS4 system. 4-button smart key. 315 MHz (NA). PCF7953 HITAG PRO ID49.',
  },
  // 2015-2019 X6 (F16) - FEM/BDC - 4 button
  {
    model: 'X6', year_start: 2015, year_end: 2019,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-4B.jpg`,
    programming_notes: 'FEM/BDC system. 4-button smart key with Comfort Access. 315 MHz (NA). Also FCC N5F-ID2A.',
  },
  // 2020-2025 X6 (G06) - BDC - 4 button
  {
    model: 'X6', year_start: 2020, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'N5F-ID2A', ic_number: '3248A-ID2A',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-N5F-4B.jpg`,
    programming_notes: 'BDC system. 4-button smart key. 315 MHz (NA). HU100R blade.',
  },

  // ===== BMW X7 =====
  // 2019-2025 X7 (G07) - BDC - 4 button
  {
    model: 'X7', year_start: 2019, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'N5F-ID2A', ic_number: '3248A-ID2A',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-N5F-4B.jpg`,
    programming_notes: 'BDC system. 4-button smart key. 315 MHz (NA). HU100R blade.',
  },

  // ===== BMW Z4 =====
  // 2003-2008 Z4 (E85) - EWS/CAS2 - HU92
  {
    model: 'Z4', year_start: 2003, year_end: 2008,
    key_blank: 'HU92', transponder_type: 'Philips Crypto', chip_type: 'PCF7935 (ID44)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: 'HU92',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/K-HU92.jpg`,
    programming_notes: 'EWS/CAS2 system transponder key. HU92 blade. PCF7935 ID44 chip.',
  },
  // 2009-2016 Z4 (E89) - CAS3/CAS4 - 3 button
  {
    model: 'Z4', year_start: 2009, year_end: 2016,
    key_blank: 'HU92R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU92R', test_key_blank: 'HU92R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: `${CDN}/products/RSK-BMW-5662-3B.jpg`,
    programming_notes: 'CAS3+/CAS4 system. 3-button smart key. 315 MHz (NA). PCF7953 HITAG PRO ID49.',
  },
  // 2019-2025 Z4 (G29) - BDC - 4 button
  {
    model: 'Z4', year_start: 2019, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-4B.jpg`,
    programming_notes: 'BDC system. 4-button smart key. 315 MHz (NA). HU100R blade.',
  },

  // ===== BMW i4 =====
  // 2022-2025 i4 (G26) - BDC - 4 button
  {
    model: 'i4', year_start: 2022, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: null,
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-IDGNG1-4B.jpg`,
    programming_notes: 'BDC system. 4-button smart key. 315 MHz (NA). HU100R blade. Electric vehicle.',
  },

  // ===== BMW iX =====
  // 2022-2025 iX (I20) - BDC - 4 button
  {
    model: 'iX', year_start: 2022, year_end: 2025,
    key_blank: 'HU100R', transponder_type: 'HITAG PRO', chip_type: 'PCF7953 (ID49)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'N5F-ID2A', ic_number: '3248A-ID2A',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU100R', test_key_blank: 'HU100R',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: `${CDN}/products/RSK-BMW-N5F-4B.jpg`,
    programming_notes: 'BDC system. 4-button smart key. 315 MHz (NA). HU100R blade. Electric SUV.',
  },
];

// ============================================================
// ACCURATE SUBARU KEY DATA
// ============================================================
const subaruKeys = [

  // ===== SUBARU OUTBACK =====
  // 2000-2004 Outback - Transponder (4D62 40-bit)
  {
    model: 'Outback', year_start: 2000, year_end: 2004,
    key_blank: 'SUB4', transponder_type: 'Texas ID 4D62', chip_type: '4D62 (40-bit)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'SUB4',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null,
    image_url: `${CDN}/products/K-SUB4.jpg`,
    programming_notes: 'Transponder-only key. Texas 4D62 40-bit chip. SUB4 keyway. Requires pin code from dealer or Subaru SSM.',
  },
  // 2005-2009 Outback - Transponder (4D62 40-bit) - DAT17
  {
    model: 'Outback', year_start: 2005, year_end: 2009,
    key_blank: 'DAT17', transponder_type: 'Texas ID 4D62', chip_type: '4D62 (40-bit)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'DAT17',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi DAT17',
    image_url: `${CDN}/products/K-SUB3.jpg`,
    programming_notes: 'Transponder-only key. Texas 4D62 40-bit chip. DAT17 high-security keyway. Requires pin code.',
  },
  // 2010-2014 Outback - Remote Head Key (4D62 80-bit / G chip) - CWTWB1U811
  {
    model: 'Outback', year_start: 2010, year_end: 2014,
    key_blank: 'DAT17', transponder_type: 'Texas ID 4D62 80-bit', chip_type: 'G Chip (4D62 80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U811', ic_number: null,
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DAT17',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi DAT17',
    image_url: `${CDN}/products/RHK-SUB-811.jpg`,
    programming_notes: '4-button remote head key. G chip (4D62 80-bit). 315 MHz. PN: 57497-AJ10A. OBD programmable via Subaru SSM or Autel IM608.',
  },
  // 2015-2019 Outback - Smart Key (HYQ14AHC) - 4 button
  {
    model: 'Outback', year_start: 2015, year_end: 2019,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHC', ic_number: '1551A-14AHC',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHC.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 315 MHz. PN: 88835-AL04A. Emergency blade NSN14. Requires Subaru SSM or Autel IM608.',
  },
  // 2020-2025 Outback - Smart Key (HYQ14AHK) - 4 button
  {
    model: 'Outback', year_start: 2020, year_end: 2025,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHK', ic_number: '1551A-14AHK',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHK.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 434 MHz (changed from 315). PN: 88835-AN00A. Emergency blade NSN14.',
  },

  // ===== SUBARU FORESTER =====
  // 1998-2004 Forester - Transponder (4D62 40-bit)
  {
    model: 'Forester', year_start: 1998, year_end: 2004,
    key_blank: 'SUB4', transponder_type: 'Texas ID 4D62', chip_type: '4D62 (40-bit)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'SUB4',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null,
    image_url: `${CDN}/products/K-SUB4.jpg`,
    programming_notes: 'Transponder-only key. Texas 4D62 40-bit chip. SUB4 keyway.',
  },
  // 2005-2010 Forester - Transponder (4D62 40-bit) - DAT17
  {
    model: 'Forester', year_start: 2005, year_end: 2010,
    key_blank: 'DAT17', transponder_type: 'Texas ID 4D62', chip_type: '4D62 (40-bit)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'DAT17',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi DAT17',
    image_url: `${CDN}/products/K-SUB3.jpg`,
    programming_notes: 'Transponder-only key. Texas 4D62 40-bit chip. DAT17 high-security keyway.',
  },
  // 2011-2013 Forester - Remote Head Key (4D62 80-bit / G chip)
  {
    model: 'Forester', year_start: 2011, year_end: 2013,
    key_blank: 'DAT17', transponder_type: 'Texas ID 4D62 80-bit', chip_type: 'G Chip (4D62 80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U811', ic_number: null,
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DAT17',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi DAT17',
    image_url: `${CDN}/products/RHK-SUB-811.jpg`,
    programming_notes: '4-button remote head key. G chip (4D62 80-bit). 315 MHz. PN: 57497-FJ230. OBD programmable.',
  },
  // 2014-2018 Forester - Smart Key (HYQ14AHC) - 4 button
  {
    model: 'Forester', year_start: 2014, year_end: 2018,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHC', ic_number: '1551A-14AHC',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHC.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 315 MHz. PN: 88835-AL04A. Emergency blade NSN14.',
  },
  // 2019-2025 Forester - Smart Key (HYQ14AHK) - 4 button
  {
    model: 'Forester', year_start: 2019, year_end: 2025,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHK', ic_number: '1551A-14AHK',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHK.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 434 MHz. PN: 88835-FL03A. Emergency blade NSN14.',
  },

  // ===== SUBARU CROSSTREK =====
  // 2013-2015 Crosstrek - Remote Head Key (G chip) - CWTWB1U811
  {
    model: 'Crosstrek', year_start: 2013, year_end: 2015,
    key_blank: 'DAT17', transponder_type: 'Texas ID 4D62 80-bit', chip_type: 'G Chip (4D62 80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U811', ic_number: null,
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DAT17',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi DAT17',
    image_url: `${CDN}/products/RHK-SUB-811.jpg`,
    programming_notes: '4-button remote head key. G chip (4D62 80-bit). 315 MHz. OBD programmable.',
  },
  // 2016-2017 Crosstrek - Smart Key (HYQ14AHC)
  {
    model: 'Crosstrek', year_start: 2016, year_end: 2017,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHC', ic_number: '1551A-14AHC',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHC.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 315 MHz. PN: 88835-AL04A.',
  },
  // 2018-2025 Crosstrek - Smart Key (HYQ14AHK)
  {
    model: 'Crosstrek', year_start: 2018, year_end: 2025,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHK', ic_number: '1551A-14AHK',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHK.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 434 MHz. PN: 88835-FL03A.',
  },

  // ===== SUBARU IMPREZA =====
  // 1998-2004 Impreza - Transponder (4D62 40-bit)
  {
    model: 'Impreza', year_start: 1998, year_end: 2004,
    key_blank: 'SUB4', transponder_type: 'Texas ID 4D62', chip_type: '4D62 (40-bit)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'SUB4',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null,
    image_url: `${CDN}/products/K-SUB4.jpg`,
    programming_notes: 'Transponder-only key. Texas 4D62 40-bit chip. SUB4 keyway.',
  },
  // 2005-2011 Impreza - Transponder (4D62 40-bit) - DAT17
  {
    model: 'Impreza', year_start: 2005, year_end: 2011,
    key_blank: 'DAT17', transponder_type: 'Texas ID 4D62', chip_type: '4D62 (40-bit)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'DAT17',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi DAT17',
    image_url: `${CDN}/products/K-SUB3.jpg`,
    programming_notes: 'Transponder-only key. Texas 4D62 40-bit chip. DAT17 high-security keyway.',
  },
  // 2012-2016 Impreza - Remote Head Key (G chip) - CWTWB1U811
  {
    model: 'Impreza', year_start: 2012, year_end: 2016,
    key_blank: 'DAT17', transponder_type: 'Texas ID 4D62 80-bit', chip_type: 'G Chip (4D62 80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U811', ic_number: null,
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DAT17',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi DAT17',
    image_url: `${CDN}/products/RHK-SUB-811.jpg`,
    programming_notes: '4-button remote head key. G chip (4D62 80-bit). 315 MHz. PN: 57497-FJ230. OBD programmable.',
  },
  // 2017-2022 Impreza - Smart Key (HYQ14AHK)
  {
    model: 'Impreza', year_start: 2017, year_end: 2022,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHK', ic_number: '1551A-14AHK',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHK.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 434 MHz. PN: 88835-FL03A.',
  },
  // 2023-2025 Impreza - Smart Key (HYQ14AHK)
  {
    model: 'Impreza', year_start: 2023, year_end: 2025,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHK', ic_number: '1551A-14AHK',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHK.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 434 MHz. New 6th gen Impreza.',
  },

  // ===== SUBARU LEGACY =====
  // 2000-2004 Legacy - Transponder (4D62 40-bit)
  {
    model: 'Legacy', year_start: 2000, year_end: 2004,
    key_blank: 'SUB4', transponder_type: 'Texas ID 4D62', chip_type: '4D62 (40-bit)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'SUB4',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null,
    image_url: `${CDN}/products/K-SUB4.jpg`,
    programming_notes: 'Transponder-only key. Texas 4D62 40-bit chip. SUB4 keyway.',
  },
  // 2005-2009 Legacy - Transponder (4D62 40-bit) - DAT17
  {
    model: 'Legacy', year_start: 2005, year_end: 2009,
    key_blank: 'DAT17', transponder_type: 'Texas ID 4D62', chip_type: '4D62 (40-bit)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'DAT17',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi DAT17',
    image_url: `${CDN}/products/K-SUB3.jpg`,
    programming_notes: 'Transponder-only key. Texas 4D62 40-bit chip. DAT17 high-security keyway.',
  },
  // 2010-2014 Legacy - Remote Head Key (G chip) - CWTWB1U811
  {
    model: 'Legacy', year_start: 2010, year_end: 2014,
    key_blank: 'DAT17', transponder_type: 'Texas ID 4D62 80-bit', chip_type: 'G Chip (4D62 80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U811', ic_number: null,
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DAT17',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi DAT17',
    image_url: `${CDN}/products/RHK-SUB-811.jpg`,
    programming_notes: '4-button remote head key. G chip (4D62 80-bit). 315 MHz. PN: 57497-AJ10A. OBD programmable.',
  },
  // 2015-2019 Legacy - Smart Key (HYQ14AHC)
  {
    model: 'Legacy', year_start: 2015, year_end: 2019,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHC', ic_number: '1551A-14AHC',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHC.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 315 MHz. PN: 88835-AL04A.',
  },
  // 2020-2025 Legacy - Smart Key (HYQ14AHK)
  {
    model: 'Legacy', year_start: 2020, year_end: 2025,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHK', ic_number: '1551A-14AHK',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHK.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 434 MHz. PN: 88835-AN00A.',
  },

  // ===== SUBARU WRX =====
  // 2002-2007 WRX - Transponder (4D62 40-bit)
  {
    model: 'WRX', year_start: 2002, year_end: 2007,
    key_blank: 'SUB4', transponder_type: 'Texas ID 4D62', chip_type: '4D62 (40-bit)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'SUB4',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null,
    image_url: `${CDN}/products/K-SUB4.jpg`,
    programming_notes: 'Transponder-only key. Texas 4D62 40-bit chip. SUB4 keyway.',
  },
  // 2008-2011 WRX - Transponder (4D62) - DAT17
  {
    model: 'WRX', year_start: 2008, year_end: 2011,
    key_blank: 'DAT17', transponder_type: 'Texas ID 4D62', chip_type: '4D62 (40-bit)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'DAT17',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi DAT17',
    image_url: `${CDN}/products/K-SUB3.jpg`,
    programming_notes: 'Transponder-only key. Texas 4D62 chip. DAT17 high-security keyway.',
  },
  // 2012-2014 WRX - Remote Head Key (G chip) - CWTWB1U811
  {
    model: 'WRX', year_start: 2012, year_end: 2014,
    key_blank: 'DAT17', transponder_type: 'Texas ID 4D62 80-bit', chip_type: 'G Chip (4D62 80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U811', ic_number: null,
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DAT17',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi DAT17',
    image_url: `${CDN}/products/RHK-SUB-811.jpg`,
    programming_notes: '4-button remote head key. G chip (4D62 80-bit). 315 MHz. OBD programmable.',
  },
  // 2015-2021 WRX - Smart Key (HYQ14AHC)
  {
    model: 'WRX', year_start: 2015, year_end: 2021,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHC', ic_number: '1551A-14AHC',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHC.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 315 MHz. PN: 88835-AL04A.',
  },
  // 2022-2025 WRX - Smart Key (HYQ14AHK)
  {
    model: 'WRX', year_start: 2022, year_end: 2025,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHK', ic_number: '1551A-14AHK',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHK.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 434 MHz. New VB platform.',
  },

  // ===== SUBARU ASCENT =====
  // 2019-2025 Ascent - Smart Key (HYQ14AHK) - 4 button
  {
    model: 'Ascent', year_start: 2019, year_end: 2025,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHK', ic_number: '1551A-14AHK',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHK.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 434 MHz. PN: 88835-XC00A.',
  },

  // ===== SUBARU BRZ =====
  // 2013-2020 BRZ - Smart Key (HYQ14AHC)
  {
    model: 'BRZ', year_start: 2013, year_end: 2020,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHC', ic_number: '1551A-14AHC',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHC.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 315 MHz. PN: 88835-AL04A.',
  },
  // 2022-2025 BRZ - Smart Key (HYQ14AHK)
  {
    model: 'BRZ', year_start: 2022, year_end: 2025,
    key_blank: 'NSN14', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14AHK', ic_number: '1551A-14AHK',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'NSN14', test_key_blank: 'NSN14',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi NSN14',
    image_url: `${CDN}/products/RSK-SUB-AHK.jpg`,
    programming_notes: '4-button smart proximity key. H chip (8A). 434 MHz. 2nd gen BRZ on Subaru platform.',
  },

  // ===== SUBARU BAJA =====
  // 2003-2006 Baja - Transponder (4D62 40-bit)
  {
    model: 'Baja', year_start: 2003, year_end: 2006,
    key_blank: 'SUB4', transponder_type: 'Texas ID 4D62', chip_type: '4D62 (40-bit)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'SUB4',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null,
    image_url: `${CDN}/products/K-SUB4.jpg`,
    programming_notes: 'Transponder-only key. Texas 4D62 40-bit chip. SUB4 keyway.',
  },

  // ===== SUBARU TRIBECA =====
  // 2006-2007 Tribeca - Transponder (4D62 40-bit)
  {
    model: 'Tribeca', year_start: 2006, year_end: 2007,
    key_blank: 'DAT17', transponder_type: 'Texas ID 4D62', chip_type: '4D62 (40-bit)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: 'DAT17',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi DAT17',
    image_url: `${CDN}/products/K-SUB3.jpg`,
    programming_notes: 'Transponder-only key. Texas 4D62 chip. DAT17 high-security keyway.',
  },
  // 2008-2014 Tribeca - Remote Head Key (4D62/G chip) - CWTWB1U811
  {
    model: 'Tribeca', year_start: 2008, year_end: 2014,
    key_blank: 'DAT17', transponder_type: 'Texas ID 4D62 80-bit', chip_type: 'G Chip (4D62 80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U811', ic_number: null,
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'DAT17',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi DAT17',
    image_url: `${CDN}/products/RHK-SUB-811.jpg`,
    programming_notes: '4-button remote head key. G chip. 315 MHz. OBD programmable.',
  },

  // ===== SUBARU SOLTERRA =====
  // 2023-2025 Solterra - Smart Key (HYQ14FBX - Toyota platform)
  {
    model: 'Solterra', year_start: 2023, year_end: 2025,
    key_blank: 'TOY51', transponder_type: 'Texas Crypto 128-bit AES', chip_type: 'H Chip (8A)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ14FBX', ic_number: '1551A-14FBX',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, A/C, Panic',
    emergency_key_blank: 'TOY51', test_key_blank: 'TOY51',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: `${CDN}/files/RSK-TOY-42510_1.jpg`,
    programming_notes: '4-button smart key. Toyota bZ4X platform - uses Toyota key system. A/C pre-conditioning button. Emergency blade TOY51.',
  },
];


async function main() {
  await client.connect();
  console.log('Connected to database.\n');

  try {
    // ====== BMW ======
    const bmwCurrent = await client.query(
      "SELECT COUNT(*) as count FROM automotive_keys WHERE manufacturer_id=$1", [BMW_MFR_ID]
    );
    console.log(`Current BMW key rows: ${bmwCurrent.rows[0].count}`);

    console.log('\nDeleting all existing BMW key rows...');
    const bmwDel = await client.query(
      "DELETE FROM automotive_keys WHERE manufacturer_id=$1", [BMW_MFR_ID]
    );
    console.log(`Deleted ${bmwDel.rowCount} BMW rows.`);

    const bmwModelIds = Object.values(BMW_MODEL_IDS);
    const bmwYearDel = await client.query(
      `DELETE FROM vehicle_years WHERE model_id = ANY($1::uuid[])`, [bmwModelIds]
    );
    console.log(`Deleted ${bmwYearDel.rowCount} BMW vehicle_years rows.`);

    console.log('\nInserting new BMW key data...\n');
    let bmwCount = 0;
    for (const key of bmwKeys) {
      const modelId = BMW_MODEL_IDS[key.model];
      if (!modelId) { console.error(`No model ID for BMW ${key.model}`); continue; }

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
          yearId, BMW_MFR_ID, `BMW ${key.model}`,
          key.key_blank, key.transponder_type, key.chip_type, key.remote_frequency,
          key.key_type, key.fcc_id, key.ic_number, key.programming_notes,
          key.pin_code_required, key.obd_programmable, key.emergency_key_blank,
          key.year_start, key.year_end, key.battery_type, key.buttons,
          key.test_key_blank, key.image_url, key.lishi_tool,
        ]
      );
      bmwCount++;
      console.log(`  [${bmwCount}] BMW ${key.model} ${key.year_start}-${key.year_end} | ${key.key_type} | ${key.buttons || 'N/A'} | FCC: ${key.fcc_id || 'N/A'} | ${key.chip_type}`);
    }
    console.log(`\nInserted ${bmwCount} BMW key rows.`);

    // ====== SUBARU ======
    const subCurrent = await client.query(
      "SELECT COUNT(*) as count FROM automotive_keys WHERE manufacturer_id=$1", [SUBARU_MFR_ID]
    );
    console.log(`\nCurrent Subaru key rows: ${subCurrent.rows[0].count}`);

    console.log('\nDeleting all existing Subaru key rows...');
    const subDel = await client.query(
      "DELETE FROM automotive_keys WHERE manufacturer_id=$1", [SUBARU_MFR_ID]
    );
    console.log(`Deleted ${subDel.rowCount} Subaru rows.`);

    const subModelIds = Object.values(SUBARU_MODEL_IDS);
    const subYearDel = await client.query(
      `DELETE FROM vehicle_years WHERE model_id = ANY($1::uuid[])`, [subModelIds]
    );
    console.log(`Deleted ${subYearDel.rowCount} Subaru vehicle_years rows.`);

    console.log('\nInserting new Subaru key data...\n');
    let subCount = 0;
    for (const key of subaruKeys) {
      const modelId = SUBARU_MODEL_IDS[key.model];
      if (!modelId) { console.error(`No model ID for Subaru ${key.model}`); continue; }

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
          yearId, SUBARU_MFR_ID, `Subaru ${key.model}`,
          key.key_blank, key.transponder_type, key.chip_type, key.remote_frequency,
          key.key_type, key.fcc_id, key.ic_number, key.programming_notes,
          key.pin_code_required, key.obd_programmable, key.emergency_key_blank,
          key.year_start, key.year_end, key.battery_type, key.buttons,
          key.test_key_blank, key.image_url, key.lishi_tool,
        ]
      );
      subCount++;
      console.log(`  [${subCount}] Subaru ${key.model} ${key.year_start}-${key.year_end} | ${key.key_type} | ${key.buttons || 'N/A'} | FCC: ${key.fcc_id || 'N/A'} | ${key.chip_type}`);
    }
    console.log(`\nInserted ${subCount} Subaru key rows.`);

    // ====== VERIFICATION ======
    console.log('\n' + '='.repeat(80));
    console.log('VERIFICATION');
    console.log('='.repeat(80));

    const verBmw = await client.query(
      `SELECT model_name, year_start, year_end, key_type, key_blank,
              chip_type, fcc_id, remote_frequency, buttons, image_url, lishi_tool
       FROM automotive_keys WHERE manufacturer_id=$1
       ORDER BY model_name, year_start, key_type`, [BMW_MFR_ID]
    );
    console.log(`\nBMW: ${verBmw.rows.length} rows`);
    for (const r of verBmw.rows) {
      console.log(`  ${r.model_name} ${r.year_start}-${r.year_end} | ${r.key_type} | ${r.key_blank} | ${r.chip_type} | FCC: ${r.fcc_id || 'N/A'} | ${r.buttons || 'N/A'} | Img: ${r.image_url ? 'YES' : 'MISSING'}`);
    }

    const verSub = await client.query(
      `SELECT model_name, year_start, year_end, key_type, key_blank,
              chip_type, fcc_id, remote_frequency, buttons, image_url, lishi_tool
       FROM automotive_keys WHERE manufacturer_id=$1
       ORDER BY model_name, year_start, key_type`, [SUBARU_MFR_ID]
    );
    console.log(`\nSubaru: ${verSub.rows.length} rows`);
    for (const r of verSub.rows) {
      console.log(`  ${r.model_name} ${r.year_start}-${r.year_end} | ${r.key_type} | ${r.key_blank} | ${r.chip_type} | FCC: ${r.fcc_id || 'N/A'} | ${r.buttons || 'N/A'} | Img: ${r.image_url ? 'YES' : 'MISSING'}`);
    }

    console.log(`\nTOTAL: ${verBmw.rows.length} BMW + ${verSub.rows.length} Subaru = ${verBmw.rows.length + verSub.rows.length} rows`);

  } catch (err) {
    console.error('ERROR:', err.message);
    console.error(err.stack);
  } finally {
    await client.end();
    console.log('\nDatabase connection closed.');
  }
}

main();
