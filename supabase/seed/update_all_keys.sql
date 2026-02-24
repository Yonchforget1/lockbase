-- ============================================================
-- Part 1: Add new columns + Update keys for manufacturers A-C
-- (Acura, Alfa Romeo, Audi, BMW, Buick, Cadillac, Chevrolet, Chrysler)
-- ============================================================

-- Add new columns
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS ic_number TEXT;
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS battery_type TEXT;
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS buttons TEXT;
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS test_key_blank TEXT;
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS image_url TEXT;

-- ============================================================
-- ACURA
-- ============================================================

-- Acura ILX 2013-2015 (smart_key, ACJ932HK1210A, Megamos 46, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'ACJ932HK1210A',
  ic_number = '3109A-CJ932HK1210A',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura ILX' AND year_start = 2013 AND year_end = 2015;

-- Acura ILX 2016-2022 (smart_key, KR5V1X, Hitag 3, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5V1X',
  ic_number = '7812D-V1X',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura ILX' AND year_start = 2016 AND year_end = 2022;

-- Acura Integra 2023-2024 (smart_key, KR5TP-4, Hitag Pro, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TP-4',
  ic_number = '7812D-TP4',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura Integra' AND year_start = 2023 AND year_end = 2024;

-- Acura MDX 2001-2006 (transponder, HD106, no remote)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HD106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Acura MDX' AND year_start = 2001 AND year_end = 2006;

-- Acura MDX 2007-2013 (smart_key, ACJ932HK1210A, Megamos 46, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'ACJ932HK1210A',
  ic_number = '3109A-CJ932HK1210A',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura MDX' AND year_start = 2007 AND year_end = 2013;

-- Acura MDX 2014-2021 (smart_key, KR5V1X, Hitag 3, 313.8 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5V1X',
  ic_number = '7812D-V1X',
  remote_frequency = '313.8 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura MDX' AND year_start = 2014 AND year_end = 2021;

-- Acura MDX 2022-2024 (smart_key, KR5TP-4, Hitag Pro, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TP-4',
  ic_number = '7812D-TP4',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura MDX' AND year_start = 2022 AND year_end = 2024;

-- Acura RDX 2007-2012 (transponder, HD106, no remote)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HD106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Acura RDX' AND year_start = 2007 AND year_end = 2012;

-- Acura RDX 2013-2018 (smart_key, KR5V1X, Hitag 3, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5V1X',
  ic_number = '7812D-V1X',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura RDX' AND year_start = 2013 AND year_end = 2018;

-- Acura RDX 2019-2024 (smart_key, KR5V2X, Hitag Pro, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5V2X',
  ic_number = '7812D-V2X',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura RDX' AND year_start = 2019 AND year_end = 2024;

-- Acura TLX 2015-2020 (smart_key, KR5V1X, Hitag 3, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5V1X',
  ic_number = '7812D-V1X',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura TLX' AND year_start = 2015 AND year_end = 2020;

-- Acura TLX 2021-2024 (smart_key, KR5TP-4, Hitag Pro, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TP-4',
  ic_number = '7812D-TP4',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura TLX' AND year_start = 2021 AND year_end = 2024;

-- ============================================================
-- ALFA ROMEO
-- ============================================================

-- Alfa Romeo Giulia 2017-2024 (smart_key, M3N-7393490, Hitag AES, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-7393490',
  ic_number = '7812A-7393490',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'SIP22',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Alfa Romeo Giulia%' AND year_start = 2017 AND year_end = 2024;

-- Alfa Romeo Stelvio 2018-2024 (smart_key, M3N-7393490, Hitag AES, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-7393490',
  ic_number = '7812A-7393490',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'SIP22',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Alfa Romeo Stelvio%' AND year_start = 2018 AND year_end = 2024;

-- Alfa Romeo Tonale 2023-2024 (smart_key, KR5ALFA434, Hitag AES, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5ALFA434',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'SIP22',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Alfa Romeo Tonale' AND year_start = 2023 AND year_end = 2024;

-- ============================================================
-- AUDI
-- ============================================================

-- Audi A3 2015-2024 (smart_key, IYZFBSB802, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi A3%' AND year_start = 2015 AND year_end = 2024;

-- Audi A4 B8 2009-2016 (smart_key, IYZFBSB802, Megamos 48, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi A4 (B8)%' AND year_start = 2009 AND year_end = 2016;

-- Audi A4 B9 2017-2024 (smart_key, IYZFBSB802, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi A4 (B9)%' AND year_start = 2017 AND year_end = 2024;

-- Audi A5 2018-2024 (smart_key, IYZFBSB802, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi A5%' AND year_start = 2018 AND year_end = 2024;

-- Audi A6 C7 2012-2018 (smart_key, 4M0959754, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = '4M0959754',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi A6 (C7)%' AND year_start = 2012 AND year_end = 2018;

-- Audi A6 C8 2019-2024 (smart_key, 4M0959754, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = '4M0959754',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi A6 (C8)%' AND year_start = 2019 AND year_end = 2024;

-- Audi Q3 2019-2024 (smart_key, IYZFBSB802, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi Q3%' AND year_start = 2019 AND year_end = 2024;

-- Audi Q5 8R 2009-2017 (smart_key, IYZFBSB802, Megamos 48, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi Q5 (8R)%' AND year_start = 2009 AND year_end = 2017;

-- Audi Q5 FY 2018-2024 (smart_key, IYZFBSB802, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi Q5 (FY)%' AND year_start = 2018 AND year_end = 2024;

-- Audi Q7 4L 2007-2015 (proximity, NBG010206T, Megamos 48, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'NBG010206T',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi Q7 (4L)%' AND year_start = 2007 AND year_end = 2015;

-- Audi Q7 4M 2017-2024 (smart_key, 4M0959754, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = '4M0959754',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi Q7 (4M)%' AND year_start = 2017 AND year_end = 2024;

-- Audi e-tron 2019-2024 (smart_key, 4M0959754, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = '4M0959754',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi e-tron%' AND year_start = 2019 AND year_end = 2024;

-- ============================================================
-- BMW
-- ============================================================

-- BMW 2 Series F22/F45 2014-2019 (smart_key, KR55WK49863, CAS4, 315/433 MHz)
-- Covers both original and duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49863',
  ic_number = '2694A-WK49863',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 2 Series (F22%' AND year_start = 2014 AND year_end = 2019;

-- BMW 2 Series F44/G42 2020-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 2 Series (F44%' AND year_start = 2020 AND year_end = 2024;

-- BMW 3 Series 1999-2005 (transponder, EWS3, HU58, no remote fob)
UPDATE public.automotive_keys SET
  fcc_id = 'LX8FZV',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU58',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 3 Series%' AND year_start = 1999 AND year_end = 2005;

-- BMW 3 Series 2006-2011 (transponder, CAS3, HU92)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49127',
  ic_number = '2694A-WK49127',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 3 Series%' AND year_start = 2006 AND year_end = 2011;

-- BMW 3 Series F30 2012-2018 (smart_key, KR55WK49863, CAS4, 315/433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49863',
  ic_number = '2694A-WK49863',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 3 Series (F30)%' AND year_start = 2012 AND year_end = 2018;

-- BMW 3 Series G20 2019-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 3 Series (G20)%' AND year_start = 2019 AND year_end = 2024;

-- BMW 4 Series G22 2021-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 4 Series (G22)%' AND year_start = 2021 AND year_end = 2024;

-- BMW 5 Series 1997-2003 (transponder, EWS3, HU58)
UPDATE public.automotive_keys SET
  fcc_id = 'LX8FZV',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU58',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 5 Series%' AND year_start = 1997 AND year_end = 2003;

-- BMW 5 Series 2004-2010 (transponder, CAS3, HU92)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49127',
  ic_number = '2694A-WK49127',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 5 Series%' AND year_start = 2004 AND year_end = 2010;

-- BMW 5 Series F10 2011-2016 (smart_key, YGOHUF5767, CAS4, 315/433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'YGOHUF5767',
  ic_number = NULL,
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 5 Series (F10)%' AND year_start = 2011 AND year_end = 2016;

-- BMW 5 Series G30 2017-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 5 Series (G30)%' AND year_start = 2017 AND year_end = 2024;

-- BMW 6 Series F06/F12/F13 2012-2017 (smart_key, YGOHUF5767, CAS4+, 315/433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'YGOHUF5767',
  ic_number = NULL,
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 6 Series (F06%' AND year_start = 2012 AND year_end = 2017;

-- BMW 6 Series GT G32 2018-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 6 Series GT%' AND year_start = 2018 AND year_end = 2024;

-- BMW 7 Series 2002-2008 (transponder, CAS2, HU92)
UPDATE public.automotive_keys SET
  fcc_id = 'LX8FZV',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 7 Series%' AND year_start = 2002 AND year_end = 2008;

-- BMW 7 Series 2009-2015 (smart_key, YGOHUF5767, CAS4, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'YGOHUF5767',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 7 Series%' AND year_start = 2009 AND year_end = 2015;

-- BMW 7 Series G11/G70 2016-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 7 Series (G11%' AND year_start = 2016 AND year_end = 2024;

-- BMW 8 Series G14/G15/G16 2019-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 8 Series%' AND year_start = 2019 AND year_end = 2024;

-- BMW X1 2013-2015 (transponder, CAS4, HU92)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49863',
  ic_number = '2694A-WK49863',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X1%' AND year_start = 2013 AND year_end = 2015;

-- BMW X1 F48/U11 2016-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X1 (F48%' AND year_start = 2016 AND year_end = 2024;

-- BMW X2 F39/U10 2018-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X2%' AND year_start = 2018 AND year_end = 2024;

-- BMW X3 2004-2010 (transponder, CAS3, HU92)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49127',
  ic_number = '2694A-WK49127',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X3%' AND year_start = 2004 AND year_end = 2010;

-- BMW X3 F25 2011-2017 (smart_key, KR55WK49863, CAS4, 315/433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49863',
  ic_number = '2694A-WK49863',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X3 (F25)%' AND year_start = 2011 AND year_end = 2017;

-- BMW X3 G01 2018-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X3 (G01)%' AND year_start = 2018 AND year_end = 2024;

-- BMW X4 F26 2015-2018 (smart_key, KR55WK49863, CAS4+, 315/433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49863',
  ic_number = '2694A-WK49863',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X4 (F26)%' AND year_start = 2015 AND year_end = 2018;

-- BMW X4 G02 2019-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X4 (G02)%' AND year_start = 2019 AND year_end = 2024;

-- BMW X5 2000-2006 (transponder, EWS3, HU58)
UPDATE public.automotive_keys SET
  fcc_id = 'LX8FZV',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU58',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X5%' AND year_start = 2000 AND year_end = 2006;

-- BMW X5 2007-2013 (smart_key, YGOHUF5767, CAS3, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'YGOHUF5767',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X5%' AND year_start = 2007 AND year_end = 2013;

-- BMW X5 F15 2014-2018 (smart_key, N5F-ID2A, CAS4+, 315/433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X5 (F15)%' AND year_start = 2014 AND year_end = 2018;

-- BMW X5 G05 2019-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X5 (G05)%' AND year_start = 2019 AND year_end = 2024;

-- BMW X6 F16 2015-2019 (smart_key, N5F-ID2A, CAS4+, 315/433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X6 (F16)%' AND year_start = 2015 AND year_end = 2019;

-- BMW X6 G06 2020-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X6 (G06)%' AND year_start = 2020 AND year_end = 2024;

-- BMW X7 G07 2019-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X7 (G07)%' AND year_start = 2019 AND year_end = 2024;

-- BMW Z4 G29 2019-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW Z4 (G29)%' AND year_start = 2019 AND year_end = 2024;

-- BMW i4 G26 2022-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW i4 (G26)%' AND year_start = 2022 AND year_end = 2024;

-- BMW iX I20 2022-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW iX%' AND year_start = 2022 AND year_end = 2024;

-- ============================================================
-- BUICK
-- ============================================================

-- Buick Enclave 2008-2017 (transponder, B106-PT, OHT01060512, flip key remote head)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Enclave' AND year_start = 2008 AND year_end = 2017;

-- Buick Enclave 2018-2024 (proximity, B111-PT, HYQ4EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4EA',
  ic_number = '1551A-4EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Enclave' AND year_start = 2018 AND year_end = 2024;

-- Buick Encore 2013-2017 (transponder, B106-PT, OHT01060512, flip key remote head)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Encore' AND year_start = 2013 AND year_end = 2017;

-- Buick Encore 2018-2024 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Encore' AND year_start = 2018 AND year_end = 2024;

-- Buick Envision 2016-2020 (transponder, B111-PT, M3N-32337100)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-32337100',
  ic_number = '7812A-32337100',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Envision' AND year_start = 2016 AND year_end = 2020;

-- Buick Envision 2021-2024 (proximity, B111-PT, HYQ4EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4EA',
  ic_number = '1551A-4EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Envision' AND year_start = 2021 AND year_end = 2024;

-- Buick LaCrosse 2010-2016 (transponder, B106-PT, OHT01060512, flip key remote head)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick LaCrosse' AND year_start = 2010 AND year_end = 2016;

-- Buick LaCrosse 2017-2019 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick LaCrosse' AND year_start = 2017 AND year_end = 2019;

-- Buick Regal 2011-2017 (transponder, B106-PT, OHT01060512, flip key remote head)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Regal' AND year_start = 2011 AND year_end = 2017;

-- Buick Regal 2018-2020 (proximity, B111-PT, HYQ4EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4EA',
  ic_number = '1551A-4EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Regal' AND year_start = 2018 AND year_end = 2020;

-- ============================================================
-- CADILLAC
-- ============================================================

-- Cadillac ATS 2013-2019 (proximity, B111-PT, HYQ2AB)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac ATS' AND year_start = 2013 AND year_end = 2019;

-- Cadillac CT4 2020-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac CT4' AND year_start = 2020 AND year_end = 2024;

-- Cadillac CT5 2020-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac CT5' AND year_start = 2020 AND year_end = 2024;

-- Cadillac CTS 2008-2013 (transponder, B106-PT, M3N5WY7777A, flip key remote head)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N5WY7777A',
  ic_number = '7812A-5WY7777A',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac CTS' AND year_start = 2008 AND year_end = 2013;

-- Cadillac CTS 2014-2019 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac CTS' AND year_start = 2014 AND year_end = 2019;

-- Cadillac DTS 2006-2011 (transponder, B106-PT, OUC6000066, remote head key)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'OUC6000066',
  ic_number = '3521A-6000066',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac DTS' AND year_start = 2006 AND year_end = 2011;

-- Cadillac DeVille 2000-2005 (transponder, B97, PK3)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'KOBUT1BT',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac DeVille' AND year_start = 2000 AND year_end = 2005;

-- Cadillac Escalade 2007-2014 (transponder, B106-PT, OUC6000066, remote head key)
UPDATE public.automotive_keys SET
  fcc_id = 'OUC6000066',
  ic_number = '3521A-6000066',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Escalade' AND year_start = 2007 AND year_end = 2014;

-- Cadillac Escalade 2015-2020 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Escalade' AND year_start = 2015 AND year_end = 2020;

-- Cadillac Escalade 2021-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Escalade' AND year_start = 2021 AND year_end = 2024;

-- Cadillac Escalade ESV 2007-2014 (transponder, B106-PT, OUC6000066)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'OUC6000066',
  ic_number = '3521A-6000066',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Escalade ESV' AND year_start = 2007 AND year_end = 2014;

-- Cadillac Escalade ESV 2015-2020 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Escalade ESV' AND year_start = 2015 AND year_end = 2020;

-- Cadillac Escalade ESV 2021-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Escalade ESV' AND year_start = 2021 AND year_end = 2024;

-- Cadillac Lyriq 2023-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Lyriq' AND year_start = 2023 AND year_end = 2024;

-- Cadillac SRX 2004-2009 (transponder, B106-PT, OUC6000066)
UPDATE public.automotive_keys SET
  fcc_id = 'OUC6000066',
  ic_number = '3521A-6000066',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac SRX' AND year_start = 2004 AND year_end = 2009;

-- Cadillac SRX 2010-2016 (proximity, B111-PT, NBG009768T)
UPDATE public.automotive_keys SET
  fcc_id = 'NBG009768T',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac SRX' AND year_start = 2010 AND year_end = 2016;

-- Cadillac STS 2005-2011 (transponder, B106-PT, OUC6000066)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'OUC6000066',
  ic_number = '3521A-6000066',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac STS' AND year_start = 2005 AND year_end = 2011;

-- Cadillac XT4 2019-2024 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac XT4' AND year_start = 2019 AND year_end = 2024;

-- Cadillac XT5 2017-2019 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac XT5' AND year_start = 2017 AND year_end = 2019;

-- Cadillac XT5 2020-2024 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac XT5' AND year_start = 2020 AND year_end = 2024;

-- Cadillac XT6 2020-2024 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac XT6' AND year_start = 2020 AND year_end = 2024;

-- ============================================================
-- CHEVROLET
-- ============================================================

-- Chevrolet Silverado 2019-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Silverado' AND year_start = 2019 AND year_end = 2024;

-- Chevrolet Silverado 2014-2018 (transponder, B111-PT, M3N-32337100, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-32337100',
  ic_number = '7812A-32337100',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Silverado' AND year_start = 2014 AND year_end = 2018;

-- Chevrolet Equinox 2018-2024 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Equinox' AND year_start = 2018 AND year_end = 2024;

-- Chevrolet Malibu 2016-2024 (proximity, B111-PT, HYQ4EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4EA',
  ic_number = '1551A-4EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Malibu' AND year_start = 2016 AND year_end = 2024;

-- Chevrolet Traverse 2018-2024 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Traverse' AND year_start = 2018 AND year_end = 2024;

-- Chevrolet Tahoe 2021-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Tahoe' AND year_start = 2021 AND year_end = 2024;

-- Chevrolet Tahoe 2015-2020 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Tahoe' AND year_start = 2015 AND year_end = 2020;

-- Chevrolet Tahoe 2007-2014 (transponder, B102-PT, OHT01060512, remote head key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Tahoe' AND year_start = 2007 AND year_end = 2014;

-- Chevrolet Suburban 2021-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Suburban' AND year_start = 2021 AND year_end = 2024;

-- Chevrolet Suburban 2015-2020 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Suburban' AND year_start = 2015 AND year_end = 2020;

-- Chevrolet Suburban 2007-2014 (transponder, B102-PT, OHT01060512, remote head key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Suburban' AND year_start = 2007 AND year_end = 2014;

-- Chevrolet Camaro 2016-2024 (proximity, B111-PT, HYQ4EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4EA',
  ic_number = '1551A-4EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Camaro' AND year_start = 2016 AND year_end = 2024;

-- Chevrolet Camaro 2010-2015 (transponder, B111-PT, OHT01060512, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Camaro' AND year_start = 2010 AND year_end = 2015;

-- Chevrolet Camaro 1998-2002 (transponder, B97, PK3 - transponder only, separate remote)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Camaro' AND year_start = 1998 AND year_end = 2002;

-- Chevrolet Colorado 2015-2024 (transponder, B111-PT, M3N-32337100, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-32337100',
  ic_number = '7812A-32337100',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Colorado' AND year_start = 2015 AND year_end = 2024;

-- Chevrolet Colorado 2004-2012 (transponder, B102, PK3 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Colorado' AND year_start = 2004 AND year_end = 2012;

-- Chevrolet Blazer 2019-2024 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Blazer' AND year_start = 2019 AND year_end = 2024;

-- Chevrolet Trailblazer 2021-2024 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Trailblazer' AND year_start = 2021 AND year_end = 2024;

-- Chevrolet Impala 2014-2020 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Impala' AND year_start = 2014 AND year_end = 2020;

-- Chevrolet Impala 2006-2013 (transponder, B102-PT, OHT01060512, remote head key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Impala' AND year_start = 2006 AND year_end = 2013;

-- Chevrolet Impala 2000-2005 (transponder, B97, PK3 - transponder only, separate remote)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Impala' AND year_start = 2000 AND year_end = 2005;

-- Chevrolet Cruze 2016-2019 (proximity, B111-PT, HYQ4EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4EA',
  ic_number = '1551A-4EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Cruze' AND year_start = 2016 AND year_end = 2019;

-- Chevrolet Cruze 2011-2015 (transponder, B111-PT, OHT01060512, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Cruze' AND year_start = 2011 AND year_end = 2015;

-- Chevrolet Sonic 2012-2020 (transponder, B111-PT, OHT01060512, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Sonic' AND year_start = 2012 AND year_end = 2020;

-- Chevrolet Spark 2013-2022 (transponder, B111-PT, OHT01060512, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Spark' AND year_start = 2013 AND year_end = 2022;

-- Chevrolet Trax 2024 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Trax' AND year_start = 2024 AND year_end = 2024;

-- Chevrolet Trax 2015-2022 (transponder, B111-PT, OHT01060512, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Trax' AND year_start = 2015 AND year_end = 2022;

-- Chevrolet Cobalt 2005-2010 (transponder, B102, PK3+ - transponder only, separate remote)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Cobalt' AND year_start = 2005 AND year_end = 2010;

-- Chevrolet HHR 2006-2011 (transponder, B102, PK3+ - transponder only, separate remote)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet HHR' AND year_start = 2006 AND year_end = 2011;

-- Chevrolet Avalanche 2007-2013 (transponder, B102-PT, OHT01060512, remote head key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Avalanche' AND year_start = 2007 AND year_end = 2013;

-- Chevrolet Avalanche 2002-2006 (transponder, B97, PK3 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Avalanche' AND year_start = 2002 AND year_end = 2006;

-- Chevrolet Monte Carlo 2000-2007 (transponder, B97, PK3 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Monte Carlo' AND year_start = 2000 AND year_end = 2007;

-- Chevrolet S-10 1998-2004 (transponder, B97, PK3 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet S-10' AND year_start = 1998 AND year_end = 2004;

-- Chevrolet Express 2010-2024 (transponder, B102-PT, OHT01060512, remote head key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Express' AND year_start = 2010 AND year_end = 2024;

-- Chevrolet Express 1998-2009 (transponder, B97, PK3 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Express' AND year_start = 1998 AND year_end = 2009;

-- ============================================================
-- CHRYSLER
-- ============================================================

-- Chrysler 300 2019-2024 (smart_key, M3N-40821302, Hitag AES, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-40821302',
  ic_number = '7812A-40821302',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'Y159',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler 300' AND year_start = 2019 AND year_end = 2024;

-- Chrysler 300 2011-2018 (smart_key, M3N-40821302, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-40821302',
  ic_number = '7812A-40821302',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler 300' AND year_start = 2011 AND year_end = 2018;

-- Chrysler Pacifica 2017-2024 (smart_key, M3N-97395900, Hitag AES, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-97395900',
  ic_number = '7812A-97395900',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Sliding Doors, Hatch, Panic',
  emergency_key_blank = 'Y159',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Pacifica' AND year_start = 2017 AND year_end = 2024;

-- Chrysler Town & Country 2008-2016 (smart_key, M3N5WY783X, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N5WY783X',
  ic_number = '7812A-5WY783X',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Sliding Doors, Hatch, Panic',
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Town & Country' AND year_start = 2008 AND year_end = 2016;

-- Chrysler 200 2015-2017 (smart_key, M3N-40821302, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-40821302',
  ic_number = '7812A-40821302',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'Y159',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler 200' AND year_start = 2015 AND year_end = 2017;

-- Chrysler 200 2011-2014 (smart_key, M3N-40821302, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-40821302',
  ic_number = '7812A-40821302',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler 200' AND year_start = 2011 AND year_end = 2014;

-- Chrysler Sebring 2007-2010 (smart_key/Fobik, OHT692427AA, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT692427AA',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Sebring' AND year_start = 2007 AND year_end = 2010;

-- Chrysler Sebring 2001-2006 (transponder, Y160, Megamos 46 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Sebring' AND year_start = 2001 AND year_end = 2006;

-- Chrysler PT Cruiser 2006-2010 (smart_key/Fobik, OHT692427AA, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT692427AA',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler PT Cruiser' AND year_start = 2006 AND year_end = 2010;

-- Chrysler PT Cruiser 2001-2005 (transponder, Y160, Megamos 46 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler PT Cruiser' AND year_start = 2001 AND year_end = 2005;

-- Chrysler Crossfire 2004-2008 (transponder, HU64, Mercedes IR - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU64',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Crossfire' AND year_start = 2004 AND year_end = 2008;

-- Chrysler Aspen 2007-2009 (smart_key/Fobik, OHT692427AA, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT692427AA',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Hatch, Panic',
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Aspen' AND year_start = 2007 AND year_end = 2009;

-- Chrysler Concorde 1998-2004 (transponder, Y160, Megamos 46 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Concorde' AND year_start = 1998 AND year_end = 2004;

-- Chrysler LHS 1999-2001 (transponder, Y160, Megamos 46 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler LHS' AND year_start = 1999 AND year_end = 2001;
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
