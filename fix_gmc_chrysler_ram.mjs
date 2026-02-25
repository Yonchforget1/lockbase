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

const GMC_ID = 'c8982dc7-95fc-4b3a-820f-d0a616ae769a';
const CHRYSLER_ID = '346d79c0-f83d-402b-8c86-66a650b6817f';
const RAM_ID = '3f050066-07ac-428b-a8e5-774fedda674e';

// ============================================================
// GMC KEY DATA
// ============================================================
const gmcKeys = [

  // ===================== GMC SIERRA 1500 =====================

  // 1999-2002 Sierra 1500 - PK3 transponder (old body style)
  {
    model: 'GMC Sierra 1500', year_start: 1999, year_end: 2002,
    key_blank: 'B97-PT', transponder_type: 'Megamos Crypto 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 (Passlock 3) transponder. 10-minute relearn procedure or Tech 2 programming. B97 sidewinder key blade.',
  },
  // 2003-2006 Sierra 1500 - PK3+ transponder (GMT800 classic)
  {
    model: 'GMC Sierra 1500', year_start: 2003, year_end: 2006,
    key_blank: 'B99-PT', transponder_type: 'Megamos Crypto 13', chip_type: 'PK3+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3+ (Passkey 3+) system. On-board 10-minute relearn or Tech 2 with security access. B99 key blade.',
  },
  // 2007-2013 Sierra 1500 - Remote head key 3 button (GMT900)
  {
    model: 'GMC Sierra 1500', year_start: 2007, year_end: 2013,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM Circle+ 46 chip. On-board programming with 2 existing keys (10-min relearn). GM MDI/Tech 2 for all keys lost. 3-button: Lock, Unlock, Panic.',
  },
  // 2007-2013 Sierra 1500 - Remote head key 4 button
  {
    model: 'GMC Sierra 1500', year_start: 2007, year_end: 2013,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM Circle+ 46 chip. On-board 10-min relearn with 2 working keys. 4-button: Lock, Unlock, Remote Start, Panic.',
  },
  // 2014-2018 Sierra 1500 - Flip key 3 button (K2XX)
  {
    model: 'GMC Sierra 1500', year_start: 2014, year_end: 2018,
    key_blank: 'B119-PT', transponder_type: 'Philips 46 (EXT)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'M3N-32337100', ic_number: '7812A-32337100',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key with 46 chip. On-board 10-min relearn with 2 working keys. GM MDI for all keys lost. 3-button: Lock, Unlock, Panic.',
  },
  // 2014-2018 Sierra 1500 - Flip key 4 button
  {
    model: 'GMC Sierra 1500', year_start: 2014, year_end: 2018,
    key_blank: 'B119-PT', transponder_type: 'Philips 46 (EXT)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'M3N-32337100', ic_number: '7812A-32337100',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key with 46 chip. 4-button: Lock, Unlock, Remote Start, Panic. On-board relearn or GM MDI.',
  },
  // 2014-2018 Sierra 1500 - Flip key 5 button
  {
    model: 'GMC Sierra 1500', year_start: 2014, year_end: 2018,
    key_blank: 'B119-PT', transponder_type: 'Philips 46 (EXT)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'M3N-32337100', ic_number: '7812A-32337100',
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key with 46 chip. 5-button: Lock, Unlock, Remote Start, Tailgate, Panic. On-board relearn or GM MDI.',
  },
  // 2019-2024 Sierra 1500 - Smart key 5 button (T1XX)
  {
    model: 'GMC Sierra 1500', year_start: 2019, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag Pro (AES)', chip_type: '46 AES',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ1EA', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'B120', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key, 46 AES chip. Push-button start. 5-button: Lock, Unlock, Remote Start, Tailgate Release, Panic. Program via GM MDI or Autel IM608.',
  },

  // ===================== GMC SIERRA 2500 =====================

  // 1999-2002 Sierra 2500 - PK3 transponder
  {
    model: 'GMC Sierra 2500', year_start: 1999, year_end: 2002,
    key_blank: 'B97-PT', transponder_type: 'Megamos Crypto 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 transponder. 10-minute relearn procedure. B97 sidewinder blade.',
  },
  // 2003-2006 Sierra 2500 - PK3+
  {
    model: 'GMC Sierra 2500', year_start: 2003, year_end: 2006,
    key_blank: 'B99-PT', transponder_type: 'Megamos Crypto 13', chip_type: 'PK3+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3+ system. 10-minute relearn or Tech 2. B99 key blade.',
  },
  // 2007-2014 Sierra 2500HD - Remote head 3 button
  {
    model: 'GMC Sierra 2500', year_start: 2007, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. On-board 10-min relearn. 3-button: Lock, Unlock, Panic.',
  },
  // 2007-2014 Sierra 2500HD - Remote head 4 button
  {
    model: 'GMC Sierra 2500', year_start: 2007, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. 4-button: Lock, Unlock, Remote Start, Panic.',
  },
  // 2015-2019 Sierra 2500HD - Flip key 3 button
  {
    model: 'GMC Sierra 2500', year_start: 2015, year_end: 2019,
    key_blank: 'B119-PT', transponder_type: 'Philips 46 (EXT)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'M3N-32337100', ic_number: '7812A-32337100',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key. 46 chip. 3-button: Lock, Unlock, Panic. On-board relearn or GM MDI.',
  },
  // 2015-2019 Sierra 2500HD - Flip key 5 button
  {
    model: 'GMC Sierra 2500', year_start: 2015, year_end: 2019,
    key_blank: 'B119-PT', transponder_type: 'Philips 46 (EXT)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'M3N-32337100', ic_number: '7812A-32337100',
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key. 46 chip. 5-button: Lock, Unlock, Remote Start, Tailgate, Panic.',
  },
  // 2020-2024 Sierra 2500HD - Smart key 5 button
  {
    model: 'GMC Sierra 2500', year_start: 2020, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag Pro (AES)', chip_type: '46 AES',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ1EA', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'B120', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key. 46 AES chip. 5-button: Lock, Unlock, Remote Start, Tailgate, Panic. GM MDI or Autel IM608.',
  },

  // ===================== GMC SIERRA 3500 =====================

  // 1999-2002 Sierra 3500 - PK3
  {
    model: 'GMC Sierra 3500', year_start: 1999, year_end: 2002,
    key_blank: 'B97-PT', transponder_type: 'Megamos Crypto 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 transponder. 10-minute relearn. B97 sidewinder blade.',
  },
  // 2003-2006 Sierra 3500 - PK3+
  {
    model: 'GMC Sierra 3500', year_start: 2003, year_end: 2006,
    key_blank: 'B99-PT', transponder_type: 'Megamos Crypto 13', chip_type: 'PK3+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3+ system. 10-minute relearn or Tech 2.',
  },
  // 2007-2014 Sierra 3500HD - Remote head 3 button
  {
    model: 'GMC Sierra 3500', year_start: 2007, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. On-board 10-min relearn. 3-button: Lock, Unlock, Panic.',
  },
  // 2007-2014 Sierra 3500HD - Remote head 4 button
  {
    model: 'GMC Sierra 3500', year_start: 2007, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. 4-button: Lock, Unlock, Remote Start, Panic.',
  },
  // 2015-2019 Sierra 3500HD - Flip key 3 button
  {
    model: 'GMC Sierra 3500', year_start: 2015, year_end: 2019,
    key_blank: 'B119-PT', transponder_type: 'Philips 46 (EXT)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'M3N-32337100', ic_number: '7812A-32337100',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key. 46 chip. 3-button: Lock, Unlock, Panic.',
  },
  // 2015-2019 Sierra 3500HD - Flip key 5 button
  {
    model: 'GMC Sierra 3500', year_start: 2015, year_end: 2019,
    key_blank: 'B119-PT', transponder_type: 'Philips 46 (EXT)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'M3N-32337100', ic_number: '7812A-32337100',
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key. 46 chip. 5-button: Lock, Unlock, Remote Start, Tailgate, Panic.',
  },
  // 2020-2024 Sierra 3500HD - Smart key 5 button
  {
    model: 'GMC Sierra 3500', year_start: 2020, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag Pro (AES)', chip_type: '46 AES',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ1EA', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'B120', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key. 46 AES chip. 5-button: Lock, Unlock, Remote Start, Tailgate, Panic. GM MDI or Autel IM608.',
  },

  // ===================== GMC YUKON =====================

  // 2000-2006 Yukon - PK3/PK3+
  {
    model: 'GMC Yukon', year_start: 2000, year_end: 2002,
    key_blank: 'B97-PT', transponder_type: 'Megamos Crypto 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 transponder. 10-minute relearn. B97 sidewinder blade.',
  },
  {
    model: 'GMC Yukon', year_start: 2003, year_end: 2006,
    key_blank: 'B99-PT', transponder_type: 'Megamos Crypto 13', chip_type: 'PK3+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3+ system. 10-minute relearn or Tech 2.',
  },
  // 2007-2014 Yukon - Remote head key 3 button
  {
    model: 'GMC Yukon', year_start: 2007, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. On-board 10-min relearn. 3-button: Lock, Unlock, Panic.',
  },
  // 2007-2014 Yukon - Remote head key 4 button
  {
    model: 'GMC Yukon', year_start: 2007, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. 4-button: Lock, Unlock, Remote Start, Panic.',
  },
  // 2007-2014 Yukon - Remote head key 5 button
  {
    model: 'GMC Yukon', year_start: 2007, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. 5-button: Lock, Unlock, Remote Start, Hatch, Panic.',
  },
  // 2015-2020 Yukon - Smart key 6 button (K2XX)
  {
    model: 'GMC Yukon', year_start: 2015, year_end: 2020,
    key_blank: null, transponder_type: 'Philips 46 (EXT)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ1AA', ic_number: null,
    battery_type: 'CR2032', buttons: 6,
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key. 46 chip. 6-button: Lock, Unlock, Remote Start, Hatch, Panic, Liftgate. Program via GM MDI or Autel.',
  },
  // 2021-2024 Yukon - Smart key 5 button (T1XX)
  {
    model: 'GMC Yukon', year_start: 2021, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag Pro (AES)', chip_type: '46 AES',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'YG0G21TB2', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'B120', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key. 46 AES chip. 5-button: Lock, Unlock, Remote Start, Hatch, Panic. GM MDI2 or Autel IM608 Pro.',
  },

  // ===================== GMC YUKON XL =====================

  // 2000-2006 Yukon XL - PK3/PK3+
  {
    model: 'GMC Yukon XL', year_start: 2000, year_end: 2002,
    key_blank: 'B97-PT', transponder_type: 'Megamos Crypto 13', chip_type: 'PK3',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3 transponder. 10-minute relearn.',
  },
  {
    model: 'GMC Yukon XL', year_start: 2003, year_end: 2006,
    key_blank: 'B99-PT', transponder_type: 'Megamos Crypto 13', chip_type: 'PK3+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3+ system. 10-minute relearn or Tech 2.',
  },
  // 2007-2014 Yukon XL - Remote head 3 button
  {
    model: 'GMC Yukon XL', year_start: 2007, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. On-board 10-min relearn. 3-button: Lock, Unlock, Panic.',
  },
  // 2007-2014 Yukon XL - Remote head 5 button
  {
    model: 'GMC Yukon XL', year_start: 2007, year_end: 2014,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. 5-button: Lock, Unlock, Remote Start, Hatch, Panic.',
  },
  // 2015-2020 Yukon XL - Smart key 6 button
  {
    model: 'GMC Yukon XL', year_start: 2015, year_end: 2020,
    key_blank: null, transponder_type: 'Philips 46 (EXT)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ1AA', ic_number: null,
    battery_type: 'CR2032', buttons: 6,
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key. 6-button: Lock, Unlock, Remote Start, Hatch, Panic, Liftgate. GM MDI or Autel.',
  },
  // 2021-2024 Yukon XL - Smart key 5 button
  {
    model: 'GMC Yukon XL', year_start: 2021, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag Pro (AES)', chip_type: '46 AES',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'YG0G21TB2', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'B120', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key. 46 AES chip. 5-button: Lock, Unlock, Remote Start, Hatch, Panic. GM MDI2 or Autel IM608 Pro.',
  },

  // ===================== GMC ACADIA =====================

  // 2007-2012 Acadia - Remote head 4 button
  {
    model: 'GMC Acadia', year_start: 2007, year_end: 2012,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. On-board 10-min relearn. 4-button: Lock, Unlock, Remote Start, Panic.',
  },
  // 2007-2012 Acadia - Remote head 5 button
  {
    model: 'GMC Acadia', year_start: 2007, year_end: 2012,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. 5-button: Lock, Unlock, Remote Start, Hatch, Panic.',
  },
  // 2013-2016 Acadia - Smart key 4 button
  {
    model: 'GMC Acadia', year_start: 2013, year_end: 2016,
    key_blank: null, transponder_type: 'Philips 46 (EXT)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key. 46 chip. 4-button: Lock, Unlock, Remote Start, Panic. GM MDI or on-board relearn.',
  },
  // 2013-2016 Acadia - Smart key 5 button
  {
    model: 'GMC Acadia', year_start: 2013, year_end: 2016,
    key_blank: null, transponder_type: 'Philips 46 (EXT)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'B111', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key. 46 chip. 5-button: Lock, Unlock, Remote Start, Hatch, Panic.',
  },
  // 2017-2024 Acadia - Smart key 4 button (new gen)
  {
    model: 'GMC Acadia', year_start: 2017, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag Pro (AES)', chip_type: '46 AES',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'B120', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key. 46 AES chip. 4-button: Lock, Unlock, Remote Start, Panic. GM MDI or Autel IM608.',
  },
  // 2017-2024 Acadia - Smart key 5 button
  {
    model: 'GMC Acadia', year_start: 2017, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag Pro (AES)', chip_type: '46 AES',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'B120', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key. 46 AES chip. 5-button: Lock, Unlock, Remote Start, Hatch, Panic.',
  },

  // ===================== GMC TERRAIN =====================

  // 2010-2017 Terrain - Remote head 3 button
  {
    model: 'GMC Terrain', year_start: 2010, year_end: 2017,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. On-board 10-min relearn. 3-button: Lock, Unlock, Panic.',
  },
  // 2010-2017 Terrain - Remote head 4 button
  {
    model: 'GMC Terrain', year_start: 2010, year_end: 2017,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OHT01060512', ic_number: '3521A-T060512',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. 4-button: Lock, Unlock, Remote Start, Panic.',
  },
  // 2018-2024 Terrain - Smart key 4 button
  {
    model: 'GMC Terrain', year_start: 2018, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag Pro (AES)', chip_type: '46 AES',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'B120', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key. 46 AES chip. 4-button: Lock, Unlock, Remote Start, Panic. GM MDI or Autel IM608.',
  },
  // 2018-2024 Terrain - Smart key 5 button
  {
    model: 'GMC Terrain', year_start: 2018, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag Pro (AES)', chip_type: '46 AES',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'HYQ4AA', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'B120', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key. 46 AES chip. 5-button: Lock, Unlock, Remote Start, Hatch, Panic.',
  },

  // ===================== GMC CANYON =====================

  // 2004-2012 Canyon - PK3+
  {
    model: 'GMC Canyon', year_start: 2004, year_end: 2012,
    key_blank: 'B99-PT', transponder_type: 'Megamos Crypto 13', chip_type: 'PK3+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3+ system. 10-minute relearn or Tech 2. B99 key blade.',
  },
  // 2015-2021 Canyon - Flip key 3 button
  {
    model: 'GMC Canyon', year_start: 2015, year_end: 2021,
    key_blank: 'B119-PT', transponder_type: 'Philips 46 (EXT)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'M3N-32337100', ic_number: '7812A-32337100',
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key. 46 chip. 3-button: Lock, Unlock, Panic. On-board relearn or GM MDI.',
  },
  // 2015-2021 Canyon - Flip key 4 button
  {
    model: 'GMC Canyon', year_start: 2015, year_end: 2021,
    key_blank: 'B119-PT', transponder_type: 'Philips 46 (EXT)', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'M3N-32337100', ic_number: '7812A-32337100',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'GM flip key. 46 chip. 4-button: Lock, Unlock, Remote Start, Panic.',
  },
  // 2022-2024 Canyon - Smart key 4 button
  {
    model: 'GMC Canyon', year_start: 2022, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag Pro (AES)', chip_type: '46 AES',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'YG0G21TB2', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'B120', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Proximity smart key. 46 AES chip. 4-button: Lock, Unlock, Remote Start, Panic. GM MDI2 or Autel.',
  },

  // ===================== GMC ENVOY =====================

  // 2002-2005 Envoy - PK3+
  {
    model: 'GMC Envoy', year_start: 2002, year_end: 2005,
    key_blank: 'B99-PT', transponder_type: 'Megamos Crypto 13', chip_type: 'PK3+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3+ system. 10-minute relearn or Tech 2. B99 key blade.',
  },
  // 2006-2009 Envoy - Circle+ 46 chip transponder
  {
    model: 'GMC Envoy', year_start: 2006, year_end: 2009,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip transponder. On-board 10-min relearn. B111 key blade.',
  },

  // ===================== HUMMER H2 =====================

  // 2003-2007 Hummer H2 - PK3+
  {
    model: 'Hummer H2', year_start: 2003, year_end: 2007,
    key_blank: 'B99-PT', transponder_type: 'Megamos Crypto 13', chip_type: 'PK3+',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi GM37',
    image_url: null,
    programming_notes: 'PK3+ system. 10-minute relearn or Tech 2. B99 sidewinder blade.',
  },
  // 2008-2009 Hummer H2 - Circle+ 46 transponder
  {
    model: 'Hummer H2', year_start: 2008, year_end: 2009,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip. On-board 10-min relearn. B111 key blade.',
  },

  // ===================== HUMMER H3 =====================

  // 2006-2010 Hummer H3 - Circle+ 46
  {
    model: 'Hummer H3', year_start: 2006, year_end: 2010,
    key_blank: 'B111-PT', transponder_type: 'Philips 46 (Circle+)', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: null,
    programming_notes: 'Circle+ 46 chip transponder. On-board 10-min relearn. B111 key blade.',
  },
];

// ============================================================
// CHRYSLER KEY DATA
// ============================================================
const chryslerKeys = [

  // ===================== CHRYSLER 200 =====================

  // 2011-2014 Chrysler 200 - Fobik 4 button
  {
    model: 'Chrysler 200', year_start: 2011, year_end: 2014,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N5WY783X', ic_number: '7812A-5WY783X',
    battery_type: 'CR2032 (internal)', buttons: 4,
    emergency_key_blank: 'Y160', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Chrysler Fobik key. 46 Hitag2 chip. 4-button: Lock, Unlock, Trunk, Panic. Requires PIN/security code from dealer or WIT2 for programming. OBD programmable with Autel IM608, SmartPro, etc.',
  },
  // 2011-2014 Chrysler 200 - Fobik 5 button
  {
    model: 'Chrysler 200', year_start: 2011, year_end: 2014,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N5WY783X', ic_number: '7812A-5WY783X',
    battery_type: 'CR2032 (internal)', buttons: 5,
    emergency_key_blank: 'Y160', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Chrysler Fobik key. 46 Hitag2 chip. 5-button: Lock, Unlock, Trunk, Remote Start, Panic. Requires PIN code.',
  },
  // 2015-2017 Chrysler 200 - Smart key 4 button
  {
    model: 'Chrysler 200', year_start: 2015, year_end: 2017,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: '7812A-40821302',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Proximity smart key. Hitag AES 4A chip. 4-button: Lock, Unlock, Trunk, Panic. Push-button start. Requires PIN for programming. Autel IM608 or SmartPro.',
  },
  // 2015-2017 Chrysler 200 - Smart key 5 button
  {
    model: 'Chrysler 200', year_start: 2015, year_end: 2017,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: '7812A-40821302',
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'CY24', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Proximity smart key. 4A chip. 5-button: Lock, Unlock, Trunk, Remote Start, Panic. PIN required.',
  },

  // ===================== CHRYSLER 300 =====================

  // 2005-2007 Chrysler 300 - Fobik 3 button (first gen)
  {
    model: 'Chrysler 300', year_start: 2005, year_end: 2007,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'First gen Fobik. Hitag2 46 chip. 3-button: Lock, Unlock, Panic. PIN required for programming.',
  },
  // 2005-2007 Chrysler 300 - Fobik 4 button
  {
    model: 'Chrysler 300', year_start: 2005, year_end: 2007,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 4,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'First gen Fobik. 46 chip. 4-button: Lock, Unlock, Trunk, Panic. PIN required.',
  },
  // 2008-2010 Chrysler 300 - Fobik 4 button (updated)
  {
    model: 'Chrysler 300', year_start: 2008, year_end: 2010,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ-C01C', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 4,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 Hitag2 chip. 4-button: Lock, Unlock, Trunk, Panic. PIN required.',
  },
  // 2008-2010 Chrysler 300 - Fobik 5 button
  {
    model: 'Chrysler 300', year_start: 2008, year_end: 2010,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ-C01C', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 5,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 5-button: Lock, Unlock, Trunk, Remote Start, Panic.',
  },
  // 2011-2018 Chrysler 300 - Fobik 4 button
  {
    model: 'Chrysler 300', year_start: 2011, year_end: 2018,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: '7812A-40821302',
    battery_type: 'CR2032 (internal)', buttons: 4,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 Hitag2 chip. 4-button: Lock, Unlock, Trunk, Panic. PIN required. OBD programming with Autel/SmartPro.',
  },
  // 2011-2018 Chrysler 300 - Fobik 5 button
  {
    model: 'Chrysler 300', year_start: 2011, year_end: 2018,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: '7812A-40821302',
    battery_type: 'CR2032 (internal)', buttons: 5,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 5-button: Lock, Unlock, Trunk, Remote Start, Panic.',
  },
  // 2019-2023 Chrysler 300 - Smart key 4 button (AES)
  {
    model: 'Chrysler 300', year_start: 2019, year_end: 2023,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: '7812A-40821302',
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart proximity key. Hitag AES 4A chip. 4-button: Lock, Unlock, Trunk, Panic. Push-button start. PIN required. Autel IM608.',
  },
  // 2019-2023 Chrysler 300 - Smart key 5 button
  {
    model: 'Chrysler 300', year_start: 2019, year_end: 2023,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-40821302', ic_number: '7812A-40821302',
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart key. 4A chip. 5-button: Lock, Unlock, Trunk, Remote Start, Panic.',
  },

  // ===================== CHRYSLER ASPEN =====================

  // 2007-2009 Aspen - Fobik 3 button
  {
    model: 'Chrysler Aspen', year_start: 2007, year_end: 2009,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 Hitag2 chip. 3-button: Lock, Unlock, Panic. PIN required.',
  },
  // 2007-2009 Aspen - Fobik 4 button
  {
    model: 'Chrysler Aspen', year_start: 2007, year_end: 2009,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 4,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 4-button: Lock, Unlock, Hatch, Panic.',
  },

  // ===================== CHRYSLER CROSSFIRE =====================

  // 2004-2008 Crossfire - Mercedes transponder
  {
    model: 'Chrysler Crossfire', year_start: 2004, year_end: 2008,
    key_blank: 'HU64', transponder_type: 'Mercedes IR', chip_type: 'Mercedes IR',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2025', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HU64',
    image_url: null,
    programming_notes: 'Mercedes-Benz platform. Uses Mercedes IR transponder system. Must be programmed with Mercedes EIS/EZS. 3-button: Lock, Unlock, Panic. Key blade is HU64.',
  },

  // ===================== CHRYSLER PACIFICA =====================

  // 2004-2008 Pacifica (first gen) - Fobik 4 button
  {
    model: 'Chrysler Pacifica', year_start: 2004, year_end: 2008,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 4,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'First gen Pacifica. Fobik key. 46 chip. 4-button: Lock, Unlock, Hatch, Panic. PIN required.',
  },
  // 2017-2024 Pacifica - Smart key 6 button
  {
    model: 'Chrysler Pacifica', year_start: 2017, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-97395900', ic_number: '7812A-97395900',
    battery_type: 'CR2032', buttons: 6,
    emergency_key_blank: 'Y173', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Proximity smart key. Hitag AES 4A chip. 6-button: Lock, Unlock, Power Sliding Doors (x2), Hatch, Panic. Push-button start. PIN required. Autel IM608 or SmartPro.',
  },
  // 2017-2024 Pacifica - Smart key 7 button (w/ Remote Start)
  {
    model: 'Chrysler Pacifica', year_start: 2017, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-97395900', ic_number: '7812A-97395900',
    battery_type: 'CR2032', buttons: 7,
    emergency_key_blank: 'Y173', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Proximity smart key. 4A chip. 7-button: Lock, Unlock, Power Sliding Doors (x2), Hatch, Remote Start, Panic.',
  },

  // ===================== CHRYSLER PT CRUISER =====================

  // 2001-2005 PT Cruiser - Transponder (no Fobik)
  {
    model: 'Chrysler PT Cruiser', year_start: 2001, year_end: 2005,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Transponder key with 46 chip. PIN code from dealer required for all-keys-lost. On-board programming possible with 2 working keys.',
  },
  // 2006-2010 PT Cruiser - Fobik 3 button
  {
    model: 'Chrysler PT Cruiser', year_start: 2006, year_end: 2010,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y160', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 Hitag2 chip. 3-button: Lock, Unlock, Panic. PIN required.',
  },
  // 2006-2010 PT Cruiser - Fobik 4 button
  {
    model: 'Chrysler PT Cruiser', year_start: 2006, year_end: 2010,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 4,
    emergency_key_blank: 'Y160', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 4-button: Lock, Unlock, Trunk, Panic.',
  },

  // ===================== CHRYSLER SEBRING =====================

  // 2001-2006 Sebring - Transponder
  {
    model: 'Chrysler Sebring', year_start: 2001, year_end: 2006,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Transponder key with 46 chip. PIN code required for programming. Y160 key blade.',
  },
  // 2007-2010 Sebring - Fobik 3 button
  {
    model: 'Chrysler Sebring', year_start: 2007, year_end: 2010,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y160', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 Hitag2 chip. 3-button: Lock, Unlock, Panic.',
  },
  // 2007-2010 Sebring - Fobik 4 button
  {
    model: 'Chrysler Sebring', year_start: 2007, year_end: 2010,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 4,
    emergency_key_blank: 'Y160', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 4-button: Lock, Unlock, Trunk, Panic.',
  },
  // 2007-2010 Sebring - Fobik 5 button
  {
    model: 'Chrysler Sebring', year_start: 2007, year_end: 2010,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 5,
    emergency_key_blank: 'Y160', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 5-button: Lock, Unlock, Trunk, Remote Start, Panic.',
  },

  // ===================== CHRYSLER TOWN & COUNTRY =====================

  // 2001-2003 Town & Country - Transponder
  {
    model: 'Chrysler Town & Country', year_start: 2001, year_end: 2003,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Transponder key with 46 chip. PIN code required for programming.',
  },
  // 2004-2007 Town & Country - Fobik 3 button
  {
    model: 'Chrysler Town & Country', year_start: 2004, year_end: 2007,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 3-button: Lock, Unlock, Panic.',
  },
  // 2004-2007 Town & Country - Fobik 5 button
  {
    model: 'Chrysler Town & Country', year_start: 2004, year_end: 2007,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 5,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 5-button: Lock, Unlock, Sliding Doors (x2), Panic.',
  },
  // 2008-2016 Town & Country - Fobik 5 button
  {
    model: 'Chrysler Town & Country', year_start: 2008, year_end: 2016,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N5WY783X', ic_number: '7812A-5WY783X',
    battery_type: 'CR2032 (internal)', buttons: 5,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 Hitag2 chip. 5-button: Lock, Unlock, Power Sliding Doors (x2), Panic. PIN required.',
  },
  // 2008-2016 Town & Country - Fobik 6 button
  {
    model: 'Chrysler Town & Country', year_start: 2008, year_end: 2016,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N5WY783X', ic_number: '7812A-5WY783X',
    battery_type: 'CR2032 (internal)', buttons: 6,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 6-button: Lock, Unlock, Power Sliding Doors (x2), Hatch, Panic.',
  },
  // 2008-2016 Town & Country - Fobik 7 button
  {
    model: 'Chrysler Town & Country', year_start: 2008, year_end: 2016,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N5WY783X', ic_number: '7812A-5WY783X',
    battery_type: 'CR2032 (internal)', buttons: 7,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 7-button: Lock, Unlock, Power Sliding Doors (x2), Hatch, Remote Start, Panic.',
  },

  // ===================== CHRYSLER VOYAGER =====================

  // 2020-2024 Voyager - Smart key 6 button
  {
    model: 'Chrysler Voyager', year_start: 2020, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-97395900', ic_number: '7812A-97395900',
    battery_type: 'CR2032', buttons: 6,
    emergency_key_blank: 'Y173', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Proximity smart key. 4A chip. 6-button: Lock, Unlock, Power Sliding Doors (x2), Hatch, Panic. Push-button start. PIN required.',
  },
  // 2020-2024 Voyager - Smart key 7 button
  {
    model: 'Chrysler Voyager', year_start: 2020, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-97395900', ic_number: '7812A-97395900',
    battery_type: 'CR2032', buttons: 7,
    emergency_key_blank: 'Y173', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart key. 4A chip. 7-button: Lock, Unlock, Power Sliding Doors (x2), Hatch, Remote Start, Panic.',
  },
];

// ============================================================
// RAM KEY DATA (2019+ as separate brand; older Rams shared with Dodge)
// ============================================================
const ramKeys = [

  // ===================== RAM 1500 =====================

  // 2002-2008 Ram 1500 (Dodge era) - Transponder
  {
    model: 'Ram 1500', year_start: 2002, year_end: 2004,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Transponder key with 46 chip. PIN code required for programming. Y160 key blade.',
  },
  // 2005-2008 Ram 1500 - Fobik 3 button
  {
    model: 'Ram 1500', year_start: 2005, year_end: 2008,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 Hitag2 chip. 3-button: Lock, Unlock, Panic. PIN required.',
  },
  // 2009-2012 Ram 1500 - Fobik 3 button
  {
    model: 'Ram 1500', year_start: 2009, year_end: 2012,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ-C01C', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 Hitag2 chip. 3-button: Lock, Unlock, Panic. PIN required.',
  },
  // 2009-2012 Ram 1500 - Fobik 4 button
  {
    model: 'Ram 1500', year_start: 2009, year_end: 2012,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ-C01C', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 4,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 4-button: Lock, Unlock, Tailgate, Panic.',
  },
  // 2013-2018 Ram 1500 - Fobik 3 button (GQ4-54T)
  {
    model: 'Ram 1500', year_start: 2013, year_end: 2018,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'GQ4-54T', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 Hitag2 chip. 3-button: Lock, Unlock, Panic. PIN required. Autel IM608/SmartPro.',
  },
  // 2013-2018 Ram 1500 - Fobik 4 button
  {
    model: 'Ram 1500', year_start: 2013, year_end: 2018,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'GQ4-54T', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 4,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 4-button: Lock, Unlock, Remote Start, Panic.',
  },
  // 2013-2018 Ram 1500 - Fobik 5 button
  {
    model: 'Ram 1500', year_start: 2013, year_end: 2018,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'GQ4-54T', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 5,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 5-button: Lock, Unlock, Tailgate, Remote Start, Panic.',
  },
  // 2019-2024 Ram 1500 - Smart key 5 button (OHT-4882056)
  {
    model: 'Ram 1500', year_start: 2019, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'OHT-4882056', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'Y173', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Proximity smart key. Hitag AES 4A chip. 5-button: Lock, Unlock, Tailgate, Remote Start, Panic. Push-button start. PIN required. Autel IM608 or SmartPro.',
  },
  // 2019-2024 Ram 1500 - Smart key 6 button (air suspension)
  {
    model: 'Ram 1500', year_start: 2019, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'OHT-4882056', ic_number: null,
    battery_type: 'CR2032', buttons: 6,
    emergency_key_blank: 'Y173', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Smart key for models with air suspension. 4A chip. 6-button: Lock, Unlock, Tailgate, Remote Start, Air Suspension, Panic.',
  },

  // ===================== RAM 2500 =====================

  // 2003-2009 Ram 2500 - Transponder
  {
    model: 'Ram 2500', year_start: 2003, year_end: 2004,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Transponder key with 46 chip. PIN code required.',
  },
  // 2005-2009 Ram 2500 - Fobik 3 button
  {
    model: 'Ram 2500', year_start: 2005, year_end: 2009,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 3-button: Lock, Unlock, Panic. PIN required.',
  },
  // 2010-2012 Ram 2500 - Fobik 3 button
  {
    model: 'Ram 2500', year_start: 2010, year_end: 2012,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ-C01C', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 3-button: Lock, Unlock, Panic.',
  },
  // 2013-2018 Ram 2500 - Fobik 3 button (GQ4-54T)
  {
    model: 'Ram 2500', year_start: 2013, year_end: 2018,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'GQ4-54T', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 3-button: Lock, Unlock, Panic. PIN required.',
  },
  // 2013-2018 Ram 2500 - Fobik 4 button
  {
    model: 'Ram 2500', year_start: 2013, year_end: 2018,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'GQ4-54T', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 4,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 4-button: Lock, Unlock, Remote Start, Panic.',
  },
  // 2019-2024 Ram 2500 - Smart key 5 button
  {
    model: 'Ram 2500', year_start: 2019, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'OHT-4882056', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'Y173', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Proximity smart key. 4A chip. 5-button: Lock, Unlock, Tailgate, Remote Start, Panic. Push-button start. PIN required. Autel IM608 or SmartPro.',
  },

  // ===================== RAM 3500 =====================

  // 2003-2004 Ram 3500 - Transponder
  {
    model: 'Ram 3500', year_start: 2003, year_end: 2004,
    key_blank: 'Y160-PT', transponder_type: 'Philips 46', chip_type: '46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Transponder key with 46 chip. PIN code required.',
  },
  // 2005-2009 Ram 3500 - Fobik 3 button
  {
    model: 'Ram 3500', year_start: 2005, year_end: 2009,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'OHT692427AA', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 3-button: Lock, Unlock, Panic. PIN required.',
  },
  // 2010-2012 Ram 3500 - Fobik 3 button
  {
    model: 'Ram 3500', year_start: 2010, year_end: 2012,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZ-C01C', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 3-button: Lock, Unlock, Panic.',
  },
  // 2013-2018 Ram 3500 - Fobik 3 button
  {
    model: 'Ram 3500', year_start: 2013, year_end: 2018,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'GQ4-54T', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 3-button: Lock, Unlock, Panic. PIN required.',
  },
  // 2013-2018 Ram 3500 - Fobik 4 button
  {
    model: 'Ram 3500', year_start: 2013, year_end: 2018,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'GQ4-54T', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 4,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 4-button: Lock, Unlock, Remote Start, Panic.',
  },
  // 2019-2024 Ram 3500 - Smart key 5 button
  {
    model: 'Ram 3500', year_start: 2019, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'OHT-4882056', ic_number: null,
    battery_type: 'CR2032', buttons: 5,
    emergency_key_blank: 'Y173', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi CY24',
    image_url: null,
    programming_notes: 'Proximity smart key. 4A chip. 5-button: Lock, Unlock, Tailgate, Remote Start, Panic. Push-button start. PIN required.',
  },

  // ===================== RAM PROMASTER =====================

  // 2014-2018 ProMaster - Fobik 3 button
  {
    model: 'Ram ProMaster', year_start: 2014, year_end: 2018,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'GQ4-54T', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 3,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi SIP22',
    image_url: null,
    programming_notes: 'Fobik key. 46 Hitag2 chip. 3-button: Lock, Unlock, Panic. Fiat Ducato platform. PIN required.',
  },
  // 2014-2018 ProMaster - Fobik 4 button
  {
    model: 'Ram ProMaster', year_start: 2014, year_end: 2018,
    key_blank: null, transponder_type: 'Hitag2', chip_type: '46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'GQ4-54T', ic_number: null,
    battery_type: 'CR2032 (internal)', buttons: 4,
    emergency_key_blank: 'Y164', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi SIP22',
    image_url: null,
    programming_notes: 'Fobik key. 46 chip. 4-button: Lock, Unlock, Sliding Door, Panic. Fiat Ducato platform.',
  },
  // 2019-2024 ProMaster - Smart key 3 button (AES)
  {
    model: 'Ram ProMaster', year_start: 2019, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'LTQF12AM433TX', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi SIP22',
    image_url: null,
    programming_notes: 'Proximity smart key. 4A chip. 3-button: Lock, Unlock, Panic. Fiat Ducato platform. PIN required.',
  },
  // 2019-2024 ProMaster - Smart key 4 button
  {
    model: 'Ram ProMaster', year_start: 2019, year_end: 2024,
    key_blank: null, transponder_type: 'Hitag AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'LTQF12AM433TX', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi SIP22',
    image_url: null,
    programming_notes: 'Smart key. 4A chip. 4-button: Lock, Unlock, Sliding Door, Panic.',
  },

  // ===================== RAM PROMASTER CITY =====================

  // 2015-2022 ProMaster City - Transponder (Fiat Doblo platform)
  {
    model: 'Ram ProMaster City', year_start: 2015, year_end: 2022,
    key_blank: 'SIP22', transponder_type: 'Megamos 48', chip_type: 'Megamos 48',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi SIP22',
    image_url: null,
    programming_notes: 'Fiat Doblo platform. Megamos 48 transponder chip. SIP22 key blade. PIN required for programming. Zedfull or Abrites recommended.',
  },
  // 2015-2022 ProMaster City - Flip key 3 button
  {
    model: 'Ram ProMaster City', year_start: 2015, year_end: 2022,
    key_blank: 'SIP22', transponder_type: 'Megamos 48', chip_type: 'Megamos 48',
    remote_frequency: '433 MHz', key_type: 'transponder',
    fcc_id: 'LTQF12AM433TX', ic_number: null,
    battery_type: 'CR2032', buttons: 3,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi SIP22',
    image_url: null,
    programming_notes: 'Fiat Doblo platform. Megamos 48 chip. Flip remote key. 3-button: Lock, Unlock, Panic. PIN required.',
  },
  // 2015-2022 ProMaster City - Flip key 4 button
  {
    model: 'Ram ProMaster City', year_start: 2015, year_end: 2022,
    key_blank: 'SIP22', transponder_type: 'Megamos 48', chip_type: 'Megamos 48',
    remote_frequency: '433 MHz', key_type: 'transponder',
    fcc_id: 'LTQF12AM433TX', ic_number: null,
    battery_type: 'CR2032', buttons: 4,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi SIP22',
    image_url: null,
    programming_notes: 'Fiat Doblo platform. Megamos 48 chip. 4-button: Lock, Unlock, Sliding Door, Panic.',
  },
];

// ============================================================
// INSERT LOGIC
// ============================================================
async function run() {
  await client.connect();
  console.log('Connected to database.');

  try {
    await client.query('BEGIN');

    // Get valid year_ids for each manufacturer
    const gmcYearRes = await client.query(
      `SELECT vy.id FROM vehicle_years vy
       JOIN vehicle_models vm ON vy.model_id = vm.id
       JOIN manufacturers m ON vm.manufacturer_id = m.id
       WHERE m.id = $1 LIMIT 1`, [GMC_ID]
    );
    const chryslerYearRes = await client.query(
      `SELECT vy.id FROM vehicle_years vy
       JOIN vehicle_models vm ON vy.model_id = vm.id
       JOIN manufacturers m ON vm.manufacturer_id = m.id
       WHERE m.id = $1 LIMIT 1`, [CHRYSLER_ID]
    );
    const ramYearRes = await client.query(
      `SELECT vy.id FROM vehicle_years vy
       JOIN vehicle_models vm ON vy.model_id = vm.id
       JOIN manufacturers m ON vm.manufacturer_id = m.id
       WHERE m.id = $1 LIMIT 1`, [RAM_ID]
    );

    // Fallback: if no year_id found for a manufacturer, grab any year_id
    const fallbackRes = await client.query('SELECT id FROM vehicle_years LIMIT 1');
    const fallbackYearId = fallbackRes.rows[0].id;

    const gmcYearId = gmcYearRes.rows.length > 0 ? gmcYearRes.rows[0].id : fallbackYearId;
    const chryslerYearId = chryslerYearRes.rows.length > 0 ? chryslerYearRes.rows[0].id : fallbackYearId;
    const ramYearId = ramYearRes.rows.length > 0 ? ramYearRes.rows[0].id : fallbackYearId;

    console.log(`GMC year_id: ${gmcYearId}`);
    console.log(`Chrysler year_id: ${chryslerYearId}`);
    console.log(`Ram year_id: ${ramYearId}`);

    // Delete existing rows
    const d1 = await client.query('DELETE FROM automotive_keys WHERE manufacturer_id = $1', [GMC_ID]);
    console.log(`Deleted ${d1.rowCount} GMC rows.`);
    const d2 = await client.query('DELETE FROM automotive_keys WHERE manufacturer_id = $1', [CHRYSLER_ID]);
    console.log(`Deleted ${d2.rowCount} Chrysler rows.`);
    const d3 = await client.query('DELETE FROM automotive_keys WHERE manufacturer_id = $1', [RAM_ID]);
    console.log(`Deleted ${d3.rowCount} Ram rows.`);

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

    // Helper: resolve key_blank - if null, use emergency_key_blank as fallback
    function resolveKeyBlank(k) {
      if (k.key_blank) return k.key_blank;
      if (k.emergency_key_blank) return k.emergency_key_blank;
      // Last resort: derive from lishi_tool
      if (k.lishi_tool && k.lishi_tool.includes('HU100')) return 'HU100';
      if (k.lishi_tool && k.lishi_tool.includes('CY24')) return 'CY24';
      if (k.lishi_tool && k.lishi_tool.includes('SIP22')) return 'SIP22';
      return 'N/A';
    }

    async function insertBatch(keys, mfrId, yearId, label) {
      let count = 0;
      for (const k of keys) {
        await client.query(insertSQL, [
          yearId, mfrId, k.model, k.year_start, k.year_end,
          resolveKeyBlank(k), k.transponder_type, k.chip_type,
          k.remote_frequency, k.key_type, k.fcc_id, k.ic_number,
          k.battery_type, k.buttons !== null ? String(k.buttons) : null, k.emergency_key_blank, k.test_key_blank,
          k.obd_programmable, k.pin_code_required, k.lishi_tool,
          k.image_url, k.programming_notes,
        ]);
        count++;
      }
      console.log(`Inserted ${count} ${label} rows.`);
      return count;
    }

    const gmcCount = await insertBatch(gmcKeys, GMC_ID, gmcYearId, 'GMC');
    const chryslerCount = await insertBatch(chryslerKeys, CHRYSLER_ID, chryslerYearId, 'Chrysler');
    const ramCount = await insertBatch(ramKeys, RAM_ID, ramYearId, 'Ram');

    await client.query('COMMIT');
    console.log('Transaction committed successfully.');

    // Verify
    const v1 = await client.query('SELECT count(*) FROM automotive_keys WHERE manufacturer_id = $1', [GMC_ID]);
    const v2 = await client.query('SELECT count(*) FROM automotive_keys WHERE manufacturer_id = $1', [CHRYSLER_ID]);
    const v3 = await client.query('SELECT count(*) FROM automotive_keys WHERE manufacturer_id = $1', [RAM_ID]);
    console.log(`\nVerification counts:`);
    console.log(`  GMC:      ${v1.rows[0].count} rows`);
    console.log(`  Chrysler: ${v2.rows[0].count} rows`);
    console.log(`  Ram:      ${v3.rows[0].count} rows`);
    console.log(`  TOTAL:    ${Number(v1.rows[0].count) + Number(v2.rows[0].count) + Number(v3.rows[0].count)} rows`);

    // Print summary of models
    const summary = await client.query(`
      SELECT model_name, count(*) as variants, min(year_start) as from_year, max(year_end) as to_year
      FROM automotive_keys
      WHERE manufacturer_id IN ($1, $2, $3)
      GROUP BY model_name
      ORDER BY model_name
    `, [GMC_ID, CHRYSLER_ID, RAM_ID]);
    console.log('\nModel summary:');
    for (const row of summary.rows) {
      console.log(`  ${row.model_name}: ${row.variants} variants (${row.from_year}-${row.to_year})`);
    }

  } catch (err) {
    await client.query('ROLLBACK');
    console.error('Error, rolled back:', err.message);
  } finally {
    await client.end();
  }
}

run();
