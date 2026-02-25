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

const MERCEDES_MFR_ID = 'eb5d03cc-6843-4a5f-a297-4ef61835674b';
const VW_MFR_ID       = '9200101e-47ca-40d9-8658-02b7cc400f25';

// key_type allowed values (DB CHECK constraint): standard, transponder, smart_key, proximity
// buttons: text column - store as integer string per user's request

// ============================================================
// MERCEDES-BENZ KEY DATA
// Sources: UHS Hardware, Keyless Entry Remote, Tom's Key, Locksmith Ledger,
// ILCO / Strattec references, FCC ID.io
// ============================================================
const mercedesKeys = [

  // =====================================================
  // A-CLASS (W176: 2014-2018 US, W177: 2019+)
  // =====================================================
  {
    model: 'A-Class', year_start: 2019, year_end: 2024,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC12K', ic_number: '2694A-DC12K',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W177 A-Class. 4-button smart key (Lock, Unlock, Trunk, Panic). BGA keyless go system. Requires VVDI MB, CGDI MB, or Autel IM608 with XP400 Pro. All keys lost requires EIS/EZS read.',
  },

  // =====================================================
  // B-CLASS (W246: 2012-2018, W247: 2019+) - US had limited availability
  // =====================================================
  {
    model: 'B-Class', year_start: 2014, year_end: 2019,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC11', ic_number: '2694A-DC11',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W246 B-Class Electric Drive (US market). BGA smart key system. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB or CGDI MB for programming. EIS data read required for all keys lost.',
  },

  // =====================================================
  // C-CLASS
  // =====================================================
  // W203 (2001-2007) - Transponder HU64
  {
    model: 'C-Class', year_start: 2001, year_end: 2007,
    key_blank: 'HU64', transponder_type: 'Philips Crypto 44', chip_type: 'PCF7935 (ID44)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W203 C-Class. EIS/ELV system with ID44 transponder. HU64 key blank. Requires Mercedes Star Diagnostic or VVDI MB/CGDI MB to read EIS and program key. Chrome key head style.',
  },
  // W203 (2001-2007) - Chrome smart key (IYZ3312)
  {
    model: 'C-Class', year_start: 2001, year_end: 2007,
    key_blank: 'HU64', transponder_type: 'Mercedes IR/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3312', ic_number: null,
    battery_type: 'CR2025', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W203 C-Class chrome smart key. 3 buttons (Lock, Unlock, Trunk). IR-based communication with EIS module. Requires VVDI MB BGA tool or CGDI MB. All keys lost: must read EIS data.',
  },
  // W204 (2008-2014) - Chrome smart key 3-button
  {
    model: 'C-Class', year_start: 2008, year_end: 2014,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3312', ic_number: null,
    battery_type: 'CR2025', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W204 C-Class. BGA/NEC smart key system. 3 buttons (Lock, Unlock, Trunk). Chrome key head. Requires VVDI MB BGA tool, CGDI MB, or Autel IM608. All keys lost requires EIS read and password calculation.',
  },
  // W204 (2008-2014) - Chrome smart key 4-button (panic)
  {
    model: 'C-Class', year_start: 2008, year_end: 2014,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3317', ic_number: null,
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W204 C-Class. BGA/NEC 4-button smart key (Lock, Unlock, Trunk, Panic). Chrome key head. Requires VVDI MB BGA or CGDI MB. All keys lost: read EIS password.',
  },
  // W205 (2015-2021) - Smart key 4-button
  {
    model: 'C-Class', year_start: 2015, year_end: 2021,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC07', ic_number: '2694A-DC07',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W205 C-Class. BGA/NEC keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Black plastic smart key. Requires VVDI MB, CGDI MB, or Autel IM608 with XP400 Pro. All keys lost: read EIS/EZS.',
  },
  // W206 (2022+) - Smart key 4-button
  {
    model: 'C-Class', year_start: 2022, year_end: 2026,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC12K', ic_number: '2694A-DC12K',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W206 C-Class. Latest generation BGA keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Requires latest VVDI MB, CGDI MB, or Autel IM608 Pro II. All keys lost: EZS read required. May need ESL/ELV repair.',
  },

  // =====================================================
  // CL-CLASS (W215: 2000-2006, W216: 2007-2014)
  // =====================================================
  {
    model: 'CL-Class', year_start: 2000, year_end: 2006,
    key_blank: 'HU64', transponder_type: 'Mercedes IR/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3302', ic_number: null,
    battery_type: 'CR2025', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W215 CL-Class. Chrome smart key with IR. 3 buttons (Lock, Unlock, Trunk). EIS module programming required. VVDI MB or CGDI MB recommended.',
  },
  {
    model: 'CL-Class', year_start: 2007, year_end: 2014,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3317', ic_number: null,
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W216 CL-Class. BGA/NEC smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Chrome key head. Requires VVDI MB BGA tool or CGDI MB. All keys lost: EIS password read required.',
  },

  // =====================================================
  // CLA (C117: 2014-2019, C118: 2020+)
  // =====================================================
  {
    model: 'CLA', year_start: 2014, year_end: 2019,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC10', ic_number: '2694A-DC10',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'C117 CLA. BGA keyless go smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB BGA tool or CGDI MB. All keys lost: EIS/EZS password calculation needed.',
  },
  {
    model: 'CLA', year_start: 2020, year_end: 2025,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC12K', ic_number: '2694A-DC12K',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'C118 CLA. BGA keyless go smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB, CGDI MB, or Autel IM608 Pro. All keys lost: EZS read required.',
  },

  // =====================================================
  // CLK (W208: 1998-2002, W209: 2003-2009)
  // =====================================================
  {
    model: 'CLK', year_start: 1998, year_end: 2002,
    key_blank: 'HU64', transponder_type: 'Mercedes IR', chip_type: 'IR/DAS',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W208 CLK. DAS (Drive Authorization System) with infrared key. HU64 key blank. No traditional transponder chip. IR signal communicates with DAS module. Requires Mercedes SDS or aftermarket DAS tool.',
  },
  {
    model: 'CLK', year_start: 2003, year_end: 2009,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3312', ic_number: null,
    battery_type: 'CR2025', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W209 CLK. Chrome smart key. 3 buttons (Lock, Unlock, Trunk). EIS module system. Requires VVDI MB or CGDI MB for programming.',
  },

  // =====================================================
  // CLS (W219: 2006-2010, W218: 2012-2018, C257: 2019+)
  // =====================================================
  {
    model: 'CLS', year_start: 2006, year_end: 2010,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3312', ic_number: null,
    battery_type: 'CR2025', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W219 CLS. Chrome smart key. 3 buttons (Lock, Unlock, Trunk). EIS module. Requires VVDI MB or CGDI MB.',
  },
  {
    model: 'CLS', year_start: 2012, year_end: 2018,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC07', ic_number: '2694A-DC07',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W218 CLS. BGA/NEC smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB BGA tool or CGDI MB. All keys lost: EIS password calculation.',
  },
  {
    model: 'CLS', year_start: 2019, year_end: 2024,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC12K', ic_number: '2694A-DC12K',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'C257 CLS. BGA keyless go smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB, CGDI MB, or Autel IM608 Pro.',
  },

  // =====================================================
  // E-CLASS
  // =====================================================
  // W210 (1996-2002) - DAS/IR
  {
    model: 'E-Class', year_start: 1996, year_end: 2002,
    key_blank: 'HU64', transponder_type: 'Mercedes IR', chip_type: 'IR/DAS',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W210 E-Class. DAS (Drive Authorization System) with infrared key. HU64 key blank. No traditional transponder chip. IR signal communicates with DAS module. Requires Mercedes SDS or aftermarket DAS programmer.',
  },
  // W211 (2003-2009) - Chrome smart key 3-button
  {
    model: 'E-Class', year_start: 2003, year_end: 2009,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3312', ic_number: null,
    battery_type: 'CR2025', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W211 E-Class. Chrome smart key. 3 buttons (Lock, Unlock, Trunk). EIS system with NEC chip. Requires VVDI MB or CGDI MB. All keys lost: EIS password read required.',
  },
  // W211 (2003-2009) - Chrome smart key 4-button
  {
    model: 'E-Class', year_start: 2003, year_end: 2009,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3317', ic_number: null,
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W211 E-Class. Chrome smart key with panic. 4 buttons (Lock, Unlock, Trunk, Panic). EIS system with NEC chip. Requires VVDI MB or CGDI MB.',
  },
  // W212 (2010-2016) - Smart key 4-button
  {
    model: 'E-Class', year_start: 2010, year_end: 2016,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC07', ic_number: '2694A-DC07',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W212 E-Class. BGA/NEC smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB BGA tool or CGDI MB. All keys lost: EIS read and password calculation. ELV/ESL steering lock may need repair.',
  },
  // W213 (2017-2023) - Smart key 4-button
  {
    model: 'E-Class', year_start: 2017, year_end: 2023,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC11', ic_number: '2694A-DC11',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W213 E-Class. BGA keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB, CGDI MB, or Autel IM608. All keys lost: EIS/EZS read required. ELV/ESL may need replacement.',
  },
  // W214 (2024+) - Smart key 4-button
  {
    model: 'E-Class', year_start: 2024, year_end: 2026,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC12K', ic_number: '2694A-DC12K',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W214 E-Class. Latest generation BGA keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Requires latest firmware on VVDI MB, CGDI MB, or Autel IM608 Pro II.',
  },

  // =====================================================
  // G-CLASS (W463: 1997-2018, W463A: 2019+)
  // =====================================================
  {
    model: 'G-Class', year_start: 1997, year_end: 2004,
    key_blank: 'HU64', transponder_type: 'Mercedes IR', chip_type: 'IR/DAS',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W463 G-Class. DAS system with IR key. HU64 blank. Requires Mercedes SDS or DAS programmer.',
  },
  {
    model: 'G-Class', year_start: 2005, year_end: 2012,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3312', ic_number: null,
    battery_type: 'CR2025', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W463 G-Class. Chrome smart key. 3 buttons (Lock, Unlock, Trunk). EIS system. Requires VVDI MB or CGDI MB.',
  },
  {
    model: 'G-Class', year_start: 2013, year_end: 2018,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC07', ic_number: '2694A-DC07',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W463 G-Class. BGA smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB BGA tool or CGDI MB.',
  },
  {
    model: 'G-Class', year_start: 2019, year_end: 2026,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC11', ic_number: '2694A-DC11',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W463A G-Class (redesigned). BGA keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB, CGDI MB, or Autel IM608.',
  },

  // =====================================================
  // GL-CLASS / GLS (X164: 2007-2012, X166: 2013-2019, X167: 2020+)
  // =====================================================
  {
    model: 'GL-Class', year_start: 2007, year_end: 2012,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3317', ic_number: null,
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'X164 GL-Class. Chrome smart key. 4 buttons (Lock, Unlock, Trunk, Panic). EIS system. Requires VVDI MB or CGDI MB.',
  },
  {
    model: 'GLS', year_start: 2013, year_end: 2019,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC07', ic_number: '2694A-DC07',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'X166 GL/GLS-Class. BGA smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB BGA tool or CGDI MB. All keys lost: EIS password read.',
  },
  {
    model: 'GLS', year_start: 2020, year_end: 2026,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC11', ic_number: '2694A-DC11',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'X167 GLS. BGA keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB, CGDI MB, or Autel IM608.',
  },

  // =====================================================
  // GLA (X156: 2015-2019, H247: 2021+)
  // =====================================================
  {
    model: 'GLA', year_start: 2015, year_end: 2019,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC10', ic_number: '2694A-DC10',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'X156 GLA. BGA keyless go smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB or CGDI MB.',
  },
  {
    model: 'GLA', year_start: 2021, year_end: 2026,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC12K', ic_number: '2694A-DC12K',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'H247 GLA. BGA keyless go smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB, CGDI MB, or Autel IM608 Pro.',
  },

  // =====================================================
  // GLB (X247: 2020+)
  // =====================================================
  {
    model: 'GLB', year_start: 2020, year_end: 2026,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC12K', ic_number: '2694A-DC12K',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'X247 GLB. BGA keyless go smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB, CGDI MB, or Autel IM608 Pro.',
  },

  // =====================================================
  // GLC (X253: 2016-2022, X254: 2023+)
  // =====================================================
  {
    model: 'GLC', year_start: 2016, year_end: 2022,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC07', ic_number: '2694A-DC07',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'X253 GLC. BGA keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB BGA or CGDI MB. All keys lost: EIS/EZS read.',
  },
  {
    model: 'GLC', year_start: 2023, year_end: 2026,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC12K', ic_number: '2694A-DC12K',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'X254 GLC. Latest BGA keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Requires latest VVDI MB, CGDI MB, or Autel IM608 Pro II.',
  },

  // =====================================================
  // GLE (W166: 2016-2019, V167: 2020+)
  // =====================================================
  {
    model: 'GLE', year_start: 2016, year_end: 2019,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC07', ic_number: '2694A-DC07',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W166 GLE. BGA smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB BGA or CGDI MB.',
  },
  {
    model: 'GLE', year_start: 2020, year_end: 2026,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC11', ic_number: '2694A-DC11',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'V167 GLE. BGA keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB, CGDI MB, or Autel IM608.',
  },

  // =====================================================
  // GLK (X204: 2010-2015)
  // =====================================================
  {
    model: 'GLK', year_start: 2010, year_end: 2015,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3317', ic_number: null,
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'X204 GLK. BGA/NEC smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Chrome key head. Requires VVDI MB BGA or CGDI MB. All keys lost: EIS password read.',
  },

  // =====================================================
  // METRIS (W447: 2016+)
  // =====================================================
  {
    model: 'Metris', year_start: 2016, year_end: 2023,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC10', ic_number: '2694A-DC10',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W447 Metris van. BGA smart key. 4 buttons (Lock, Unlock, Side Door, Panic). Requires VVDI MB or CGDI MB. Same platform as V-Class.',
  },

  // =====================================================
  // ML-CLASS (W163: 1998-2005, W164: 2006-2011)
  // =====================================================
  {
    model: 'ML-Class', year_start: 1998, year_end: 2005,
    key_blank: 'HU64', transponder_type: 'Mercedes IR', chip_type: 'IR/DAS',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W163 ML-Class. DAS system with IR key. HU64 key blank. Requires Mercedes SDS or DAS tool for programming.',
  },
  {
    model: 'ML-Class', year_start: 1998, year_end: 2005,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3302', ic_number: null,
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W163 ML-Class smart key variant. 4 buttons (Lock, Unlock, Trunk, Panic). Chrome key. Requires VVDI MB or CGDI MB.',
  },
  {
    model: 'ML-Class', year_start: 2006, year_end: 2011,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3317', ic_number: null,
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W164 ML-Class. Chrome smart key. 4 buttons (Lock, Unlock, Trunk, Panic). EIS system. Requires VVDI MB or CGDI MB. All keys lost: EIS password read.',
  },
  // ML rebadged as GLE from 2012
  {
    model: 'ML-Class', year_start: 2012, year_end: 2015,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC07', ic_number: '2694A-DC07',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W166 ML-Class (later renamed GLE). BGA smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB BGA or CGDI MB.',
  },

  // =====================================================
  // R-CLASS (W251: 2006-2013)
  // =====================================================
  {
    model: 'R-Class', year_start: 2006, year_end: 2013,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3317', ic_number: null,
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W251 R-Class. Chrome smart key. 4 buttons (Lock, Unlock, Trunk, Panic). EIS module. Requires VVDI MB or CGDI MB.',
  },

  // =====================================================
  // S-CLASS
  // =====================================================
  // W220 (1999-2006)
  {
    model: 'S-Class', year_start: 1999, year_end: 2006,
    key_blank: 'HU64', transponder_type: 'Mercedes IR/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3302', ic_number: null,
    battery_type: 'CR2025', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W220 S-Class. Chrome smart key. 3 buttons (Lock, Unlock, Trunk). IR-based EIS system. Requires VVDI MB or CGDI MB. All keys lost: EIS module read required.',
  },
  {
    model: 'S-Class', year_start: 1999, year_end: 2006,
    key_blank: 'HU64', transponder_type: 'Mercedes IR/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3302', ic_number: null,
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W220 S-Class. Chrome smart key with panic. 4 buttons (Lock, Unlock, Trunk, Panic). IR-based EIS system. Requires VVDI MB or CGDI MB.',
  },
  // W221 (2007-2013)
  {
    model: 'S-Class', year_start: 2007, year_end: 2013,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3317', ic_number: null,
    battery_type: 'CR2025', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W221 S-Class. BGA/NEC chrome smart key. 3 buttons (Lock, Unlock, Trunk). Requires VVDI MB BGA tool or CGDI MB. All keys lost: EIS password calculation.',
  },
  {
    model: 'S-Class', year_start: 2007, year_end: 2013,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3317', ic_number: null,
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W221 S-Class. BGA/NEC chrome smart key with panic. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB BGA tool or CGDI MB.',
  },
  // W222 (2014-2020)
  {
    model: 'S-Class', year_start: 2014, year_end: 2020,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC07', ic_number: '2694A-DC07',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W222 S-Class. BGA keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB BGA tool, CGDI MB, or Autel IM608. All keys lost: EIS/EZS password read.',
  },
  // W223 (2021+)
  {
    model: 'S-Class', year_start: 2021, year_end: 2026,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC12K', ic_number: '2694A-DC12K',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'W223 S-Class. Latest generation BGA keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Requires latest VVDI MB, CGDI MB, or Autel IM608 Pro II. Digital key support.',
  },

  // =====================================================
  // SL (R230: 2003-2012, R231: 2013-2020, R232: 2022+)
  // =====================================================
  {
    model: 'SL', year_start: 2003, year_end: 2012,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3312', ic_number: null,
    battery_type: 'CR2025', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'R230 SL. Chrome smart key. 3 buttons (Lock, Unlock, Trunk). EIS system. Requires VVDI MB or CGDI MB.',
  },
  {
    model: 'SL', year_start: 2013, year_end: 2020,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC07', ic_number: '2694A-DC07',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'R231 SL. BGA smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB BGA or CGDI MB.',
  },
  {
    model: 'SL', year_start: 2022, year_end: 2026,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC12K', ic_number: '2694A-DC12K',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'R232 SL. AMG-developed platform. BGA keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Requires latest VVDI MB or Autel IM608 Pro II.',
  },

  // =====================================================
  // SLC/SLK (R170: 1998-2004, R171: 2005-2011, R172: 2012-2020)
  // =====================================================
  {
    model: 'SLK', year_start: 1998, year_end: 2004,
    key_blank: 'HU64', transponder_type: 'Mercedes IR', chip_type: 'IR/DAS',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'R170 SLK. DAS system with IR key. HU64 blank. Requires Mercedes SDS or DAS programmer.',
  },
  {
    model: 'SLK', year_start: 2005, year_end: 2011,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'NEC',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ3312', ic_number: null,
    battery_type: 'CR2025', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'R171 SLK. Chrome smart key. 3 buttons (Lock, Unlock, Trunk). EIS system. Requires VVDI MB or CGDI MB.',
  },
  {
    model: 'SLC/SLK', year_start: 2012, year_end: 2020,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC07', ic_number: '2694A-DC07',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'R172 SLK (renamed SLC in 2017). BGA smart key. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB BGA or CGDI MB.',
  },

  // =====================================================
  // SPRINTER (NCV3: 2007-2018, VS30: 2019+)
  // =====================================================
  // NCV3 Transponder
  {
    model: 'Sprinter', year_start: 2007, year_end: 2013,
    key_blank: 'HU64', transponder_type: 'Philips Crypto 44', chip_type: 'PCF7935 (ID44)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'NCV3 Sprinter transponder key. ID44 chip. HU64 blade. Can be programmed via OBD with Sprinter-compatible tool. Shared platform with Dodge/Freightliner Sprinter.',
  },
  // NCV3 Smart key
  {
    model: 'Sprinter', year_start: 2014, year_end: 2018,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC10', ic_number: '2694A-DC10',
    battery_type: 'CR2025', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'NCV3 Sprinter (facelift). BGA smart key. 3 buttons (Lock, Unlock, Panic). Requires VVDI MB or CGDI MB.',
  },
  // VS30 (2019+) Smart key
  {
    model: 'Sprinter', year_start: 2019, year_end: 2026,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC11', ic_number: '2694A-DC11',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'VS30 Sprinter. BGA keyless go. 4 buttons (Lock, Unlock, Sliding Door, Panic). Requires VVDI MB, CGDI MB, or Autel IM608.',
  },

  // =====================================================
  // AMG GT (C190/R190: 2016+)
  // =====================================================
  {
    model: 'AMG GT', year_start: 2016, year_end: 2022,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC07', ic_number: '2694A-DC07',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'C190 AMG GT / GT S / GT C / GT R. BGA keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Requires VVDI MB BGA or CGDI MB.',
  },
  {
    model: 'AMG GT', year_start: 2024, year_end: 2026,
    key_blank: 'HU64', transponder_type: 'Mercedes BGA/NEC', chip_type: 'BGA (NEC)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC12K', ic_number: '2694A-DC12K',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: 'HU64',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    programming_notes: 'X290 AMG GT (new generation). BGA keyless go. 4 buttons (Lock, Unlock, Trunk, Panic). Requires latest VVDI MB or Autel IM608 Pro II.',
  },
];

// ============================================================
// VOLKSWAGEN KEY DATA
// Sources: UHS Hardware, Keyless Entry Remote, Tom's Key,
// ILCO / Strattec references, FCC ID.io
// ============================================================
const vwKeys = [

  // =====================================================
  // ATLAS (2018+)
  // =====================================================
  {
    model: 'Atlas', year_start: 2018, year_end: 2019,
    key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (Megamos AES)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR5FS14-T', ic_number: '2694A-FS14T',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU162T', test_key_blank: 'HU162T',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU162T(9)',
    programming_notes: 'MQB platform Atlas. 4-button smart key (Lock, Unlock, Trunk, Panic). 315 MHz. Requires VVDI2 + VVDI Prog, Autel IM608 with XP400 Pro, or OBDSTAR X300 DP Plus. IMMO 5 (MQB). All keys lost: must read IMMO data from cluster.',
  },
  {
    model: 'Atlas', year_start: 2020, year_end: 2026,
    key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (Megamos AES)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR5FS14-T', ic_number: '2694A-FS14T',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU162T', test_key_blank: 'HU162T',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU162T(9)',
    programming_notes: 'MQB Atlas (facelift). 4-button smart key (Lock, Unlock, Trunk, Panic). 315 MHz. MQB IMMO 5. Requires VVDI2, Autel IM608, or OBDSTAR.',
  },

  // =====================================================
  // ATLAS CROSS SPORT (2020+)
  // =====================================================
  {
    model: 'Atlas Cross Sport', year_start: 2020, year_end: 2026,
    key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (Megamos AES)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR5FS14-T', ic_number: '2694A-FS14T',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU162T', test_key_blank: 'HU162T',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU162T(9)',
    programming_notes: 'MQB Atlas Cross Sport. 4-button smart key (Lock, Unlock, Trunk, Panic). 315 MHz. Same MQB platform as Atlas. Requires VVDI2, Autel IM608, or OBDSTAR.',
  },

  // =====================================================
  // BEETLE (1998-2019)
  // =====================================================
  // New Beetle 1998-2005 (ID48)
  {
    model: 'Beetle', year_start: 1998, year_end: 2005,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto', chip_type: 'ID48 (Megamos Crypto)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'New Beetle with ID48 Megamos Crypto transponder. HU66 key blank. IMMO 2/3. OBD programmable with PIN code (SKC from dealer or calculated). 2 working keys needed for on-board add. VVDI2 or Tango for all keys lost.',
  },
  // New Beetle 2006-2010 (ID48 CAN)
  {
    model: 'Beetle', year_start: 2006, year_end: 2010,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NBG735868T', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'New Beetle with ID48 CAN transponder. Flip key with 3 buttons (Lock, Unlock, Trunk). 315 MHz remote. IMMO 3 (CAN based). PIN required for programming. VVDI2 or Tango recommended.',
  },
  // Beetle 2012-2019 (ID48 CAN / Megamos 48)
  {
    model: 'Beetle', year_start: 2012, year_end: 2019,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBG010206T', ic_number: '2694A-010206T',
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'A5 Beetle. Proximity smart key or flip key. 4 buttons (Lock, Unlock, Trunk, Panic). ID48 CAN chip. IMMO 4. 315 MHz. PIN required. VVDI2 or Autel IM608.',
  },

  // =====================================================
  // CC (2009-2017)
  // =====================================================
  {
    model: 'CC', year_start: 2009, year_end: 2012,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBG009066T', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'VW CC smart key. 4 buttons (Lock, Unlock, Trunk, Panic). ID48 CAN chip. 315 MHz. IMMO 4. PIN code required. VVDI2 or Tango for programming.',
  },
  {
    model: 'CC', year_start: 2013, year_end: 2017,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBG010206T', ic_number: '2694A-010206T',
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'VW CC facelift. Smart key. 4 buttons (Lock, Unlock, Trunk, Panic). ID48 CAN chip. 315 MHz. IMMO 4. PIN code required.',
  },

  // =====================================================
  // e-GOLF (2015-2020)
  // =====================================================
  {
    model: 'e-Golf', year_start: 2015, year_end: 2020,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBG010206T', ic_number: '2694A-010206T',
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'e-Golf electric. Smart key. 4 buttons (Lock, Unlock, Trunk, Panic). ID48 CAN chip. 315 MHz. Same key system as MK7 Golf. PIN required for programming.',
  },

  // =====================================================
  // GOLF / GTI / R
  // =====================================================
  // MK4 Golf (1999-2006) - ID48 Transponder
  {
    model: 'Golf/GTI', year_start: 1999, year_end: 2006,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto', chip_type: 'ID48 (Megamos Crypto)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'MK4 Golf/GTI. ID48 Megamos Crypto transponder. HU66 blade. IMMO 2/3. PIN code (SKC) required. On-board programming needs 2 existing keys. VVDI2 or Tango for all keys lost.',
  },
  // MK4 Golf (1999-2006) - Flip remote
  {
    model: 'Golf/GTI', year_start: 1999, year_end: 2006,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto', chip_type: 'ID48 (Megamos Crypto)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HLO1J0959753AM', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'MK4 Golf/GTI flip key with remote. 3 buttons (Lock, Unlock, Trunk). ID48 chip. 315 MHz. IMMO 2/3. PIN required.',
  },
  // MK5 Golf/GTI (2006-2009) - Flip key
  {
    model: 'Golf/GTI', year_start: 2006, year_end: 2009,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NBG735868T', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'MK5 Golf/GTI/Rabbit. Flip key. 3 buttons (Lock, Unlock, Trunk). ID48 CAN chip. 315 MHz. IMMO 3 (CAN). PIN required.',
  },
  // MK6 Golf/GTI (2010-2014) - Flip key 4-button
  {
    model: 'Golf/GTI', year_start: 2010, year_end: 2014,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NBG010180T', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'MK6 Golf/GTI. Flip key. 4 buttons (Lock, Unlock, Trunk, Panic). ID48 CAN chip. 315 MHz. IMMO 4. PIN required.',
  },
  // MK7 Golf/GTI (2015-2020) - Smart key
  {
    model: 'Golf/GTI', year_start: 2015, year_end: 2020,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBG010206T', ic_number: '2694A-010206T',
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'MK7 Golf/GTI/R. Smart proximity key. 4 buttons (Lock, Unlock, Trunk, Panic). ID48 CAN chip. 315 MHz. IMMO 4. PIN required. VVDI2, Autel IM608, or OBDSTAR for programming.',
  },
  // MK7 Golf R (2015-2020) - Smart key (same system, separate entry for clarity)
  {
    model: 'Golf R', year_start: 2015, year_end: 2020,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBG010206T', ic_number: '2694A-010206T',
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'MK7 Golf R. Smart proximity key. 4 buttons (Lock, Unlock, Trunk, Panic). ID48 CAN chip. Same system as Golf/GTI MK7. PIN required.',
  },
  // MK8 Golf/GTI (2022+) - MQB Smart key
  {
    model: 'Golf/GTI', year_start: 2022, year_end: 2026,
    key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (Megamos AES)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR5FS14-T', ic_number: '2694A-FS14T',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU162T', test_key_blank: 'HU162T',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU162T(9)',
    programming_notes: 'MK8 Golf/GTI. MQB platform. 4-button smart key (Lock, Unlock, Trunk, Panic). Megamos AES chip. 315 MHz. IMMO 5 (MQB). Requires VVDI2, Autel IM608 with XP400 Pro, or OBDSTAR.',
  },
  // MK8 Golf R (2022+) - MQB Smart key
  {
    model: 'Golf R', year_start: 2022, year_end: 2026,
    key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (Megamos AES)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR5FS14-T', ic_number: '2694A-FS14T',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU162T', test_key_blank: 'HU162T',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU162T(9)',
    programming_notes: 'MK8 Golf R. MQB platform. Same smart key as Golf/GTI MK8. 4 buttons. Megamos AES chip. IMMO 5.',
  },

  // =====================================================
  // ID.4 (2021+)
  // =====================================================
  {
    model: 'ID.4', year_start: 2021, year_end: 2026,
    key_blank: 'HU162T', transponder_type: 'MEB/NFC', chip_type: 'MEB Platform Key',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR5FS14-T', ic_number: '2694A-FS14T',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU162T', test_key_blank: 'HU162T',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU162T(9)',
    programming_notes: 'VW ID.4 electric vehicle. MEB platform smart key. 4 buttons (Lock, Unlock, Trunk, Panic). 315 MHz. Limited aftermarket support. Dealer programming may be required. HU162T emergency blade.',
  },

  // =====================================================
  // JETTA
  // =====================================================
  // MK4 Jetta (1999-2005) - ID48 Transponder
  {
    model: 'Jetta', year_start: 1999, year_end: 2005,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto', chip_type: 'ID48 (Megamos Crypto)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'MK4 Jetta. ID48 Megamos Crypto transponder. HU66 blade. IMMO 2/3. PIN (SKC) required. On-board with 2 working keys or VVDI2/Tango for all keys lost.',
  },
  // MK4 Jetta (1999-2005) - Flip remote
  {
    model: 'Jetta', year_start: 1999, year_end: 2005,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto', chip_type: 'ID48 (Megamos Crypto)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HLO1J0959753AM', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'MK4 Jetta flip key remote. 3 buttons (Lock, Unlock, Trunk). ID48 chip. 315 MHz. PIN required.',
  },
  // MK5 Jetta (2006-2010) - Flip key
  {
    model: 'Jetta', year_start: 2006, year_end: 2010,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NBG735868T', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'MK5 Jetta. Flip key. 3 buttons (Lock, Unlock, Trunk). ID48 CAN chip. 315 MHz. IMMO 3 (CAN). PIN required.',
  },
  // MK6 Jetta (2011-2018) - Flip key 4-button
  {
    model: 'Jetta', year_start: 2011, year_end: 2018,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NBG010180T', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'MK6 Jetta. Flip key. 4 buttons (Lock, Unlock, Trunk, Panic). ID48 CAN chip. 315 MHz. IMMO 4. PIN required. VVDI2 or Tango for all keys lost.',
  },
  // MK7 Jetta (2019+) - MQB Smart key
  {
    model: 'Jetta', year_start: 2019, year_end: 2026,
    key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (Megamos AES)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR5FS14-T', ic_number: '2694A-FS14T',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU162T', test_key_blank: 'HU162T',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU162T(9)',
    programming_notes: 'MK7 Jetta. MQB platform. 4-button smart key (Lock, Unlock, Trunk, Panic). Megamos AES chip. 315 MHz. IMMO 5. Requires VVDI2, Autel IM608, or OBDSTAR.',
  },

  // =====================================================
  // PASSAT
  // =====================================================
  // B5 Passat (1998-2005) - ID48
  {
    model: 'Passat', year_start: 1998, year_end: 2005,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto', chip_type: 'ID48 (Megamos Crypto)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'B5/B5.5 Passat. ID48 Megamos Crypto transponder. HU66 blade. IMMO 2/3. PIN required. On-board with 2 working keys.',
  },
  // B5 Passat (1998-2005) - Flip remote
  {
    model: 'Passat', year_start: 1998, year_end: 2005,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto', chip_type: 'ID48 (Megamos Crypto)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'HLO1J0959753AM', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'B5/B5.5 Passat flip key. 3 buttons (Lock, Unlock, Trunk). ID48 chip. 315 MHz. PIN required.',
  },
  // B6 Passat (2006-2010) - Flip key
  {
    model: 'Passat', year_start: 2006, year_end: 2010,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NBG735868T', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'B6 Passat. Flip key. 3 buttons (Lock, Unlock, Trunk). ID48 CAN chip. 315 MHz. IMMO 3. PIN required.',
  },
  // B6 Passat (2006-2010) - Smart key
  {
    model: 'Passat', year_start: 2006, year_end: 2010,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBG009066T', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'B6 Passat smart/proximity key. 4 buttons (Lock, Unlock, Trunk, Panic). ID48 CAN chip. 315 MHz. IMMO 3/4. PIN required.',
  },
  // B7 Passat (2012-2019) - Flip key
  {
    model: 'Passat', year_start: 2012, year_end: 2019,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NBG010180T', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'NMS Passat (US market). Flip key. 4 buttons (Lock, Unlock, Trunk, Panic). ID48 CAN chip. IMMO 4. PIN required.',
  },
  // B7 Passat (2012-2019) - Smart key
  {
    model: 'Passat', year_start: 2012, year_end: 2019,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBG010206T', ic_number: '2694A-010206T',
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'NMS Passat smart key. 4 buttons (Lock, Unlock, Trunk, Panic). ID48 CAN chip. IMMO 4. PIN required. VVDI2 or Autel IM608.',
  },
  // B9 Passat (2020+) - MQB (US only limited to 2022)
  {
    model: 'Passat', year_start: 2020, year_end: 2022,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBG010206T', ic_number: '2694A-010206T',
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'NMS Passat (final US model years). Smart key. 4 buttons. ID48 CAN chip. IMMO 4. PIN required. US Passat discontinued after 2022.',
  },

  // =====================================================
  // PHAETON (2004-2006 US)
  // =====================================================
  {
    model: 'Phaeton', year_start: 2004, year_end: 2006,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBG735868T', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'VW Phaeton (US market 2004-2006 only). Kessy smart key. 4 buttons (Lock, Unlock, Trunk, Panic). ID48 chip. 315 MHz. Dealer-level programming typically required.',
  },

  // =====================================================
  // ROUTAN (2009-2014)
  // =====================================================
  {
    model: 'Routan', year_start: 2009, year_end: 2014,
    key_blank: 'Y164-PT', transponder_type: 'Philips Crypto 46', chip_type: 'PCF7941 (ID46)',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'M3N5WY783X', ic_number: '7812A-5WY783X',
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'Y164-PT', test_key_blank: 'Y164-PT',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: null,
    programming_notes: 'VW Routan (rebadged Chrysler Town & Country). 5-button fobik (Lock, Unlock, Remote Start, Sliding Doors, Hatch). Uses Chrysler system, NOT VW IMMO. ID46 chip. PIN required. Chrysler WiTECH or aftermarket for programming.',
  },
  {
    model: 'Routan', year_start: 2009, year_end: 2014,
    key_blank: 'Y164-PT', transponder_type: 'Philips Crypto 46', chip_type: 'PCF7941 (ID46)',
    remote_frequency: '315 MHz', key_type: 'proximity',
    fcc_id: 'IYZ-C01C', ic_number: '2701A-C01C',
    battery_type: 'CR2032', buttons: '6',
    emergency_key_blank: 'Y164-PT', test_key_blank: 'Y164-PT',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: null,
    programming_notes: 'VW Routan 6-button fobik variant (Lock, Unlock, Remote Start, Left Slide, Right Slide, Hatch). Uses Chrysler system. ID46 chip. PIN required.',
  },

  // =====================================================
  // TAOS (2022+)
  // =====================================================
  {
    model: 'Taos', year_start: 2022, year_end: 2026,
    key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (Megamos AES)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR5FS14-T', ic_number: '2694A-FS14T',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU162T', test_key_blank: 'HU162T',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU162T(9)',
    programming_notes: 'VW Taos. MQB platform. 4-button smart key (Lock, Unlock, Trunk, Panic). Megamos AES chip. 315 MHz. IMMO 5. Requires VVDI2, Autel IM608, or OBDSTAR.',
  },

  // =====================================================
  // TIGUAN
  // =====================================================
  // 1st gen (2009-2017) - Flip key
  {
    model: 'Tiguan', year_start: 2009, year_end: 2011,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NBG735868T', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'Tiguan 1st gen. Flip key. 3 buttons (Lock, Unlock, Trunk). ID48 CAN chip. 315 MHz. IMMO 3. PIN required.',
  },
  {
    model: 'Tiguan', year_start: 2012, year_end: 2017,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48 CAN (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NBG010180T', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'Tiguan 1st gen facelift. Flip key. 4 buttons (Lock, Unlock, Trunk, Panic). ID48 CAN. IMMO 4. PIN required.',
  },
  // 2nd gen Tiguan (2018+) - MQB Smart key
  {
    model: 'Tiguan', year_start: 2018, year_end: 2026,
    key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (Megamos AES)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR5FS14-T', ic_number: '2694A-FS14T',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU162T', test_key_blank: 'HU162T',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU162T(9)',
    programming_notes: 'Tiguan 2nd gen. MQB platform. 4-button smart key (Lock, Unlock, Trunk, Panic). Megamos AES chip. 315 MHz. IMMO 5. Requires VVDI2, Autel IM608, or OBDSTAR.',
  },

  // =====================================================
  // TOUAREG
  // =====================================================
  // 1st gen (2004-2010) - ID46 smart key
  {
    model: 'Touareg', year_start: 2004, year_end: 2010,
    key_blank: 'HU66', transponder_type: 'Philips Crypto 46', chip_type: 'PCF7946 (ID46)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK45022', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'Touareg 1st gen. Kessy smart key. 4 buttons (Lock, Unlock, Trunk, Panic). ID46 chip. 315 MHz. Requires dealer-level ODIS or VVDI2. PIN/SKC required.',
  },
  // 2nd gen (2011-2017) - ID46/ID48
  {
    model: 'Touareg', year_start: 2011, year_end: 2017,
    key_blank: 'HU66', transponder_type: 'Philips Crypto 46', chip_type: 'PCF7945 (ID46)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZVWTOUA', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU66', test_key_blank: 'HU66',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    programming_notes: 'Touareg 2nd gen. Kessy smart key. 4 buttons (Lock, Unlock, Trunk, Panic). ID46 chip. 315 MHz. Requires ODIS or VVDI2.',
  },
  // 3rd gen (2019+) - MQB
  {
    model: 'Touareg', year_start: 2019, year_end: 2026,
    key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (Megamos AES)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR5FS14-T', ic_number: '2694A-FS14T',
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU162T', test_key_blank: 'HU162T',
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU162T(9)',
    programming_notes: 'Touareg 3rd gen. MQB/MLB platform. 4-button smart key. Megamos AES chip. 315 MHz. Requires VVDI2, Autel IM608, or OBDSTAR.',
  },
];


// ============================================================
// MAIN EXECUTION
// ============================================================
async function main() {
  await client.connect();
  console.log('Connected to database.\n');

  try {
    // Start transaction
    await client.query('BEGIN');

    // ====== DELETE EXISTING DATA ======
    console.log('='.repeat(80));
    console.log('DELETING EXISTING MERCEDES-BENZ AND VOLKSWAGEN DATA');
    console.log('='.repeat(80));

    // Delete automotive_keys rows (this will cascade from vehicle_years if needed,
    // but let's delete directly from automotive_keys first)
    const delMbKeys = await client.query(
      `DELETE FROM automotive_keys WHERE manufacturer_id = $1`, [MERCEDES_MFR_ID]
    );
    console.log(`Deleted ${delMbKeys.rowCount} Mercedes-Benz automotive_keys rows.`);

    const delVwKeys = await client.query(
      `DELETE FROM automotive_keys WHERE manufacturer_id = $1`, [VW_MFR_ID]
    );
    console.log(`Deleted ${delVwKeys.rowCount} Volkswagen automotive_keys rows.`);

    // Delete orphaned vehicle_years for Mercedes models
    const mbModelRows = await client.query(
      `SELECT id, name FROM vehicle_models WHERE manufacturer_id = $1`, [MERCEDES_MFR_ID]
    );
    for (const m of mbModelRows.rows) {
      await client.query(`DELETE FROM vehicle_years WHERE model_id = $1`, [m.id]);
    }
    console.log(`Cleaned up Mercedes vehicle_years.`);

    const vwModelRows = await client.query(
      `SELECT id, name FROM vehicle_models WHERE manufacturer_id = $1`, [VW_MFR_ID]
    );
    for (const m of vwModelRows.rows) {
      await client.query(`DELETE FROM vehicle_years WHERE model_id = $1`, [m.id]);
    }
    console.log(`Cleaned up Volkswagen vehicle_years.`);

    // Build model lookup maps
    const mbModelMap = {};
    for (const m of mbModelRows.rows) {
      mbModelMap[m.name] = m.id;
    }
    const vwModelMap = {};
    for (const m of vwModelRows.rows) {
      vwModelMap[m.name] = m.id;
    }

    // Helper: slugify
    function slugify(name) {
      return name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
    }

    // Helper: ensure model exists
    async function ensureModel(mfrId, modelMap, modelName) {
      if (modelMap[modelName]) return modelMap[modelName];
      const res = await client.query(
        `INSERT INTO vehicle_models (id, manufacturer_id, name, slug)
         VALUES (gen_random_uuid(), $1, $2, $3)
         RETURNING id`,
        [mfrId, modelName, slugify(modelName)]
      );
      modelMap[modelName] = res.rows[0].id;
      console.log(`  Created model: ${modelName} (${res.rows[0].id})`);
      return res.rows[0].id;
    }

    // Helper: ensure vehicle_year exists
    async function ensureVehicleYear(modelId, yearStart, yearEnd) {
      const res = await client.query(
        `INSERT INTO vehicle_years (id, model_id, year_start, year_end)
         VALUES (gen_random_uuid(), $1, $2, $3)
         ON CONFLICT (model_id, year_start, year_end) DO UPDATE SET year_start = EXCLUDED.year_start
         RETURNING id`,
        [modelId, yearStart, yearEnd]
      );
      return res.rows[0].id;
    }

    // ====== INSERT MERCEDES-BENZ ======
    console.log('\n' + '='.repeat(80));
    console.log('INSERTING MERCEDES-BENZ KEY DATA');
    console.log('='.repeat(80));

    let mbCount = 0;
    for (const key of mercedesKeys) {
      const modelId = await ensureModel(MERCEDES_MFR_ID, mbModelMap, key.model);
      const yearId = await ensureVehicleYear(modelId, key.year_start, key.year_end);

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
          yearId, MERCEDES_MFR_ID, `Mercedes-Benz ${key.model}`,
          key.key_blank, key.transponder_type, key.chip_type, key.remote_frequency,
          key.key_type, key.fcc_id, key.ic_number, key.programming_notes,
          key.pin_code_required, key.obd_programmable, key.emergency_key_blank,
          key.year_start, key.year_end, key.battery_type, key.buttons,
          key.test_key_blank, key.image_url || null, key.lishi_tool,
        ]
      );
      mbCount++;
      console.log(`  [${mbCount}] Mercedes-Benz ${key.model} ${key.year_start}-${key.year_end} | ${key.key_type} | ${key.buttons || 'N/A'} btn | FCC: ${key.fcc_id || 'N/A'} | ${key.chip_type}`);
    }
    console.log(`\nInserted ${mbCount} Mercedes-Benz key rows.`);

    // ====== INSERT VOLKSWAGEN ======
    console.log('\n' + '='.repeat(80));
    console.log('INSERTING VOLKSWAGEN KEY DATA');
    console.log('='.repeat(80));

    let vwCount = 0;
    for (const key of vwKeys) {
      const modelId = await ensureModel(VW_MFR_ID, vwModelMap, key.model);
      const yearId = await ensureVehicleYear(modelId, key.year_start, key.year_end);

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
          yearId, VW_MFR_ID, `Volkswagen ${key.model}`,
          key.key_blank, key.transponder_type, key.chip_type, key.remote_frequency,
          key.key_type, key.fcc_id, key.ic_number, key.programming_notes,
          key.pin_code_required, key.obd_programmable, key.emergency_key_blank,
          key.year_start, key.year_end, key.battery_type, key.buttons,
          key.test_key_blank, key.image_url || null, key.lishi_tool,
        ]
      );
      vwCount++;
      console.log(`  [${vwCount}] Volkswagen ${key.model} ${key.year_start}-${key.year_end} | ${key.key_type} | ${key.buttons || 'N/A'} btn | FCC: ${key.fcc_id || 'N/A'} | ${key.chip_type}`);
    }
    console.log(`\nInserted ${vwCount} Volkswagen key rows.`);

    // Commit transaction
    await client.query('COMMIT');
    console.log('\nTransaction COMMITTED successfully.');

    // ====== VERIFICATION ======
    console.log('\n' + '='.repeat(80));
    console.log('VERIFICATION');
    console.log('='.repeat(80));

    const verMb = await client.query(
      `SELECT model_name, year_start, year_end, key_type, key_blank,
              chip_type, fcc_id, remote_frequency, buttons, lishi_tool, battery_type
       FROM automotive_keys WHERE manufacturer_id=$1
       ORDER BY model_name, year_start, key_type`, [MERCEDES_MFR_ID]
    );
    console.log(`\nMercedes-Benz: ${verMb.rows.length} rows`);
    for (const r of verMb.rows) {
      console.log(`  ${r.model_name} ${r.year_start}-${r.year_end} | ${r.key_type} | ${r.key_blank} | ${r.chip_type} | FCC: ${r.fcc_id || 'N/A'} | ${r.buttons || 'N/A'} btn | ${r.lishi_tool || 'N/A'}`);
    }

    const verVw = await client.query(
      `SELECT model_name, year_start, year_end, key_type, key_blank,
              chip_type, fcc_id, remote_frequency, buttons, lishi_tool, battery_type
       FROM automotive_keys WHERE manufacturer_id=$1
       ORDER BY model_name, year_start, key_type`, [VW_MFR_ID]
    );
    console.log(`\nVolkswagen: ${verVw.rows.length} rows`);
    for (const r of verVw.rows) {
      console.log(`  ${r.model_name} ${r.year_start}-${r.year_end} | ${r.key_type} | ${r.key_blank} | ${r.chip_type} | FCC: ${r.fcc_id || 'N/A'} | ${r.buttons || 'N/A'} btn | ${r.lishi_tool || 'N/A'}`);
    }

    console.log(`\n${'='.repeat(80)}`);
    console.log(`TOTAL: ${verMb.rows.length} Mercedes-Benz + ${verVw.rows.length} Volkswagen = ${verMb.rows.length + verVw.rows.length} rows`);
    console.log('='.repeat(80));

  } catch (err) {
    await client.query('ROLLBACK');
    console.error('ERROR - Transaction ROLLED BACK:', err.message);
    console.error(err.stack);
  } finally {
    await client.end();
    console.log('\nDatabase connection closed.');
  }
}

main();
