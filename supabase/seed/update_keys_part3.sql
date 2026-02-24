-- =============================================
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
