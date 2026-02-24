-- MASTER SEED PART3b
-- Run in order: PART1 -> PART2 -> PART3a -> PART3b -> PART4

-- Part 4: Update keys for manufacturers P-Z
-- (Porsche, RAM/Ram, Subaru, Tesla, Toyota, Volkswagen, Volvo)
-- ============================================================

-- ============================================================
-- PORSCHE
-- ============================================================

-- Porsche 911 2012-2019 (smart_key, KR55WK50138, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK50138',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Frunk',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Porsche 911%' AND year_start = 2012 AND year_end = 2019;

-- Porsche 911 2020-2024 (smart_key, IYZPK3, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZPK3',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Frunk',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Porsche 911%' AND year_start = 2020 AND year_end = 2024;

-- Porsche Cayenne 2011-2018 (smart_key, KR55WK50138, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK50138',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Frunk',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Porsche Cayenne%' AND year_start = 2011 AND year_end = 2018;

-- Porsche Cayenne 2019-2024 (smart_key, IYZPK3, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZPK3',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Frunk',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Porsche Cayenne%' AND year_start = 2019 AND year_end = 2024;

-- Porsche Macan 2015-2024 (smart_key, IYZPK3, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZPK3',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Porsche Macan%' AND year_start = 2015 AND year_end = 2024;

-- Porsche Panamera 2010-2016 (smart_key, KR55WK50138, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK50138',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Porsche Panamera%' AND year_start = 2010 AND year_end = 2016;

-- Porsche Panamera 2017-2024 (smart_key, IYZPK3, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZPK3',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Porsche Panamera%' AND year_start = 2017 AND year_end = 2024;

-- Porsche Taycan 2020-2024 (smart_key, IYZPK3, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZPK3',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Frunk, Charge Port',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Porsche Taycan%' AND year_start = 2020 AND year_end = 2024;

-- ============================================================
-- RAM / Ram
-- ============================================================

-- RAM 1500 2002-2008 (transponder, GQ43VT17T)
UPDATE public.automotive_keys SET
  fcc_id = 'GQ43VT17T',
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'RAM 1500' AND year_start = 2002 AND year_end = 2008;

-- Ram 1500 2009-2012 (FOBIK, IYZ-C01C)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZ-C01C',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'Y164',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Ram 1500' AND year_start = 2009 AND year_end = 2012;

-- Ram 1500 2013-2018 (proximity, GQ4-54T)
UPDATE public.automotive_keys SET
  fcc_id = 'GQ4-54T',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
  emergency_key_blank = 'Y164-PT',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Ram 1500' AND year_start = 2013 AND year_end = 2018;

-- Ram 1500 2019-2024 (proximity, OHT-4882056)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT-4882056',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
  emergency_key_blank = 'Y170',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Ram 1500' AND year_start = 2019 AND year_end = 2024;

-- RAM 2500 2003-2009 (transponder, GQ43VT17T)
UPDATE public.automotive_keys SET
  fcc_id = 'GQ43VT17T',
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'RAM 2500' AND year_start = 2003 AND year_end = 2009;

-- Ram 2500 2010-2018 (FOBIK, GQ4-54T) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = 'GQ4-54T',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'Y164',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Ram 2500' AND year_start = 2010 AND year_end = 2018;

-- Ram 2500 2019-2024 (proximity, OHT-4882056) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = 'OHT-4882056',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'Y170',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Ram 2500' AND year_start = 2019 AND year_end = 2024;

-- RAM 3500 2003-2009 (transponder, GQ43VT17T)
UPDATE public.automotive_keys SET
  fcc_id = 'GQ43VT17T',
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'RAM 3500' AND year_start = 2003 AND year_end = 2009;

-- Ram 3500 2010-2018 (FOBIK, GQ4-54T) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = 'GQ4-54T',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'Y164',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Ram 3500' AND year_start = 2010 AND year_end = 2018;

-- Ram 3500 2019-2024 (proximity, OHT-4882056) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = 'OHT-4882056',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'Y170',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Ram 3500' AND year_start = 2019 AND year_end = 2024;

-- Ram ProMaster 2014-2024 (remote head transponder, LTQF12AM433TX) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = 'LTQF12AM433TX',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Sliding Doors',
  emergency_key_blank = 'SIP22',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Ram ProMaster' AND year_start = 2014 AND year_end = 2024;

-- ============================================================
-- SUBARU
-- ============================================================

-- Subaru Ascent 2019-2024 (smart_key, HYQ14AHK)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHK',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Ascent' AND year_start = 2019 AND year_end = 2024;

-- Subaru BRZ 2013-2020 (remote head transponder, HYQ14AHC) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHC',
  ic_number = NULL,
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru BRZ' AND year_start = 2013 AND year_end = 2020;

-- Subaru BRZ 2022-2024 (smart_key, HYQ14AHK) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHK',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru BRZ' AND year_start = 2022 AND year_end = 2024;

-- Subaru Baja 2003-2006 (transponder, SUB82) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'SUB82',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Baja' AND year_start = 2003 AND year_end = 2006;

-- Subaru Crosstrek 2013-2017 (smart_key, HYQ14AHC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHC',
  ic_number = NULL,
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Crosstrek' AND year_start = 2013 AND year_end = 2017;

-- Subaru Crosstrek 2018-2024 (smart_key, HYQ14AHK)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHK',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Crosstrek' AND year_start = 2018 AND year_end = 2024;

-- Subaru Forester 1998-2004 (transponder, SUB82)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'SUB82',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Forester' AND year_start = 1998 AND year_end = 2004;

-- Subaru Forester 2005-2008 (transponder, SUB82)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'SUB82',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Forester' AND year_start = 2005 AND year_end = 2008;

-- Subaru Forester 2009-2013 (remote head transponder, CWTWB1U811)
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U811',
  ic_number = NULL,
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Forester' AND year_start = 2009 AND year_end = 2013;

-- Subaru Forester 2014-2018 (smart_key, HYQ14AHC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHC',
  ic_number = NULL,
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Forester' AND year_start = 2014 AND year_end = 2018;

-- Subaru Forester 2019-2024 (smart_key, HYQ14AHK)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHK',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Forester' AND year_start = 2019 AND year_end = 2024;

-- Subaru Impreza 1998-2004 (transponder, SUB82)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'SUB82',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Impreza' AND year_start = 1998 AND year_end = 2004;

-- Subaru Impreza 2005-2011 (transponder, SUB82)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'SUB82',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Impreza' AND year_start = 2005 AND year_end = 2011;

-- Subaru Impreza 2012-2016 (smart_key, HYQ14AHC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHC',
  ic_number = NULL,
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Impreza' AND year_start = 2012 AND year_end = 2016;

-- Subaru Impreza 2017-2024 (smart_key, HYQ14AHK)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHK',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Impreza' AND year_start = 2017 AND year_end = 2024;

-- Subaru Legacy 2000-2004 (transponder, SUB82)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'SUB82',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Legacy' AND year_start = 2000 AND year_end = 2004;

-- Subaru Legacy 2005-2009 (transponder, SUB82)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'SUB82',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Legacy' AND year_start = 2005 AND year_end = 2009;

-- Subaru Legacy 2010-2014 (remote head transponder, CWTWB1U811)
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U811',
  ic_number = NULL,
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Legacy' AND year_start = 2010 AND year_end = 2014;

-- Subaru Legacy 2015-2019 (smart_key, HYQ14AHC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHC',
  ic_number = NULL,
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Legacy' AND year_start = 2015 AND year_end = 2019;

-- Subaru Legacy 2020-2024 (smart_key, HYQ14AHK)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHK',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Legacy' AND year_start = 2020 AND year_end = 2024;

-- Subaru Outback 2000-2004 (transponder, SUB82)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'SUB82',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Outback' AND year_start = 2000 AND year_end = 2004;

-- Subaru Outback 2005-2009 (transponder, SUB82)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'SUB82',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Outback' AND year_start = 2005 AND year_end = 2009;

-- Subaru Outback 2010-2014 (smart_key, HYQ14AHC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHC',
  ic_number = NULL,
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Outback' AND year_start = 2010 AND year_end = 2014;

-- Subaru Outback 2015-2019 (smart_key, HYQ14AHC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHC',
  ic_number = NULL,
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Outback' AND year_start = 2015 AND year_end = 2019;

-- Subaru Outback 2020-2024 (smart_key, HYQ14AHK)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHK',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Outback' AND year_start = 2020 AND year_end = 2024;

-- Subaru Solterra 2023-2024 (smart_key, HYQ14FBX) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBX',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Solterra' AND year_start = 2023 AND year_end = 2024;

-- Subaru Tribeca 2006-2014 (remote head transponder, CWTWB1U811) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U811',
  ic_number = NULL,
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru Tribeca' AND year_start = 2006 AND year_end = 2014;

-- Subaru WRX 2002-2007 (transponder, SUB82)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'SUB82',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru WRX' AND year_start = 2002 AND year_end = 2007;

-- Subaru WRX 2008-2014 (remote head transponder, CWTWB1U811)
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U811',
  ic_number = NULL,
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru WRX' AND year_start = 2008 AND year_end = 2014;

-- Subaru WRX 2015-2021 (smart_key, HYQ14AHC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHC',
  ic_number = NULL,
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru WRX' AND year_start = 2015 AND year_end = 2021;

-- Subaru WRX 2022-2024 (smart_key, HYQ14AHK)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHK',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Subaru WRX' AND year_start = 2022 AND year_end = 2024;

-- ============================================================
-- TESLA
-- ============================================================

-- Tesla Model 3 2018-2024 (smart_key, phone/card based)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = 'CR2032 (optional fob)',
  buttons = 'Lock, Unlock, Frunk, Trunk (via app/card)',
  emergency_key_blank = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Tesla Model 3' AND year_start = 2018 AND year_end = 2024;

-- Tesla Model S 2012-2020 (smart_key, 1032523-00-A)
UPDATE public.automotive_keys SET
  fcc_id = '1032523-00-A',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Frunk, Trunk',
  emergency_key_blank = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Tesla Model S%' AND year_start = 2012 AND year_end = 2020;

-- Tesla Model S 2021-2024 (smart_key, phone/card based)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = 'CR2032 (optional fob)',
  buttons = 'Lock, Unlock, Frunk, Trunk (via app/card)',
  emergency_key_blank = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Tesla Model S%' AND year_start = 2021 AND year_end = 2024;

-- Tesla Model X 2016-2020 (smart_key, 1032523-00-A)
UPDATE public.automotive_keys SET
  fcc_id = '1032523-00-A',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Frunk, Falcon Doors',
  emergency_key_blank = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Tesla Model X%' AND year_start = 2016 AND year_end = 2020;

-- Tesla Model X 2021-2024 (smart_key, phone/card based)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = 'CR2032 (optional fob)',
  buttons = 'Lock, Unlock, Frunk, Falcon Doors (via app/card)',
  emergency_key_blank = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Tesla Model X%' AND year_start = 2021 AND year_end = 2024;

-- Tesla Model Y 2020-2024 (smart_key, phone/card based)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = 'CR2032 (optional fob)',
  buttons = 'Lock, Unlock, Frunk, Trunk (via app/card)',
  emergency_key_blank = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Tesla Model Y' AND year_start = 2020 AND year_end = 2024;

-- ============================================================
-- TOYOTA
-- ============================================================

-- Toyota 4Runner 1996-2002 (transponder, TOY43)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota 4Runner' AND year_start = 1996 AND year_end = 2002;

-- Toyota 4Runner 2003-2009 (transponder, TOY44D-PT)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota 4Runner' AND year_start = 2003 AND year_end = 2009;

-- Toyota 4Runner 2010-2019 (smart_key, HYQ14ACX)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14ACX',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota 4Runner' AND year_start = 2010 AND year_end = 2019;

-- Toyota 4Runner 2020-2024 (smart_key, HYQ14FBC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBC',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota 4Runner' AND year_start = 2020 AND year_end = 2024;

-- Toyota Avalon 2000-2004 (transponder, TOY43)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Avalon' AND year_start = 2000 AND year_end = 2004;

-- Toyota Avalon 2005-2012 (transponder, TOY44D-PT)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Avalon' AND year_start = 2005 AND year_end = 2012;

-- Toyota Avalon 2013-2018 (smart_key, HYQ14FBA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBA',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Avalon' AND year_start = 2013 AND year_end = 2018;

-- Toyota Avalon 2019-2024 (smart_key, HYQ14FBC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBC',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Avalon' AND year_start = 2019 AND year_end = 2024;

-- Toyota C-HR 2018-2024 (smart_key, MOZBR1ET)
UPDATE public.automotive_keys SET
  fcc_id = 'MOZBR1ET',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota C-HR' AND year_start = 2018 AND year_end = 2024;

-- Toyota Camry 1997-2002 (transponder, TOY43)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Camry' AND year_start = 1997 AND year_end = 2002;

-- Toyota Camry 2003-2011 (transponder, mixed - some have smart key)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Camry' AND year_start = 2003 AND year_end = 2011;

-- Toyota Camry 2012-2017 (smart_key, HYQ14FBA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBA',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Camry' AND year_start = 2012 AND year_end = 2017;

-- Toyota Camry 2018-2024 (smart_key, HYQ14FBC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBC',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'TOY51',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Camry' AND year_start = 2018 AND year_end = 2024;

-- Toyota Celica 2000-2005 (transponder, TOY43) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Celica' AND year_start = 2000 AND year_end = 2005;

-- Toyota Corolla 1998-2002 (transponder, TOY43)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Corolla' AND year_start = 1998 AND year_end = 2002;

-- Toyota Corolla 2003-2008 (transponder, TOY44D-PT)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Corolla' AND year_start = 2003 AND year_end = 2008;

-- Toyota Corolla 2009-2013 (transponder, TOY44G-PT)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44G',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Corolla' AND year_start = 2009 AND year_end = 2013;

-- Toyota Corolla 2014-2018 (smart_key, HYQ14FBA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBA',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Corolla' AND year_start = 2014 AND year_end = 2018;

-- Toyota Corolla 2019-2024 (smart_key, HYQ14FBC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBC',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'TOY51',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Corolla' AND year_start = 2019 AND year_end = 2024;

-- Toyota Crown 2023-2024 (smart_key, HYQ14FBX)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBX',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'TOY51',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Crown' AND year_start = 2023 AND year_end = 2024;

-- Toyota Echo 2000-2005 (transponder, TOY43) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Echo' AND year_start = 2000 AND year_end = 2005;

-- Toyota FJ Cruiser 2007-2009 (transponder, TOY44D-PT) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota FJ Cruiser' AND year_start = 2007 AND year_end = 2009;

-- Toyota FJ Cruiser 2010-2014 (remote head transponder, HYQ12BBY) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ12BBY',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'TOY44G',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota FJ Cruiser' AND year_start = 2010 AND year_end = 2014;

-- Toyota GR86 2022-2024 (smart_key, HYQ14AHK - Subaru made)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AHK',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN19',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota GR86' AND year_start = 2022 AND year_end = 2024;

-- Toyota Highlander 2001-2007 (transponder, TOY44D-PT)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Highlander' AND year_start = 2001 AND year_end = 2007;

-- Toyota Highlander 2008-2013 (smart_key, HYQ14AAB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AAB',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Highlander' AND year_start = 2008 AND year_end = 2013;

-- Toyota Highlander 2014-2019 (smart_key, HYQ14FBA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBA',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Highlander' AND year_start = 2014 AND year_end = 2019;

-- Toyota Highlander 2020-2024 (smart_key, HYQ14FBC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBC',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Highlander' AND year_start = 2020 AND year_end = 2024;

-- Toyota Land Cruiser 1998-2007 (transponder, TOY44D-PT)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Land Cruiser' AND year_start = 1998 AND year_end = 2007;

-- Toyota Land Cruiser 2008-2021 (smart_key, HYQ14ACX)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14ACX',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Land Cruiser' AND year_start = 2008 AND year_end = 2021;

-- Toyota Land Cruiser 2024 (smart_key, HYQ14FBX)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBX',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY51',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Land Cruiser' AND year_start = 2024 AND year_end = 2024;

-- Toyota Matrix 2003-2008 (transponder, TOY44D-PT) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Matrix' AND year_start = 2003 AND year_end = 2008;

-- Toyota Matrix 2009-2013 (transponder, TOY44G-PT) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44G',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Matrix' AND year_start = 2009 AND year_end = 2013;

-- Toyota Prius 2001-2003 (transponder, TOY43)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Prius' AND year_start = 2001 AND year_end = 2003;

-- Toyota Prius 2004-2009 (smart_key, MOZB31EG)
UPDATE public.automotive_keys SET
  fcc_id = 'MOZB31EG',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Prius' AND year_start = 2004 AND year_end = 2009;

-- Toyota Prius 2010-2015 (smart_key, HYQ14ACX)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14ACX',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Prius' AND year_start = 2010 AND year_end = 2015;

-- Toyota Prius 2016-2022 (smart_key, HYQ14FBC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBC',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Prius' AND year_start = 2016 AND year_end = 2022;

-- Toyota Prius 2023-2024 (smart_key, HYQ14FBX)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBX',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY51',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Prius' AND year_start = 2023 AND year_end = 2024;

-- Toyota RAV4 1996-2000 (transponder, TOY43)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota RAV4' AND year_start = 1996 AND year_end = 2000;

-- Toyota RAV4 2001-2005 (transponder, TOY44D-PT)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota RAV4' AND year_start = 2001 AND year_end = 2005;

-- Toyota RAV4 2006-2012 (remote head transponder, HYQ12BDP)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ12BDP',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'TOY44G',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota RAV4' AND year_start = 2006 AND year_end = 2012;

-- Toyota RAV4 2013-2018 (smart_key, HYQ14FBA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBA',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota RAV4' AND year_start = 2013 AND year_end = 2018;

-- Toyota RAV4 2019-2024 (smart_key, HYQ14FBC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBC',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'TOY51',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota RAV4' AND year_start = 2019 AND year_end = 2024;

-- Toyota Sequoia 2001-2007 (transponder, TOY44D-PT)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Sequoia' AND year_start = 2001 AND year_end = 2007;

-- Toyota Sequoia 2008-2022 (smart_key, HYQ14ACX)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14ACX',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Sequoia' AND year_start = 2008 AND year_end = 2022;

-- Toyota Sequoia 2023-2024 (smart_key, HYQ14FBX)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBX',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY51',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Sequoia' AND year_start = 2023 AND year_end = 2024;

-- Toyota Sienna 1998-2003 (transponder, TOY43)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Sienna' AND year_start = 1998 AND year_end = 2003;

-- Toyota Sienna 2004-2010 (transponder, TOY44D-PT)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Sienna' AND year_start = 2004 AND year_end = 2010;

-- Toyota Sienna 2011-2020 (smart_key, HYQ14ADR)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14ADR',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Sliding Doors, Hatch',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Sienna' AND year_start = 2011 AND year_end = 2020;

-- Toyota Sienna 2021-2024 (smart_key, HYQ14FBC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBC',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Sliding Doors, Hatch',
  emergency_key_blank = 'TOY51',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Sienna' AND year_start = 2021 AND year_end = 2024;

-- Toyota Solara 1999-2003 (transponder, TOY43) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Solara' AND year_start = 1999 AND year_end = 2003;

-- Toyota Solara 2004-2008 (transponder, TOY44D-PT) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Solara' AND year_start = 2004 AND year_end = 2008;

-- Toyota Supra 2020-2024 (smart_key, BMW-based, IDGNG1)
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Supra' AND year_start = 2020 AND year_end = 2024;

-- Toyota Tacoma 1995-2004 (transponder, TOY43)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Tacoma' AND year_start = 1995 AND year_end = 2004;

-- Toyota Tacoma 2005-2015 (transponder, TOY44D-PT)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Tacoma' AND year_start = 2005 AND year_end = 2015;

-- Toyota Tacoma 2016-2024 (smart_key, HYQ14FBA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBA',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Tacoma' AND year_start = 2016 AND year_end = 2024;

-- Toyota Tundra 2000-2006 (transponder, TOY44D-PT)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Tundra' AND year_start = 2000 AND year_end = 2006;

-- Toyota Tundra 2007-2013 (remote head transponder, GQ43VT20T)
UPDATE public.automotive_keys SET
  fcc_id = 'GQ43VT20T',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'TOY44G',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Tundra' AND year_start = 2007 AND year_end = 2013;

-- Toyota Tundra 2014-2021 (smart_key, HYQ14FBA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBA',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Tailgate',
  emergency_key_blank = 'TOY40',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Tundra' AND year_start = 2014 AND year_end = 2021;

-- Toyota Tundra 2022-2024 (smart_key, HYQ14FBX)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBX',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
  emergency_key_blank = 'TOY51',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Tundra' AND year_start = 2022 AND year_end = 2024;

-- Toyota Venza 2021-2024 (smart_key, HYQ14FBC)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBC',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY51',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Venza' AND year_start = 2021 AND year_end = 2024;

-- Toyota Yaris 2007-2014 (transponder) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Yaris' AND year_start = 2007 AND year_end = 2014;

-- Toyota Yaris 2015-2020 (remote head transponder, MOZB52TH) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = 'MOZB52TH',
  ic_number = NULL,
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'TOY43',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota Yaris' AND year_start = 2015 AND year_end = 2020;

-- Toyota bZ4X 2023-2024 (smart_key, HYQ14FBX) - matches duplicates
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBX',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY51',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Toyota bZ4X' AND year_start = 2023 AND year_end = 2024;

-- ============================================================
-- VOLKSWAGEN
-- ============================================================

-- Volkswagen Atlas 2018-2024 (smart_key, 3G0959752BD)
UPDATE public.automotive_keys SET
  fcc_id = '3G0959752BD',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU162T',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volkswagen Atlas' AND year_start = 2018 AND year_end = 2024;

-- Volkswagen Golf/GTI 1999-2005 (transponder/remote head, NBG735868T)
UPDATE public.automotive_keys SET
  fcc_id = 'NBG735868T',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volkswagen Golf/GTI' AND year_start = 1999 AND year_end = 2005;

-- Volkswagen Golf/GTI 2006-2009 (remote head transponder, NBG010180T)
UPDATE public.automotive_keys SET
  fcc_id = 'NBG010180T',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volkswagen Golf/GTI' AND year_start = 2006 AND year_end = 2009;

-- Volkswagen Golf/GTI 2010-2014 (smart_key, 5K0837202AK)
UPDATE public.automotive_keys SET
  fcc_id = '5K0837202AK',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Volkswagen Golf/GTI%' AND year_start = 2010 AND year_end = 2014;

-- Volkswagen Golf/GTI 2015-2024 (smart_key, WVGZZZ3C0WP)
UPDATE public.automotive_keys SET
  fcc_id = 'WVGZZZ3C0WP',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU162T',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Volkswagen Golf/GTI%' AND year_start = 2015 AND year_end = 2024;

-- Volkswagen ID.4 2021-2024 (smart_key, 3G0959752BJ)
UPDATE public.automotive_keys SET
  fcc_id = '3G0959752BJ',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU162T',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Volkswagen ID.4%' AND year_start = 2021 AND year_end = 2024;

-- Volkswagen Jetta 1999-2005 (transponder/remote head, NBG735868T)
UPDATE public.automotive_keys SET
  fcc_id = 'NBG735868T',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volkswagen Jetta' AND year_start = 1999 AND year_end = 2005;

-- Volkswagen Jetta 2006-2010 (remote head transponder, NBG010180T)
UPDATE public.automotive_keys SET
  fcc_id = 'NBG010180T',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volkswagen Jetta' AND year_start = 2006 AND year_end = 2010;

-- Volkswagen Jetta 2011-2018 (smart_key, NBG010206T)
UPDATE public.automotive_keys SET
  fcc_id = 'NBG010206T',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Volkswagen Jetta%' AND year_start = 2011 AND year_end = 2018;

-- Volkswagen Jetta 2019-2024 (smart_key, 3G0959752BD)
UPDATE public.automotive_keys SET
  fcc_id = '3G0959752BD',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU162T',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Volkswagen Jetta%' AND year_start = 2019 AND year_end = 2024;

-- Volkswagen Passat 1998-2005 (transponder, NBG735868T)
UPDATE public.automotive_keys SET
  fcc_id = 'NBG735868T',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volkswagen Passat' AND year_start = 1998 AND year_end = 2005;

-- Volkswagen Passat 2006-2011 (remote head transponder, NBG010180T)
UPDATE public.automotive_keys SET
  fcc_id = 'NBG010180T',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volkswagen Passat' AND year_start = 2006 AND year_end = 2011;

-- Volkswagen Passat 2012-2019 (smart_key, NBG009066T)
UPDATE public.automotive_keys SET
  fcc_id = 'NBG009066T',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Volkswagen Passat%' AND year_start = 2012 AND year_end = 2019;

-- Volkswagen Passat 2020-2024 (smart_key, 3G0959752BD)
UPDATE public.automotive_keys SET
  fcc_id = '3G0959752BD',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU162T',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Volkswagen Passat%' AND year_start = 2020 AND year_end = 2024;

-- Volkswagen Taos 2022-2024 (smart_key, 3G0959752BD)
UPDATE public.automotive_keys SET
  fcc_id = '3G0959752BD',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU162T',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volkswagen Taos' AND year_start = 2022 AND year_end = 2024;

-- Volkswagen Tiguan 2009-2017 (smart_key, NBG010206T)
UPDATE public.automotive_keys SET
  fcc_id = 'NBG010206T',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Volkswagen Tiguan%' AND year_start = 2009 AND year_end = 2017;

-- Volkswagen Tiguan 2018-2024 (smart_key, 3G0959752BD)
UPDATE public.automotive_keys SET
  fcc_id = '3G0959752BD',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU162T',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Volkswagen Tiguan%' AND year_start = 2018 AND year_end = 2024;

-- ============================================================
-- VOLVO
-- ============================================================

-- Volvo S60 2001-2009 (remote key, LQNP2T-APU)
UPDATE public.automotive_keys SET
  fcc_id = 'LQNP2T-APU',
  ic_number = NULL,
  battery_type = 'CR2430',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NE66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volvo S60' AND year_start = 2001 AND year_end = 2009;

-- Volvo S60 2011-2018 (smart_key, KR55WK49264)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49264',
  ic_number = NULL,
  battery_type = 'CR2430',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NE66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volvo S60' AND year_start = 2011 AND year_end = 2018;

-- Volvo S60 2019-2024 (smart_key, 30659637)
UPDATE public.automotive_keys SET
  fcc_id = '30659637',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volvo S60' AND year_start = 2019 AND year_end = 2024;

-- Volvo S90 2017-2024 (smart_key, 30659637)
UPDATE public.automotive_keys SET
  fcc_id = '30659637',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volvo S90' AND year_start = 2017 AND year_end = 2024;

-- Volvo V60 2015-2018 (smart_key, KR55WK49264)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49264',
  ic_number = NULL,
  battery_type = 'CR2430',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NE66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volvo V60' AND year_start = 2015 AND year_end = 2018;

-- Volvo V60 2019-2024 (smart_key, 30659637)
UPDATE public.automotive_keys SET
  fcc_id = '30659637',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volvo V60' AND year_start = 2019 AND year_end = 2024;

-- Volvo XC40 2019-2024 (smart_key, 30659637)
UPDATE public.automotive_keys SET
  fcc_id = '30659637',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU101',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volvo XC40' AND year_start = 2019 AND year_end = 2024;

-- Volvo XC60 2010-2017 (smart_key, KR55WK49264)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49264',
  ic_number = NULL,
  battery_type = 'CR2430',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NE66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volvo XC60' AND year_start = 2010 AND year_end = 2017;

-- Volvo XC60 2018-2024 (smart_key, 30659637)
UPDATE public.automotive_keys SET
  fcc_id = '30659637',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU101',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volvo XC60' AND year_start = 2018 AND year_end = 2024;

-- Volvo XC90 2003-2015 (smart_key, LQNP2T-APU)
UPDATE public.automotive_keys SET
  fcc_id = 'LQNP2T-APU',
  ic_number = NULL,
  battery_type = 'CR2430',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NE66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volvo XC90' AND year_start = 2003 AND year_end = 2015;

-- Volvo XC90 2016-2024 (smart_key, 30659637)
UPDATE public.automotive_keys SET
  fcc_id = '30659637',
  ic_number = NULL,
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU101',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Volvo XC90' AND year_start = 2016 AND year_end = 2024;

