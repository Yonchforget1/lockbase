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

const DODGE = 'b864cdbb-444f-4ff9-b54d-4b66888a5b64';

// Helper to generate rows from compact specs
// fmt: [model, ys, ye, key_blank, chip, transponder, freq, key_type, fcc, btns, batt, emg_blank, obd, pin, lishi, notes, ic]
function r(model, ys, ye, kb, chip, tp, freq, kt, fcc, btns, batt, emg, obd, pin, lishi, notes, ic) {
  return { model, ys, ye, kb, chip, tp, freq, kt, fcc, btns, batt, emg, obd, pin, lishi, notes, ic };
}

const keys = [
  // ===== AVENGER 2008-2014 =====
  r('Avenger', 2008, 2014, 'Y160-PT', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'OHT692427AA', '4', 'CR2032', null, true, false, 'Lishi CY24',
    'Remote head key. 4-button: Lock, Unlock, Trunk, Panic. OBD programmable with 2 working keys or dealer tool. 46 chip on-board relearn.', '3521A-692427'),

  // ===== CALIBER 2007-2012 =====
  r('Caliber', 2007, 2012, 'Y160-PT', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'OHT692427AA', '4', 'CR2032', null, true, false, 'Lishi CY24',
    'Remote head key. 4-button: Lock, Unlock, Hatch, Panic. Same platform as Jeep Compass/Patriot. OBD programmable.', '3521A-692427'),

  // ===== CHALLENGER 2008-2014 FOBIK =====
  r('Challenger', 2008, 2014, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '3', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 3-button: Lock, Unlock, Trunk. Requires WIT (Wireless Ignition Transponder) module programming via OBD. CY24 emergency blade.', '3521A-C01C'),
  r('Challenger', 2008, 2014, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Trunk, Remote Start. 46 chip, OBD programmable.', '3521A-C01C'),
  // 2015-2019 Challenger - smart fobik
  r('Challenger', 2015, 2019, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'smart_key',
    'GQ4-54T', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Smart key fobik. 4-button: Lock, Unlock, Trunk, Panic. Push-button start. 433 MHz. GQ4-54T. OBD programmable with Autel/OBDSTAR.', '7812A-54T'),
  r('Challenger', 2015, 2019, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'smart_key',
    'GQ4-54T', '5', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Smart key fobik. 5-button: Lock, Unlock, Trunk, Remote Start, Panic. Push-button start. 433 MHz.', '7812A-54T'),
  // 2020-2025 Challenger - 4A chip
  r('Challenger', 2020, 2025, 'CY24', '4A', 'NXP NCF29A1M (4A)', '433 MHz', 'smart_key',
    'M3N-40821302', '5', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Smart key. 4A (NCF29A1M) chip. 5-button: Lock, Unlock, Trunk, Remote Start, Panic. Push-button start. Requires Autel/OBDSTAR with 4A support.', '7812D-40821302'),

  // ===== CHARGER 2006-2010 FOBIK =====
  r('Charger', 2006, 2010, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '3', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 3-button: Lock, Unlock, Trunk. 46 chip. OBD programmable via WIT module.', '3521A-C01C'),
  r('Charger', 2006, 2010, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Trunk, Remote Start. 46 chip. OBD programmable.', '3521A-C01C'),
  // 2011-2014 Charger fobik
  r('Charger', 2011, 2014, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'transponder',
    'M3N5WY783X', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Trunk, Panic. Switched to 433 MHz. OBD programmable.', '3521A-5WY783X'),
  r('Charger', 2011, 2014, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'transponder',
    'M3N5WY783X', '5', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 5-button: Lock, Unlock, Trunk, Remote Start, Panic. 433 MHz. OBD programmable.', '3521A-5WY783X'),
  // 2015-2019 Charger smart key
  r('Charger', 2015, 2019, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'smart_key',
    'GQ4-54T', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Smart key fobik. 4-button: Lock, Unlock, Trunk, Panic. Push-button start. GQ4-54T.', '7812A-54T'),
  r('Charger', 2015, 2019, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'smart_key',
    'GQ4-54T', '5', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Smart key fobik. 5-button: Lock, Unlock, Trunk, Remote Start, Panic. Push-button start. GQ4-54T. OBD programmable.', '7812A-54T'),
  // 2020-2025 Charger 4A chip
  r('Charger', 2020, 2025, 'CY24', '4A', 'NXP NCF29A1M (4A)', '433 MHz', 'smart_key',
    'M3N-40821302', '5', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Smart key. 4A chip. 5-button: Lock, Unlock, Trunk, Remote Start, Panic. Push-button start. Requires 4A-capable programmer.', '7812D-40821302'),

  // ===== DAKOTA 2005-2007 =====
  r('Dakota', 2005, 2007, 'Y160-PT', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'OHT692427AA', '3', 'CR2032', null, true, false, 'Lishi CY24',
    'Remote head key. 3-button: Lock, Unlock, Panic. 46 chip. OBD programmable.', '3521A-692427'),
  // 2008-2011 Dakota
  r('Dakota', 2008, 2011, 'Y160-PT', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'OHT692427AA', '4', 'CR2032', null, true, false, 'Lishi CY24',
    'Remote head key. 4-button: Lock, Unlock, Remote Start, Panic. 46 chip. OBD programmable.', '3521A-692427'),

  // ===== DART 2013-2014 FLIP KEY =====
  r('Dart', 2013, 2014, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'OHT05176014', '4', 'CR2032', null, true, false, 'Lishi CY24',
    'Flip remote key. 4-button: Lock, Unlock, Trunk, Panic. 46 chip. CY24 blade.', null),
  // 2015-2016 Dart smart key
  r('Dart', 2015, 2016, 'CY24', '4A', 'NXP NCF29A1M (4A)', '433 MHz', 'smart_key',
    'M3N-40821302', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Smart key. 4A chip. 4-button: Lock, Unlock, Trunk, Panic. Push-button start. Requires 4A-capable programmer.', '7812D-40821302'),

  // ===== DURANGO 2004-2009 REMOTE HEAD KEY =====
  r('Durango', 2004, 2009, 'Y160-PT', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'OHT692427AA', '3', 'CR2032', null, true, false, 'Lishi CY24',
    'Remote head key. 3-button: Lock, Unlock, Panic. 46 chip. OBD programmable.', '3521A-692427'),
  r('Durango', 2004, 2009, 'Y160-PT', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'OHT692427AA', '4', 'CR2032', null, true, false, 'Lishi CY24',
    'Remote head key. 4-button: Lock, Unlock, Hatch, Panic. 46 chip. OBD programmable.', '3521A-692427'),
  // 2011-2013 Durango fobik
  r('Durango', 2011, 2013, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'transponder',
    'IYZ-C01C', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Hatch, Panic. 433 MHz. OBD programmable.', '3521A-C01C'),
  r('Durango', 2011, 2013, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'transponder',
    'IYZ-C01C', '5', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 5-button: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. OBD programmable.', '3521A-C01C'),
  // 2014-2020 Durango smart key
  r('Durango', 2014, 2020, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'smart_key',
    'GQ4-54T', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Smart key fobik. 4-button: Lock, Unlock, Hatch, Panic. Push-button start. GQ4-54T.', '7812A-54T'),
  r('Durango', 2014, 2020, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'smart_key',
    'GQ4-54T', '5', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Smart key fobik. 5-button: Lock, Unlock, Hatch, Remote Start, Panic. Push-button start. GQ4-54T.', '7812A-54T'),
  // 2021-2025 Durango 4A
  r('Durango', 2021, 2025, 'CY24', '4A', 'NXP NCF29A1M (4A)', '433 MHz', 'smart_key',
    'M3N-40821302', '5', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Smart key. 4A chip. 5-button: Lock, Unlock, Hatch, Remote Start, Panic. Push-button start. Requires 4A-capable programmer.', '7812D-40821302'),

  // ===== GRAND CARAVAN 2001-2007 TRANSPONDER =====
  r('Grand Caravan', 2001, 2003, 'Y170-PT', '4C', 'Texas Instruments 4C', null, 'transponder',
    null, null, null, null, true, true, 'Lishi CY24',
    'Transponder key only (no remote integrated). 4C chip. PIN code required for programming. No remote buttons.', null),
  r('Grand Caravan', 2004, 2007, 'Y170-PT', '46', 'Philips 46 (PCF7941)', null, 'transponder',
    null, null, null, null, true, false, 'Lishi CY24',
    'Transponder key only. 46 chip (upgraded from 4C in 2004). OBD programmable. No remote integrated.', null),
  // 2008-2020 Grand Caravan fobik variants
  r('Grand Caravan', 2008, 2020, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '3', 'CR2032', 'Y170', true, false, 'Lishi CY24',
    'Fobik key. 3-button: Lock, Unlock, Panic. 315 MHz. OBD programmable.', '3521A-C01C'),
  r('Grand Caravan', 2008, 2020, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '4', 'CR2032', 'Y170', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Rear Hatch, Panic. 315 MHz. OBD programmable.', '3521A-C01C'),
  r('Grand Caravan', 2008, 2020, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '5', 'CR2032', 'Y170', true, false, 'Lishi CY24',
    'Fobik key. 5-button: Lock, Unlock, Rear Hatch, Power Doors, Panic. 315 MHz. OBD programmable.', '3521A-C01C'),
  r('Grand Caravan', 2008, 2020, 'CY24', '46', 'Philips 46 (PCF7941)', '434 MHz', 'transponder',
    'IYZ-C01C', '6', 'CR2032', 'Y170', true, false, 'Lishi CY24',
    'Fobik key. 6-button: Lock, Unlock, Rear Hatch, Left Slide, Right Slide, Panic. 434 MHz. OBD programmable.', '3521A-C01C'),
  r('Grand Caravan', 2008, 2020, 'CY24', '46', 'Philips 46 (PCF7941)', '434 MHz', 'transponder',
    'IYZ-C01C', '7', 'CR2032', 'Y170', true, false, 'Lishi CY24',
    'Fobik key. 7-button: Lock, Unlock, Rear Hatch, Left Slide, Right Slide, Remote Start, Panic. 434 MHz. OBD programmable.', '3521A-C01C'),

  // ===== HORNET 2023-2025 =====
  r('Hornet', 2023, 2025, 'CY24', '4A', 'NXP NCF29A1M (4A)', '433 MHz', 'smart_key',
    'M3N-40821302', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Smart key. 4A chip. 4-button: Lock, Unlock, Hatch, Panic. Push-button start. Shared Alfa Romeo Tonale platform. Requires 4A-capable programmer.', '7812D-40821302'),

  // ===== JOURNEY 2009-2010 =====
  r('Journey', 2009, 2010, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '3', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 3-button: Lock, Unlock, Panic. 46 chip. 315 MHz. OBD programmable.', '3521A-C01C'),
  r('Journey', 2009, 2010, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Hatch, Panic. 46 chip. 315 MHz. OBD programmable.', '3521A-C01C'),
  // 2011-2020 Journey
  r('Journey', 2011, 2020, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'transponder',
    'M3N5WY783X', '3', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 3-button: Lock, Unlock, Panic. 433 MHz. OBD programmable.', '3521A-5WY783X'),
  r('Journey', 2011, 2020, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'transponder',
    'M3N5WY783X', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Hatch, Panic. 433 MHz. OBD programmable.', '3521A-5WY783X'),
  r('Journey', 2011, 2020, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'transponder',
    'M3N5WY783X', '5', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 5-button: Lock, Unlock, Hatch, Remote Start, Panic. 433 MHz. OBD programmable.', '3521A-5WY783X'),

  // ===== MAGNUM 2005-2008 =====
  r('Magnum', 2005, 2008, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '3', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 3-button: Lock, Unlock, Trunk. 46 chip. First gen fobik. OBD programmable via WIT module.', '3521A-C01C'),
  r('Magnum', 2005, 2008, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Trunk, Remote Start. 46 chip. OBD programmable.', '3521A-C01C'),

  // ===== NEON 2000-2005 =====
  r('Neon', 2000, 2005, 'Y159-PT', '4D-64', 'Texas Instruments 4D-64', null, 'transponder',
    null, null, null, null, true, true, 'Lishi Y159',
    'Transponder key only. 4D-64 chip. PIN code required from dealer or extracted with Abrites/AVDI. No integrated remote. Y159 blade.', null),

  // ===== NITRO 2007-2011 =====
  r('Nitro', 2007, 2011, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '3', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 3-button: Lock, Unlock, Panic. 46 chip. OBD programmable.', '3521A-C01C'),
  r('Nitro', 2007, 2011, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Hatch, Panic. 46 chip. OBD programmable.', '3521A-C01C'),

  // ===== RAM 1500 2011-2018 =====
  r('Ram 1500', 2011, 2012, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '3', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 3-button: Lock, Unlock, Panic. 46 chip. 315 MHz. OBD programmable.', '3521A-C01C'),
  r('Ram 1500', 2011, 2012, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Remote Start, Panic. 46 chip. OBD programmable.', '3521A-C01C'),
  r('Ram 1500', 2013, 2018, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'transponder',
    'GQ4-53T', '3', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 3-button: Lock, Unlock, Panic. 433 MHz. GQ4-53T. OBD programmable.', '7812A-53T'),
  r('Ram 1500', 2013, 2018, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'transponder',
    'GQ4-53T', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Remote Start, Panic. 433 MHz. OBD programmable.', '7812A-53T'),

  // ===== RAM 2500 2010-2018 =====
  r('Ram 2500', 2010, 2012, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '3', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 3-button: Lock, Unlock, Panic. 46 chip. OBD programmable.', '3521A-C01C'),
  r('Ram 2500', 2010, 2012, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Remote Start, Panic. 46 chip. OBD programmable.', '3521A-C01C'),
  r('Ram 2500', 2013, 2018, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'transponder',
    'GQ4-53T', '3', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 3-button: Lock, Unlock, Panic. 433 MHz. OBD programmable.', '7812A-53T'),
  r('Ram 2500', 2013, 2018, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'transponder',
    'GQ4-53T', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Remote Start, Panic. 433 MHz. OBD programmable.', '7812A-53T'),

  // ===== RAM 3500 2010-2018 =====
  r('Ram 3500', 2010, 2012, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '3', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 3-button: Lock, Unlock, Panic. 46 chip. OBD programmable.', '3521A-C01C'),
  r('Ram 3500', 2010, 2012, 'CY24', '46', 'Philips 46 (PCF7941)', '315 MHz', 'transponder',
    'IYZ-C01C', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Remote Start, Panic. 46 chip. OBD programmable.', '3521A-C01C'),
  r('Ram 3500', 2013, 2018, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'transponder',
    'GQ4-53T', '3', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 3-button: Lock, Unlock, Panic. 433 MHz. OBD programmable.', '7812A-53T'),
  r('Ram 3500', 2013, 2018, 'CY24', '46', 'Philips 46 (PCF7941)', '433 MHz', 'transponder',
    'GQ4-53T', '4', 'CR2032', 'Y160', true, false, 'Lishi CY24',
    'Fobik key. 4-button: Lock, Unlock, Remote Start, Panic. 433 MHz. OBD programmable.', '7812A-53T'),

  // ===== STRATUS 2001-2006 =====
  r('Stratus', 2001, 2006, 'Y160-PT', '4D-64', 'Texas Instruments 4D-64', null, 'transponder',
    null, null, null, null, true, true, 'Lishi Y159',
    'Transponder key only. 4D-64 chip. PIN code required. Same key system as Neon. Y160 blade with transponder.', null),

  // ===== VIPER 2003-2010 =====
  r('Viper', 2003, 2010, 'Y164-PT', '46', 'Philips 46 (PCF7941)', null, 'transponder',
    null, null, null, null, true, false, 'Lishi CY24',
    'Transponder key only. 46 chip. Specialty vehicle - limited aftermarket support. Y164 blade. OBD programmable with Chrysler tool.', null),
];

// ============================================================
// INSERT LOGIC
// ============================================================
async function run() {
  await client.connect();
  console.log('Connected.');

  try {
    await client.query('BEGIN');

    // Create missing vehicle_models for Dodge
    const existingModels = await client.query(
      `SELECT name, id FROM vehicle_models WHERE manufacturer_id = $1`, [DODGE]
    );
    const modelMap = {};
    for (const row of existingModels.rows) modelMap[row.name] = row.id;

    // Models we need
    const neededModels = [...new Set(keys.map(k => k.model))];
    for (const name of neededModels) {
      if (!modelMap[name]) {
        const slug = name.toLowerCase().replace(/\s+/g, '-');
        const res = await client.query(
          `INSERT INTO vehicle_models (id, manufacturer_id, name, slug) VALUES (gen_random_uuid(), $1, $2, $3) RETURNING id`,
          [DODGE, name, slug]
        );
        modelMap[name] = res.rows[0].id;
        console.log(`Created model: ${name} -> ${modelMap[name]}`);
      }
    }

    // Ensure vehicle_years exist for all year ranges we need
    const existingYears = await client.query(
      `SELECT vy.id, vm.name, vy.year_start, vy.year_end
       FROM vehicle_years vy JOIN vehicle_models vm ON vy.model_id = vm.id
       WHERE vm.manufacturer_id = $1`, [DODGE]
    );
    // Build lookup: "model|ys|ye" -> year_id
    const yearMap = {};
    for (const row of existingYears.rows) {
      yearMap[`${row.name}|${row.year_start}|${row.year_end}`] = row.id;
    }

    // For each key entry, find or create a matching vehicle_year
    // We need a year_id that encompasses each key's year range
    async function getYearId(model, ys, ye) {
      // First try exact match
      const exactKey = `${model}|${ys}|${ye}`;
      if (yearMap[exactKey]) return yearMap[exactKey];

      // Try any overlapping year range for this model
      for (const key in yearMap) {
        const [m, s, e] = key.split('|');
        if (m === model && Number(s) <= ys && Number(e) >= ye) return yearMap[key];
      }
      // Try partial overlap
      for (const key in yearMap) {
        const [m, s, e] = key.split('|');
        if (m === model && Number(s) <= ye && Number(e) >= ys) return yearMap[key];
      }

      // Create new vehicle_year
      const modelId = modelMap[model];
      const res = await client.query(
        `INSERT INTO vehicle_years (id, model_id, year_start, year_end) VALUES (gen_random_uuid(), $1, $2, $3) RETURNING id`,
        [modelId, ys, ye]
      );
      const newId = res.rows[0].id;
      yearMap[`${model}|${ys}|${ye}`] = newId;
      console.log(`Created vehicle_year: ${model} ${ys}-${ye} -> ${newId}`);
      return newId;
    }

    // Delete existing Dodge automotive_keys
    const del = await client.query('DELETE FROM automotive_keys WHERE manufacturer_id = $1', [DODGE]);
    console.log(`Deleted ${del.rowCount} existing Dodge rows.`);

    // Insert all keys
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
      )`;

    let count = 0;
    for (const k of keys) {
      const yearId = await getYearId(k.model, k.ys, k.ye);
      await client.query(insertSQL, [
        yearId, DODGE, k.model, k.ys, k.ye,
        k.kb, k.tp, k.chip,
        k.freq, k.kt, k.fcc, k.ic,
        k.batt, k.btns, k.emg, null,
        k.obd, k.pin, k.lishi,
        null, k.notes,
      ]);
      count++;
    }
    console.log(`Inserted ${count} Dodge rows.`);

    await client.query('COMMIT');
    console.log('Transaction committed.');

    // Verify
    const v = await client.query(
      `SELECT model_name, count(*) as variants, min(year_start) as from_yr, max(year_end) as to_yr
       FROM automotive_keys WHERE manufacturer_id = $1
       GROUP BY model_name ORDER BY model_name`, [DODGE]
    );
    console.log('\nVerification:');
    let total = 0;
    for (const row of v.rows) {
      console.log(`  ${row.model_name}: ${row.variants} variants (${row.from_yr}-${row.to_yr})`);
      total += Number(row.variants);
    }
    console.log(`  TOTAL: ${total} rows`);

  } catch (e) {
    await client.query('ROLLBACK');
    console.error('ROLLBACK:', e.message);
    throw e;
  } finally {
    await client.end();
  }
}

run();
