-- ============================================================
-- UPDATE automotive_keys: Fill missing columns for manufacturers D-H
-- (Dodge, Fiat, Ford, Genesis, GMC, Honda, Hyundai)
-- Targets: battery_type, buttons, emergency_key_blank, ic_number,
--          test_key_blank, image_url, fcc_id, remote_frequency
-- ============================================================

-- ============================================================
-- DODGE
-- ============================================================

-- Dodge Avenger 2008-2014 (FOBIK)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Avenger' AND year_start = 2008 AND year_end = 2014;

-- Dodge Caliber 2007-2012 (FOBIK)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Caliber' AND year_start = 2007 AND year_end = 2012;

-- Dodge Challenger 2008-2014 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'IYZ-C01C',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Challenger' AND year_start = 2008 AND year_end = 2014;

-- Dodge Challenger 2015-2024 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic, Remote Start',
    emergency_key_blank = 'Y164-PT',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Challenger' AND year_start = 2015 AND year_end = 2024;

-- Dodge Charger 2006-2010 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY72XX',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Charger' AND year_start = 2006 AND year_end = 2010;

-- Dodge Charger 2011-2014 (FOBIK)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Charger' AND year_start = 2011 AND year_end = 2014;

-- Dodge Charger 2015-2024 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic, Remote Start',
    emergency_key_blank = 'Y164-PT',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Charger' AND year_start = 2015 AND year_end = 2024;

-- Dodge Dakota 2000-2007 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Dakota' AND year_start = 2000 AND year_end = 2007;

-- Dodge Dakota 2008-2011 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'KOBDT04A',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Dakota' AND year_start = 2008 AND year_end = 2011;

-- Dodge Dart 2013-2016 (proximity/smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank = 'Y170',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Dart' AND year_start = 2013 AND year_end = 2016;

-- Dodge Durango 1998-2003 (standard, no transponder)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Durango' AND year_start = 1998 AND year_end = 2003;

-- Dodge Durango 2004-2009 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'KOBDT04A',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Durango' AND year_start = 2004 AND year_end = 2009;

-- Dodge Durango 2011-2013 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'IYZ-C01C',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Durango' AND year_start = 2011 AND year_end = 2013;

-- Dodge Durango 2014-2020 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Hatch, Panic, Remote Start',
    emergency_key_blank = 'Y164-PT',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Durango' AND year_start = 2014 AND year_end = 2020;

-- Dodge Durango 2021-2024 (proximity)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-5WY783X',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Hatch, Panic, Remote Start',
    emergency_key_blank = 'Y170',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Durango' AND year_start = 2021 AND year_end = 2024;

-- Dodge Grand Caravan 1996-2000 (standard)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Grand Caravan' AND year_start = 1996 AND year_end = 2000;

-- Dodge Grand Caravan 2001-2007 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY72XX',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Grand Caravan' AND year_start = 2001 AND year_end = 2007;

-- Dodge Grand Caravan 2008-2020 (FOBIK)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Power Doors',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Grand Caravan' AND year_start = 2008 AND year_end = 2020;

-- Dodge Journey 2009-2010 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'OHT692713AA',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Journey' AND year_start = 2009 AND year_end = 2010;

-- Dodge Journey 2011-2020 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'IYZ-C01C',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Journey' AND year_start = 2011 AND year_end = 2020;

-- Dodge Magnum 2005-2008 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY72XX',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Magnum' AND year_start = 2005 AND year_end = 2008;

-- Dodge Neon 2000-2005 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Neon' AND year_start = 2000 AND year_end = 2005;

-- Dodge Nitro 2007-2011 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'KOBDT04A',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Nitro' AND year_start = 2007 AND year_end = 2011;

-- Dodge Ram Van 1998-2003 (standard, no transponder)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Ram Van' AND year_start = 1998 AND year_end = 2003;


-- ============================================================
-- FIAT
-- ============================================================

-- Fiat 500 2012-2019 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'SIP22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Fiat 500' AND year_start = 2012 AND year_end = 2019;

-- Fiat 500L 2014-2020 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'LTQF12AM433TX',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'SIP22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Fiat 500L' AND year_start = 2014 AND year_end = 2020;

-- Fiat 500X 2016-2018 (transponder with remote)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'SIP22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Fiat 500X' AND year_start = 2016 AND year_end = 2018;

-- Fiat 500X 2019-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'SIP22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name LIKE 'Fiat 500X%' AND year_start = 2019 AND year_end = 2024;


-- ============================================================
-- FORD
-- ============================================================

-- Ford Crown Victoria 1998-2004 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Crown Victoria' AND year_start = 1998 AND year_end = 2004;

-- Ford Crown Victoria 2005-2011 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Crown Victoria' AND year_start = 2005 AND year_end = 2011;

-- Ford Excursion 2000-2005 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Excursion' AND year_start = 2000 AND year_end = 2005;

-- Ford F-150 1997-2003 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-150' AND year_start = 1997 AND year_end = 2003;

-- Ford F-150 2005-2014 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-150' AND year_start = 2005 AND year_end = 2014;

-- Ford F-150 2015-2020 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142300',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-150' AND year_start = 2015 AND year_end = 2020;

-- Ford F-150 2021-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-150' AND year_start = 2021 AND year_end = 2024;

-- Ford Explorer 1998-2005 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U345',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Explorer' AND year_start = 1998 AND year_end = 2005;

-- Ford Explorer 2006-2010 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Explorer' AND year_start = 2006 AND year_end = 2010;

-- Ford Explorer 2011-2019 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY8609',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Explorer' AND year_start = 2011 AND year_end = 2019;

-- Ford Explorer 2020-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Explorer' AND year_start = 2020 AND year_end = 2024;

-- Ford Escape 2001-2007 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U345',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Escape' AND year_start = 2001 AND year_end = 2007;

-- Ford Escape 2008-2012 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Escape' AND year_start = 2008 AND year_end = 2012;

-- Ford Escape 2013-2019 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C31243300',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Escape' AND year_start = 2013 AND year_end = 2019;

-- Ford Escape 2020-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Escape' AND year_start = 2020 AND year_end = 2024;

-- Ford Edge 2007-2010 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = '164-R8040',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Edge' AND year_start = 2007 AND year_end = 2010;

-- Ford Edge 2011-2014 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY8609',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Edge' AND year_start = 2011 AND year_end = 2014;

-- Ford Edge 2015-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C31243300',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Edge' AND year_start = 2015 AND year_end = 2024;

-- Ford Expedition 1997-2002 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Expedition' AND year_start = 1997 AND year_end = 2002;

-- Ford Expedition 2003-2006 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Expedition' AND year_start = 2003 AND year_end = 2006;

-- Ford Expedition 2007-2017 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Expedition' AND year_start = 2007 AND year_end = 2017;

-- Ford Expedition 2018-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Expedition' AND year_start = 2018 AND year_end = 2024;

-- Ford F-250/F-350 Super Duty 2005-2010 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-250/F-350 Super Duty' AND year_start = 2005 AND year_end = 2010;

-- Ford F-250/F-350 Super Duty 2011-2016 (transponder)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-250/F-350 Super Duty' AND year_start = 2011 AND year_end = 2016;

-- Ford F-250/F-350 Super Duty 2017-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-250/F-350 Super Duty' AND year_start = 2017 AND year_end = 2024;

-- Ford F-350/F-450 Chassis Cab 2008-2016 (transponder)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-350/F-450 Chassis Cab' AND year_start = 2008 AND year_end = 2016;

-- Ford F-350/F-450 Chassis Cab 2017-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-350/F-450 Chassis Cab' AND year_start = 2017 AND year_end = 2024;

-- Ford Fiesta 2011-2019 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Fiesta' AND year_start = 2011 AND year_end = 2019;

-- Ford Five Hundred 2005-2007 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Five Hundred' AND year_start = 2005 AND year_end = 2007;

-- Ford Flex 2009-2012 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Flex' AND year_start = 2009 AND year_end = 2012;

-- Ford Flex 2013-2019 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY8609',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Flex' AND year_start = 2013 AND year_end = 2019;

-- Ford Focus 2000-2004 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Focus' AND year_start = 2000 AND year_end = 2004;

-- Ford Focus 2005-2007 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Focus' AND year_start = 2005 AND year_end = 2007;

-- Ford Focus 2008-2011 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Focus' AND year_start = 2008 AND year_end = 2011;

-- Ford Focus 2012-2018 (transponder)
UPDATE public.automotive_keys
SET fcc_id = 'OUCD6000022',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Focus' AND year_start = 2012 AND year_end = 2018;

-- Ford Freestyle 2005-2007 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Freestyle' AND year_start = 2005 AND year_end = 2007;

-- Ford Fusion 2006-2009 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Fusion' AND year_start = 2006 AND year_end = 2009;

-- Ford Fusion 2010-2012 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Fusion' AND year_start = 2010 AND year_end = 2012;

-- Ford Fusion 2013-2020 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C31243300',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Fusion' AND year_start = 2013 AND year_end = 2020;

-- Ford Maverick 2022-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Maverick' AND year_start = 2022 AND year_end = 2024;

-- Ford Mustang 1996-2004 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Mustang' AND year_start = 1996 AND year_end = 2004;

-- Ford Mustang 2005-2009 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Mustang' AND year_start = 2005 AND year_end = 2009;

-- Ford Mustang 2010-2014 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = '164-R8087',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Mustang' AND year_start = 2010 AND year_end = 2014;

-- Ford Mustang 2015-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C31243800',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Mustang' AND year_start = 2015 AND year_end = 2024;

-- Ford Ranger 1998-2004 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Ranger' AND year_start = 1998 AND year_end = 2004;

-- Ford Ranger 2005-2011 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Ranger' AND year_start = 2005 AND year_end = 2011;

-- Ford Ranger 2019-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142300',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Ranger' AND year_start = 2019 AND year_end = 2024;

-- Ford Taurus 1996-2000 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Taurus' AND year_start = 1996 AND year_end = 2000;

-- Ford Taurus 2001-2007 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Taurus' AND year_start = 2001 AND year_end = 2007;

-- Ford Taurus 2010-2019 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY8609',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Taurus' AND year_start = 2010 AND year_end = 2019;

-- Ford Transit 2015-2024 (transponder, separate remote)
UPDATE public.automotive_keys
SET fcc_id = '164-R8128',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Transit' AND year_start = 2015 AND year_end = 2024;

-- Ford Windstar 1999-2003 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Windstar' AND year_start = 1999 AND year_end = 2003;

-- Ford Bronco 2021-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Rear Window',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Bronco' AND year_start = 2021 AND year_end = 2024;

-- Ford Bronco Sport 2021-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Bronco Sport' AND year_start = 2021 AND year_end = 2024;


-- ============================================================
-- GENESIS
-- ============================================================

-- Genesis G70 2019-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'TQ8-FOB-4F36',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Genesis G70' AND year_start = 2019 AND year_end = 2024;

-- Genesis G80 2017-2020 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'SY5IGFGE04',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Genesis G80' AND year_start = 2017 AND year_end = 2020;

-- Genesis G80 2021-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'TQ8-FOB-4F35',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Genesis G80' AND year_start = 2021 AND year_end = 2024;

-- Genesis GV70 2022-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'TQ8-FOB-4F35',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Genesis GV70' AND year_start = 2022 AND year_end = 2024;

-- Genesis GV80 2021-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'TQ8-FOB-4F35',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Genesis GV80' AND year_start = 2021 AND year_end = 2024;


-- ============================================================
-- GMC
-- ============================================================

-- GMC Acadia 2007-2016 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Acadia' AND year_start = 2007 AND year_end = 2016;

-- GMC Acadia 2017-2024 (proximity)
UPDATE public.automotive_keys
SET fcc_id = 'HYQ4EA',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'B111',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Acadia' AND year_start = 2017 AND year_end = 2024;

-- GMC Canyon 2015-2024 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Canyon' AND year_start = 2015 AND year_end = 2024;

-- GMC Envoy 2002-2009 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Envoy' AND year_start = 2002 AND year_end = 2009;

-- GMC Jimmy 1998-2005 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Jimmy' AND year_start = 1998 AND year_end = 2005;

-- GMC Savana 1998-2009 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Savana' AND year_start = 1998 AND year_end = 2009;

-- GMC Savana 2010-2024 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Savana' AND year_start = 2010 AND year_end = 2024;

-- GMC Sierra 1500 2007-2013 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Sierra 1500' AND year_start = 2007 AND year_end = 2013;

-- GMC Sierra 1500 2014-2018 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Sierra 1500' AND year_start = 2014 AND year_end = 2018;

-- GMC Sierra 1500 2019-2024 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'B111',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Sierra 1500' AND year_start = 2019 AND year_end = 2024;

-- GMC Sierra 2500/3500 HD 2007-2014 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Sierra 2500/3500 HD' AND year_start = 2007 AND year_end = 2014;

-- GMC Sierra 2500/3500 HD 2015-2019 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Sierra 2500/3500 HD' AND year_start = 2015 AND year_end = 2019;

-- GMC Sierra 2500/3500 HD 2020-2024 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'B111',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Sierra 2500/3500 HD' AND year_start = 2020 AND year_end = 2024;

-- GMC Terrain 2010-2017 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Terrain' AND year_start = 2010 AND year_end = 2017;

-- GMC Terrain 2018-2024 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'B111',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Terrain' AND year_start = 2018 AND year_end = 2024;

-- GMC Yukon 2015-2020 (transponder)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Yukon' AND year_start = 2015 AND year_end = 2020;

-- GMC Yukon 2021-2024 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'B111',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Yukon' AND year_start = 2021 AND year_end = 2024;


-- ============================================================
-- HONDA
-- ============================================================

-- Honda Accord 1998-2002 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Accord' AND year_start = 1998 AND year_end = 2002;

-- Honda Accord 2003-2007 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Accord' AND year_start = 2003 AND year_end = 2007;

-- Honda Accord 2008-2017 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'ACJ932HK1210A',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Accord' AND year_start = 2008 AND year_end = 2017;

-- Honda Accord 2018-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Accord' AND year_start = 2018 AND year_end = 2024;

-- Honda Civic 1996-2000 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Civic' AND year_start = 1996 AND year_end = 2000;

-- Honda Civic 2001-2005 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Civic' AND year_start = 2001 AND year_end = 2005;

-- Honda Civic 2006-2015 (transponder/smart_key mixed)
UPDATE public.automotive_keys
SET fcc_id = 'ACJ932HK1210A',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Civic' AND year_start = 2006 AND year_end = 2015;

-- Honda Civic 2016-2021 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Civic' AND year_start = 2016 AND year_end = 2021;

-- Honda Civic 2022-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Civic' AND year_start = 2022 AND year_end = 2024;

-- Honda CR-V 1997-2001 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda CR-V' AND year_start = 1997 AND year_end = 2001;

-- Honda CR-V 2002-2006 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda CR-V' AND year_start = 2002 AND year_end = 2006;

-- Honda CR-V 2007-2011 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda CR-V' AND year_start = 2007 AND year_end = 2011;

-- Honda CR-V 2012-2016 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda CR-V' AND year_start = 2012 AND year_end = 2016;

-- Honda CR-V 2017-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'ACJ932HK1310A',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda CR-V' AND year_start = 2017 AND year_end = 2024;

-- Honda CR-Z 2011-2016 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda CR-Z' AND year_start = 2011 AND year_end = 2016;

-- Honda Crosstour 2010-2011 (transponder/smart mixed)
UPDATE public.automotive_keys
SET fcc_id = 'ACJ932HK1210A',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Crosstour' AND year_start = 2010 AND year_end = 2011;

-- Honda Crosstour 2012-2015 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Crosstour' AND year_start = 2012 AND year_end = 2015;

-- Honda Element 2003-2006 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Element' AND year_start = 2003 AND year_end = 2006;

-- Honda Element 2007-2011 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Element' AND year_start = 2007 AND year_end = 2011;

-- Honda Fit 2007-2008 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Fit' AND year_start = 2007 AND year_end = 2008;

-- Honda Fit 2009-2014 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Fit' AND year_start = 2009 AND year_end = 2014;

-- Honda Fit 2015-2020 (remote head key)
UPDATE public.automotive_keys
SET fcc_id = 'MLBHLIK6-1TA',
    remote_frequency = '315 MHz',
    battery_type = 'CR1616',
    buttons = 'Lock, Unlock, Panic',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Fit' AND year_start = 2015 AND year_end = 2020;

-- Honda HR-V 2016-2022 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'KR5V1X',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda HR-V' AND year_start = 2016 AND year_end = 2022;

-- Honda HR-V 2023-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda HR-V' AND year_start = 2023 AND year_end = 2024;

-- Honda Insight 2000-2006 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Insight' AND year_start = 2000 AND year_end = 2006;

-- Honda Insight 2010-2014 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'ACJ932HK1210A',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Insight' AND year_start = 2010 AND year_end = 2014;

-- Honda Insight 2019-2022 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Insight' AND year_start = 2019 AND year_end = 2022;

-- Honda Odyssey 1999-2004 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Odyssey' AND year_start = 1999 AND year_end = 2004;

-- Honda Odyssey 2005-2010 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Odyssey' AND year_start = 2005 AND year_end = 2010;

-- Honda Odyssey 2011-2017 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'ACJ932HK1310A',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Sliding Doors, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Odyssey' AND year_start = 2011 AND year_end = 2017;

-- Honda Odyssey 2018-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Sliding Doors, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Odyssey' AND year_start = 2018 AND year_end = 2024;

-- Honda Passport 1998-2002 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Passport' AND year_start = 1998 AND year_end = 2002;

-- Honda Passport 2019-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Passport' AND year_start = 2019 AND year_end = 2024;

-- Honda Pilot 2003-2008 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Pilot' AND year_start = 2003 AND year_end = 2008;

-- Honda Pilot 2009-2015 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Pilot' AND year_start = 2009 AND year_end = 2015;

-- Honda Pilot 2016-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Pilot' AND year_start = 2016 AND year_end = 2024;

-- Honda Prelude 1997-2001 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Prelude' AND year_start = 1997 AND year_end = 2001;

-- Honda Prologue 2024 (smart_key / GM platform)
UPDATE public.automotive_keys
SET fcc_id = 'HYQ1EA',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Prologue' AND year_start = 2024 AND year_end = 2024;

-- Honda Ridgeline 2006-2014 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Ridgeline' AND year_start = 2006 AND year_end = 2014;

-- Honda Ridgeline 2017-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'KR5V1X',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Ridgeline' AND year_start = 2017 AND year_end = 2024;

-- Honda S2000 2000-2009 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda S2000' AND year_start = 2000 AND year_end = 2009;


-- ============================================================
-- HYUNDAI
-- ============================================================

-- Hyundai Accent 2000-2005 (standard/transponder, no remote on key)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Accent' AND year_start = 2000 AND year_end = 2005;

-- Hyundai Accent 2006-2011 (transponder, no remote on key)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Accent' AND year_start = 2006 AND year_end = 2011;

-- Hyundai Accent 2012-2017 (remote head key)
UPDATE public.automotive_keys
SET fcc_id = 'TQ8-RKE-4F17',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic',
    emergency_key_blank = 'HY18',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Accent' AND year_start = 2012 AND year_end = 2017;

-- Hyundai Accent 2018-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'TQ8-FOB-4F11',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Accent' AND year_start = 2018 AND year_end = 2024;

-- Hyundai Azera 2006-2011 (transponder, no remote on key)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Azera' AND year_start = 2006 AND year_end = 2011;

-- Hyundai Azera 2012-2017 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Azera' AND year_start = 2012 AND year_end = 2017;

-- Hyundai Elantra 2001-2006 (standard/transponder, no remote on key)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Elantra' AND year_start = 2001 AND year_end = 2006;

-- Hyundai Elantra 2007-2010 (transponder, no remote on key)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Elantra' AND year_start = 2007 AND year_end = 2010;

-- Hyundai Elantra 2011-2016 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'SY5HMFNA04',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Elantra' AND year_start = 2011 AND year_end = 2016;

-- Hyundai Elantra 2017-2020 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Elantra' AND year_start = 2017 AND year_end = 2020;

-- Hyundai Elantra 2021-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Elantra' AND year_start = 2021 AND year_end = 2024;

-- Hyundai Genesis Coupe 2010-2016 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Genesis Coupe' AND year_start = 2010 AND year_end = 2016;

-- Hyundai Ioniq 2017-2022 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Ioniq' AND year_start = 2017 AND year_end = 2022;

-- Hyundai Ioniq 5 2022-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Ioniq 5' AND year_start = 2022 AND year_end = 2024;

-- Hyundai Kona 2018-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Kona' AND year_start = 2018 AND year_end = 2024;

-- Hyundai Palisade 2020-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Palisade' AND year_start = 2020 AND year_end = 2024;

-- Hyundai Santa Cruz 2022-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Santa Cruz' AND year_start = 2022 AND year_end = 2024;

-- Hyundai Santa Fe 2013-2018 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Santa Fe' AND year_start = 2013 AND year_end = 2018;

-- Hyundai Santa Fe 2019-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Santa Fe' AND year_start = 2019 AND year_end = 2024;

-- Hyundai Sonata 2011-2014 (transponder with remote)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Sonata' AND year_start = 2011 AND year_end = 2014;

-- Hyundai Sonata 2015-2019 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Sonata' AND year_start = 2015 AND year_end = 2019;

-- Hyundai Sonata 2020-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Sonata' AND year_start = 2020 AND year_end = 2024;

-- Hyundai Tiburon 2003-2008 (transponder, no remote on key)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Tiburon' AND year_start = 2003 AND year_end = 2008;

-- Hyundai Tucson 2016-2021 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Tucson' AND year_start = 2016 AND year_end = 2021;

-- Hyundai Tucson 2022-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Tucson' AND year_start = 2022 AND year_end = 2024;

-- Hyundai Veloster 2012-2017 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Veloster' AND year_start = 2012 AND year_end = 2017;

-- Hyundai Veloster 2019-2021 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Veloster' AND year_start = 2019 AND year_end = 2021;

-- Hyundai Venue 2020-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Venue' AND year_start = 2020 AND year_end = 2024;

-- Hyundai Veracruz 2007-2012 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Veracruz' AND year_start = 2007 AND year_end = 2012;
