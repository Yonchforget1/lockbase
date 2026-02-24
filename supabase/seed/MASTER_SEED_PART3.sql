-- MASTER SEED PART3 of 4
-- Key updates I-Z
-- Run in order: PART1 -> PART2 -> PART3 -> PART4

-- UPDATE statements for automotive key records
-- Manufacturers I through N
-- Fill in missing data: fcc_id, battery_type, buttons, emergency_key_blank, ic_number, test_key_blank, image_url
-- =============================================

-- Transaction managed by Supabase

-- =============================================
-- INFINITI (13 keys)
-- =============================================

UPDATE public.automotive_keys SET
  fcc_id = 'KR5S180144014',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Infiniti%Q50%' AND year_start = 2014 AND year_end = 2018;

UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN7',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Infiniti%Q50%' AND year_start = 2019 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KR5S180144014',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Infiniti%Q60%' AND year_start = 2017 AND year_end = 2018;

UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN7',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Infiniti%Q60%' AND year_start = 2019 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49622',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Infiniti%QX50%' AND year_start = 2008 AND year_end = 2013;

UPDATE public.automotive_keys SET
  fcc_id = 'KR5S180144014',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Infiniti%QX50%' AND year_start = 2014 AND year_end = 2018;

UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN7',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Infiniti%QX50%' AND year_start = 2019 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KR5S180144014',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Infiniti%QX60%' AND year_start = 2014 AND year_end = 2021;

UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN7',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Infiniti%QX60%' AND year_start = 2022 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U415',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Infiniti%QX80%' AND year_start = 2004 AND year_end = 2010;

UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1G744',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Infiniti%QX80%' AND year_start = 2011 AND year_end = 2013;

UPDATE public.automotive_keys SET
  fcc_id = 'S180144014',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Infiniti%QX80%' AND year_start = 2014 AND year_end = 2018;

UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN7',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Infiniti%QX80%' AND year_start = 2019 AND year_end = 2024;

-- =============================================
-- JAGUAR (7 keys)
-- =============================================

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJTF10A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jaguar%E-Pace%' AND year_start = 2018 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJTF10A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jaguar%F-Pace%' AND year_start = 2017 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJTF10A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Roof',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jaguar%F-Type%' AND year_start = 2014 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJTF10A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jaguar%I-Pace%' AND year_start = 2019 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJTF10A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jaguar%XE%' AND year_start = 2017 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJTF10A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jaguar%XF%' AND year_start = 2009 AND year_end = 2015;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJTF10A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jaguar%XF%' AND year_start = 2016 AND year_end = 2024;

-- =============================================
-- JEEP (25 keys)
-- =============================================

-- Cherokee 1997-2001: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y157',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Cherokee%' AND year_start = 1997 AND year_end = 2001;

-- Cherokee 2014-2024: proximity
UPDATE public.automotive_keys SET
  fcc_id = 'GQ4-54T',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'Y164-PT',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Cherokee%' AND year_start = 2014 AND year_end = 2024;

-- Commander 2006-2010 (x2): FOBIK
UPDATE public.automotive_keys SET
  fcc_id = 'IYZ-C01C',
  battery_type = 'integrated',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'Y164',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Commander%' AND year_start = 2006 AND year_end = 2010;

-- Compass 2007-2016: FOBIK
UPDATE public.automotive_keys SET
  fcc_id = 'OHT692713AA',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'Y159',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Compass%' AND year_start = 2007 AND year_end = 2016;

-- Compass 2017-2024: proximity
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-40821302',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'Y170',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Compass%' AND year_start = 2017 AND year_end = 2024;

-- Gladiator 2020-2024: proximity
UPDATE public.automotive_keys SET
  fcc_id = 'OHT1130261',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Doors Off',
  emergency_key_blank = 'Y170',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Gladiator%' AND year_start = 2020 AND year_end = 2024;

-- Grand Cherokee 1999-2004: transponder + separate remote
UPDATE public.automotive_keys SET
  fcc_id = 'GQ43VT9T',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y159',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Grand Cherokee%' AND year_start = 1999 AND year_end = 2004;

-- Grand Cherokee 2005-2013: FOBIK
UPDATE public.automotive_keys SET
  fcc_id = 'IYZ-C01C',
  battery_type = 'integrated',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'Y164',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Grand Cherokee%' AND year_start = 2005 AND year_end = 2013;

-- Grand Cherokee 2014-2021: proximity
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-40821302',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'Y164-PT',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Grand Cherokee%' AND year_start = 2014 AND year_end = 2021;

-- Grand Cherokee 2022-2024: proximity
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-5WY783X',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'Y170',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Grand Cherokee%' AND year_start = 2022 AND year_end = 2024;

-- Grand Wagoneer 2022-2024 (x2): proximity
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-5WY783X',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'Y170',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Grand Wagoneer%' AND year_start = 2022 AND year_end = 2024;

-- Liberty 2002-2007 (x2): FOBIK
UPDATE public.automotive_keys SET
  fcc_id = 'KOBDT04A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'Y159',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Liberty%' AND year_start = 2002 AND year_end = 2007;

-- Liberty 2008-2012 (x2): FOBIK
UPDATE public.automotive_keys SET
  fcc_id = 'IYZ-C01C',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'Y164',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Liberty%' AND year_start = 2008 AND year_end = 2012;

-- Patriot 2007-2017 (x2): FOBIK
UPDATE public.automotive_keys SET
  fcc_id = 'OHT692713AA',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'Y159',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Patriot%' AND year_start = 2007 AND year_end = 2017;

-- Renegade 2015-2024: proximity
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-40821302',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'SIP22',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Renegade%' AND year_start = 2015 AND year_end = 2024;

-- Wagoneer 2022-2024 (x2): proximity
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-5WY783X',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'Y170',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Wagoneer%' AND year_start = 2022 AND year_end = 2024;

-- Wrangler 1997-2006: transponder + separate remote
UPDATE public.automotive_keys SET
  fcc_id = 'GQ43VT9T',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y159',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Wrangler%' AND year_start = 1997 AND year_end = 2006;

-- Wrangler 2007-2017: FOBIK
UPDATE public.automotive_keys SET
  fcc_id = 'OHT692427AA',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'Y164',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Wrangler%' AND year_start = 2007 AND year_end = 2017;

-- Wrangler 2018-2024: proximity
UPDATE public.automotive_keys SET
  fcc_id = 'OHT1130261',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Doors Off',
  emergency_key_blank = 'Y170',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Jeep%Wrangler%' AND year_start = 2018 AND year_end = 2024;

-- =============================================
-- KIA (43 keys)
-- =============================================

-- Amanti 2004-2009 (x2): remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'OSLOKA-310T',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'KK7',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Amanti%' AND year_start = 2004 AND year_end = 2009;

-- Cadenza 2014-2020 (x2): smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'SY5IGFGE04',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Cadenza%' AND year_start = 2014 AND year_end = 2020;

-- Carnival 2022-2024 (x2): smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'SY5MQ4FGE05',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Sliding Doors, Hatch',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Carnival%' AND year_start = 2022 AND year_end = 2024;

-- EV6 2022-2024 (x2): smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-FOB-4F24',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HY22',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%EV6%' AND year_start = 2022 AND year_end = 2024;

-- Forte 2010-2013: remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'PINHA-T008',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'KK10',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Forte%' AND year_start = 2010 AND year_end = 2013;

-- Forte 2014-2018: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'CQOFD00120',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Forte%' AND year_start = 2014 AND year_end = 2018;

-- Forte 2019-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-FOB-4F11',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Forte%' AND year_start = 2019 AND year_end = 2024;

-- K5 2021-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-FOB-4F27',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%K5%' AND year_start = 2021 AND year_end = 2024;

-- Optima 2001-2006: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'KK7',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Optima%' AND year_start = 2001 AND year_end = 2006;

-- Optima 2007-2010: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'KK10',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Optima%' AND year_start = 2007 AND year_end = 2010;

-- Optima 2011-2015: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'SY5HMFNA04',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Optima%' AND year_start = 2011 AND year_end = 2015;

-- Optima 2016-2020: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-FOB-4F10',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Optima%' AND year_start = 2016 AND year_end = 2020;

-- Rio 2006-2011 (x2): remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'PLNHM-T011',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'KK7',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Rio%' AND year_start = 2006 AND year_end = 2011;

-- Rio 2012-2017 (x2): remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-RKE-4F17',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'KK10',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Rio%' AND year_start = 2012 AND year_end = 2017;

-- Rio 2018-2024 (x2): smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-FOB-4F11',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Rio%' AND year_start = 2018 AND year_end = 2024;

-- Sedona 2006-2014 (x2): remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'SV3-100060234',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Sliding Doors',
  emergency_key_blank = 'KK7',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Sedona%' AND year_start = 2006 AND year_end = 2014;

-- Sedona 2015-2021 (x2): smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'SY5YPFGE06',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Sliding Doors',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Sedona%' AND year_start = 2015 AND year_end = 2021;

-- Seltos 2021-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-FOB-4F24',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Seltos%' AND year_start = 2021 AND year_end = 2024;

-- Sorento 2003-2009: remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'OSLOKA-310T',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'KK7',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Sorento%' AND year_start = 2003 AND year_end = 2009;

-- Sorento 2010-2015: remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-RKE-3F05',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'KK10',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Sorento%' AND year_start = 2010 AND year_end = 2015;

-- Sorento 2016-2020: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-FOB-4F06',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Sorento%' AND year_start = 2016 AND year_end = 2020;

-- Sorento 2021-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-FOB-4F24',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Sorento%' AND year_start = 2021 AND year_end = 2024;

-- Soul 2010-2013: remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'NY0SEKSAM11ATX',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'KK10',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Soul%' AND year_start = 2010 AND year_end = 2013;

-- Soul 2014-2019: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'CQOFD00120',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Soul%' AND year_start = 2014 AND year_end = 2019;

-- Soul 2020-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-FOB-4F24',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Soul%' AND year_start = 2020 AND year_end = 2024;

-- Spectra 2004-2009 (x2): remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'OSLOKA-310T',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'KK7',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Spectra%' AND year_start = 2004 AND year_end = 2009;

-- Sportage 2005-2010: remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'OSLOKA-310T',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'KK7',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Sportage%' AND year_start = 2005 AND year_end = 2010;

-- Sportage 2011-2016: remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-RKE-3F05',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'KK10',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Sportage%' AND year_start = 2011 AND year_end = 2016;

-- Sportage 2017-2022: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-FOB-4F08',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Sportage%' AND year_start = 2017 AND year_end = 2022;

-- Sportage 2023-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-FOB-4F24',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Sportage%' AND year_start = 2023 AND year_end = 2024;

-- Stinger 2018-2023 (x2): smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-FOB-4F15',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Stinger%' AND year_start = 2018 AND year_end = 2023;

-- Telluride 2020-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'TQ8-FOB-4F24',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'KK12',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Kia%Telluride%' AND year_start = 2020 AND year_end = 2024;

-- =============================================
-- LAND ROVER (9 keys)
-- =============================================

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJXF18A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Land Rover%Defender%' AND year_start = 2020 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJXF18A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Land Rover%Discovery%' AND year_start = 2017 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJXF10A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Land Rover%Discovery Sport%' AND year_start = 2015 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJTF10A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Land Rover%Range Rover%' AND year_start = 2013 AND year_end = 2021;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJXF18A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Land Rover%Range Rover%' AND year_start = 2022 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJTF10A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Land Rover%Range Rover Evoque%' AND year_start = 2012 AND year_end = 2019;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJXF18A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Land Rover%Range Rover Evoque%' AND year_start = 2020 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJTF10A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Land Rover%Range Rover Sport%' AND year_start = 2014 AND year_end = 2022;

UPDATE public.automotive_keys SET
  fcc_id = 'KOBJXF18A',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU101',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Land Rover%Range Rover Sport%' AND year_start = 2023 AND year_end = 2024;

-- =============================================
-- LEXUS (25 keys)
-- =============================================

-- ES 1997-2003: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%ES%' AND year_start = 1997 AND year_end = 2003;

-- ES 2004-2006: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D-PT',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%ES%' AND year_start = 2004 AND year_end = 2006;

-- ES 2007-2012: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AAB',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%ES%' AND year_start = 2007 AND year_end = 2012;

-- ES 2013-2018: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBA',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%ES%' AND year_start = 2013 AND year_end = 2018;

-- ES 2019-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBN',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%ES%' AND year_start = 2019 AND year_end = 2024;

-- GX 2003-2009: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D-PT',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%GX%' AND year_start = 2003 AND year_end = 2009;

-- GX 2010-2023: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14ACX',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%GX%' AND year_start = 2010 AND year_end = 2023;

-- GX 2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBX',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%GX%' AND year_start = 2024 AND year_end = 2024;

-- IS 2001-2005: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D-PT',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%IS%' AND year_start = 2001 AND year_end = 2005;

-- IS 2006-2013: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AAB',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%IS%' AND year_start = 2006 AND year_end = 2013;

-- IS 2014-2020: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBA',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%IS%' AND year_start = 2014 AND year_end = 2020;

-- IS 2021-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBN',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%IS%' AND year_start = 2021 AND year_end = 2024;

-- LC 2018-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBF',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%LC%' AND year_start = 2018 AND year_end = 2024;

-- LX 1998-2007: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY44D-PT',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%LX%' AND year_start = 1998 AND year_end = 2007;

-- LX 2008-2015: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14ACX',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%LX%' AND year_start = 2008 AND year_end = 2015;

-- LX 2016-2021: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBA',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%LX%' AND year_start = 2016 AND year_end = 2021;

-- LX 2022-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBX',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%LX%' AND year_start = 2022 AND year_end = 2024;

-- NX 2015-2021: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBA',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%NX%' AND year_start = 2015 AND year_end = 2021;

-- NX 2022-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBX',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%NX%' AND year_start = 2022 AND year_end = 2024;

-- RX 1999-2003: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'TOY43',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%RX%' AND year_start = 1999 AND year_end = 2003;

-- RX 2004-2009: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14AAB',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%RX%' AND year_start = 2004 AND year_end = 2009;

-- RX 2010-2015: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14ACX',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%RX%' AND year_start = 2010 AND year_end = 2015;

-- RX 2016-2022: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBA',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%RX%' AND year_start = 2016 AND year_end = 2022;

-- RX 2023-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBX',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%RX%' AND year_start = 2023 AND year_end = 2024;

-- UX 2019-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ14FBN',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'TOY40',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lexus%UX%' AND year_start = 2019 AND year_end = 2024;

-- =============================================
-- LINCOLN (9 keys)
-- =============================================

UPDATE public.automotive_keys SET
  fcc_id = 'M3N-A2C931426',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'H75',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lincoln%Aviator%' AND year_start = 2020 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'M3N-A2C94078000',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'H75',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lincoln%Continental%' AND year_start = 2017 AND year_end = 2020;

UPDATE public.automotive_keys SET
  fcc_id = 'M3N-A2C931426',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'H75',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lincoln%Corsair%' AND year_start = 2020 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'M3N-A2C31243300',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'H75',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lincoln%MKC%' AND year_start = 2015 AND year_end = 2019;

UPDATE public.automotive_keys SET
  fcc_id = 'M3N-A2C31243300',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'H75',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lincoln%MKZ%' AND year_start = 2013 AND year_end = 2016;

UPDATE public.automotive_keys SET
  fcc_id = 'M3N-A2C94078000',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'H75',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lincoln%MKZ%' AND year_start = 2017 AND year_end = 2020;

UPDATE public.automotive_keys SET
  fcc_id = 'M3N-A2C931426',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'H75',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lincoln%Nautilus%' AND year_start = 2019 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'M3N5WY8609',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'H75',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lincoln%Navigator%' AND year_start = 2007 AND year_end = 2017;

UPDATE public.automotive_keys SET
  fcc_id = 'M3N-A2C93142600',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'H75',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Lincoln%Navigator%' AND year_start = 2018 AND year_end = 2024;

-- =============================================
-- MAZDA (16 keys)
-- =============================================

-- CX-30 2020-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'WAZSKE11D01',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%CX-30%' AND year_start = 2020 AND year_end = 2024;

-- CX-5 2013-2016: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'WAZSKE13D01',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%CX-5%' AND year_start = 2013 AND year_end = 2016;

-- CX-5 2017-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'WAZSKE13D02',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%CX-5%' AND year_start = 2017 AND year_end = 2024;

-- CX-50 2023-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'WAZSKE11D01',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%CX-50%' AND year_start = 2023 AND year_end = 2024;

-- CX-9 2007-2015: transponder
UPDATE public.automotive_keys SET
  fcc_id = 'WAZX1T763SKE11A04',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%CX-9%' AND year_start = 2007 AND year_end = 2015;

-- CX-9 2016-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'WAZSKE13D01',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%CX-9%' AND year_start = 2016 AND year_end = 2024;

-- MX-5 1999-2005: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%MX-5%' AND year_start = 1999 AND year_end = 2005;

-- MX-5 2006-2015: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%MX-5%' AND year_start = 2006 AND year_end = 2015;

-- MX-5 2016-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'WAZSKE13D01',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%MX-5%' AND year_start = 2016 AND year_end = 2024;

-- Mazda3 2004-2009: remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'KPU41846',
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%Mazda3%' AND year_start = 2004 AND year_end = 2009;

-- Mazda3 2010-2013: remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'WAZX1T768SKE11A03',
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%Mazda3%' AND year_start = 2010 AND year_end = 2013;

-- Mazda3 2014-2018: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'WAZSKE13D01',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%Mazda3%' AND year_start = 2014 AND year_end = 2018;

-- Mazda3 2019-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'WAZSKE11D01',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%Mazda3%' AND year_start = 2019 AND year_end = 2024;

-- Mazda6 2003-2008: remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'KPU41846',
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%Mazda6%' AND year_start = 2003 AND year_end = 2008;

-- Mazda6 2009-2013: remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'WAZX1T768SKE11A03',
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%Mazda6%' AND year_start = 2009 AND year_end = 2013;

-- Mazda6 2014-2021: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'WAZSKE13D01',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'MAZ24R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mazda%Mazda6%' AND year_start = 2014 AND year_end = 2021;

-- =============================================
-- MERCEDES-BENZ (19 keys)
-- =============================================

-- A-Class 2019-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZDC12K',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%A-Class%' AND year_start = 2019 AND year_end = 2024;

-- C-Class 1996-2000: standard key, no transponder
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%C-Class%' AND year_start = 1996 AND year_end = 2000;

-- C-Class 2001-2007: transponder, chrome key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZ-3312',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU64-PT',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%C-Class%' AND year_start = 2001 AND year_end = 2007;

-- C-Class 2008-2014: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZ-3312',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%C-Class%' AND year_start = 2008 AND year_end = 2014;

-- C-Class 2015-2021: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZDC11',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%C-Class%' AND year_start = 2015 AND year_end = 2021;

-- C-Class 2022-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZDC12K',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%C-Class%' AND year_start = 2022 AND year_end = 2024;

-- E-Class 1996-2002: standard key
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%E-Class%' AND year_start = 1996 AND year_end = 2002;

-- E-Class 2003-2009: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZ-3312',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%E-Class%' AND year_start = 2003 AND year_end = 2009;

-- E-Class 2010-2016: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZDC07',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%E-Class%' AND year_start = 2010 AND year_end = 2016;

-- E-Class 2017-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZDC11',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%E-Class%' AND year_start = 2017 AND year_end = 2024;

-- GLA 2021-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZDC12K',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%GLA%' AND year_start = 2021 AND year_end = 2024;

-- GLB 2020-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZDC12K',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%GLB%' AND year_start = 2020 AND year_end = 2024;

-- GLC 2016-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZDC11',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%GLC%' AND year_start = 2016 AND year_end = 2024;

-- GLE 2016-2019: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZDC11',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%GLE%' AND year_start = 2016 AND year_end = 2019;

-- GLE 2020-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZDC12K',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%GLE%' AND year_start = 2020 AND year_end = 2024;

-- S-Class 1999-2005: smart_key (IR key)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%S-Class%' AND year_start = 1999 AND year_end = 2005;

-- S-Class 2006-2013: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZ-3312',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%S-Class%' AND year_start = 2006 AND year_end = 2013;

-- S-Class 2014-2020: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZDC07',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%S-Class%' AND year_start = 2014 AND year_end = 2020;

-- S-Class 2021-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'IYZDC12K',
  battery_type = 'CR2025',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU64',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mercedes-Benz%S-Class%' AND year_start = 2021 AND year_end = 2024;

-- =============================================
-- MINI (5 keys)
-- =============================================

UPDATE public.automotive_keys SET
  fcc_id = 'NBGIDGNG1',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU92R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mini%Clubman%' AND year_start = 2016 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49333',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU92R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mini%Cooper%' AND year_start = 2014 AND year_end = 2018;

UPDATE public.automotive_keys SET
  fcc_id = 'NBGIDGNG1',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU100R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mini%Cooper%' AND year_start = 2019 AND year_end = 2024;

UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49333',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU92R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mini%Countryman%' AND year_start = 2011 AND year_end = 2016;

UPDATE public.automotive_keys SET
  fcc_id = 'NBGIDGNG1',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'HU100R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mini%Countryman%' AND year_start = 2017 AND year_end = 2024;

-- =============================================
-- MITSUBISHI (9 keys)
-- =============================================

-- Eclipse Cross 2018-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'OUCJ166N',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'MIT11R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mitsubishi%Eclipse Cross%' AND year_start = 2018 AND year_end = 2024;

-- Lancer 2002-2007: remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'OUCG8D-620M-A',
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'MIT8',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mitsubishi%Lancer%' AND year_start = 2002 AND year_end = 2007;

-- Lancer 2008-2017: remote head / smart transponder
UPDATE public.automotive_keys SET
  fcc_id = 'OUCJ166N',
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'MIT11',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mitsubishi%Lancer%' AND year_start = 2008 AND year_end = 2017;

-- Mirage 2014-2024: remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'OUCJ166N',
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'MIT11',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mitsubishi%Mirage%' AND year_start = 2014 AND year_end = 2024;

-- Outlander 2007-2013: transponder
UPDATE public.automotive_keys SET
  fcc_id = 'OUCG8D-625M-A',
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'MIT11',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mitsubishi%Outlander%' AND year_start = 2007 AND year_end = 2013;

-- Outlander 2014-2021: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'OUCJ166N',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'MIT11R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mitsubishi%Outlander%' AND year_start = 2014 AND year_end = 2021;

-- Outlander 2022-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'OUCJ166N',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'MIT11R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mitsubishi%Outlander%' AND year_start = 2022 AND year_end = 2024;

-- Outlander Sport 2011-2017: transponder
UPDATE public.automotive_keys SET
  fcc_id = 'OUCJ166N',
  battery_type = 'CR1620',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'MIT11',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mitsubishi%Outlander Sport%' AND year_start = 2011 AND year_end = 2017;

-- Outlander Sport 2018-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'OUCJ166N',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'MIT11R',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Mitsubishi%Outlander Sport%' AND year_start = 2018 AND year_end = 2024;

-- =============================================
-- NISSAN (74 keys)
-- =============================================

-- 350Z 2003-2005: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%350Z%' AND year_start = 2003 AND year_end = 2005;

-- 350Z 2006-2009: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK48903',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%350Z%' AND year_start = 2006 AND year_end = 2009;

-- 370Z 2009-2017: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49622',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%370Z%' AND year_start = 2009 AND year_end = 2017;

-- 370Z 2018-2020: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5S180144014',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%370Z%' AND year_start = 2018 AND year_end = 2020;

-- Altima 1998-2001: standard key
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN11',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Altima%' AND year_start = 1998 AND year_end = 2001;

-- Altima 2002-2006: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Altima%' AND year_start = 2002 AND year_end = 2006;

-- Altima 2007-2012: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK48903',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Altima%' AND year_start = 2007 AND year_end = 2012;

-- Altima 2013-2018: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5S180144014',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Altima%' AND year_start = 2013 AND year_end = 2018;

-- Altima 2019-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN4',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Altima%' AND year_start = 2019 AND year_end = 2024;

-- Armada 2004-2007: smart_key (older)
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U787',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Armada%' AND year_start = 2004 AND year_end = 2007;

-- Armada 2008-2015: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U787',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Armada%' AND year_start = 2008 AND year_end = 2015;

-- Armada 2017-2018: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1G744',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Armada%' AND year_start = 2017 AND year_end = 2018;

-- Armada 2019-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN7',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Armada%' AND year_start = 2019 AND year_end = 2024;

-- Frontier 1998-2004: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN11',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Frontier%' AND year_start = 1998 AND year_end = 2004;

-- Frontier 2005-2007: transponder
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Frontier%' AND year_start = 2005 AND year_end = 2007;

-- Frontier 2008-2014: transponder, remote head
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U751',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Frontier%' AND year_start = 2008 AND year_end = 2014;

-- Frontier 2015-2021: transponder, remote head
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U751',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Frontier%' AND year_start = 2015 AND year_end = 2021;

-- Frontier 2022-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN4',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Frontier%' AND year_start = 2022 AND year_end = 2024;

-- Juke 2011-2017 (x2): smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U840',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Juke%' AND year_start = 2011 AND year_end = 2017;

-- Kicks 2018-2020: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN7',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Kicks%' AND year_start = 2018 AND year_end = 2020;

-- Kicks 2021-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN7',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Kicks%' AND year_start = 2021 AND year_end = 2024;

-- Leaf 2011-2017: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U840',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Leaf%' AND year_start = 2011 AND year_end = 2017;

-- Leaf 2018-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN4',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Leaf%' AND year_start = 2018 AND year_end = 2024;

-- Maxima 1999-2003: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Maxima%' AND year_start = 1999 AND year_end = 2003;

-- Maxima 2004-2006: transponder
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Maxima%' AND year_start = 2004 AND year_end = 2006;

-- Maxima 2007-2008: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK48903',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Maxima%' AND year_start = 2007 AND year_end = 2008;

-- Maxima 2009-2014: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49622',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Maxima%' AND year_start = 2009 AND year_end = 2014;

-- Maxima 2015-2018: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5S180144014',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Maxima%' AND year_start = 2015 AND year_end = 2018;

-- Maxima 2019-2023: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN7',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Maxima%' AND year_start = 2019 AND year_end = 2023;

-- Murano 2003-2007: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KBRASTU15',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Murano%' AND year_start = 2003 AND year_end = 2007;

-- Murano 2008-2009: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK48903',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Murano%' AND year_start = 2008 AND year_end = 2009;

-- Murano 2010-2014: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49622',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Murano%' AND year_start = 2010 AND year_end = 2014;

-- Murano 2015-2018: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5S180144014',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Murano%' AND year_start = 2015 AND year_end = 2018;

-- Murano 2019-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN4',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Murano%' AND year_start = 2019 AND year_end = 2024;

-- Pathfinder 1996-2000: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN11',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Pathfinder%' AND year_start = 1996 AND year_end = 2000;

-- Pathfinder 2001-2004: transponder
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Pathfinder%' AND year_start = 2001 AND year_end = 2004;

-- Pathfinder 2005-2007: transponder
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Pathfinder%' AND year_start = 2005 AND year_end = 2007;

-- Pathfinder 2008-2012: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49622',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Pathfinder%' AND year_start = 2008 AND year_end = 2012;

-- Pathfinder 2013-2015: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5S180144014',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Pathfinder%' AND year_start = 2013 AND year_end = 2015;

-- Pathfinder 2016-2018: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5S180144014',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Pathfinder%' AND year_start = 2016 AND year_end = 2018;

-- Pathfinder 2019-2020: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN7',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Pathfinder%' AND year_start = 2019 AND year_end = 2020;

-- Pathfinder 2022-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN4',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Pathfinder%' AND year_start = 2022 AND year_end = 2024;

-- Quest 2004-2009: transponder, remote head
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U751',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Quest%' AND year_start = 2004 AND year_end = 2009;

-- Quest 2010-2017: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U840',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Sliding Doors, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Quest%' AND year_start = 2010 AND year_end = 2017;

-- Rogue 2008-2013: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWBU729',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Rogue%' AND year_start = 2008 AND year_end = 2013;

-- Rogue 2014-2020: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5S180144106',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Rogue%' AND year_start = 2014 AND year_end = 2020;

-- Rogue 2021-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN4',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Rogue%' AND year_start = 2021 AND year_end = 2024;

-- Sentra 2000-2006: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN11',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Sentra%' AND year_start = 2000 AND year_end = 2006;

-- Sentra 2007-2012: transponder (some remote head)
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U751',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Sentra%' AND year_start = 2007 AND year_end = 2012;

-- Sentra 2013-2019: remote head transponder
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U815',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Sentra%' AND year_start = 2013 AND year_end = 2019;

-- Sentra 2020-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN4',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Sentra%' AND year_start = 2020 AND year_end = 2024;

-- Titan 2004-2007: transponder
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Titan%' AND year_start = 2004 AND year_end = 2007;

-- Titan 2008-2015: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U787',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Titan%' AND year_start = 2008 AND year_end = 2015;

-- Titan 2016-2018: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5S180144014',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Titan%' AND year_start = 2016 AND year_end = 2018;

-- Titan 2019-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN7',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Titan%' AND year_start = 2019 AND year_end = 2024;

-- Versa 2007-2011: transponder, remote head
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U751',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Versa%' AND year_start = 2007 AND year_end = 2011;

-- Versa 2012-2013: transponder, remote head
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U751',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Versa%' AND year_start = 2012 AND year_end = 2013;

-- Versa 2014-2016: transponder, remote head
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U815',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Versa%' AND year_start = 2014 AND year_end = 2016;

-- Versa 2017-2019: transponder, remote head
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U815',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Versa%' AND year_start = 2017 AND year_end = 2019;

-- Versa 2020-2024: smart_key
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TXN4',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Versa%' AND year_start = 2020 AND year_end = 2024;

-- Xterra 2000-2004: transponder only
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN11',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Xterra%' AND year_start = 2000 AND year_end = 2004;

-- Xterra 2005-2007: transponder
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Xterra%' AND year_start = 2005 AND year_end = 2007;

-- Xterra 2008-2012: transponder, remote head
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U751',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Xterra%' AND year_start = 2008 AND year_end = 2012;

-- Xterra 2013-2015: transponder, remote head
UPDATE public.automotive_keys SET
  fcc_id = 'CWTWB1U751',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'NSN14',
  ic_number = NULL,
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Nissan%Xterra%' AND year_start = 2013 AND year_end = 2015;

-- End of updates
-- ============================================================
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

