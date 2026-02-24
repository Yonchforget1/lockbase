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
