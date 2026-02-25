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

const AUDI_ID   = '5faa9e99-1b32-4d73-8946-c5d454b2cd08';
const VOLVO_ID  = 'deeb46ee-c72f-4300-b7c3-d6c7037ee767';
const LINCOLN_ID = '8ca10434-0c88-44cb-b8f4-b5cadb0ae162';

// ============================================================
// AUDI KEY DATA
// ============================================================
const audiKeys = [

  // === AUDI A3 ===
  { model: 'Audi A3', year_start: 2006, year_end: 2013, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'NBG009272T', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'Uses Megamos 48 transponder. Requires PIN/SKC from dealer or VVDI/Autel. On-board programming possible with working key. 315 MHz for North American market.' },
  { model: 'Audi A3', year_start: 2006, year_end: 2013, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'NBG009272T', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'Uses Megamos 48 transponder with panic button. Requires PIN/SKC. 4-button version (lock, unlock, trunk, panic). 315 MHz US market.' },
  { model: 'Audi A3', year_start: 2014, year_end: 2020, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'MQB platform smart key with AES encryption. NOT OBD programmable - requires VVDI2/Autel IM608 with MQB key learning. Emergency HU162T blade inside fob.' },
  { model: 'Audi A3', year_start: 2014, year_end: 2020, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'MQB smart key 4-button (lock, unlock, trunk, panic). NOT OBD programmable. Requires VVDI2/Autel IM608 with MQB procedure.' },
  { model: 'Audi A3', year_start: 2021, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'Latest gen MQB Evo smart key. Requires advanced tool (VVDI2/Autel IM608 Pro). All keys lost requires component security gateway bypass.' },

  // === AUDI A4 ===
  { model: 'Audi A4', year_start: 2002, year_end: 2005, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'MYT8Z0837231', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'B6 platform. Megamos 48 transponder. OBD programmable with PIN/SKC. Flip key remote head style.' },
  { model: 'Audi A4', year_start: 2006, year_end: 2008, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'MYT4073A', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'B7 platform. Megamos 48 chip. OBD with PIN/SKC from dealer or calculated via VVDI/SBB.' },
  { model: 'Audi A4', year_start: 2006, year_end: 2008, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'MYT4073A', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'B7 platform with panic button. 4 buttons: lock, unlock, trunk, panic.' },
  { model: 'Audi A4', year_start: 2009, year_end: 2016, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'B8 platform. Smart key with ID48 chip. OBD programmable with PIN/SKC. Emergency blade HU66 inside fob.' },
  { model: 'Audi A4', year_start: 2009, year_end: 2016, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'B8 platform smart key with panic. 4 buttons: lock, unlock, trunk, panic.' },
  { model: 'Audi A4', year_start: 2017, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'B9 platform MQB smart key. NOT OBD programmable. Requires VVDI2 or Autel IM608. HU162T emergency blade.' },
  { model: 'Audi A4', year_start: 2017, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'B9 MQB smart key with panic button. NOT OBD programmable.' },

  // === AUDI A5 ===
  { model: 'Audi A5', year_start: 2008, year_end: 2016, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'Shares B8 platform with A4. Smart key with ID48 chip. OBD programmable with PIN/SKC.' },
  { model: 'Audi A5', year_start: 2008, year_end: 2016, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'B8 A5 smart key with panic button. OBD programmable with PIN/SKC.' },
  { model: 'Audi A5', year_start: 2017, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'B9 MQB platform. NOT OBD programmable. VVDI2/Autel IM608 required.' },
  { model: 'Audi A5', year_start: 2017, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'B9 A5 MQB smart key with panic. NOT OBD programmable.' },

  // === AUDI A6 ===
  { model: 'Audi A6', year_start: 2002, year_end: 2004, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'MYT8Z0837231', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'C5 platform flip key. Megamos 48 transponder. OBD with PIN/SKC.' },
  { model: 'Audi A6', year_start: 2005, year_end: 2011, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'C6 platform smart key. ID48 chip. OBD programmable with PIN/SKC.' },
  { model: 'Audi A6', year_start: 2005, year_end: 2011, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'C6 smart key with panic. OBD programmable with PIN/SKC.' },
  { model: 'Audi A6', year_start: 2012, year_end: 2018, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'C7 platform smart key. ID48 chip. OBD with PIN/SKC.' },
  { model: 'Audi A6', year_start: 2012, year_end: 2018, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'C7 smart key with panic. OBD with PIN/SKC.' },
  { model: 'Audi A6', year_start: 2019, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'C8 platform MQB smart key. NOT OBD programmable. Requires VVDI2/Autel IM608 Pro. Security gateway must be bypassed.' },
  { model: 'Audi A6', year_start: 2019, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'C8 MQB smart key with panic. NOT OBD programmable.' },

  // === AUDI A7 ===
  { model: 'Audi A7', year_start: 2012, year_end: 2018, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'Shares C7 platform with A6. Smart key ID48. OBD with PIN/SKC.' },
  { model: 'Audi A7', year_start: 2012, year_end: 2018, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'C7 A7 smart key with panic. OBD with PIN/SKC.' },
  { model: 'Audi A7', year_start: 2019, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'C8 platform MQB smart key. NOT OBD programmable. Requires advanced tool.' },
  { model: 'Audi A7', year_start: 2019, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'C8 A7 MQB smart key with panic. NOT OBD programmable.' },

  // === AUDI A8 ===
  { model: 'Audi A8', year_start: 2004, year_end: 2010, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'D3 platform smart key with ID48 chip. OBD with PIN/SKC.' },
  { model: 'Audi A8', year_start: 2004, year_end: 2010, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'D3 smart key with panic. OBD with PIN/SKC.' },
  { model: 'Audi A8', year_start: 2011, year_end: 2017, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'D4 platform smart key. ID48 chip. OBD with PIN/SKC.' },
  { model: 'Audi A8', year_start: 2011, year_end: 2017, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'D4 smart key with panic. OBD with PIN/SKC.' },
  { model: 'Audi A8', year_start: 2018, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'D5 platform MQB smart key. NOT OBD programmable. Security gateway bypass required.' },
  { model: 'Audi A8', year_start: 2018, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'D5 MQB smart key with panic. NOT OBD programmable.' },

  // === AUDI e-tron ===
  { model: 'Audi e-tron', year_start: 2019, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'Electric vehicle MQB smart key. NOT OBD programmable. VVDI2/Autel IM608 Pro required. Security gateway bypass needed.' },
  { model: 'Audi e-tron', year_start: 2019, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'e-tron MQB smart key with panic. NOT OBD programmable.' },

  // === AUDI Q3 ===
  { model: 'Audi Q3', year_start: 2015, year_end: 2018, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'NBG010206T', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'First gen Q3 flip key. ID48 transponder. OBD programmable with PIN/SKC.' },
  { model: 'Audi Q3', year_start: 2015, year_end: 2018, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'NBG010206T', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'First gen Q3 flip key with panic. OBD with PIN/SKC.' },
  { model: 'Audi Q3', year_start: 2019, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'Second gen Q3 MQB smart key. NOT OBD programmable. VVDI2/Autel IM608 required.' },
  { model: 'Audi Q3', year_start: 2019, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'Second gen Q3 MQB smart key with panic. NOT OBD programmable.' },

  // === AUDI Q5 ===
  { model: 'Audi Q5', year_start: 2009, year_end: 2017, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'First gen Q5 (8R) smart key. ID48 chip. OBD programmable with PIN/SKC.' },
  { model: 'Audi Q5', year_start: 2009, year_end: 2017, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'First gen Q5 smart key with panic. OBD with PIN/SKC.' },
  { model: 'Audi Q5', year_start: 2018, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'Second gen Q5 (FY) MQB smart key. NOT OBD programmable. Requires VVDI2/Autel IM608.' },
  { model: 'Audi Q5', year_start: 2018, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'Second gen Q5 MQB smart key with panic. NOT OBD programmable.' },

  // === AUDI Q7 ===
  { model: 'Audi Q7', year_start: 2007, year_end: 2015, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'First gen Q7 smart key. ID48 chip. OBD with PIN/SKC.' },
  { model: 'Audi Q7', year_start: 2007, year_end: 2015, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'First gen Q7 smart key with panic. OBD with PIN/SKC.' },
  { model: 'Audi Q7', year_start: 2016, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'Second gen Q7 MQB smart key. NOT OBD programmable. Requires VVDI2/Autel IM608.' },
  { model: 'Audi Q7', year_start: 2016, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'Second gen Q7 MQB smart key with panic. NOT OBD programmable.' },

  // === AUDI Q8 ===
  { model: 'Audi Q8', year_start: 2019, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'MQB smart key. NOT OBD programmable. Requires VVDI2/Autel IM608 Pro with security gateway bypass.' },
  { model: 'Audi Q8', year_start: 2019, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'Q8 MQB smart key with panic. NOT OBD programmable.' },

  // === AUDI R8 ===
  { model: 'Audi R8', year_start: 2008, year_end: 2015, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'R8 smart key with ID48 chip. OBD programmable with PIN/SKC. Limited aftermarket availability.' },
  { model: 'Audi R8', year_start: 2016, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'Second gen R8 MQB smart key. NOT OBD programmable. Dealer or advanced aftermarket tool required.' },

  // === AUDI TT ===
  { model: 'Audi TT', year_start: 2000, year_end: 2006, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'MYT8Z0837231', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'First gen TT flip key. ID48 transponder. OBD with PIN/SKC.' },
  { model: 'Audi TT', year_start: 2007, year_end: 2014, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'NBG009272T', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'Second gen TT (8J) flip key. ID48 chip. OBD with PIN/SKC.' },
  { model: 'Audi TT', year_start: 2015, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'Third gen TT (FV/8S) MQB smart key. NOT OBD programmable. VVDI2/Autel IM608 required.' },
  { model: 'Audi TT', year_start: 2015, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'Third gen TT MQB smart key with panic. NOT OBD programmable.' },

  // === AUDI RS MODELS ===
  { model: 'Audi RS3', year_start: 2017, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'RS3 MQB smart key. Same key system as A3 MQB. NOT OBD programmable.' },
  { model: 'Audi RS4', year_start: 2018, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'RS4 MQB smart key. Same key system as A4 B9. NOT OBD programmable.' },
  { model: 'Audi RS5', year_start: 2018, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'RS5 MQB smart key. Same key system as A5 B9. NOT OBD programmable.' },
  { model: 'Audi RS6', year_start: 2020, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'RS6 Avant MQB smart key. Same as A6 C8. NOT OBD programmable. Security gateway bypass required.' },
  { model: 'Audi RS7', year_start: 2020, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'RS7 MQB smart key. Same as A7 C8. NOT OBD programmable.' },

  // === AUDI S MODELS ===
  { model: 'Audi S3', year_start: 2015, year_end: 2020, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'S3 MQB smart key. Same system as A3 MQB. NOT OBD programmable.' },
  { model: 'Audi S3', year_start: 2021, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'Latest S3 MQB Evo smart key. Security gateway bypass required for all keys lost.' },
  { model: 'Audi S4', year_start: 2010, year_end: 2016, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'S4 B8 platform smart key. ID48 chip. OBD with PIN/SKC.' },
  { model: 'Audi S4', year_start: 2017, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'S4 B9 MQB smart key. NOT OBD programmable.' },
  { model: 'Audi S5', year_start: 2008, year_end: 2016, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'S5 B8 smart key. ID48 chip. OBD with PIN/SKC.' },
  { model: 'Audi S5', year_start: 2017, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'S5 B9 MQB smart key. NOT OBD programmable.' },
  { model: 'Audi S6', year_start: 2013, year_end: 2018, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'S6 C7 smart key. ID48 chip. OBD with PIN/SKC.' },
  { model: 'Audi S6', year_start: 2019, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'S6 C8 MQB smart key. NOT OBD programmable.' },
  { model: 'Audi S7', year_start: 2013, year_end: 2018, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'S7 C7 smart key. ID48 chip. OBD with PIN/SKC.' },
  { model: 'Audi S7', year_start: 2019, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'S7 C8 MQB smart key. NOT OBD programmable.' },
  { model: 'Audi S8', year_start: 2013, year_end: 2017, key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'IYZFBSB802', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU66', test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU66', programming_notes: 'S8 D4 smart key. ID48 chip. OBD with PIN/SKC.' },
  { model: 'Audi S8', year_start: 2020, year_end: 2025, key_blank: 'HU162T', transponder_type: 'MQB', chip_type: 'MQB (AES)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'NBGFS14P71', ic_number: null, battery_type: 'CR2032', buttons: 3, emergency_key_blank: 'HU162T', test_key_blank: null, obd_programmable: false, pin_code_required: true, lishi_tool: 'Lishi HU162T', programming_notes: 'S8 D5 MQB smart key. NOT OBD programmable. Security gateway bypass required.' },
];

// ============================================================
// VOLVO KEY DATA
// ============================================================
const volvoKeys = [

  // === VOLVO C30 ===
  { model: 'Volvo C30', year_start: 2007, year_end: 2013, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR55WK49264', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'NE66', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'Volvo smart key with 5 buttons (lock, unlock, trunk, panic, remote start). ID46 chip. OBD programmable with VVDI/Autel. No PIN required.' },

  // === VOLVO C70 ===
  { model: 'Volvo C70', year_start: 2006, year_end: 2013, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR55WK49264', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'NE66', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'Volvo smart key with 5 buttons. ID46 chip. OBD programmable.' },

  // === VOLVO S40 ===
  { model: 'Volvo S40', year_start: 2004, year_end: 2011, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR55WK49264', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'NE66', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'P1 platform smart key. ID46 chip. OBD programmable with VVDI/Autel.' },

  // === VOLVO S60 ===
  { model: 'Volvo S60', year_start: 2001, year_end: 2009, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'LQNP2T-APU', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'First gen S60 remote head key. ID46 chip. 4 buttons (lock, unlock, trunk, panic). OBD programmable.' },
  { model: 'Volvo S60', year_start: 2010, year_end: 2018, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR55WK49264', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'NE66', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'Second gen S60 smart key. ID46 chip. 5 buttons. OBD programmable.' },
  { model: 'Volvo S60', year_start: 2019, year_end: 2025, key_blank: 'HU101', transponder_type: 'Hitag Pro', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR5V21', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: false, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'SPA platform smart key. ID49 Hitag Pro chip. NOT OBD programmable - requires Volvo VIDA or advanced tool. HU101 emergency blade.' },

  // === VOLVO S80 ===
  { model: 'Volvo S80', year_start: 1999, year_end: 2006, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'LQNP2T-APU', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'First gen S80 remote head key. ID46 chip. OBD programmable.' },
  { model: 'Volvo S80', year_start: 2007, year_end: 2016, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR55WK49264', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'NE66', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'Second gen S80 smart key. ID46 chip. 5 buttons. OBD programmable.' },

  // === VOLVO S90 ===
  { model: 'Volvo S90', year_start: 2017, year_end: 2025, key_blank: 'HU101', transponder_type: 'Hitag Pro', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR5V21', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: false, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'SPA platform smart key. ID49 Hitag Pro chip. NOT OBD programmable. Requires Volvo VIDA or advanced tool. HU101 emergency blade.' },

  // === VOLVO V40 ===
  { model: 'Volvo V40', year_start: 2013, year_end: 2019, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '433 MHz', key_type: 'smart_key', fcc_id: 'KR55WK49266', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'NE66', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'V40 smart key. ID46 chip. 433 MHz (primarily European market model). OBD programmable.' },

  // === VOLVO V50 ===
  { model: 'Volvo V50', year_start: 2004, year_end: 2012, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR55WK49264', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'NE66', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'P1 platform smart key. ID46 chip. OBD programmable.' },

  // === VOLVO V60 ===
  { model: 'Volvo V60', year_start: 2011, year_end: 2018, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR55WK49264', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'NE66', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'V60 smart key. ID46 chip. 5 buttons. OBD programmable.' },
  { model: 'Volvo V60', year_start: 2019, year_end: 2025, key_blank: 'HU101', transponder_type: 'Hitag Pro', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR5V21', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: false, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'SPA platform V60 smart key. ID49 Hitag Pro chip. NOT OBD programmable. Requires Volvo VIDA.' },

  // === VOLVO V70 ===
  { model: 'Volvo V70', year_start: 2000, year_end: 2007, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'LQNP2T-APU', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'V70 remote head key. ID46 chip. 4 buttons. OBD programmable.' },
  { model: 'Volvo V70', year_start: 2008, year_end: 2016, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR55WK49264', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'NE66', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'V70 smart key. ID46 chip. 5 buttons. OBD programmable.' },

  // === VOLVO V90 ===
  { model: 'Volvo V90', year_start: 2017, year_end: 2025, key_blank: 'HU101', transponder_type: 'Hitag Pro', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR5V21', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: false, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'SPA platform V90 smart key. ID49 Hitag Pro chip. NOT OBD programmable. HU101 emergency blade.' },

  // === VOLVO XC40 ===
  { model: 'Volvo XC40', year_start: 2019, year_end: 2025, key_blank: 'HU101', transponder_type: 'Hitag Pro', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR5V21', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: false, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'CMA platform smart key. ID49 Hitag Pro chip. NOT OBD programmable. Requires Volvo VIDA or Autel IM608 Pro.' },

  // === VOLVO XC60 ===
  { model: 'Volvo XC60', year_start: 2010, year_end: 2017, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR55WK49264', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'NE66', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'First gen XC60 smart key. ID46 chip. 5 buttons. OBD programmable.' },
  { model: 'Volvo XC60', year_start: 2018, year_end: 2025, key_blank: 'HU101', transponder_type: 'Hitag Pro', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR5V21', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: false, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'Second gen XC60 SPA platform smart key. ID49 Hitag Pro chip. NOT OBD programmable. Requires Volvo VIDA.' },

  // === VOLVO XC70 ===
  { model: 'Volvo XC70', year_start: 2001, year_end: 2007, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'LQNP2T-APU', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'XC70 remote head key. ID46 chip. OBD programmable.' },
  { model: 'Volvo XC70', year_start: 2008, year_end: 2016, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR55WK49264', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'NE66', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'XC70 smart key. ID46 chip. 5 buttons. OBD programmable.' },

  // === VOLVO XC90 ===
  { model: 'Volvo XC90', year_start: 2003, year_end: 2006, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'LQNP2T-APU', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'First gen XC90 remote head key. ID46 chip. 4 buttons. OBD programmable.' },
  { model: 'Volvo XC90', year_start: 2007, year_end: 2015, key_blank: 'NE66', transponder_type: 'Texas Crypto ID46', chip_type: 'ID46 (PCF7936)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR55WK49264', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'NE66', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi NE66', programming_notes: 'First gen XC90 smart key. ID46 chip. 5 buttons. OBD programmable.' },
  { model: 'Volvo XC90', year_start: 2016, year_end: 2025, key_blank: 'HU101', transponder_type: 'Hitag Pro', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR5V21', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: false, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'Second gen XC90 SPA platform smart key. ID49 Hitag Pro chip. NOT OBD programmable. Requires Volvo VIDA or advanced tool.' },

  // === VOLVO EX30 ===
  { model: 'Volvo EX30', year_start: 2024, year_end: 2025, key_blank: 'HU101', transponder_type: 'Hitag Pro', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR5V21', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: false, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'Electric vehicle smart key. ID49 Hitag Pro. NOT OBD programmable. Dealer or advanced tool required. Also supports phone-as-key.' },

  // === VOLVO EX90 ===
  { model: 'Volvo EX90', year_start: 2024, year_end: 2025, key_blank: 'HU101', transponder_type: 'Hitag Pro', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'KR5V21', ic_number: null, battery_type: 'CR2032', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: false, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'Electric vehicle smart key. ID49 Hitag Pro. NOT OBD programmable. Dealer or advanced tool required. Also supports phone-as-key and UWB digital key.' },
];

// ============================================================
// LINCOLN KEY DATA
// ============================================================
const lincolnKeys = [

  // === LINCOLN TOWN CAR ===
  { model: 'Lincoln Town Car', year_start: 1998, year_end: 2002, key_blank: 'H72', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C chip', remote_frequency: null, key_type: 'transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi FO38', programming_notes: 'PATS system with 4C chip. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.' },
  { model: 'Lincoln Town Car', year_start: 2003, year_end: 2011, key_blank: 'H84', transponder_type: 'Texas Crypto 4D63 40-bit', chip_type: '4D63 (40-bit)', remote_frequency: null, key_type: 'transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi FO38', programming_notes: 'PATS with 4D63 40-bit transponder. On-board with 2 working keys or Ford IDS for all-keys-lost. H84-PT key blank.' },

  // === LINCOLN ZEPHYR ===
  { model: 'Lincoln Zephyr', year_start: 2006, year_end: 2006, key_blank: 'H92', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 (80-bit)', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'OUCD6000022', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi FO38', programming_notes: 'PATS with 80-bit 4D63 chip. 4-button remote head key (lock, unlock, trunk, panic). OBD with security code.' },

  // === LINCOLN MKZ ===
  { model: 'Lincoln MKZ', year_start: 2007, year_end: 2012, key_blank: 'H92', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 (80-bit)', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'OUCD6000022', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU101', programming_notes: 'PATS with 80-bit 4D63 transponder. 4-button remote head. OBD with security code.' },
  { model: 'Lincoln MKZ', year_start: 2013, year_end: 2016, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID47 (Hitag 2)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C31243300', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key system. 4 buttons (lock, unlock, trunk, panic). OBD programmable. HU101 emergency blade.' },
  { model: 'Lincoln MKZ', year_start: 2013, year_end: 2016, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID47 (Hitag 2)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C31243300', ic_number: null, battery_type: 'CR2025', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key 5-button (lock, unlock, trunk, panic, remote start). OBD programmable.' },
  { model: 'Lincoln MKZ', year_start: 2017, year_end: 2020, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C94078000', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key with ID49 Hitag Pro chip. 4 buttons. OBD programmable. HU101 blade.' },
  { model: 'Lincoln MKZ', year_start: 2017, year_end: 2020, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C94078000', ic_number: null, battery_type: 'CR2025', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key 5-button with ID49 Hitag Pro. OBD programmable.' },

  // === LINCOLN MKS ===
  { model: 'Lincoln MKS', year_start: 2009, year_end: 2012, key_blank: 'H92', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 (80-bit)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N5WY8406', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'H92', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key with 80-bit 4D63 chip. 4 buttons. OBD programmable.' },
  { model: 'Lincoln MKS', year_start: 2013, year_end: 2016, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID47 (Hitag 2)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C31243300', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key. ID47 chip. OBD programmable. HU101 emergency blade.' },
  { model: 'Lincoln MKS', year_start: 2013, year_end: 2016, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID47 (Hitag 2)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C31243300', ic_number: null, battery_type: 'CR2025', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key 5-button version. ID47 chip. OBD programmable.' },

  // === LINCOLN MKT ===
  { model: 'Lincoln MKT', year_start: 2010, year_end: 2012, key_blank: 'H92', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 (80-bit)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N5WY8406', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'H92', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key with 80-bit 4D63 chip. 4 buttons. OBD programmable.' },
  { model: 'Lincoln MKT', year_start: 2013, year_end: 2019, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID47 (Hitag 2)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C31243300', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key. ID47 chip. OBD programmable. HU101 blade.' },
  { model: 'Lincoln MKT', year_start: 2013, year_end: 2019, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID47 (Hitag 2)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C31243300', ic_number: null, battery_type: 'CR2025', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key 5-button with remote start. OBD programmable.' },

  // === LINCOLN MKX ===
  { model: 'Lincoln MKX', year_start: 2007, year_end: 2010, key_blank: 'H92', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 (80-bit)', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'OUCD6000022', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU101', programming_notes: 'PATS remote head key with 80-bit 4D63 chip. 4 buttons. OBD with security code.' },
  { model: 'Lincoln MKX', year_start: 2011, year_end: 2015, key_blank: 'H92', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 (80-bit)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N5WY8609', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'H92', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key with 80-bit 4D63 chip. 4 buttons. OBD programmable.' },
  { model: 'Lincoln MKX', year_start: 2016, year_end: 2018, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C94078000', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key with ID49 Hitag Pro chip. OBD programmable. HU101 blade.' },
  { model: 'Lincoln MKX', year_start: 2016, year_end: 2018, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C94078000', ic_number: null, battery_type: 'CR2025', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key 5-button with remote start. ID49 chip. OBD programmable.' },

  // === LINCOLN MKC ===
  { model: 'Lincoln MKC', year_start: 2015, year_end: 2016, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID47 (Hitag 2)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C31243300', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key. ID47 chip. 4 buttons. OBD programmable.' },
  { model: 'Lincoln MKC', year_start: 2015, year_end: 2016, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID47 (Hitag 2)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C31243300', ic_number: null, battery_type: 'CR2025', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key 5-button. ID47 chip. OBD programmable.' },
  { model: 'Lincoln MKC', year_start: 2017, year_end: 2019, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C94078000', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key with ID49 Hitag Pro chip. OBD programmable.' },
  { model: 'Lincoln MKC', year_start: 2017, year_end: 2019, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C94078000', ic_number: null, battery_type: 'CR2025', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key 5-button. ID49 chip. OBD programmable.' },

  // === LINCOLN CORSAIR ===
  { model: 'Lincoln Corsair', year_start: 2020, year_end: 2025, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A3C054339', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'Gen2 PEPS smart key with ID49 Hitag Pro. 4 buttons. OBD programmable. HU101 emergency blade.' },
  { model: 'Lincoln Corsair', year_start: 2020, year_end: 2025, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A3C054339', ic_number: null, battery_type: 'CR2025', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'Gen2 PEPS smart key 5-button with remote start. ID49 chip. OBD programmable.' },

  // === LINCOLN NAUTILUS ===
  { model: 'Lincoln Nautilus', year_start: 2019, year_end: 2025, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C94078000', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'Replaced MKX. PEPS smart key with ID49 Hitag Pro. OBD programmable. HU101 blade.' },
  { model: 'Lincoln Nautilus', year_start: 2019, year_end: 2025, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C94078000', ic_number: null, battery_type: 'CR2025', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'Nautilus PEPS smart key 5-button with remote start. ID49 chip. OBD programmable.' },

  // === LINCOLN CONTINENTAL ===
  { model: 'Lincoln Continental', year_start: 2017, year_end: 2020, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C94078000', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key with ID49 Hitag Pro chip. 4 buttons. OBD programmable. HU101 emergency blade.' },
  { model: 'Lincoln Continental', year_start: 2017, year_end: 2020, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C94078000', ic_number: null, battery_type: 'CR2025', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'Continental PEPS smart key 5-button. ID49 chip. OBD programmable.' },

  // === LINCOLN AVIATOR ===
  { model: 'Lincoln Aviator', year_start: 2020, year_end: 2025, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A3C054339', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'Gen2 PEPS smart key with ID49 Hitag Pro. 4 buttons. OBD programmable. Also available with Phone As A Key (PAAK).' },
  { model: 'Lincoln Aviator', year_start: 2020, year_end: 2025, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A3C054339', ic_number: null, battery_type: 'CR2025', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'Aviator PEPS smart key 5-button with remote start. ID49 chip. OBD programmable.' },

  // === LINCOLN NAVIGATOR ===
  { model: 'Lincoln Navigator', year_start: 1999, year_end: 2002, key_blank: 'H72', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C chip', remote_frequency: null, key_type: 'transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi FO38', programming_notes: 'PATS 4C transponder. On-board with 2 working keys. IDS for all-keys-lost.' },
  { model: 'Lincoln Navigator', year_start: 2003, year_end: 2006, key_blank: 'H84', transponder_type: 'Texas Crypto 4D63 40-bit', chip_type: '4D63 (40-bit)', remote_frequency: null, key_type: 'transponder', fcc_id: null, ic_number: null, battery_type: null, buttons: null, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi FO38', programming_notes: 'PATS 4D63 40-bit. On-board with 2 working keys. IDS for all-keys-lost.' },
  { model: 'Lincoln Navigator', year_start: 2007, year_end: 2014, key_blank: 'H92', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 (80-bit)', remote_frequency: '315 MHz', key_type: 'transponder', fcc_id: 'CWTWB1U793', ic_number: null, battery_type: 'CR2032', buttons: 4, emergency_key_blank: null, test_key_blank: null, obd_programmable: true, pin_code_required: true, lishi_tool: 'Lishi HU101', programming_notes: 'PATS remote head key with 80-bit 4D63. 4 buttons. OBD with security code.' },
  { model: 'Lincoln Navigator', year_start: 2015, year_end: 2017, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C31243300', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key with ID49 chip. 4 buttons. OBD programmable.' },
  { model: 'Lincoln Navigator', year_start: 2015, year_end: 2017, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C31243300', ic_number: null, battery_type: 'CR2025', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'PEPS smart key 5-button with remote start. OBD programmable.' },
  { model: 'Lincoln Navigator', year_start: 2018, year_end: 2025, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C94078000', ic_number: null, battery_type: 'CR2025', buttons: 4, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'Current gen Navigator PEPS smart key. ID49 Hitag Pro. OBD programmable.' },
  { model: 'Lincoln Navigator', year_start: 2018, year_end: 2025, key_blank: 'HU101', transponder_type: 'Texas Crypto 128-bit', chip_type: 'ID49 (Hitag Pro)', remote_frequency: '315 MHz', key_type: 'smart_key', fcc_id: 'M3N-A2C94078000', ic_number: null, battery_type: 'CR2025', buttons: 5, emergency_key_blank: 'HU101', test_key_blank: null, obd_programmable: true, pin_code_required: false, lishi_tool: 'Lishi HU101', programming_notes: 'Navigator PEPS 5-button with remote start. ID49 chip. OBD programmable.' },
];

// ============================================================
// INSERT HELPER - inserts one row at a time with year_id
// ============================================================
async function insertKey(client, yearId, mfrId, key) {
  await client.query(
    `INSERT INTO automotive_keys (
      year_id, manufacturer_id, model_name, key_blank, transponder_type,
      chip_type, remote_frequency, key_type, fcc_id, ic_number,
      battery_type, buttons, emergency_key_blank, test_key_blank,
      obd_programmable, pin_code_required, lishi_tool, image_url,
      programming_notes, year_start, year_end
    ) VALUES (
      $1, $2, $3, $4, $5,
      $6, $7, $8, $9, $10,
      $11, $12, $13, $14,
      $15, $16, $17, $18,
      $19, $20, $21
    )`,
    [
      yearId, mfrId, key.model, key.key_blank, key.transponder_type,
      key.chip_type, key.remote_frequency, key.key_type, key.fcc_id, key.ic_number,
      key.battery_type, key.buttons != null ? String(key.buttons) : null, key.emergency_key_blank, key.test_key_blank,
      key.obd_programmable, key.pin_code_required, key.lishi_tool, key.image_url || null,
      key.programming_notes, key.year_start, key.year_end
    ]
  );
}

// Helper to get a year_id for a manufacturer by slug
async function getYearId(client, slug) {
  const res = await client.query(
    `SELECT vy.id FROM vehicle_years vy
     JOIN vehicle_models vm ON vy.model_id = vm.id
     JOIN manufacturers m ON vm.manufacturer_id = m.id
     WHERE m.slug = $1 LIMIT 1;`,
    [slug]
  );
  if (res.rows.length === 0) {
    throw new Error(`No year_id found for manufacturer slug: ${slug}`);
  }
  return res.rows[0].id;
}

// ============================================================
// MAIN
// ============================================================
async function main() {
  await client.connect();
  console.log('Connected to database.');

  // Get year_ids for each manufacturer
  const audiYearId = await getYearId(client, 'audi');
  console.log(`Audi year_id: ${audiYearId}`);
  const volvoYearId = await getYearId(client, 'volvo');
  console.log(`Volvo year_id: ${volvoYearId}`);
  const lincolnYearId = await getYearId(client, 'lincoln');
  console.log(`Lincoln year_id: ${lincolnYearId}`);

  await client.query('BEGIN');

  try {
    // DELETE existing rows for all three manufacturers
    const delResult1 = await client.query('DELETE FROM automotive_keys WHERE manufacturer_id = $1', [AUDI_ID]);
    console.log(`Deleted ${delResult1.rowCount} existing Audi rows.`);

    const delResult2 = await client.query('DELETE FROM automotive_keys WHERE manufacturer_id = $1', [VOLVO_ID]);
    console.log(`Deleted ${delResult2.rowCount} existing Volvo rows.`);

    const delResult3 = await client.query('DELETE FROM automotive_keys WHERE manufacturer_id = $1', [LINCOLN_ID]);
    console.log(`Deleted ${delResult3.rowCount} existing Lincoln rows.`);

    // INSERT Audi
    let cnt = 0;
    for (const key of audiKeys) {
      await insertKey(client, audiYearId, AUDI_ID, key);
      cnt++;
    }
    console.log(`Inserted ${cnt} Audi rows.`);

    // INSERT Volvo
    cnt = 0;
    for (const key of volvoKeys) {
      await insertKey(client, volvoYearId, VOLVO_ID, key);
      cnt++;
    }
    console.log(`Inserted ${cnt} Volvo rows.`);

    // INSERT Lincoln
    cnt = 0;
    for (const key of lincolnKeys) {
      await insertKey(client, lincolnYearId, LINCOLN_ID, key);
      cnt++;
    }
    console.log(`Inserted ${cnt} Lincoln rows.`);

    await client.query('COMMIT');
    console.log('Transaction committed successfully.');

  } catch (err) {
    await client.query('ROLLBACK');
    console.error('Transaction rolled back due to error:', err.message);
    throw err;
  }

  // Verify counts
  const countQ = `SELECT m.name, COUNT(*) as cnt
    FROM automotive_keys ak
    JOIN manufacturers m ON m.id = ak.manufacturer_id
    WHERE ak.manufacturer_id IN ($1, $2, $3)
    GROUP BY m.name ORDER BY m.name`;
  const counts = await client.query(countQ, [AUDI_ID, VOLVO_ID, LINCOLN_ID]);
  console.log('\n=== VERIFICATION COUNTS ===');
  for (const row of counts.rows) {
    console.log(`  ${row.name}: ${row.cnt} rows`);
  }

  // Show sample data
  const sampleQ = `SELECT model_name, year_start, year_end, key_type, chip_type, buttons, lishi_tool
    FROM automotive_keys
    WHERE manufacturer_id IN ($1, $2, $3)
    ORDER BY model_name, year_start
    LIMIT 20`;
  const samples = await client.query(sampleQ, [AUDI_ID, VOLVO_ID, LINCOLN_ID]);
  console.log('\n=== SAMPLE DATA (first 20) ===');
  console.table(samples.rows);

  await client.end();
  console.log('Connection closed.');
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
