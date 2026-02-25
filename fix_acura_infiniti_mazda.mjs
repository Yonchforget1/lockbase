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

const ACURA_MFR_ID = '5d934439-3901-4ea8-a641-03ef2184e6ad';
const INFINITI_MFR_ID = 'd421b97b-6e64-4d86-abf3-a859ce80fb8b';
const MAZDA_MFR_ID = 'f1e4802d-31b4-48e6-a273-49b3f770cdd6';

// ============================================================
// ACURA KEY DATA
// ============================================================
const acuraKeys = [
  // ===== ACURA CL =====
  { model: 'CL', year_start: 1997, year_end: 1999, key_blank: 'HD103', transponder_type: null, chip_type: null, remote_frequency: null, key_type: 'Non-Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: null, obd_programmable: false, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '1st gen CL. Non-transponder mechanical key. No programming required.' },
  { model: 'CL', year_start: 2001, year_end: 2003, key_blank: 'HD106', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '2nd gen CL. Transponder key with Philips ID 46 chip. OBD programmable with Honda HDS or aftermarket tool.' },

  // ===== ACURA ILX =====
  { model: 'ILX', year_start: 2013, year_end: 2015, key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'MLBHLIK6-1T', ic_number: '2500A-HLIK61T', battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '1st gen ILX base. 4-button remote head key with ID 46. 315 MHz. OBD programmable.' },
  { model: 'ILX', year_start: 2013, year_end: 2015, key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: '47', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'ACJ932HK1210A', ic_number: '3109A-932HK1210', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '1st gen ILX Premium/Tech. 4-button smart key. 315 MHz. Honda HDS or aftermarket programmer required.' },
  { model: 'ILX', year_start: 2016, year_end: 2022, key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: '47', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5V1X', ic_number: '7812D-V1X', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: 'ILX 2016-2022. 4-button smart proximity key. ID 47 chip. 315 MHz. KR5V1X. Honda HDS or Autel IM608.' },

  // ===== ACURA INTEGRA (2023+) =====
  { model: 'Integra', year_start: 2023, year_end: 2025, key_blank: 'LXP90', transponder_type: 'HITAG-AES', chip_type: '4A', remote_frequency: '433 MHz', key_type: 'Smart Key', fcc_id: 'KR5TP-4', ic_number: '7812D-TP4', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'LXP90', test_key_blank: 'LXP90', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: 'New Integra. 4-button smart key with HITAG-AES 4A chip. 433 MHz. KR5TP-4. New LXP90 emergency blade. Honda HDS or Autel IM608.' },
  { model: 'Integra', year_start: 2023, year_end: 2025, key_blank: 'LXP90', transponder_type: 'HITAG-AES', chip_type: '4A', remote_frequency: '433 MHz', key_type: 'Smart Key', fcc_id: 'KR5TP-4', ic_number: '7812D-TP4', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Remote Start', emergency_key_blank: 'LXP90', test_key_blank: 'LXP90', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: 'Integra Type S / A-Spec with remote start. 5-button smart key. HITAG-AES 4A chip. 433 MHz. KR5TP-4.' },

  // ===== ACURA MDX =====
  { model: 'MDX', year_start: 2001, year_end: 2006, key_blank: 'HD106', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '1st gen MDX. Transponder only key with ID 46 chip. Separate remote fob. OBD programmable.' },
  { model: 'MDX', year_start: 2001, year_end: 2006, key_blank: 'HD106', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'E4EG8D-444H-A', ic_number: '850G-G8D444HA', battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '1st gen MDX. 4-button remote head key. ID 46 chip. 315 MHz.' },
  { model: 'MDX', year_start: 2007, year_end: 2013, key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'N5F0602A1A', ic_number: '2114A-F0602A1A', battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '2nd gen MDX. 4-button remote head key with ID 46 chip. 315 MHz. OBD programmable.' },
  { model: 'MDX', year_start: 2007, year_end: 2013, key_blank: 'HO01', transponder_type: 'Hitag 2', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'M3N5WY8145', ic_number: '267F-5WY8145', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '2nd gen MDX with smart entry. 4-button smart key. ID 46 chip. 315 MHz. Honda HDS required.' },
  { model: 'MDX', year_start: 2014, year_end: 2020, key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: '47', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5V1X', ic_number: '7812D-V1X', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '3rd gen MDX. 4-button smart key with ID 47 chip. 315 MHz. KR5V1X. Honda HDS or Autel IM608.' },
  { model: 'MDX', year_start: 2014, year_end: 2020, key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: '47', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5V2X', ic_number: '7812D-V2X', battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '3rd gen MDX with remote start. 5-button smart key. ID 47. 315 MHz. KR5V2X.' },
  { model: 'MDX', year_start: 2022, year_end: 2025, key_blank: 'LXP90', transponder_type: 'HITAG-AES', chip_type: '4A', remote_frequency: '433 MHz', key_type: 'Smart Key', fcc_id: 'KR5TP-4', ic_number: '7812D-TP4', battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start', emergency_key_blank: 'LXP90', test_key_blank: 'LXP90', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '4th gen MDX. 5-button smart key with HITAG-AES 4A chip. 433 MHz. KR5TP-4. New LXP90 blade.' },

  // ===== ACURA NSX =====
  { model: 'NSX', year_start: 1997, year_end: 2005, key_blank: 'HD103', transponder_type: null, chip_type: null, remote_frequency: null, key_type: 'Non-Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: null, obd_programmable: false, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '1st gen NSX. Non-transponder mechanical key. No immobilizer.' },
  { model: 'NSX', year_start: 2017, year_end: 2022, key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: '47', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5V1X', ic_number: '7812D-V1X', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: false, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '2nd gen NSX. 4-button smart key. ID 47 chip. 315 MHz. KR5V1X. Dealer programming only recommended.' },

  // ===== ACURA RDX =====
  { model: 'RDX', year_start: 2007, year_end: 2012, key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '1st gen RDX. Transponder only key with ID 46. OBD programmable.' },
  { model: 'RDX', year_start: 2007, year_end: 2012, key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'N5F0602A1A', ic_number: '2114A-F0602A1A', battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '1st gen RDX. 4-button remote head key. ID 46 chip. 315 MHz.' },
  { model: 'RDX', year_start: 2013, year_end: 2018, key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: '47', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5V1X', ic_number: '7812D-V1X', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '2nd gen RDX. 4-button smart key. ID 47 chip. 315 MHz. KR5V1X.' },
  { model: 'RDX', year_start: 2019, year_end: 2025, key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: '47', remote_frequency: '433 MHz', key_type: 'Smart Key', fcc_id: 'KR5V2X', ic_number: '7812D-V2X', battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '3rd gen RDX. 5-button smart key. ID 47. 433 MHz. KR5V2X. Honda HDS or Autel IM608.' },
  { model: 'RDX', year_start: 2019, year_end: 2025, key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: '47', remote_frequency: '433 MHz', key_type: 'Smart Key', fcc_id: 'KR5T44', ic_number: '7812D-T44', battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '3rd gen RDX base (no remote start). 4-button smart key. ID 47. 433 MHz. KR5T44.' },

  // ===== ACURA RL =====
  { model: 'RL', year_start: 1996, year_end: 2004, key_blank: 'HD106', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '1st gen RL. Transponder key with ID 46 chip. Separate remote fob. OBD programmable.' },
  { model: 'RL', year_start: 2005, year_end: 2012, key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'ACJ8D8E24A04', ic_number: '3109A-8D8E24A04', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '2nd gen RL. 4-button smart proximity key. ID 46 chip. 315 MHz. Honda HDS required.' },

  // ===== ACURA RLX =====
  { model: 'RLX', year_start: 2014, year_end: 2020, key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: '47', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5V1X', ic_number: '7812D-V1X', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: 'RLX. 4-button smart key with ID 47 chip. 315 MHz. KR5V1X. Honda HDS or Autel IM608.' },

  // ===== ACURA RSX =====
  { model: 'RSX', year_start: 2002, year_end: 2006, key_blank: 'HD106', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: 'RSX all years. Transponder key with ID 46 chip. OBD programmable. Separate remote fob.' },
  { model: 'RSX', year_start: 2002, year_end: 2006, key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'OUCG8D-355H-A', ic_number: '850G-G8D355HA', battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: 'RSX. 4-button remote head key. ID 46. 315 MHz. Remote on-board programmable.' },

  // ===== ACURA TL =====
  { model: 'TL', year_start: 1999, year_end: 2003, key_blank: 'HD106', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '2nd gen TL. Transponder only key with ID 46 chip. Separate remote fob.' },
  { model: 'TL', year_start: 2004, year_end: 2008, key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'OUCG8D-439H-A', ic_number: '850G-G8D439HA', battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '3rd gen TL. 4-button remote head key. ID 46 chip. 315 MHz. OBD programmable.' },
  { model: 'TL', year_start: 2009, year_end: 2014, key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'M3N5WY8145', ic_number: '267F-5WY8145', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '4th gen TL. 4-button smart key. ID 46 chip. 315 MHz. Honda HDS required for smart key programming.' },

  // ===== ACURA TLX =====
  { model: 'TLX', year_start: 2015, year_end: 2020, key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: '47', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5V1X', ic_number: '7812D-V1X', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '1st gen TLX. 4-button smart key. ID 47 chip. 315 MHz. KR5V1X. Honda HDS or Autel IM608.' },
  { model: 'TLX', year_start: 2021, year_end: 2025, key_blank: 'LXP90', transponder_type: 'HITAG-AES', chip_type: '4A', remote_frequency: '433 MHz', key_type: 'Smart Key', fcc_id: 'KR5TP-4', ic_number: '7812D-TP4', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'LXP90', test_key_blank: 'LXP90', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '2nd gen TLX. 4-button smart key with HITAG-AES 4A chip. 433 MHz. KR5TP-4. New LXP90 blade.' },
  { model: 'TLX', year_start: 2021, year_end: 2025, key_blank: 'LXP90', transponder_type: 'HITAG-AES', chip_type: '4A', remote_frequency: '433 MHz', key_type: 'Smart Key', fcc_id: 'KR5TP-4', ic_number: '7812D-TP4', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Remote Start', emergency_key_blank: 'LXP90', test_key_blank: 'LXP90', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '2nd gen TLX with remote start. 5-button smart key. HITAG-AES 4A chip. 433 MHz. KR5TP-4.' },

  // ===== ACURA TSX =====
  { model: 'TSX', year_start: 2004, year_end: 2008, key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'OUCG8D-439H-A', ic_number: '850G-G8D439HA', battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '1st gen TSX. 4-button remote head key. ID 46 chip. 315 MHz. OBD programmable.' },
  { model: 'TSX', year_start: 2004, year_end: 2008, key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '1st gen TSX. Transponder only key with ID 46. OBD programmable.' },
  { model: 'TSX', year_start: 2009, year_end: 2014, key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'MLBHLIK-1T', ic_number: '2500A-HLIK1T', battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: null, test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: '2nd gen TSX. 4-button remote head key. ID 46 chip. 315 MHz. OBD programmable.' },

  // ===== ACURA ZDX =====
  { model: 'ZDX', year_start: 2010, year_end: 2013, key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'M3N5WY8145', ic_number: '267F-5WY8145', battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic', emergency_key_blank: 'HO01', test_key_blank: 'HO01', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HON66', image_url: null, programming_notes: 'ZDX. 4-button smart key. ID 46 chip. 315 MHz. Honda HDS required.' },
];

// ============================================================
// INFINITI KEY DATA
// ============================================================
const infinitiKeys = [
  // ===== INFINITI EX35/EX37 =====
  { model: 'EX35', year_start: 2008, year_end: 2012, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'EX35. 4-button smart key. ID 46 chip. 315 MHz. KR55WK48903. PIN code required. Nissan CONSULT or aftermarket tool.' },
  { model: 'EX37', year_start: 2013, year_end: 2013, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'EX37. 4-button smart key. ID 46. 315 MHz. Same as EX35. PIN code from BCM.' },

  // ===== INFINITI FX35/FX37/FX45/FX50 =====
  { model: 'FX35', year_start: 2003, year_end: 2008, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KBRTN001', ic_number: '1788D-BRTN001', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: '1st gen FX35. 4-button smart key. ID 46. 315 MHz. KBRTN001. PIN required from BCM.' },
  { model: 'FX35', year_start: 2009, year_end: 2012, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: '2nd gen FX35. 4-button smart key. ID 46. 315 MHz. KR55WK48903.' },
  { model: 'FX37', year_start: 2013, year_end: 2013, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'FX37. 4-button smart key. ID 46. 315 MHz. Same platform as FX35.' },
  { model: 'FX45', year_start: 2003, year_end: 2008, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KBRTN001', ic_number: '1788D-BRTN001', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'FX45. Same smart key as FX35. 4-button. ID 46. KBRTN001.' },
  { model: 'FX50', year_start: 2009, year_end: 2013, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'FX50. 4-button smart key. ID 46. 315 MHz. KR55WK48903.' },

  // ===== INFINITI G25/G35/G37 =====
  { model: 'G35', year_start: 2003, year_end: 2006, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'KBRASTU15', ic_number: '1788D-ASTU15', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: null, test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'G35 sedan/coupe. 4-button remote head key. ID 46. 315 MHz. PIN required from BCM.' },
  { model: 'G35', year_start: 2003, year_end: 2006, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'G35 transponder-only key. ID 46 chip. PIN code required.' },
  { model: 'G35', year_start: 2007, year_end: 2008, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'G35 2007-2008. 4-button smart key. ID 46. 315 MHz. KR55WK48903.' },
  { model: 'G37', year_start: 2008, year_end: 2013, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'G37 sedan/coupe. 4-button smart key. ID 46. 315 MHz. KR55WK48903. PIN from BCM.' },
  { model: 'G25', year_start: 2011, year_end: 2012, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'G25. Same smart key as G37. 4-button. ID 46. 315 MHz. PIN required.' },

  // ===== INFINITI I30/I35 =====
  { model: 'I30', year_start: 1998, year_end: 2001, key_blank: 'NI02', transponder_type: 'Philips 41', chip_type: '41', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'NI02', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'I30. Transponder key with ID 41 chip. PIN code required. Nissan CONSULT tool needed.' },
  { model: 'I35', year_start: 2002, year_end: 2004, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'I35. Transponder key with ID 46 chip. PIN code required.' },

  // ===== INFINITI JX35 =====
  { model: 'JX35', year_start: 2013, year_end: 2013, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic, Hatch', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'JX35 (became QX60). 5-button smart key. ID 46. 315 MHz. KR55WK48903. PIN required.' },

  // ===== INFINITI M35/M37/M45/M56 =====
  { model: 'M35', year_start: 2006, year_end: 2010, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'M35. 4-button smart key. ID 46. 315 MHz. PIN from BCM.' },
  { model: 'M37', year_start: 2011, year_end: 2013, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'M37. 4-button smart key. ID 46. 315 MHz. Same as M35.' },
  { model: 'M45', year_start: 2006, year_end: 2010, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'M45. Same smart key as M35. 4-button. ID 46. PIN required.' },
  { model: 'M56', year_start: 2011, year_end: 2013, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'M56. 4-button smart key. ID 46. 315 MHz. Same platform as M37.' },

  // ===== INFINITI Q40 =====
  { model: 'Q40', year_start: 2015, year_end: 2015, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'Q40 (rebadged G37). 4-button smart key. ID 46. 315 MHz. KR55WK48903.' },

  // ===== INFINITI Q50 =====
  { model: 'Q50', year_start: 2014, year_end: 2023, key_blank: 'NSN14', transponder_type: 'Hitag AES', chip_type: '4A', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5S180144014', ic_number: '7812D-S180144014', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NSN14', test_key_blank: 'NSN14', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'Q50. 4-button smart key. 4A chip. 315 MHz. KR5S180144014. PIN required from BCM. Autel IM608 or CONSULT.' },
  { model: 'Q50', year_start: 2014, year_end: 2023, key_blank: 'NSN14', transponder_type: 'Hitag AES', chip_type: '4A', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5S180144014', ic_number: '7812D-S180144014', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Remote Start', emergency_key_blank: 'NSN14', test_key_blank: 'NSN14', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'Q50 with remote start. 5-button smart key. 4A chip. 315 MHz. KR5S180144014.' },

  // ===== INFINITI Q60 =====
  { model: 'Q60', year_start: 2014, year_end: 2015, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'Q60 convertible (based on G37). 4-button smart key. ID 46. 315 MHz.' },
  { model: 'Q60', year_start: 2017, year_end: 2024, key_blank: 'NSN14', transponder_type: 'Hitag AES', chip_type: '4A', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5S180144014', ic_number: '7812D-S180144014', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NSN14', test_key_blank: 'NSN14', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'Q60 coupe. 4-button smart key. 4A chip. 315 MHz. KR5S180144014.' },

  // ===== INFINITI Q70 =====
  { model: 'Q70', year_start: 2014, year_end: 2019, key_blank: 'NSN14', transponder_type: 'Hitag AES', chip_type: '4A', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5S180144014', ic_number: '7812D-S180144014', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NSN14', test_key_blank: 'NSN14', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'Q70 (rebadged M). 4-button smart key. 4A chip. 315 MHz. KR5S180144014.' },

  // ===== INFINITI QX30 =====
  { model: 'QX30', year_start: 2017, year_end: 2019, key_blank: 'HU64', transponder_type: 'NEC', chip_type: 'NEC', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'IYZDC11', ic_number: '2701A-DC11', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'HU64', test_key_blank: null, obd_programmable: false, pin_code_required: false, lishi_tool: 'Lishi HU64', image_url: null, programming_notes: 'QX30 (Mercedes-Benz GLA platform). Uses Mercedes key system IYZDC11. NOT a Nissan/Infiniti key. 4-button. Mercedes programming required.' },

  // ===== INFINITI QX50 =====
  { model: 'QX50', year_start: 2014, year_end: 2017, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'QX50 (rebadged EX). 4-button smart key. ID 46. 315 MHz. KR55WK48903.' },
  { model: 'QX50', year_start: 2019, year_end: 2024, key_blank: 'NSN14', transponder_type: 'Hitag AES', chip_type: '4A', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5TXN1', ic_number: '7812D-TXN1', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic', emergency_key_blank: 'NSN14', test_key_blank: 'NSN14', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: '2nd gen QX50. 4-button smart key. 4A chip. 315 MHz. KR5TXN1. PIN from BCM.' },
  { model: 'QX50', year_start: 2019, year_end: 2024, key_blank: 'NSN14', transponder_type: 'Hitag AES', chip_type: '4A', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5TXN1', ic_number: '7812D-TXN1', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start', emergency_key_blank: 'NSN14', test_key_blank: 'NSN14', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: '2nd gen QX50 with remote start. 5-button smart key. 4A chip. 315 MHz. KR5TXN1.' },

  // ===== INFINITI QX55 =====
  { model: 'QX55', year_start: 2022, year_end: 2024, key_blank: 'NSN14', transponder_type: 'Hitag AES', chip_type: '4A', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5TXN1', ic_number: '7812D-TXN1', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start', emergency_key_blank: 'NSN14', test_key_blank: 'NSN14', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'QX55. 5-button smart key. 4A chip. 315 MHz. KR5TXN1. Same as QX50.' },

  // ===== INFINITI QX56 =====
  { model: 'QX56', year_start: 2004, year_end: 2007, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'CWTWB1U758', ic_number: '1788D-TWB1U758', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: null, test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: '1st gen QX56. 4-button remote head key. ID 46 chip. PIN from BCM.' },
  { model: 'QX56', year_start: 2008, year_end: 2010, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: '2nd gen QX56. 4-button smart key. ID 46. 315 MHz. KR55WK48903.' },
  { model: 'QX56', year_start: 2011, year_end: 2013, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'CWTWB1U787', ic_number: '1788D-TWB1U787', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: '2nd gen QX56 2011+. 5-button smart key with remote start. ID 46. 315 MHz. CWTWB1U787.' },

  // ===== INFINITI QX60 =====
  { model: 'QX60', year_start: 2014, year_end: 2017, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: '1st gen QX60. 5-button smart key. ID 46. 315 MHz. KR55WK48903. PIN from BCM.' },
  { model: 'QX60', year_start: 2014, year_end: 2017, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: '1st gen QX60 without remote start. 4-button smart key. ID 46. 315 MHz.' },
  { model: 'QX60', year_start: 2019, year_end: 2020, key_blank: 'NSN14', transponder_type: 'Hitag AES', chip_type: '4A', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5TXN7', ic_number: '7812D-TXN7', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start', emergency_key_blank: 'NSN14', test_key_blank: 'NSN14', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: '1st gen QX60 refresh. 5-button smart key. 4A chip. 315 MHz. KR5TXN7.' },
  { model: 'QX60', year_start: 2022, year_end: 2025, key_blank: 'NSN14', transponder_type: 'Hitag AES', chip_type: '4A', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5TXPZ3', ic_number: '7812D-TXPZ3', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start', emergency_key_blank: 'NSN14', test_key_blank: 'NSN14', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: '2nd gen QX60. 5-button smart key. 4A chip. 315 MHz. KR5TXPZ3. Autel IM608 or CONSULT.' },

  // ===== INFINITI QX70 =====
  { model: 'QX70', year_start: 2014, year_end: 2017, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR55WK48903', ic_number: '267T-5WK48903', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'QX70 (rebadged FX). 4-button smart key. ID 46. 315 MHz. KR55WK48903.' },

  // ===== INFINITI QX80 =====
  { model: 'QX80', year_start: 2014, year_end: 2018, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'CWTWB1U787', ic_number: '1788D-TWB1U787', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'QX80 (rebadged QX56). 5-button smart key. ID 46. 315 MHz. CWTWB1U787. PIN from BCM.' },
  { model: 'QX80', year_start: 2014, year_end: 2018, key_blank: 'NI04', transponder_type: 'Philips 46', chip_type: '46', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'CWTWB1U787', ic_number: '1788D-TWB1U787', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic', emergency_key_blank: 'NI06', test_key_blank: 'NI04', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'QX80 without remote start. 4-button smart key. ID 46. 315 MHz. CWTWB1U787.' },
  { model: 'QX80', year_start: 2019, year_end: 2024, key_blank: 'NSN14', transponder_type: 'Hitag AES', chip_type: '4A', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5TXN7', ic_number: '7812D-TXN7', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start', emergency_key_blank: 'NSN14', test_key_blank: 'NSN14', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'QX80 2019+. 5-button smart key. 4A chip. 315 MHz. KR5TXN7.' },
  { model: 'QX80', year_start: 2025, year_end: 2026, key_blank: 'NSN14', transponder_type: 'Hitag AES', chip_type: '4A', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'KR5TXPZ4', ic_number: '7812D-TXPZ4', battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start', emergency_key_blank: 'NSN14', test_key_blank: 'NSN14', obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi NSN14', image_url: null, programming_notes: 'All-new 2025 QX80. 5-button smart key. 4A chip. 315 MHz. KR5TXPZ4.' },
];

// ============================================================
// MAZDA KEY DATA
// ============================================================
const mazdaKeys = [
  // ===== MAZDA CX-3 =====
  { model: 'CX-3', year_start: 2016, year_end: 2022, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'WAZSKE13D01', ic_number: '662F-SKE13D01', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'MAZ24R', test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'CX-3. 4-button smart key. ID 49 (128-bit) chip. 315 MHz. WAZSKE13D01. OBD programmable with Autel or Smart Pro.' },

  // ===== MAZDA CX-30 =====
  { model: 'CX-30', year_start: 2020, year_end: 2025, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'WAZSKE11D01', ic_number: '662F-SKE11D01', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'MAZ24R', test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'CX-30. 4-button smart key. ID 49 (128-bit). 315 MHz. WAZSKE11D01. OBD programmable.' },

  // ===== MAZDA CX-5 =====
  { model: 'CX-5', year_start: 2013, year_end: 2016, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'WAZSKE13D01', ic_number: '662F-SKE13D01', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'MAZ24R', test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '1st gen CX-5. 4-button smart key. ID 49 (128-bit). 315 MHz. WAZSKE13D01. OBD programmable.' },
  { model: 'CX-5', year_start: 2013, year_end: 2016, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'WAZSKE13D01', ic_number: '662F-SKE13D01', battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '1st gen CX-5 Sport. 3-button remote head key. ID 49. 315 MHz.' },
  { model: 'CX-5', year_start: 2017, year_end: 2025, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'WAZSKE11D01', ic_number: '662F-SKE11D01', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'MAZ24R', test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '2nd gen CX-5. 4-button smart key. ID 49 (128-bit). 315 MHz. WAZSKE11D01.' },

  // ===== MAZDA CX-7 =====
  { model: 'CX-7', year_start: 2007, year_end: 2012, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'KPU41846', ic_number: '1534-KPU41846', battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'CX-7. 3-button remote head key. ID 63 (80-bit) chip. 315 MHz. OBD programmable.' },
  { model: 'CX-7', year_start: 2007, year_end: 2012, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'CX-7 transponder only key. ID 63 (80-bit). OBD programmable.' },

  // ===== MAZDA CX-9 =====
  { model: 'CX-9', year_start: 2007, year_end: 2015, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'KPU41846', ic_number: '1534-KPU41846', battery_type: 'CR1620', buttons: 'Lock, Unlock, Hatch', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '1st gen CX-9. 3-button remote head key. ID 63 (80-bit). 315 MHz. OBD programmable.' },
  { model: 'CX-9', year_start: 2007, year_end: 2015, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '1st gen CX-9 transponder only key. ID 63 (80-bit). OBD programmable.' },
  { model: 'CX-9', year_start: 2016, year_end: 2023, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'WAZSKE13D02', ic_number: '662F-SKE13D02', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic', emergency_key_blank: 'MAZ24R', test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '2nd gen CX-9. 4-button smart key. ID 49 (128-bit). 315 MHz. WAZSKE13D02.' },

  // ===== MAZDA CX-50 =====
  { model: 'CX-50', year_start: 2023, year_end: 2025, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'WAZSKE11D01', ic_number: '662F-SKE11D01', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'MAZ24R', test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'CX-50. 4-button smart key. ID 49 (128-bit). 315 MHz. WAZSKE11D01. OBD programmable.' },

  // ===== MAZDA CX-70 =====
  { model: 'CX-70', year_start: 2025, year_end: 2026, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'WAZSKE11D01', ic_number: '662F-SKE11D01', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic', emergency_key_blank: 'MAZ24R', test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'CX-70. 4-button smart key. ID 49 (128-bit). 315 MHz. New Mazda large platform.' },

  // ===== MAZDA CX-90 =====
  { model: 'CX-90', year_start: 2024, year_end: 2026, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'WAZSKE11D01', ic_number: '662F-SKE11D01', battery_type: 'CR2025', buttons: 'Lock, Unlock, Hatch, Panic', emergency_key_blank: 'MAZ24R', test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'CX-90. 4-button smart key. ID 49 (128-bit). 315 MHz. Mazda large platform (replaces CX-9).' },

  // ===== MAZDA3 =====
  { model: 'Mazda3', year_start: 2004, year_end: 2009, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '1st gen Mazda3. Transponder only key. ID 63 (80-bit). OBD programmable.' },
  { model: 'Mazda3', year_start: 2004, year_end: 2009, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'KPU41846', ic_number: '1534-KPU41846', battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '1st gen Mazda3. 3-button remote head key. ID 63 (80-bit). 315 MHz.' },
  { model: 'Mazda3', year_start: 2010, year_end: 2013, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'WAZX1T768SKE11A03', ic_number: '662F-X1T768SKE11A03', battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '2nd gen Mazda3. 3-button remote head key. ID 63 (80-bit). 315 MHz.' },
  { model: 'Mazda3', year_start: 2010, year_end: 2013, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '2nd gen Mazda3 transponder only. ID 63 (80-bit). OBD programmable.' },
  { model: 'Mazda3', year_start: 2014, year_end: 2018, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'WAZSKE13D01', ic_number: '662F-SKE13D01', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'MAZ24R', test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '3rd gen Mazda3. 4-button smart key. ID 49 (128-bit). 315 MHz. WAZSKE13D01.' },
  { model: 'Mazda3', year_start: 2014, year_end: 2018, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'WAZSKE13D02', ic_number: '662F-SKE13D02', battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '3rd gen Mazda3 Sport. 3-button remote head key. ID 49. 315 MHz.' },
  { model: 'Mazda3', year_start: 2019, year_end: 2025, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'WAZSKE11D01', ic_number: '662F-SKE11D01', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'MAZ24R', test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '4th gen Mazda3. 4-button smart key. ID 49 (128-bit). 315 MHz. WAZSKE11D01.' },

  // ===== MAZDA5 =====
  { model: 'Mazda5', year_start: 2006, year_end: 2010, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'KPU41846', ic_number: '1534-KPU41846', battery_type: 'CR1620', buttons: 'Lock, Unlock, Sliding Door', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '1st gen Mazda5. 3-button remote head key. ID 63 (80-bit). 315 MHz.' },
  { model: 'Mazda5', year_start: 2006, year_end: 2010, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'Mazda5 transponder only. ID 63 (80-bit). OBD programmable.' },
  { model: 'Mazda5', year_start: 2012, year_end: 2015, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'KPU41846', ic_number: '1534-KPU41846', battery_type: 'CR1620', buttons: 'Lock, Unlock, Sliding Door', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '2nd gen Mazda5. 3-button remote head key. ID 63 (80-bit). 315 MHz.' },

  // ===== MAZDA6 =====
  { model: 'Mazda6', year_start: 2003, year_end: 2008, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '1st gen Mazda6 transponder only. ID 63 (80-bit). OBD programmable.' },
  { model: 'Mazda6', year_start: 2003, year_end: 2008, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'KPU41846', ic_number: '1534-KPU41846', battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '1st gen Mazda6. 3-button remote head key. ID 63 (80-bit). 315 MHz.' },
  { model: 'Mazda6', year_start: 2009, year_end: 2013, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'KPU41846', ic_number: '1534-KPU41846', battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '2nd gen Mazda6. 3-button remote head key. ID 63 (80-bit). 315 MHz.' },
  { model: 'Mazda6', year_start: 2009, year_end: 2013, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '2nd gen Mazda6 transponder only. ID 63 (80-bit). OBD programmable.' },
  { model: 'Mazda6', year_start: 2014, year_end: 2021, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'WAZSKE13D01', ic_number: '662F-SKE13D01', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'MAZ24R', test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '3rd gen Mazda6. 4-button smart key. ID 49 (128-bit). 315 MHz. WAZSKE13D01.' },

  // ===== MAZDA MX-5 MIATA =====
  { model: 'MX-5 Miata', year_start: 2006, year_end: 2012, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'KPU41846', ic_number: '1534-KPU41846', battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'NC MX-5 Miata. 3-button remote head key. ID 63 (80-bit). 315 MHz.' },
  { model: 'MX-5 Miata', year_start: 2006, year_end: 2012, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'NC MX-5 Miata transponder only. ID 63 (80-bit). OBD programmable.' },
  { model: 'MX-5 Miata', year_start: 2013, year_end: 2015, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'WAZX1T768SKE11A03', ic_number: '662F-X1T768SKE11A03', battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'NC2 MX-5 Miata. 3-button remote head key. ID 63 (80-bit). 315 MHz.' },
  { model: 'MX-5 Miata', year_start: 2016, year_end: 2025, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '49 (128-bit)', remote_frequency: '315 MHz', key_type: 'Smart Key', fcc_id: 'WAZSKE13D01', ic_number: '662F-SKE13D01', battery_type: 'CR2025', buttons: 'Lock, Unlock, Trunk, Panic', emergency_key_blank: 'MAZ24R', test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'ND MX-5 Miata. 4-button smart key. ID 49 (128-bit). 315 MHz. WAZSKE13D01.' },

  // ===== MAZDA RX-8 =====
  { model: 'RX-8', year_start: 2004, year_end: 2011, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'KPU41846', ic_number: '1534-KPU41846', battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'RX-8. 3-button remote head key. ID 63 (80-bit). 315 MHz. OBD programmable.' },
  { model: 'RX-8', year_start: 2004, year_end: 2011, key_blank: 'MAZ24R', transponder_type: 'Mitsubishi', chip_type: '63 (80-bit)', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'RX-8 transponder only key. ID 63 (80-bit). OBD programmable.' },

  // ===== MAZDA TRIBUTE =====
  { model: 'Tribute', year_start: 2001, year_end: 2004, key_blank: 'MAZ24R', transponder_type: 'Texas', chip_type: '4D63 (40-bit)', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: '1st gen Tribute. Transponder key with 4D63 (40-bit) chip. Ford Escape platform. OBD programmable (8-key method or tool).' },
  { model: 'Tribute', year_start: 2005, year_end: 2008, key_blank: 'MAZ24R', transponder_type: 'Texas', chip_type: '4D63 (80-bit)', remote_frequency: null, key_type: 'Transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'Tribute 2005-2008. Transponder key with 4D63 (80-bit) chip. Ford Escape platform. OBD programmable.' },
  { model: 'Tribute', year_start: 2008, year_end: 2011, key_blank: 'MAZ24R', transponder_type: 'Texas', chip_type: '4D63 (80-bit)', remote_frequency: '315 MHz', key_type: 'Remote Head', fcc_id: 'CWTWB1U793', ic_number: '1788D-TWB1U793', battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk', emergency_key_blank: null, test_key_blank: 'MAZ24R', obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi MAZ24', image_url: null, programming_notes: 'Tribute remote head key. 3-button. 4D63 (80-bit). 315 MHz. Ford platform.' },
];

// ============================================================
// MAIN EXECUTION
// ============================================================
async function main() {
  await client.connect();
  console.log('Connected to database.\n');

  try {
    await client.query('BEGIN');

    // 1. Show current counts
    for (const [name, mfrId] of [['Acura', ACURA_MFR_ID], ['Infiniti', INFINITI_MFR_ID], ['Mazda', MAZDA_MFR_ID]]) {
      const res = await client.query('SELECT COUNT(*) as count FROM automotive_keys WHERE manufacturer_id = $1', [mfrId]);
      console.log(`Current ${name} rows: ${res.rows[0].count}`);
    }

    // 2. Delete existing rows
    console.log('\n--- Deleting existing rows ---');
    for (const [name, mfrId] of [['Acura', ACURA_MFR_ID], ['Infiniti', INFINITI_MFR_ID], ['Mazda', MAZDA_MFR_ID]]) {
      const res = await client.query('DELETE FROM automotive_keys WHERE manufacturer_id = $1', [mfrId]);
      console.log(`Deleted ${res.rowCount} ${name} key rows.`);
    }

    // 3. Delete vehicle_years for these manufacturers
    console.log('\n--- Deleting existing vehicle_years ---');
    for (const [name, mfrId] of [['Acura', ACURA_MFR_ID], ['Infiniti', INFINITI_MFR_ID], ['Mazda', MAZDA_MFR_ID]]) {
      const res = await client.query(
        `DELETE FROM vehicle_years WHERE model_id IN (SELECT id FROM vehicle_models WHERE manufacturer_id = $1)`,
        [mfrId]
      );
      console.log(`Deleted ${res.rowCount} ${name} vehicle_years rows.`);
    }

    // 4. Ensure all needed vehicle_models exist
    console.log('\n--- Ensuring vehicle_models exist ---');
    const allModels = {};

    // Collect unique model names per manufacturer
    const acuraModelNames = [...new Set(acuraKeys.map(k => k.model))];
    const infinitiModelNames = [...new Set(infinitiKeys.map(k => k.model))];
    const mazdaModelNames = [...new Set(mazdaKeys.map(k => k.model))];

    for (const [mfrId, modelNames, brand] of [[ACURA_MFR_ID, acuraModelNames, 'Acura'], [INFINITI_MFR_ID, infinitiModelNames, 'Infiniti'], [MAZDA_MFR_ID, mazdaModelNames, 'Mazda']]) {
      for (const modelName of modelNames) {
        // Check if model exists
        const existing = await client.query(
          'SELECT id FROM vehicle_models WHERE manufacturer_id = $1 AND name = $2',
          [mfrId, modelName]
        );
        if (existing.rows.length > 0) {
          allModels[`${brand}:${modelName}`] = existing.rows[0].id;
          console.log(`  Found existing model: ${brand} ${modelName} = ${existing.rows[0].id}`);
        } else {
          const slug = modelName.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
          const newModel = await client.query(
            'INSERT INTO vehicle_models (id, manufacturer_id, name, slug) VALUES (gen_random_uuid(), $1, $2, $3) RETURNING id',
            [mfrId, modelName, slug]
          );
          allModels[`${brand}:${modelName}`] = newModel.rows[0].id;
          console.log(`  Created new model: ${brand} ${modelName} = ${newModel.rows[0].id}`);
        }
      }
    }

    // 5. Insert all keys
    console.log('\n--- Inserting keys ---');
    let totalInserted = 0;

    // Map key_type to valid constraint values
    const keyTypeMap = {
      'Non-Transponder': 'standard',
      'Transponder': 'transponder',
      'Remote Head': 'transponder',
      'Smart Key': 'smart_key',
    };

    for (const [brand, mfrId, keys] of [['Acura', ACURA_MFR_ID, acuraKeys], ['Infiniti', INFINITI_MFR_ID, infinitiKeys], ['Mazda', MAZDA_MFR_ID, mazdaKeys]]) {
      let brandCount = 0;
      for (const key of keys) {
        // Map key_type to valid DB value
        key.key_type = keyTypeMap[key.key_type] || key.key_type;
        const modelId = allModels[`${brand}:${key.model}`];
        if (!modelId) {
          console.error(`ERROR: No model ID for ${brand} ${key.model}`);
          continue;
        }

        // Create vehicle_year entry
        const yearRes = await client.query(
          `INSERT INTO vehicle_years (id, model_id, year_start, year_end)
           VALUES (gen_random_uuid(), $1, $2, $3)
           ON CONFLICT (model_id, year_start, year_end) DO UPDATE SET year_start = EXCLUDED.year_start
           RETURNING id`,
          [modelId, key.year_start, key.year_end]
        );
        const yearId = yearRes.rows[0].id;

        // Insert automotive_keys entry
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
            mfrId,
            `${brand} ${key.model}`,
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

        brandCount++;
        totalInserted++;
      }
      console.log(`  Inserted ${brandCount} ${brand} rows.`);
    }

    await client.query('COMMIT');
    console.log(`\nCOMMITTED. Total inserted: ${totalInserted}`);

    // 6. Verify
    console.log('\n' + '='.repeat(80));
    console.log('VERIFICATION');
    console.log('='.repeat(80));
    for (const [name, mfrId] of [['Acura', ACURA_MFR_ID], ['Infiniti', INFINITI_MFR_ID], ['Mazda', MAZDA_MFR_ID]]) {
      const res = await client.query(
        `SELECT model_name, year_start, year_end, key_type, key_blank, chip_type, fcc_id, buttons, lishi_tool
         FROM automotive_keys WHERE manufacturer_id = $1
         ORDER BY model_name, year_start, key_type`,
        [mfrId]
      );
      console.log(`\n${name}: ${res.rows.length} rows`);
      for (const r of res.rows) {
        console.log(`  ${r.model_name} ${r.year_start}-${r.year_end} | ${r.key_type} | ${r.key_blank} | ${r.chip_type || 'N/A'} | FCC:${r.fcc_id || 'N/A'} | ${r.buttons || 'N/A'} | ${r.lishi_tool}`);
      }
    }

  } catch (err) {
    await client.query('ROLLBACK');
    console.error('ERROR - ROLLED BACK:', err.message);
    console.error(err.stack);
  } finally {
    await client.end();
    console.log('\nDone.');
  }
}

main();
