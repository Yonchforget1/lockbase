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
const BUICK_ID    = 'ab4c52e3-0b1d-41dd-8ce1-7333a6f1f69a';
const PONTIAC_ID  = 'f6d7a73c-a334-4399-b8b1-7b3b0716adf6';
const LR_ID       = '18044e42-db8f-46d4-987a-1021ae5af99b';

// ============================================================
//  BUICK KEY DATA
//  key_type DB values: 'standard', 'transponder', 'smart_key', 'proximity'
//  buttons column is text - store integer count as string per task requirement
// ============================================================
const buickKeys = [

  // =====================================================
  // BUICK CENTURY (1997-2005)
  // =====================================================
  {
    model: 'Buick Century', year_start: 1997, year_end: 2000,
    key_blank: 'B89', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. No programming required. Standard GM double-sided B89 key blank.',
  },
  {
    model: 'Buick Century', year_start: 2001, year_end: 2005,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder system with Megamos 13 chip. 10-minute relearn procedure with 2 programmed keys or Tech2/SPS for all-keys-lost. B97 sidewinder key blank.',
  },

  // =====================================================
  // BUICK CASCADA (2016-2019)
  // =====================================================
  {
    model: 'Buick Cascada', year_start: 2016, year_end: 2019,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key with 46 chip (circle-plus). 4 buttons: Lock, Unlock, Remote Start, Trunk. On-board programming with 2 working keys or Tech2/MDI for all-keys-lost. HU100 10-cut high-security blade.',
  },
  {
    model: 'Buick Cascada', year_start: 2016, year_end: 2019,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key with 46 chip (circle-plus). 5 buttons: Lock, Unlock, Remote Start, Trunk, Panic. On-board programming with 2 working keys or Tech2/MDI for all-keys-lost.',
  },

  // =====================================================
  // BUICK ENCLAVE (2008-2017 1st gen, 2018+ 2nd gen)
  // =====================================================
  // 2008-2009 - Remote head key era
  {
    model: 'Buick Enclave', year_start: 2008, year_end: 2009,
    key_blank: 'B111-PT', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUC60270', ic_number: null,
    battery_type: 'CR1616', buttons: '5',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Remote head key with 46 chip (circle-plus). 5 buttons: Lock, Unlock, Remote Start, Liftgate, Panic. B111 key blank (circle-plus profile). On-board programming with 2 working keys. Tech2 for all-keys-lost.',
  },
  {
    model: 'Buick Enclave', year_start: 2010, year_end: 2017,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key with 46 chip (circle-plus). 5 buttons: Lock, Unlock, Remote Start, Liftgate, Panic. HU100 key blade. On-board programming with 2 working keys or Tech2/MDI for all-keys-lost.',
  },
  // 2018-2025 Enclave - Smart Key
  {
    model: 'Buick Enclave', year_start: 2018, year_end: 2025,
    key_blank: 'HU100', transponder_type: 'HITAG Pro', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4EA', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 47 chip. 5 buttons: Lock, Unlock, Remote Start, Liftgate, Panic. 433 MHz. Requires SPS/MDI2 or aftermarket tool (Autel IM608, SmartPro) for programming. Emergency HU100 key blade inside fob.',
  },
  {
    model: 'Buick Enclave', year_start: 2018, year_end: 2025,
    key_blank: 'HU100', transponder_type: 'HITAG Pro', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4EA', ic_number: null,
    battery_type: 'CR2032', buttons: '6',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 47 chip. 6 buttons: Lock, Unlock, Remote Start, Liftgate, Panic, Rear Glass. 433 MHz. Higher trim levels. Requires SPS/MDI2 or aftermarket tool for programming.',
  },

  // =====================================================
  // BUICK ENCORE (2013-2022)
  // =====================================================
  {
    model: 'Buick Encore', year_start: 2013, year_end: 2016,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key with 46 chip (circle-plus). 3 buttons: Lock, Unlock, Panic. HU100 key blade. On-board programming with 2 working keys or Tech2/MDI for all-keys-lost.',
  },
  {
    model: 'Buick Encore', year_start: 2013, year_end: 2016,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key with 46 chip (circle-plus). 4 buttons: Lock, Unlock, Remote Start, Panic. HU100 key blade. On-board programming with 2 working keys.',
  },
  {
    model: 'Buick Encore', year_start: 2017, year_end: 2020,
    key_blank: 'HU100', transponder_type: 'HITAG Pro', chip_type: '47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 47 chip. 3 buttons: Lock, Unlock, Panic. 315 MHz. Requires GM SPS/MDI2 or Autel IM608 for programming. Emergency HU100 blade inside fob.',
  },
  {
    model: 'Buick Encore', year_start: 2017, year_end: 2022,
    key_blank: 'HU100', transponder_type: 'HITAG Pro', chip_type: '47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 47 chip. 4 buttons: Lock, Unlock, Remote Start, Panic. 315 MHz. Requires GM SPS/MDI2 or Autel IM608 for programming.',
  },

  // =====================================================
  // BUICK ENCORE GX (2020-2025)
  // =====================================================
  {
    model: 'Buick Encore GX', year_start: 2020, year_end: 2025,
    key_blank: 'HU100', transponder_type: 'HITAG Pro', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4EA', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 47 chip. 3 buttons: Lock, Unlock, Panic. 433 MHz. Requires GM SPS/MDI2 or aftermarket tool (Autel IM608, SmartPro).',
  },
  {
    model: 'Buick Encore GX', year_start: 2020, year_end: 2025,
    key_blank: 'HU100', transponder_type: 'HITAG Pro', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4EA', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 47 chip. 4 buttons: Lock, Unlock, Remote Start, Panic. 433 MHz. Requires GM SPS/MDI2 or aftermarket tool for programming.',
  },

  // =====================================================
  // BUICK ENVISION (2016-2020 1st gen, 2021+ 2nd gen)
  // =====================================================
  {
    model: 'Buick Envision', year_start: 2016, year_end: 2020,
    key_blank: 'HU100', transponder_type: 'HITAG Pro', chip_type: '47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 47 chip. 4 buttons: Lock, Unlock, Remote Start, Panic. 315 MHz. Requires GM SPS/MDI2 or Autel IM608 for programming.',
  },
  {
    model: 'Buick Envision', year_start: 2016, year_end: 2020,
    key_blank: 'HU100', transponder_type: 'HITAG Pro', chip_type: '47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 47 chip. 5 buttons: Lock, Unlock, Remote Start, Liftgate, Panic. 315 MHz. Higher trims with power liftgate.',
  },
  {
    model: 'Buick Envision', year_start: 2021, year_end: 2025,
    key_blank: 'HU100', transponder_type: 'HITAG Pro', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4EA', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 47 chip. 4 buttons: Lock, Unlock, Remote Start, Panic. 433 MHz. Requires GM SPS/MDI2 or aftermarket tool for programming.',
  },
  {
    model: 'Buick Envision', year_start: 2021, year_end: 2025,
    key_blank: 'HU100', transponder_type: 'HITAG Pro', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4EA', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 47 chip. 5 buttons: Lock, Unlock, Remote Start, Liftgate, Panic. 433 MHz. Higher trims with power liftgate.',
  },

  // =====================================================
  // BUICK ENVISTA (2024+)
  // =====================================================
  {
    model: 'Buick Envista', year_start: 2024, year_end: 2025,
    key_blank: 'HU100', transponder_type: 'HITAG Pro', chip_type: '47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4ES', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 47 chip. 4 buttons: Lock, Unlock, Remote Start, Panic. 433 MHz. New generation GM smart key system. Requires SPS2/MDI2 or compatible aftermarket tool.',
  },

  // =====================================================
  // BUICK LACROSSE (2005-2009 1st gen, 2010-2016 2nd gen)
  // =====================================================
  {
    model: 'Buick LaCrosse', year_start: 2005, year_end: 2009,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 programmed keys or Tech2/SPS for all-keys-lost.',
  },
  {
    model: 'Buick LaCrosse', year_start: 2010, year_end: 2013,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key with 46 chip (circle-plus). 4 buttons: Lock, Unlock, Remote Start, Trunk. HU100 key blade. On-board programming with 2 working keys or Tech2/MDI for all-keys-lost.',
  },
  {
    model: 'Buick LaCrosse', year_start: 2010, year_end: 2013,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key with 46 chip (circle-plus). 5 buttons: Lock, Unlock, Remote Start, Trunk, Panic. HU100 key blade. On-board programming with 2 working keys.',
  },
  {
    model: 'Buick LaCrosse', year_start: 2014, year_end: 2016,
    key_blank: 'HU100', transponder_type: 'HITAG2 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG2 46 chip. 4 buttons: Lock, Unlock, Remote Start, Trunk. 315 MHz. Requires GM SPS/MDI or Autel IM608 for programming.',
  },
  {
    model: 'Buick LaCrosse', year_start: 2014, year_end: 2016,
    key_blank: 'HU100', transponder_type: 'HITAG2 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG2 46 chip. 5 buttons: Lock, Unlock, Remote Start, Trunk, Panic. 315 MHz. Requires GM SPS/MDI for programming.',
  },

  // =====================================================
  // BUICK LESABRE (1997-2005)
  // =====================================================
  {
    model: 'Buick LeSabre', year_start: 1997, year_end: 2000,
    key_blank: 'B89', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. VATS (Vehicle Anti-Theft System) resistor key may be present on some models. Standard GM B89 double-sided key blank.',
  },
  {
    model: 'Buick LeSabre', year_start: 2001, year_end: 2005,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // BUICK LUCERNE (2006-2011)
  // =====================================================
  {
    model: 'Buick Lucerne', year_start: 2006, year_end: 2007,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },
  {
    model: 'Buick Lucerne', year_start: 2008, year_end: 2011,
    key_blank: 'B111-PT', transponder_type: 'Philips 46', chip_type: 'PK3+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3+ transponder with Philips 46 chip. B111 circle-plus key blank (HU100 profile). 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // BUICK PARK AVENUE (1997-2005)
  // =====================================================
  {
    model: 'Buick Park Avenue', year_start: 1997, year_end: 2000,
    key_blank: 'B89', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. VATS resistor key system. Standard GM B89 double-sided key blank.',
  },
  {
    model: 'Buick Park Avenue', year_start: 2001, year_end: 2005,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // BUICK RAINIER (2004-2007)
  // =====================================================
  {
    model: 'Buick Rainier', year_start: 2004, year_end: 2007,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // BUICK REGAL (1997-2004, 2011-2017)
  // =====================================================
  {
    model: 'Buick Regal', year_start: 1997, year_end: 2000,
    key_blank: 'B89', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. VATS resistor key on some models. Standard GM B89 double-sided key blank.',
  },
  {
    model: 'Buick Regal', year_start: 2001, year_end: 2004,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },
  {
    model: 'Buick Regal', year_start: 2011, year_end: 2013,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key with 46 chip (circle-plus). 4 buttons: Lock, Unlock, Remote Start, Trunk. HU100 key blade. On-board programming with 2 working keys or Tech2/MDI for all-keys-lost.',
  },
  {
    model: 'Buick Regal', year_start: 2014, year_end: 2017,
    key_blank: 'HU100', transponder_type: 'HITAG2 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG2 46 chip. 4 buttons: Lock, Unlock, Remote Start, Trunk. 315 MHz. Requires GM SPS/MDI or Autel IM608 for programming.',
  },
  {
    model: 'Buick Regal', year_start: 2014, year_end: 2017,
    key_blank: 'HU100', transponder_type: 'HITAG2 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG2 46 chip. 5 buttons: Lock, Unlock, Remote Start, Trunk, Panic. 315 MHz. Requires GM SPS/MDI for programming.',
  },

  // =====================================================
  // BUICK RENDEZVOUS (2002-2007)
  // =====================================================
  {
    model: 'Buick Rendezvous', year_start: 2002, year_end: 2007,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // BUICK TERRAZA (2005-2007)
  // =====================================================
  {
    model: 'Buick Terraza', year_start: 2005, year_end: 2007,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // BUICK VERANO (2012-2017)
  // =====================================================
  {
    model: 'Buick Verano', year_start: 2012, year_end: 2014,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key with 46 chip (circle-plus). 4 buttons: Lock, Unlock, Remote Start, Trunk. HU100 key blade. On-board programming with 2 working keys or Tech2/MDI for all-keys-lost.',
  },
  {
    model: 'Buick Verano', year_start: 2012, year_end: 2014,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key with 46 chip (circle-plus). 5 buttons: Lock, Unlock, Remote Start, Trunk, Panic. HU100 key blade.',
  },
  {
    model: 'Buick Verano', year_start: 2015, year_end: 2017,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with 46 chip. 4 buttons: Lock, Unlock, Remote Start, Trunk. 315 MHz. Some trims still use flip key. Requires GM SPS/MDI for smart key programming.',
  },
  {
    model: 'Buick Verano', year_start: 2015, year_end: 2017,
    key_blank: 'HU100', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU100', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key with 46 chip. 5 buttons: Lock, Unlock, Remote Start, Trunk, Panic. 315 MHz. Requires GM SPS/MDI for programming.',
  },
];

// ============================================================
//  PONTIAC KEY DATA
// ============================================================
const pontiacKeys = [

  // =====================================================
  // PONTIAC AZTEK (2001-2005)
  // =====================================================
  {
    model: 'Pontiac Aztek', year_start: 2001, year_end: 2005,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // PONTIAC BONNEVILLE (1997-2005)
  // =====================================================
  {
    model: 'Pontiac Bonneville', year_start: 1997, year_end: 2000,
    key_blank: 'B89', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. VATS resistor key system. Standard GM B89 double-sided key blank.',
  },
  {
    model: 'Pontiac Bonneville', year_start: 2001, year_end: 2005,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // PONTIAC G3 (2009-2010)
  // =====================================================
  {
    model: 'Pontiac G3', year_start: 2009, year_end: 2010,
    key_blank: 'DWO4R-PT', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi DWO4R',
    image_url: null,
    programming_notes: 'Transponder key with Philips 46 chip. Based on Chevrolet Aveo platform. Requires Tech2 or compatible aftermarket tool for programming.',
  },

  // =====================================================
  // PONTIAC G5 (2007-2010)
  // =====================================================
  {
    model: 'Pontiac G5', year_start: 2007, year_end: 2010,
    key_blank: 'B111-PT', transponder_type: 'Philips 46', chip_type: 'PK3+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3+ transponder with Philips 46 chip. B111 circle-plus key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // PONTIAC G6 (2005-2010)
  // =====================================================
  {
    model: 'Pontiac G6', year_start: 2005, year_end: 2006,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },
  {
    model: 'Pontiac G6', year_start: 2007, year_end: 2010,
    key_blank: 'B111-PT', transponder_type: 'Philips 46', chip_type: 'PK3+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3+ transponder with Philips 46 chip. B111 circle-plus key blank (HU100 profile). 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },
  // G6 Smart Key (2007-2009 push-button start option)
  {
    model: 'Pontiac G6', year_start: 2007, year_end: 2009,
    key_blank: 'B111-PT', transponder_type: 'Philips 46', chip_type: 'PK3+',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OUC60270', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key for push-button start equipped models. 4 buttons: Lock, Unlock, Remote Start, Trunk. Philips 46 chip. Requires Tech2/SPS for programming.',
  },

  // =====================================================
  // PONTIAC G8 (2008-2009)
  // =====================================================
  {
    model: 'Pontiac G8', year_start: 2008, year_end: 2009,
    key_blank: 'HU43', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUC6000083', ic_number: null,
    battery_type: 'CR1620', buttons: '4',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU43',
    image_url: null,
    programming_notes: 'Remote head key with Philips 46 chip. 4 buttons: Lock, Unlock, Trunk, Panic. Australian-built (Holden Commodore). HU43 key blade. Requires Tech2 for programming.',
  },

  // =====================================================
  // PONTIAC GRAND AM (1999-2005)
  // =====================================================
  {
    model: 'Pontiac Grand Am', year_start: 1999, year_end: 2000,
    key_blank: 'B89', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. Standard GM B89 double-sided key blank. No programming needed.',
  },
  {
    model: 'Pontiac Grand Am', year_start: 2001, year_end: 2005,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // PONTIAC GRAND PRIX (1997-2008)
  // =====================================================
  {
    model: 'Pontiac Grand Prix', year_start: 1997, year_end: 2000,
    key_blank: 'B89', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. VATS resistor key on some models. Standard GM B89 double-sided key blank.',
  },
  {
    model: 'Pontiac Grand Prix', year_start: 2001, year_end: 2003,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },
  {
    model: 'Pontiac Grand Prix', year_start: 2004, year_end: 2008,
    key_blank: 'B99-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM39',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B99 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // PONTIAC GTO (2004-2006)
  // =====================================================
  {
    model: 'Pontiac GTO', year_start: 2004, year_end: 2006,
    key_blank: 'HU43', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: '92123813', ic_number: null,
    battery_type: 'CR1616', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU43',
    image_url: null,
    programming_notes: 'Remote head key with Philips 46 chip. 3 buttons: Lock, Unlock, Trunk. Australian-built (Holden Monaro). HU43 key blade. Requires Tech2 with security access for programming. PIN code required.',
  },

  // =====================================================
  // PONTIAC MONTANA (1999-2009)
  // =====================================================
  {
    model: 'Pontiac Montana', year_start: 1999, year_end: 2000,
    key_blank: 'B89', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. Standard GM B89 double-sided key blank. No programming needed.',
  },
  {
    model: 'Pontiac Montana', year_start: 2001, year_end: 2006,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },
  // Montana SV6 2005-2009 (renamed Montana)
  {
    model: 'Pontiac Montana', year_start: 2005, year_end: 2009,
    key_blank: 'B99-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM39',
    image_url: null,
    programming_notes: 'Montana SV6. PK3 transponder with Megamos 13 chip. B99 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // PONTIAC SOLSTICE (2006-2009)
  // =====================================================
  {
    model: 'Pontiac Solstice', year_start: 2006, year_end: 2006,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },
  {
    model: 'Pontiac Solstice', year_start: 2007, year_end: 2009,
    key_blank: 'B111-PT', transponder_type: 'Philips 46', chip_type: 'PK3+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3+ transponder with Philips 46 chip. B111 circle-plus key blank (HU100 profile). 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // PONTIAC SUNFIRE (1997-2005)
  // =====================================================
  {
    model: 'Pontiac Sunfire', year_start: 1997, year_end: 2000,
    key_blank: 'B89', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'Non-transponder mechanical key. Standard GM B89 double-sided key blank. No programming needed. Some models had VATS system.',
  },
  {
    model: 'Pontiac Sunfire', year_start: 2001, year_end: 2005,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // PONTIAC TORRENT (2006-2009)
  // =====================================================
  {
    model: 'Pontiac Torrent', year_start: 2006, year_end: 2006,
    key_blank: 'B97-PT', transponder_type: 'Megamos 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (PassKey 3) transponder with Megamos 13 chip. B97 sidewinder key blank. 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },
  {
    model: 'Pontiac Torrent', year_start: 2007, year_end: 2009,
    key_blank: 'B111-PT', transponder_type: 'Philips 46', chip_type: 'PK3+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'PK3+ transponder with Philips 46 chip. B111 circle-plus key blank (HU100 profile). 10-minute relearn procedure with 2 working keys or Tech2/SPS for all-keys-lost.',
  },

  // =====================================================
  // PONTIAC VIBE (2003-2010)
  // =====================================================
  {
    model: 'Pontiac Vibe', year_start: 2003, year_end: 2008,
    key_blank: 'TOY43-PT', transponder_type: 'Texas 4C', chip_type: '4C',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: null,
    programming_notes: 'Toyota-based platform (Matrix). Texas 4C transponder chip. TOY43 key blade. Requires Toyota Techstream or compatible tool for programming. NOT programmable via GM Tech2.',
  },
  {
    model: 'Pontiac Vibe', year_start: 2009, year_end: 2010,
    key_blank: 'TOY44G-PT', transponder_type: 'Texas Crypto 4D-67', chip_type: '4D-67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: null,
    programming_notes: 'Toyota-based platform (Matrix). Texas Crypto 4D-67 transponder chip (G-chip). TOY44G key blade. Requires Toyota Techstream or compatible aftermarket tool. On-board programming possible with working master key.',
  },
  {
    model: 'Pontiac Vibe', year_start: 2009, year_end: 2010,
    key_blank: 'TOY44G-PT', transponder_type: 'Texas Crypto 4D-67', chip_type: '4D-67',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'GQ4-29T', ic_number: null,
    battery_type: 'CR1620', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi TOY43',
    image_url: null,
    programming_notes: 'Remote head key. Toyota-based platform. 3 buttons: Lock, Unlock, Panic. Texas Crypto 4D-67 chip (G-chip). Requires Toyota Techstream or compatible tool.',
  },
];

// ============================================================
//  LAND ROVER KEY DATA
// ============================================================
const landRoverKeys = [

  // =====================================================
  // LAND ROVER DEFENDER (2020+)
  // =====================================================
  {
    model: 'Land Rover Defender', year_start: 2020, year_end: 2025,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJXF18A', ic_number: '2024DJ2468',
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 49 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. 315 MHz (North America). Requires JLR SDD/Pathfinder or Lonsdor K518 for programming. NOT OBD programmable - requires direct IMMO module access. PIN code from dealer required.',
  },

  // =====================================================
  // LAND ROVER DISCOVERY (1999-2004 Series II, 2005-2017 LR3/LR4, 2017+ Discovery 5)
  // =====================================================
  {
    model: 'Land Rover Discovery', year_start: 1999, year_end: 2004,
    key_blank: 'NE75', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '2',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NE75',
    image_url: null,
    programming_notes: 'Discovery Series II. Remote fob separate from key. 2 buttons: Lock, Unlock. Texas 4C transponder. NE75 key blade. Requires Testbook/T4 or Hawkeye for key programming. EKA (Emergency Key Access) code required.',
  },
  {
    model: 'Land Rover Discovery', year_start: 2017, year_end: 2025,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJXF18A', ic_number: '2024DJ2468',
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Discovery 5. Proximity smart key with HITAG Pro 49 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Requires JLR SDD/Pathfinder for programming. NOT OBD programmable. PIN code from dealer required.',
  },

  // =====================================================
  // LAND ROVER DISCOVERY SPORT (2015+)
  // =====================================================
  {
    model: 'Land Rover Discovery Sport', year_start: 2015, year_end: 2019,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJXF15A', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 49 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Requires JLR SDD/Pathfinder or Lonsdor K518 for programming. NOT OBD programmable. PIN code from dealer required.',
  },
  {
    model: 'Land Rover Discovery Sport', year_start: 2020, year_end: 2025,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJXF18A', ic_number: '2024DJ2468',
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 49 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Updated key fob design. Requires JLR Pathfinder/SDD for programming. NOT OBD programmable.',
  },

  // =====================================================
  // LAND ROVER FREELANDER (2002-2005)
  // =====================================================
  {
    model: 'Land Rover Freelander', year_start: 2002, year_end: 2005,
    key_blank: 'NE75', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '2',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi NE75',
    image_url: null,
    programming_notes: 'Transponder key with Texas 4C chip. Remote fob separate from key. 2 buttons: Lock, Unlock. NE75 key blade. Requires Testbook/T4 or Hawkeye for programming. EKA code required for all-keys-lost.',
  },

  // =====================================================
  // LAND ROVER LR2 (2008-2015)
  // =====================================================
  {
    model: 'Land Rover LR2', year_start: 2008, year_end: 2011,
    key_blank: 'HU101', transponder_type: 'Texas Crypto 4D', chip_type: '4D',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NT8-15K6014CFFTXA', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Flip key with Texas Crypto 4D chip. 5 buttons: Lock, Unlock, Trunk, Panic, Auxiliary. HU101 key blade. Requires JLR SDD/IDS or Lonsdor K518 for programming. PIN code required.',
  },
  {
    model: 'Land Rover LR2', year_start: 2012, year_end: 2015,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 49 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Requires JLR SDD for programming. NOT OBD programmable. PIN code from dealer required.',
  },

  // =====================================================
  // LAND ROVER LR3 (2005-2009)
  // =====================================================
  {
    model: 'Land Rover LR3', year_start: 2005, year_end: 2009,
    key_blank: 'HU101', transponder_type: 'Philips 44', chip_type: '44 (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NT8-15K6014CFFTXA', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Flip key with Megamos 48 (Philips 44) crypto transponder. 3 buttons: Lock, Unlock, Trunk. HU101 key blade. Requires JLR SDD/IDS or Hawkeye Pro for programming. PIN code required for all-keys-lost.',
  },

  // =====================================================
  // LAND ROVER LR4 (2010-2016)
  // =====================================================
  {
    model: 'Land Rover LR4', year_start: 2010, year_end: 2012,
    key_blank: 'HU101', transponder_type: 'Philips 44', chip_type: '44 (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NT8-15K6014CFFTXA', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Flip key with Megamos 48 (Philips 44) crypto transponder. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. HU101 key blade. Requires JLR SDD/IDS for programming. PIN code required.',
  },
  {
    model: 'Land Rover LR4', year_start: 2013, year_end: 2016,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Proximity smart key with HITAG Pro 49 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Requires JLR SDD for programming. NOT OBD programmable. PIN code from dealer required.',
  },

  // =====================================================
  // LAND ROVER RANGE ROVER (2003-2012 L322, 2013+ L405)
  // =====================================================
  {
    model: 'Land Rover Range Rover', year_start: 2003, year_end: 2005,
    key_blank: 'HU92', transponder_type: 'Philips 44', chip_type: '44 (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'LX8FZV', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU92',
    image_url: null,
    programming_notes: 'Range Rover L322 (BMW era). Flip key with Megamos 48 chip. 3 buttons: Lock, Unlock, Trunk. HU92 key blade. Requires JLR SDD/Testbook for programming. PIN code required.',
  },
  {
    model: 'Land Rover Range Rover', year_start: 2006, year_end: 2009,
    key_blank: 'HU101', transponder_type: 'Philips 44', chip_type: '44 (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NT8-15K6014CFFTXA', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Range Rover L322 (Jaguar era). Flip key with Megamos 48 chip. 3 buttons: Lock, Unlock, Trunk. HU101 key blade. Requires JLR SDD/IDS for programming. PIN code required.',
  },
  {
    model: 'Land Rover Range Rover', year_start: 2010, year_end: 2012,
    key_blank: 'HU101', transponder_type: 'Philips 44', chip_type: '44 (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Range Rover L322. Proximity smart key with Megamos 48 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Requires JLR SDD for programming. NOT OBD programmable. PIN required.',
  },
  {
    model: 'Land Rover Range Rover', year_start: 2013, year_end: 2019,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Range Rover L405. Proximity smart key with HITAG Pro 49 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Requires JLR SDD/Pathfinder for programming. NOT OBD programmable. PIN from dealer required.',
  },
  {
    model: 'Land Rover Range Rover', year_start: 2020, year_end: 2025,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJXF18A', ic_number: '2024DJ2468',
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Range Rover L405/L460. Updated smart key with HITAG Pro 49 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Requires JLR Pathfinder for programming. NOT OBD programmable.',
  },

  // =====================================================
  // LAND ROVER RANGE ROVER EVOQUE (2012-2019 L538, 2020+ L551)
  // =====================================================
  {
    model: 'Land Rover Range Rover Evoque', year_start: 2012, year_end: 2015,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Evoque L538. Proximity smart key with HITAG Pro 49 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Requires JLR SDD for programming. NOT OBD programmable. PIN code from dealer required.',
  },
  {
    model: 'Land Rover Range Rover Evoque', year_start: 2016, year_end: 2019,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJXF15A', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Evoque L538 facelift. Proximity smart key with HITAG Pro 49 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Requires JLR SDD/Pathfinder for programming. NOT OBD programmable.',
  },
  {
    model: 'Land Rover Range Rover Evoque', year_start: 2020, year_end: 2025,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJXF18A', ic_number: '2024DJ2468',
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Evoque L551. Updated smart key with HITAG Pro 49 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Requires JLR Pathfinder for programming. NOT OBD programmable.',
  },

  // =====================================================
  // LAND ROVER RANGE ROVER SPORT (2006-2013 L320, 2014+ L494)
  // =====================================================
  {
    model: 'Land Rover Range Rover Sport', year_start: 2006, year_end: 2009,
    key_blank: 'HU101', transponder_type: 'Philips 44', chip_type: '44 (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'NT8-15K6014CFFTXA', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Range Rover Sport L320. Flip key with Megamos 48 chip. 3 buttons: Lock, Unlock, Trunk. HU101 key blade. Requires JLR SDD/IDS for programming. PIN code required.',
  },
  {
    model: 'Land Rover Range Rover Sport', year_start: 2010, year_end: 2013,
    key_blank: 'HU101', transponder_type: 'Philips 44', chip_type: '44 (Megamos 48)',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Range Rover Sport L320. Proximity smart key with Megamos 48 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Requires JLR SDD for programming. NOT OBD programmable. PIN required.',
  },
  {
    model: 'Land Rover Range Rover Sport', year_start: 2014, year_end: 2019,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJTF10A', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Range Rover Sport L494. Proximity smart key with HITAG Pro 49 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Requires JLR SDD/Pathfinder for programming. NOT OBD programmable. PIN from dealer required.',
  },
  {
    model: 'Land Rover Range Rover Sport', year_start: 2020, year_end: 2025,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJXF18A', ic_number: '2024DJ2468',
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Range Rover Sport L494/L461. Updated smart key with HITAG Pro 49 chip. 5 buttons. Requires JLR Pathfinder for programming. NOT OBD programmable.',
  },

  // =====================================================
  // LAND ROVER RANGE ROVER VELAR (2018+)
  // =====================================================
  {
    model: 'Land Rover Range Rover Velar', year_start: 2018, year_end: 2019,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJXF15A', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Range Rover Velar. Proximity smart key with HITAG Pro 49 chip. 5 buttons: Lock, Unlock, Tailgate, Panic, Auxiliary. Requires JLR SDD/Pathfinder for programming. NOT OBD programmable. PIN from dealer required.',
  },
  {
    model: 'Land Rover Range Rover Velar', year_start: 2020, year_end: 2025,
    key_blank: 'HU101', transponder_type: 'HITAG Pro', chip_type: '49',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KOBJXF18A', ic_number: '2024DJ2468',
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: null,
    programming_notes: 'Range Rover Velar. Updated smart key with HITAG Pro 49 chip. 5 buttons. Requires JLR Pathfinder for programming. NOT OBD programmable.',
  },
];

// ============================================================
//  MAIN EXECUTION
// ============================================================
async function main() {
  await client.connect();
  console.log('Connected to Supabase PostgreSQL.');

  // Get year_ids for each manufacturer (required NOT NULL column)
  const buickYearRes = await client.query(
    "SELECT vy.id FROM vehicle_years vy JOIN vehicle_models vm ON vy.model_id = vm.id WHERE vm.manufacturer_id = $1 LIMIT 1",
    [BUICK_ID]
  );
  const pontiacYearRes = await client.query(
    "SELECT vy.id FROM vehicle_years vy JOIN vehicle_models vm ON vy.model_id = vm.id WHERE vm.manufacturer_id = $1 LIMIT 1",
    [PONTIAC_ID]
  );
  const lrYearRes = await client.query(
    "SELECT vy.id FROM vehicle_years vy JOIN vehicle_models vm ON vy.model_id = vm.id WHERE vm.manufacturer_id = $1 LIMIT 1",
    [LR_ID]
  );

  const buickYearId = buickYearRes.rows[0]?.id;
  const pontiacYearId = pontiacYearRes.rows[0]?.id;
  const lrYearId = lrYearRes.rows[0]?.id;

  if (!buickYearId || !pontiacYearId || !lrYearId) {
    console.error('Missing year_ids:', { buickYearId, pontiacYearId, lrYearId });
    process.exit(1);
  }
  console.log('Year IDs:', { buickYearId, pontiacYearId, lrYearId });

  // Count existing rows
  for (const [name, id] of [['Buick', BUICK_ID], ['Pontiac', PONTIAC_ID], ['Land Rover', LR_ID]]) {
    const cnt = await client.query("SELECT COUNT(*) FROM automotive_keys WHERE manufacturer_id = $1", [id]);
    console.log(`Existing ${name} rows: ${cnt.rows[0].count}`);
  }

  try {
    await client.query('BEGIN');

    // DELETE all existing rows for all three manufacturers
    const delBuick = await client.query("DELETE FROM automotive_keys WHERE manufacturer_id = $1", [BUICK_ID]);
    const delPontiac = await client.query("DELETE FROM automotive_keys WHERE manufacturer_id = $1", [PONTIAC_ID]);
    const delLR = await client.query("DELETE FROM automotive_keys WHERE manufacturer_id = $1", [LR_ID]);
    console.log(`\nDeleted: Buick=${delBuick.rowCount}, Pontiac=${delPontiac.rowCount}, Land Rover=${delLR.rowCount}`);

    // INSERT helper
    async function insertKeys(keys, mfrId, yearId, mfrName) {
      let inserted = 0;
      for (const key of keys) {
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
            key.battery_type, key.buttons, key.emergency_key_blank, key.test_key_blank,
            key.obd_programmable, key.pin_code_required, key.lishi_tool, key.image_url,
            key.programming_notes, key.year_start, key.year_end
          ]
        );
        inserted++;
      }
      console.log(`Inserted ${inserted} ${mfrName} rows.`);
      return inserted;
    }

    const totalBuick = await insertKeys(buickKeys, BUICK_ID, buickYearId, 'Buick');
    const totalPontiac = await insertKeys(pontiacKeys, PONTIAC_ID, pontiacYearId, 'Pontiac');
    const totalLR = await insertKeys(landRoverKeys, LR_ID, lrYearId, 'Land Rover');

    await client.query('COMMIT');
    console.log('\nTransaction committed successfully.');
    console.log(`Total inserted: ${totalBuick + totalPontiac + totalLR}`);

    // Verify counts
    console.log('\n=== VERIFICATION ===');
    for (const [name, id] of [['Buick', BUICK_ID], ['Pontiac', PONTIAC_ID], ['Land Rover', LR_ID]]) {
      const cnt = await client.query("SELECT COUNT(*) FROM automotive_keys WHERE manufacturer_id = $1", [id]);
      console.log(`${name}: ${cnt.rows[0].count} rows`);

      // Show distinct models
      const models = await client.query(
        "SELECT DISTINCT model_name FROM automotive_keys WHERE manufacturer_id = $1 ORDER BY model_name",
        [id]
      );
      console.log(`  Models: ${models.rows.map(r => r.model_name).join(', ')}`);
    }

    // Show total across all three
    const grandTotal = await client.query(
      "SELECT COUNT(*) FROM automotive_keys WHERE manufacturer_id IN ($1, $2, $3)",
      [BUICK_ID, PONTIAC_ID, LR_ID]
    );
    console.log(`\nGrand total: ${grandTotal.rows[0].count} rows`);

  } catch (txErr) {
    await client.query('ROLLBACK');
    console.error('Transaction rolled back due to error:', txErr.message);
    console.error(txErr.stack);
    throw txErr;
  }

  await client.end();
  console.log('\nDone. Connection closed.');
}

main().catch(err => { console.error(err); process.exit(1); });
