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

// Manufacturer IDs
const JAGUAR_ID  = '138d6254-0b62-46ee-a0a8-32696b86bc71';
const PORSCHE_ID = '3fadbb6f-4dcb-4584-a825-df4296d93e98';
const MINI_ID    = '5a8e1032-4a65-46f4-b0e3-3f705920bf2f';

// ============================================================
// JAGUAR KEY DATA
// Sources: Locksmith Ledger, UHS Hardware, Key Craze, Transpondery,
// JaguarForum, FCC ID database
// ============================================================
const jaguarKeys = [

  // =====================================================
  // JAGUAR S-TYPE (2000-2008)
  // =====================================================
  {
    model: 'Jaguar S-Type', year_start: 2000, year_end: 2002,
    key_blank: 'FO21', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NHVWB1U241', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi FO21',
    image_url: null,
    programming_notes: 'Uses Tibbe-style FO21 key blade. 4C transponder. Program via Jaguar SDD/IDS or aftermarket tool. 4 buttons: lock, unlock, trunk, panic.',
  },
  {
    model: 'Jaguar S-Type', year_start: 2003, year_end: 2008,
    key_blank: 'FO21', transponder_type: 'Texas Crypto 4D 60', chip_type: '4D60',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NHVWB1U241', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi FO21',
    image_url: null,
    programming_notes: 'Upgraded to 4D60 transponder. Program via Jaguar SDD/IDS. Tibbe FO21 blade. On-board programming with 2 working keys possible.',
  },

  // =====================================================
  // JAGUAR X-TYPE (2002-2008)
  // =====================================================
  {
    model: 'Jaguar X-Type', year_start: 2002, year_end: 2004,
    key_blank: 'FO21', transponder_type: 'Texas Crypto 4D 60', chip_type: '4D60',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NHVWB1U241', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi FO21',
    image_url: null,
    programming_notes: 'Ford platform shares Tibbe FO21 blade. 4D60 transponder chip. Program with Jaguar SDD or compatible EEPROM tool.',
  },
  {
    model: 'Jaguar X-Type', year_start: 2005, year_end: 2008,
    key_blank: 'FO21', transponder_type: 'Texas Crypto 4D 63', chip_type: '4D63 (40-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NHVWB1U241', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi FO21',
    image_url: null,
    programming_notes: 'Updated to 4D63 40-bit transponder. Uses Tibbe FO21 blade. Program with Jaguar SDD/IDS or VVDI/Smart Pro. On-board with 2 working keys.',
  },

  // =====================================================
  // JAGUAR XJ (X350) (2004-2007)
  // =====================================================
  {
    model: 'Jaguar XJ (X350)', year_start: 2004, year_end: 2007,
    key_blank: 'FO21', transponder_type: 'Texas Crypto 4D 60', chip_type: '4D60',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NHVWB1U241', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi FO21',
    image_url: null,
    programming_notes: 'X350 generation XJ. FO21 Tibbe blade with 4D60 transponder. Program via Jaguar SDD/IDS. Smart key variant also available on some trims.',
  },

  // =====================================================
  // JAGUAR XJ (X358) (2008-2009)
  // =====================================================
  {
    model: 'Jaguar XJ (X358)', year_start: 2008, year_end: 2009,
    key_blank: 'FO21', transponder_type: 'Texas Crypto 4D 63', chip_type: '4D63 (80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NHVWB1U241', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi FO21',
    image_url: null,
    programming_notes: 'X358 generation. Upgraded to 4D63 80-bit transponder. FO21 blade. Program via Jaguar SDD/IDS or aftermarket tools.',
  },

  // =====================================================
  // JAGUAR XJ (X351) (2010-2019) - Smart Key
  // =====================================================
  {
    model: 'Jaguar XJ (X351)', year_start: 2010, year_end: 2015,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID47 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'X351 gen. Push-button start smart key. 5 buttons: lock, unlock, trunk, panic, start. Emergency HU101 blade inside fob. Program with Jaguar SDD/Pathfinder or Autel/VVDI.',
  },
  {
    model: 'Jaguar XJ (X351)', year_start: 2016, year_end: 2019,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'X351 later model. ID49 chip. Push-button start. Program with Jaguar Pathfinder, Autel IM608, or VVDI Key Tool Plus.',
  },

  // =====================================================
  // JAGUAR XK / XKR (2007-2015)
  // =====================================================
  {
    model: 'Jaguar XK', year_start: 2007, year_end: 2009,
    key_blank: 'FO21', transponder_type: 'Texas Crypto 4D 63', chip_type: '4D63 (80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NHVWB1U241', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi FO21',
    image_url: null,
    programming_notes: 'FO21 Tibbe blade with 4D63 80-bit chip. Program via Jaguar SDD/IDS. 4 buttons: lock, unlock, trunk, panic.',
  },
  {
    model: 'Jaguar XK', year_start: 2010, year_end: 2015,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID47 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Smart key system. Push-button start. 5 buttons. Emergency HU101 blade. Program with Jaguar SDD/Pathfinder or aftermarket tools.',
  },
  {
    model: 'Jaguar XKR', year_start: 2007, year_end: 2009,
    key_blank: 'FO21', transponder_type: 'Texas Crypto 4D 63', chip_type: '4D63 (80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NHVWB1U241', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi FO21',
    image_url: null,
    programming_notes: 'Same as XK platform. FO21 blade, 4D63 80-bit. Program via Jaguar SDD/IDS.',
  },
  {
    model: 'Jaguar XKR', year_start: 2010, year_end: 2015,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID47 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'XKR smart key. Same as XK platform 2010+. Push-button start. 5 buttons. Program with Jaguar SDD/Pathfinder.',
  },

  // =====================================================
  // JAGUAR XF (2009-2024)
  // =====================================================
  {
    model: 'Jaguar XF', year_start: 2009, year_end: 2012,
    key_blank: 'FO21', transponder_type: 'Texas Crypto 4D 63', chip_type: '4D63 (80-bit)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NHVWB1U241', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi FO21',
    image_url: null,
    programming_notes: 'First gen XF (X250). FO21 Tibbe blade with 4D63 80-bit transponder. 4-button remote head key. Program via Jaguar SDD/IDS.',
  },
  {
    model: 'Jaguar XF', year_start: 2009, year_end: 2015,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID47 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'XF X250 smart key variant. Push-button start. 5 buttons. Emergency HU101 blade inside fob. Program with Jaguar SDD/Pathfinder.',
  },
  {
    model: 'Jaguar XF', year_start: 2016, year_end: 2020,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'XF X260 gen. ID49 chip. Push-button start smart key. 5 buttons. Program with Jaguar Pathfinder, Autel IM608, or VVDI Key Tool Plus.',
  },
  {
    model: 'Jaguar XF', year_start: 2021, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Latest XF. ID49 chip. Push-button start. Program with Jaguar Pathfinder or Autel/VVDI. May require online module for some years.',
  },

  // =====================================================
  // JAGUAR XE (2016-2024)
  // =====================================================
  {
    model: 'Jaguar XE', year_start: 2016, year_end: 2020,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Smart key with push-button start. ID49 chip. 5 buttons: lock, unlock, trunk, panic, start. HU101 emergency blade. Program via Jaguar Pathfinder, Autel IM608, VVDI.',
  },
  {
    model: 'Jaguar XE', year_start: 2021, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Latest XE. ID49 chip. Push-button start. Program with Jaguar Pathfinder, Autel IM608, or VVDI Key Tool Plus.',
  },

  // =====================================================
  // JAGUAR F-TYPE (2014-2024)
  // =====================================================
  {
    model: 'Jaguar F-Type', year_start: 2014, year_end: 2020,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'F-Type smart key. Push-button start. ID49 chip. 5 buttons. Emergency HU101 blade. Program with Jaguar SDD/Pathfinder, Autel IM608, or VVDI.',
  },
  {
    model: 'Jaguar F-Type', year_start: 2021, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Latest F-Type. ID49 chip. Push-button start. Program with Jaguar Pathfinder or Autel/VVDI. May require online module.',
  },

  // =====================================================
  // JAGUAR F-PACE (2017-2024)
  // =====================================================
  {
    model: 'Jaguar F-Pace', year_start: 2017, year_end: 2020,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'F-Pace smart key. Push-button start. ID49 chip. 5 buttons: lock, unlock, trunk, panic, start. Emergency HU101 blade. Program with Jaguar Pathfinder, Autel IM608, VVDI.',
  },
  {
    model: 'Jaguar F-Pace', year_start: 2021, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Facelift F-Pace. ID49 chip. Push-button start. Program with Jaguar Pathfinder, Autel IM608, or VVDI Key Tool Plus. May require online module.',
  },

  // =====================================================
  // JAGUAR E-PACE (2018-2024)
  // =====================================================
  {
    model: 'Jaguar E-Pace', year_start: 2018, year_end: 2020,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'E-Pace smart key. Push-button start. ID49 chip. 5 buttons. Emergency HU101 blade. Program with Jaguar Pathfinder, Autel IM608, VVDI.',
  },
  {
    model: 'Jaguar E-Pace', year_start: 2021, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Updated E-Pace. ID49 chip. Push-button start. Program with Jaguar Pathfinder, Autel IM608, or VVDI Key Tool Plus.',
  },

  // =====================================================
  // JAGUAR I-PACE (2019-2024)
  // =====================================================
  {
    model: 'Jaguar I-Pace', year_start: 2019, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'PCF7953', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: '7812A-JTFJ10A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'All-electric I-Pace. Smart key with push-button start. ID49 chip. 5 buttons. Emergency HU101 blade. Program with Jaguar Pathfinder, Autel IM608, VVDI.',
  },
];

// ============================================================
// PORSCHE KEY DATA
// Sources: FCC ID database, Porsche forums, Key Craze,
// Locksmith Ledger, UHS Hardware
// ============================================================
const porscheKeys = [

  // =====================================================
  // PORSCHE 911 (996) (1999-2004)
  // =====================================================
  {
    model: 'Porsche 911 (996)', year_start: 1999, year_end: 2004,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 48 (ID48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KR55WK45022', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    image_url: null,
    programming_notes: 'Porsche 996 uses Megamos 48 transponder. 3 buttons: lock, unlock, trunk. HU66 blade. Must program via Porsche PIWIS or key EEPROM dump. PIN/security code required. Not OBD programmable.',
  },

  // =====================================================
  // PORSCHE 911 (997) (2005-2012)
  // =====================================================
  {
    model: 'Porsche 911 (997)', year_start: 2005, year_end: 2008,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 48 (ID48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KR55WK45032', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    image_url: null,
    programming_notes: '997.1 uses Megamos 48 transponder. HU66 blade. 3 buttons: lock, unlock, trunk. Program via Porsche PIWIS or aftermarket EEPROM tools. PIN required.',
  },
  {
    model: 'Porsche 911 (997)', year_start: 2009, year_end: 2012,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 48 (ID48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK50138', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    image_url: null,
    programming_notes: '997.2 introduced smart key / proximity entry on some trims. 4 buttons: lock, unlock, trunk, panic. ID48 chip. Program via PIWIS or VVDI with Porsche adapter.',
  },

  // =====================================================
  // PORSCHE 911 (991) (2012-2019)
  // =====================================================
  {
    model: 'Porsche 911 (991)', year_start: 2012, year_end: 2016,
    key_blank: 'HU66', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK50138', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    image_url: null,
    programming_notes: '991.1 smart key with push-button start. ID49 chip. 4 buttons: lock, unlock, trunk, panic. Emergency HU66 blade. Program via Porsche PIWIS II or VVDI Key Tool Plus.',
  },
  {
    model: 'Porsche 911 (991)', year_start: 2017, year_end: 2019,
    key_blank: 'HU66', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK50138', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    image_url: null,
    programming_notes: '991.2 smart key. ID49 chip. 4 buttons. Program via PIWIS II/III. VVDI Key Tool Plus supports key learning. PIN/security code required.',
  },

  // =====================================================
  // PORSCHE 911 (992) (2020-2025)
  // =====================================================
  {
    model: 'Porsche 911 (992)', year_start: 2020, year_end: 2025,
    key_blank: 'HU162', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZPK3', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU162', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU162',
    image_url: null,
    programming_notes: '992 gen smart key. ID49 chip. New HU162 blade profile. 4 buttons: lock, unlock, trunk, panic. Program via PIWIS III or compatible aftermarket tool. PIN required. Online coding may be needed.',
  },

  // =====================================================
  // PORSCHE 718 BOXSTER / CAYMAN (2017-2024)
  // =====================================================
  {
    model: 'Porsche 718 Boxster', year_start: 2017, year_end: 2024,
    key_blank: 'HU66', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK50138', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    image_url: null,
    programming_notes: '718 Boxster smart key. ID49 chip. 4 buttons: lock, unlock, trunk, panic. Emergency HU66 blade. Program via PIWIS II/III or VVDI Key Tool Plus. PIN required.',
  },
  {
    model: 'Porsche 718 Cayman', year_start: 2017, year_end: 2024,
    key_blank: 'HU66', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK50138', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    image_url: null,
    programming_notes: '718 Cayman smart key. ID49 chip. 4 buttons. Same platform as 718 Boxster. Program via PIWIS II/III or VVDI Key Tool Plus. PIN required.',
  },

  // =====================================================
  // PORSCHE CAYENNE (2003-2024)
  // =====================================================
  {
    model: 'Porsche Cayenne', year_start: 2003, year_end: 2006,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 48 (ID48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'KR55WK45022', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    image_url: null,
    programming_notes: 'First gen Cayenne (9PA). Megamos 48 (ID48) transponder. HU66 blade. 3 buttons: lock, unlock, trunk. Program via PIWIS or EEPROM dump. PIN required.',
  },
  {
    model: 'Porsche Cayenne', year_start: 2007, year_end: 2010,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto', chip_type: 'Megamos 48 (ID48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK45032', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    image_url: null,
    programming_notes: 'Cayenne 9PA facelift. Smart key option with Megamos 48. 4 buttons: lock, unlock, trunk, panic. Program via PIWIS or aftermarket tools. PIN required.',
  },
  {
    model: 'Porsche Cayenne', year_start: 2011, year_end: 2017,
    key_blank: 'HU66', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK50138', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    image_url: null,
    programming_notes: 'Cayenne 92A (2nd gen). ID49 chip. Smart key with push-button start. 4 buttons. Emergency HU66 blade. Program via PIWIS II or VVDI.',
  },
  {
    model: 'Porsche Cayenne', year_start: 2018, year_end: 2024,
    key_blank: 'HU162', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZPK3', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU162', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU162',
    image_url: null,
    programming_notes: 'Cayenne 9YA (3rd gen). New HU162 blade profile. ID49 chip. 4 buttons. Program via PIWIS III. VVDI Key Tool Plus may support. PIN required. Online coding may be needed.',
  },

  // =====================================================
  // PORSCHE PANAMERA (2010-2024)
  // =====================================================
  {
    model: 'Porsche Panamera', year_start: 2010, year_end: 2016,
    key_blank: 'HU66', transponder_type: 'Hitag 2', chip_type: 'ID46 (PCF7941)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK50138', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    image_url: null,
    programming_notes: 'Panamera 970. ID46 chip. Smart key with push-button start. 4 buttons: lock, unlock, trunk, panic. Emergency HU66 blade. Program via PIWIS II or VVDI. PIN required.',
  },
  {
    model: 'Porsche Panamera', year_start: 2017, year_end: 2024,
    key_blank: 'HU162', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZPK3', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU162', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU162',
    image_url: null,
    programming_notes: 'Panamera 971 (2nd gen). New HU162 blade. ID49 chip. 4 buttons. Program via PIWIS III. VVDI Key Tool Plus may support. PIN required.',
  },

  // =====================================================
  // PORSCHE MACAN (2015-2024)
  // =====================================================
  {
    model: 'Porsche Macan', year_start: 2015, year_end: 2018,
    key_blank: 'HU66', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK50138', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    image_url: null,
    programming_notes: 'Macan 95B. ID49 chip. Smart key with push-button start. 4 buttons. Emergency HU66 blade. Program via PIWIS II or VVDI Key Tool Plus. PIN required.',
  },
  {
    model: 'Porsche Macan', year_start: 2019, year_end: 2024,
    key_blank: 'HU66', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZPK3', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66',
    image_url: null,
    programming_notes: 'Macan facelift. ID49 chip. Smart key. 4 buttons. HU66 blade. Program via PIWIS II/III or VVDI Key Tool Plus. PIN required.',
  },

  // =====================================================
  // PORSCHE TAYCAN (2020-2025)
  // =====================================================
  {
    model: 'Porsche Taycan', year_start: 2020, year_end: 2025,
    key_blank: 'HU162', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZPK3', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HU162', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU162',
    image_url: null,
    programming_notes: 'All-electric Taycan. ID49 chip. Smart key with push-button start. 4 buttons. HU162 emergency blade. Program via PIWIS III. Online coding required for key learning. Limited aftermarket support.',
  },
];

// ============================================================
// MINI KEY DATA
// Sources: FCC ID database, BMW/Mini forums, Key Craze,
// UHS Hardware, Locksmith Ledger
// ============================================================
const miniKeys = [

  // =====================================================
  // MINI COOPER / COOPER S (R50/R53) (2002-2006)
  // =====================================================
  {
    model: 'Mini Cooper (R50)', year_start: 2002, year_end: 2006,
    key_blank: 'HU92', transponder_type: 'EWS3 (PCF7935)', chip_type: 'ID44 (PCF7935)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: '2694A-FZV',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'First gen Mini (R50). EWS3 immobilizer with ID44 PCF7935 chip. HU92 blade. 3 buttons: lock, unlock, trunk. Program via BMW EWS3 system - EEPROM editing or tool like VVDI/CG Pro.',
  },
  {
    model: 'Mini Cooper S (R53)', year_start: 2002, year_end: 2006,
    key_blank: 'HU92', transponder_type: 'EWS3 (PCF7935)', chip_type: 'ID44 (PCF7935)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: '2694A-FZV',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'R53 Cooper S supercharged. Same EWS3 system as R50. ID44 (PCF7935) chip. HU92 blade. 3 buttons. Program via EWS3 EEPROM editing.',
  },

  // =====================================================
  // MINI COOPER / COOPER S (R56) (2007-2013)
  // =====================================================
  {
    model: 'Mini Cooper (R56)', year_start: 2007, year_end: 2010,
    key_blank: 'HU92', transponder_type: 'CAS2 (PCF7942)', chip_type: 'ID46 (PCF7942)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: '2694A-FZV',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'R56 with CAS2 module. ID46 (PCF7942) chip. HU92 blade. 3 buttons. OBD programmable with BMW key programmer tools (VVDI, CG Pro, Autel). May need CAS EEPROM for all-keys-lost.',
  },
  {
    model: 'Mini Cooper (R56)', year_start: 2011, year_end: 2013,
    key_blank: 'HU92', transponder_type: 'CAS3/CAS3+ (PCF7945)', chip_type: 'ID46 (PCF7945)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: '2694A-FZV',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'R56 LCI with CAS3/CAS3+. ID46 (PCF7945) chip. HU92 blade. 3 buttons. OBD programmable with VVDI2/CG Pro/Autel. CAS EEPROM dump for all-keys-lost.',
  },
  {
    model: 'Mini Cooper S (R56)', year_start: 2007, year_end: 2010,
    key_blank: 'HU92', transponder_type: 'CAS2 (PCF7942)', chip_type: 'ID46 (PCF7942)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: '2694A-FZV',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'R56 Cooper S turbo. CAS2 module with ID46 (PCF7942). HU92 blade. 3 buttons. Same programming as Cooper R56.',
  },
  {
    model: 'Mini Cooper S (R56)', year_start: 2011, year_end: 2013,
    key_blank: 'HU92', transponder_type: 'CAS3/CAS3+ (PCF7945)', chip_type: 'ID46 (PCF7945)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: '2694A-FZV',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'R56 LCI Cooper S. CAS3/CAS3+ with ID46 (PCF7945). HU92 blade. 3 buttons. OBD programmable.',
  },

  // =====================================================
  // MINI COOPER / COOPER S (F55/F56) (2014-2024) - Smart Key
  // =====================================================
  {
    model: 'Mini Cooper (F56)', year_start: 2014, year_end: 2018,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F56 3-door. FEM/BDC module. ID49 chip. Smart key with push-button start. 3 buttons: lock, unlock, trunk. Emergency HU100R blade. Program via VVDI2/Key Tool Plus, Autel IM608, or ISTA.',
  },
  {
    model: 'Mini Cooper (F56)', year_start: 2019, year_end: 2024,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F56 LCI. FEM/BDC module. ID49 chip. Smart key. 3 buttons. HU100R emergency blade. Program via VVDI2, Autel IM608, or BMW ISTA+.',
  },
  {
    model: 'Mini Cooper (F55)', year_start: 2015, year_end: 2018,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F55 5-door hardtop. Same FEM/BDC as F56. ID49 chip. Smart key. 3 buttons. HU100R emergency blade. Program via VVDI2, Autel IM608, or ISTA.',
  },
  {
    model: 'Mini Cooper (F55)', year_start: 2019, year_end: 2024,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F55 LCI 5-door. FEM/BDC. ID49 chip. Smart key. 3 buttons. Program via VVDI2/Key Tool Plus, Autel IM608.',
  },
  {
    model: 'Mini Cooper S (F56)', year_start: 2014, year_end: 2018,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F56 Cooper S turbo. Same FEM/BDC system as Cooper. ID49 chip. Smart key. 3 buttons. HU100R blade. Program via VVDI2, Autel IM608.',
  },
  {
    model: 'Mini Cooper S (F56)', year_start: 2019, year_end: 2024,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F56 LCI Cooper S. FEM/BDC. ID49 chip. Smart key. 3 buttons. Program via VVDI2/Key Tool Plus, Autel IM608.',
  },

  // =====================================================
  // MINI CONVERTIBLE (R52 / R57 / F57)
  // =====================================================
  {
    model: 'Mini Convertible (R52)', year_start: 2004, year_end: 2008,
    key_blank: 'HU92', transponder_type: 'EWS3 (PCF7935)', chip_type: 'ID44 (PCF7935)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: '2694A-FZV',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'R52 Convertible. EWS3 with ID44 (PCF7935). HU92 blade. 3 buttons. Program via EWS3 EEPROM editing (VVDI/CG Pro).',
  },
  {
    model: 'Mini Convertible (R57)', year_start: 2009, year_end: 2015,
    key_blank: 'HU92', transponder_type: 'CAS3/CAS3+ (PCF7945)', chip_type: 'ID46 (PCF7945)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: '2694A-FZV',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'R57 Convertible. CAS3/CAS3+ module. ID46 (PCF7945). HU92 blade. 3 buttons. OBD programmable with VVDI2/CG Pro/Autel.',
  },
  {
    model: 'Mini Convertible (F57)', year_start: 2016, year_end: 2024,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F57 Convertible. FEM/BDC module. ID49 chip. Smart key with push-button start. 3 buttons. HU100R emergency blade. Program via VVDI2, Autel IM608.',
  },

  // =====================================================
  // MINI CLUBMAN (R55 / F54)
  // =====================================================
  {
    model: 'Mini Clubman (R55)', year_start: 2008, year_end: 2010,
    key_blank: 'HU92', transponder_type: 'CAS2 (PCF7942)', chip_type: 'ID46 (PCF7942)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: '2694A-FZV',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'R55 Clubman. CAS2 module. ID46 (PCF7942). HU92 blade. 3 buttons. OBD programmable with VVDI2/CG Pro.',
  },
  {
    model: 'Mini Clubman (R55)', year_start: 2011, year_end: 2014,
    key_blank: 'HU92', transponder_type: 'CAS3/CAS3+ (PCF7945)', chip_type: 'ID46 (PCF7945)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: '2694A-FZV',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'R55 Clubman LCI. CAS3/CAS3+. ID46 (PCF7945). HU92 blade. 3 buttons. OBD programmable.',
  },
  {
    model: 'Mini Clubman (F54)', year_start: 2016, year_end: 2019,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F54 Clubman. FEM/BDC module. ID49 chip. Smart key with push-button start. 3 buttons. HU100R emergency blade. Program via VVDI2, Autel IM608.',
  },
  {
    model: 'Mini Clubman (F54)', year_start: 2020, year_end: 2024,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F54 LCI Clubman. FEM/BDC. ID49 chip. Smart key. 3 buttons. Program via VVDI2/Key Tool Plus, Autel IM608.',
  },

  // =====================================================
  // MINI COUNTRYMAN (R60 / F60)
  // =====================================================
  {
    model: 'Mini Countryman (R60)', year_start: 2011, year_end: 2013,
    key_blank: 'HU92', transponder_type: 'CAS3/CAS3+ (PCF7945)', chip_type: 'ID46 (PCF7945)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: '2694A-FZV',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'R60 Countryman. CAS3/CAS3+ module. ID46 (PCF7945). HU92 blade. 3 buttons: lock, unlock, trunk. OBD programmable with VVDI2/CG Pro/Autel.',
  },
  {
    model: 'Mini Countryman (R60)', year_start: 2014, year_end: 2016,
    key_blank: 'HU92', transponder_type: 'CAS3/CAS3+ (PCF7945)', chip_type: 'ID46 (PCF7945)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: '2694A-FZV',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'R60 Countryman LCI. CAS3/CAS3+. ID46 (PCF7945). HU92 blade. 3 buttons. OBD programmable.',
  },
  {
    model: 'Mini Countryman (F60)', year_start: 2017, year_end: 2020,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F60 Countryman. FEM/BDC module. ID49 chip. Smart key. 3 buttons. HU100R emergency blade. Program via VVDI2, Autel IM608, or ISTA.',
  },
  {
    model: 'Mini Countryman (F60)', year_start: 2021, year_end: 2024,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F60 LCI Countryman. FEM/BDC. ID49 chip. Smart key. 3 buttons. Program via VVDI2/Key Tool Plus, Autel IM608.',
  },

  // =====================================================
  // MINI PACEMAN (R61) (2013-2016)
  // =====================================================
  {
    model: 'Mini Paceman (R61)', year_start: 2013, year_end: 2016,
    key_blank: 'HU92', transponder_type: 'CAS3/CAS3+ (PCF7945)', chip_type: 'ID46 (PCF7945)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: '2694A-FZV',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'R61 Paceman. CAS3/CAS3+ module. ID46 (PCF7945). HU92 blade. 3 buttons. OBD programmable with VVDI2/CG Pro/Autel. Same platform as R60 Countryman.',
  },

  // =====================================================
  // MINI HARDTOP 2-Door / 4-Door
  // =====================================================
  {
    model: 'Mini Hardtop 2-Door (F56)', year_start: 2014, year_end: 2018,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F56 Hardtop 2-Door. Same as Cooper F56. FEM/BDC module. ID49 chip. Smart key. 3 buttons. HU100R blade. Program via VVDI2, Autel IM608.',
  },
  {
    model: 'Mini Hardtop 2-Door (F56)', year_start: 2019, year_end: 2024,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F56 LCI Hardtop 2-Door. FEM/BDC. ID49 chip. Smart key. 3 buttons. Program via VVDI2/Key Tool Plus, Autel IM608.',
  },
  {
    model: 'Mini Hardtop 4-Door (F55)', year_start: 2015, year_end: 2018,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F55 Hardtop 4-Door. Same as Cooper F55. FEM/BDC module. ID49 chip. Smart key. 3 buttons. HU100R blade. Program via VVDI2, Autel IM608.',
  },
  {
    model: 'Mini Hardtop 4-Door (F55)', year_start: 2019, year_end: 2024,
    key_blank: 'HU100R', transponder_type: 'FEM/BDC', chip_type: 'ID49 (Hitag Pro)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'NBGIDGNG1', ic_number: '2694A-IDGNG1',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100R',
    image_url: null,
    programming_notes: 'F55 LCI Hardtop 4-Door. FEM/BDC. ID49 chip. Smart key. 3 buttons. Program via VVDI2/Key Tool Plus, Autel IM608.',
  },
];

// ============================================================
// MAIN: Delete old data, insert new data in a single transaction
// ============================================================
async function main() {
  await client.connect();
  console.log('Connected to database.');

  try {
    // Get a valid year_id for each manufacturer (just need one per manufacturer)
    const yearIds = {};
    for (const [name, slug, mfrId] of [
      ['Jaguar', 'jaguar', JAGUAR_ID],
      ['Porsche', 'porsche', PORSCHE_ID],
      ['Mini', 'mini', MINI_ID],
    ]) {
      const res = await client.query(
        `SELECT vy.id FROM vehicle_years vy
         JOIN vehicle_models vm ON vy.model_id = vm.id
         WHERE vm.manufacturer_id = $1 LIMIT 1`,
        [mfrId]
      );
      if (res.rows.length === 0) {
        throw new Error(`No vehicle_years found for ${name}. Cannot proceed.`);
      }
      yearIds[mfrId] = res.rows[0].id;
      console.log(`${name} year_id: ${yearIds[mfrId]}`);
    }

    await client.query('BEGIN');

    // Delete all existing rows for Jaguar, Porsche, Mini
    const delResult = await client.query(
      `DELETE FROM automotive_keys WHERE manufacturer_id IN ($1, $2, $3)`,
      [JAGUAR_ID, PORSCHE_ID, MINI_ID]
    );
    console.log(`\nDeleted ${delResult.rowCount} existing rows for Jaguar, Porsche, Mini.`);

    // Combine all keys with their manufacturer IDs
    const allRows = [
      ...jaguarKeys.map(k => ({ ...k, manufacturer_id: JAGUAR_ID })),
      ...porscheKeys.map(k => ({ ...k, manufacturer_id: PORSCHE_ID })),
      ...miniKeys.map(k => ({ ...k, manufacturer_id: MINI_ID })),
    ];

    const insertSQL = `
      INSERT INTO automotive_keys (
        year_id, manufacturer_id, model_name, year_start, year_end,
        key_blank, transponder_type, chip_type,
        remote_frequency, key_type, fcc_id, ic_number,
        battery_type, buttons, emergency_key_blank, test_key_blank,
        obd_programmable, pin_code_required, lishi_tool,
        image_url, programming_notes
      ) VALUES (
        $1, $2, $3, $4, $5,
        $6, $7, $8,
        $9, $10, $11, $12,
        $13, $14, $15, $16,
        $17, $18, $19,
        $20, $21
      )
    `;

    let insertCount = 0;
    for (const row of allRows) {
      await client.query(insertSQL, [
        yearIds[row.manufacturer_id],  // year_id
        row.manufacturer_id,
        row.model,
        row.year_start,
        row.year_end,
        row.key_blank,
        row.transponder_type,
        row.chip_type,
        row.remote_frequency,
        row.key_type,
        row.fcc_id,
        row.ic_number,
        row.battery_type,
        row.buttons,        // text
        row.emergency_key_blank,
        row.test_key_blank,
        row.obd_programmable,
        row.pin_code_required,
        row.lishi_tool,
        row.image_url,
        row.programming_notes,
      ]);
      insertCount++;
    }

    await client.query('COMMIT');
    console.log(`\nInserted ${insertCount} rows total.`);
    console.log(`  Jaguar:  ${jaguarKeys.length}`);
    console.log(`  Porsche: ${porscheKeys.length}`);
    console.log(`  Mini:    ${miniKeys.length}`);

    // Verify counts
    console.log('\n--- Verification ---');
    for (const [name, id] of [['Jaguar', JAGUAR_ID], ['Porsche', PORSCHE_ID], ['Mini', MINI_ID]]) {
      const res = await client.query(
        `SELECT COUNT(*) as cnt FROM automotive_keys WHERE manufacturer_id = $1`, [id]
      );
      console.log(`${name}: ${res.rows[0].cnt} rows in database`);
    }

    // Show sample data
    console.log('\n--- Sample rows ---');
    const sample = await client.query(
      `SELECT model_name, year_start, year_end, key_type, chip_type, buttons, lishi_tool
       FROM automotive_keys
       WHERE manufacturer_id IN ($1, $2, $3)
       ORDER BY model_name, year_start
       LIMIT 20`,
      [JAGUAR_ID, PORSCHE_ID, MINI_ID]
    );
    console.table(sample.rows);

  } catch (err) {
    await client.query('ROLLBACK');
    console.error('Error - rolled back:', err.message);
    throw err;
  } finally {
    await client.end();
    console.log('\nDone.');
  }
}

main().catch(err => {
  console.error(err);
  process.exit(1);
});
