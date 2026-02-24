-- Fill missing older year ranges for Subaru, BMW, Mercedes-Benz, Volkswagen, Mazda, Volvo, Acura, Lexus, RAM, Mitsubishi, and Infiniti models
-- Each block looks up manufacturer and model by slug, then inserts only if the year range doesn't already exist

-- ============================================================
-- SUBARU
-- ============================================================

-- Subaru Forester 1998-2004
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'forester';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1998 AND year_end = 2004) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2004) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Subaru Forester', 'SUB82', 'Texas 4D62', '4D62', 'transponder', '1st/2nd gen Forester. Texas 4D62 transponder chip. SUB82 key blank (NSN19 profile). Requires Subaru Select Monitor or aftermarket tool for programming.', false, true, 1998, 2004);
  END IF;
END $$;

-- Subaru Forester 2005-2008
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'forester';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2005 AND year_end = 2008) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2008) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Subaru Forester', 'SUB82', 'Texas 4D62', '4D62', 'transponder', '2nd gen Forester. Texas 4D62 transponder chip. SUB82 key blank. OBD programmable via Subaru Select Monitor or aftermarket tool.', false, true, 2005, 2008);
  END IF;
END $$;

-- Subaru Forester 2009-2013
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'forester';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2009 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Subaru Forester', 'NSN19', 'Texas G Chip', 'G chip (Texas Crypto 80-bit)', 'transponder', '3rd gen Forester. Texas G chip (Crypto 80-bit) transponder. NSN19 key blank. OBD programmable via Subaru Select Monitor or aftermarket tool.', false, true, 2009, 2013);
  END IF;
END $$;

-- Subaru Outback 2000-2004
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'outback';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2000 AND year_end = 2004) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2004) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Subaru Outback', 'SUB82', 'Texas 4D62', '4D62', 'transponder', '2nd/3rd gen Outback. Texas 4D62 transponder chip. SUB82 key blank. Subaru Select Monitor or aftermarket tool required.', false, true, 2000, 2004);
  END IF;
END $$;

-- Subaru Outback 2005-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'outback';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2005 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Subaru Outback', 'SUB82', 'Texas 4D62', '4D62', 'transponder', '3rd gen Outback. Texas 4D62 transponder chip. SUB82 key blank. OBD programmable via Subaru Select Monitor or aftermarket tool.', false, true, 2005, 2009);
  END IF;
END $$;

-- Subaru Impreza 1998-2004
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'impreza';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1998 AND year_end = 2004) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2004) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Subaru Impreza', 'SUB82', 'Texas 4D62', '4D62', 'transponder', '2nd gen Impreza. Texas 4D62 transponder chip. SUB82 key blank. Subaru Select Monitor or aftermarket tool required for programming.', false, true, 1998, 2004);
  END IF;
END $$;

-- Subaru Impreza 2005-2011
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'impreza';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2005 AND year_end = 2011) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2011) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Subaru Impreza', 'SUB82', 'Texas 4D62', '4D62', 'transponder', '3rd gen Impreza. Texas 4D62 transponder chip. SUB82 key blank. OBD programmable via Subaru Select Monitor or aftermarket tool.', false, true, 2005, 2011);
  END IF;
END $$;

-- Subaru Legacy 2000-2004
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'legacy';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2000 AND year_end = 2004) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2004) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Subaru Legacy', 'SUB82', 'Texas 4D62', '4D62', 'transponder', '3rd gen Legacy. Texas 4D62 transponder chip. SUB82 key blank. Subaru Select Monitor or aftermarket tool required.', false, true, 2000, 2004);
  END IF;
END $$;

-- Subaru Legacy 2005-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'legacy';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2005 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Subaru Legacy', 'SUB82', 'Texas 4D62', '4D62', 'transponder', '4th gen Legacy. Texas 4D62 transponder chip. SUB82 key blank. OBD programmable via Subaru Select Monitor or aftermarket tool.', false, true, 2005, 2009);
  END IF;
END $$;

-- Subaru Legacy 2010-2014
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'legacy';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2010 AND year_end = 2014) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2014) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Subaru Legacy', 'NSN19', 'Texas G Chip', 'G chip (Texas Crypto 80-bit)', 'transponder', '5th gen Legacy. Texas G chip (Crypto 80-bit) transponder. NSN19 key blank. OBD programmable via Subaru Select Monitor or aftermarket tool.', false, true, 2010, 2014);
  END IF;
END $$;

-- Subaru WRX 2002-2007
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'wrx';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2002 AND year_end = 2007) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2002, 2007) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Subaru WRX', 'SUB82', 'Texas 4D62', '4D62', 'transponder', '2nd gen Impreza WRX. Texas 4D62 transponder chip. SUB82 key blank. Subaru Select Monitor or aftermarket tool required.', false, true, 2002, 2007);
  END IF;
END $$;

-- Subaru WRX 2008-2014
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'wrx';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2008 AND year_end = 2014) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2014) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Subaru WRX', 'NSN19', 'Texas G Chip', 'G chip (Texas Crypto 80-bit)', 'transponder', '3rd gen WRX. Texas G chip (Crypto 80-bit) transponder. NSN19 key blank. OBD programmable via Subaru Select Monitor or aftermarket tool.', false, true, 2008, 2014);
  END IF;
END $$;

-- ============================================================
-- BMW
-- ============================================================

-- BMW 3 Series 1999-2005
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'bmw';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = '3-series';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1999 AND year_end = 2005) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1999, 2005) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'BMW 3 Series', 'HU58', 'EWS3 / Philips 44', 'PCF7935 (44 chip)', 'transponder', 'E46 3 Series. EWS3 immobilizer with Philips 44 (PCF7935) transponder. HU58 key blank. Programmable via BMW ISTA/P or aftermarket EWS editor. Key data stored in EWS module.', false, true, 1999, 2005);
  END IF;
END $$;

-- BMW 3 Series 2006-2011
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'bmw';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = '3-series';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2006 AND year_end = 2011) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2011) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'BMW 3 Series', 'HU92', 'CAS3 / Philips 46', 'PCF7945 (46 chip)', 'transponder', 'E90 3 Series. CAS3 system with Philips 46 (PCF7945) transponder. HU92 key blank. Programmable via BMW ISTA/P or CAS3 aftermarket tool. Key must be synced with CAS module.', false, true, 2006, 2011);
  END IF;
END $$;

-- BMW 5 Series 1997-2003
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'bmw';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = '5-series';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1997 AND year_end = 2003) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1997, 2003) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'BMW 5 Series', 'HU58', 'EWS3 / Philips 44', 'PCF7935 (44 chip)', 'transponder', 'E39 5 Series. EWS3 immobilizer with Philips 44 (PCF7935) transponder. HU58 key blank. Programmable via BMW ISTA/P or aftermarket EWS editor.', false, true, 1997, 2003);
  END IF;
END $$;

-- BMW 5 Series 2004-2010
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'bmw';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = '5-series';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2004 AND year_end = 2010) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2010) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'BMW 5 Series', 'HU92', 'CAS3 / Philips 46', 'PCF7945 (46 chip)', 'transponder', 'E60 5 Series. CAS3 system with Philips 46 (PCF7945) transponder. HU92 key blank. Programmable via BMW ISTA/P or CAS3 aftermarket tool.', false, true, 2004, 2010);
  END IF;
END $$;

-- BMW X3 2004-2010
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'bmw';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'x3';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2004 AND year_end = 2010) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2010) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'BMW X3', 'HU92', 'CAS3 / Philips 46', 'PCF7945 (46 chip)', 'transponder', 'E83 X3. CAS3 system with Philips 46 (PCF7945) transponder. HU92 key blank. Programmable via BMW ISTA/P or CAS3 aftermarket tool.', false, true, 2004, 2010);
  END IF;
END $$;

-- BMW X5 2000-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'bmw';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'x5';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2000 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'BMW X5', 'HU58', 'EWS3 / Philips 44', 'PCF7935 (44 chip)', 'transponder', 'E53 X5. EWS3 immobilizer with Philips 44 (PCF7935) transponder. HU58 key blank. Programmable via BMW ISTA/P or aftermarket EWS editor.', false, true, 2000, 2006);
  END IF;
END $$;

-- BMW X5 2007-2013
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'bmw';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'x5';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'BMW X5', 'HU92', 'CAS3 / Philips 46', 'PCF7945 (46 chip)', '315 MHz', 'smart_key', 'YGOHUF5767', 'HU92', 'E70 X5. CAS3 system with Philips 46 transponder. Smart key with comfort access available. HU92 emergency key blank. Programmable via BMW ISTA/P or CAS3 aftermarket tool.', false, true, 2007, 2013);
  END IF;
END $$;

-- BMW 7 Series 2002-2008
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'bmw';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = '7-series';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2002 AND year_end = 2008) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2002, 2008) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'BMW 7 Series', 'HU92', 'CAS2 / Philips 46', 'PCF7942 (46 chip)', 'transponder', 'E65/E66 7 Series. CAS2 system with Philips 46 (PCF7942) transponder. HU92 key blank. Programmable via BMW ISTA/P or CAS aftermarket tool. Comfort access smart key optional.', false, true, 2002, 2008);
  END IF;
END $$;

-- BMW 7 Series 2009-2015
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'bmw';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = '7-series';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2009 AND year_end = 2015) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2015) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'BMW 7 Series', 'HU92', 'CAS4 / Hitag2 Pro', 'PCF7953 (Hitag2 Pro)', '315 MHz', 'smart_key', 'YGOHUF5767', 'HU92', 'F01/F02 7 Series. CAS4 system with Hitag2 Pro (PCF7953) transponder. Smart key with comfort access. HU92 emergency key blank. Requires BMW ISTA/P or CAS4 aftermarket tool.', false, true, 2009, 2015);
  END IF;
END $$;

-- BMW X1 2013-2015
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'bmw';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'x1';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2013 AND year_end = 2015) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2015) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'BMW X1', 'HU92', 'CAS4 / Hitag2 Pro', 'PCF7953 (Hitag2 Pro)', 'transponder', 'E84 X1. CAS4 system with Hitag2 Pro (PCF7953) transponder. HU92 key blank. Requires BMW ISTA/P or CAS4 aftermarket tool.', false, true, 2013, 2015);
  END IF;
END $$;

-- ============================================================
-- MERCEDES-BENZ
-- ============================================================

-- Mercedes-Benz C-Class 1996-2000
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mercedes-benz';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'c-class';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1996 AND year_end = 2000) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1996, 2000) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mercedes-Benz C-Class', 'HU64', 'None', 'No transponder', 'standard', 'W202 C-Class. No transponder immobilizer on most models. HU64 key blank. Infrared remote head key available. Key cut by code or duplicate. Some late models may have basic immobilizer.', false, false, 1996, 2000);
  END IF;
END $$;

-- Mercedes-Benz C-Class 2001-2007
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mercedes-benz';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'c-class';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2007) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2007) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mercedes-Benz C-Class', 'HU64-PT', 'Philips 44 EIS', 'PCF7935 (44 chip)', 'transponder', 'W203 C-Class. EIS (Electronic Ignition Switch) with Philips 44 transponder. HU64-PT transponder key blank. Requires Mercedes Star Diagnostic (SDS) or aftermarket EIS/ELV tool. Key data stored in EIS module.', false, true, 2001, 2007);
  END IF;
END $$;

-- Mercedes-Benz C-Class 2008-2014
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mercedes-benz';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'c-class';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2008 AND year_end = 2014) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2014) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mercedes-Benz C-Class', 'HU64-PT', 'NEC/BGA Chrome Key', 'NEC (BGA)', '315 MHz', 'smart_key', 'IYZ-3312', 'HU64', 'W204 C-Class. NEC/BGA chrome smart key (Keyless Go). Push-button start on most trims. HU64 emergency key blade. Requires Mercedes Star Diagnostic or CGDI/VVDI MB BGA tool. Key must be written to EIS.', false, true, 2008, 2014);
  END IF;
END $$;

-- Mercedes-Benz E-Class 1996-2002
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mercedes-benz';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'e-class';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1996 AND year_end = 2002) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1996, 2002) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mercedes-Benz E-Class', 'HU64', 'DAS System', 'IR/DAS', 'standard', 'W210 E-Class. DAS (Drive Authorization System) with infrared key. HU64 key blank. No traditional transponder chip. IR signal in key head communicates with DAS module. Requires Mercedes SDS or aftermarket DAS tool.', false, false, 1996, 2002);
  END IF;
END $$;

-- Mercedes-Benz E-Class 2003-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mercedes-benz';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'e-class';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2003 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mercedes-Benz E-Class', 'HU64-PT', 'Philips 44 EIS', 'PCF7935 (44 chip)', '315 MHz', 'smart_key', 'IYZ-3312', 'HU64', 'W211 E-Class. EIS with Philips 44 transponder. Chrome smart key (Keyless Go) available. HU64 emergency key blank. Requires Mercedes SDS or CGDI/VVDI MB tool.', false, true, 2003, 2009);
  END IF;
END $$;

-- Mercedes-Benz S-Class 1999-2005
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mercedes-benz';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 's-class';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1999 AND year_end = 2005) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1999, 2005) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mercedes-Benz S-Class', 'HU64', 'IR Key / DAS System', 'IR/DAS', 'transponder', 'W220 S-Class. DAS (Drive Authorization System) with infrared key. HU64 key blank. Smartkey system with IR communication. Requires Mercedes SDS or aftermarket DAS tool for key programming.', false, true, 1999, 2005);
  END IF;
END $$;

-- Mercedes-Benz S-Class 2006-2013
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mercedes-benz';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 's-class';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2006 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mercedes-Benz S-Class', 'HU64-PT', 'NEC/BGA Chrome Key', 'NEC (BGA)', '315 MHz', 'smart_key', 'IYZ-3312', 'HU64', 'W221 S-Class. NEC/BGA chrome smart key (Keyless Go). Push-button start standard. HU64 emergency key blade. Requires Mercedes SDS or CGDI/VVDI MB BGA tool.', false, true, 2006, 2013);
  END IF;
END $$;

-- ============================================================
-- VOLKSWAGEN
-- ============================================================

-- Volkswagen Jetta 1999-2005
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volkswagen';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'jetta';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1999 AND year_end = 2005) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1999, 2005) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Volkswagen Jetta', 'HU66', 'Philips 48 / CAN', 'Megamos 48 (CAN chip)', '315 MHz', 'transponder', 'NBG735868T', 'Mk4 Jetta. Megamos 48 (CAN) transponder. HU66 key blank. Immobilizer 3 system. PIN code required from dealer or extracted via diagnostics. OBD programmable with PIN via VAG-COM/VCDS or aftermarket tool.', true, true, 1999, 2005);
  END IF;
END $$;

-- Volkswagen Jetta 2006-2010
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volkswagen';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'jetta';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2006 AND year_end = 2010) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2010) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Volkswagen Jetta', 'HU66', 'Megamos 48', 'Megamos 48', '315 MHz', 'transponder', 'NBG010180T', 'Mk5 Jetta. Megamos 48 transponder. HU66 key blank. Immobilizer 4 system. PIN code required. OBD programmable via VAG-COM/VCDS or aftermarket tool.', true, true, 2006, 2010);
  END IF;
END $$;

-- Volkswagen Passat 1998-2005
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volkswagen';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'passat';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1998 AND year_end = 2005) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2005) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Volkswagen Passat', 'HU66', 'Philips 48 / CAN', 'Megamos 48 (CAN chip)', 'transponder', 'B5/B5.5 Passat. Megamos 48 (CAN) transponder. HU66 key blank. Immobilizer 3 system. PIN required from dealer or extracted via diagnostics. OBD programmable with PIN.', true, true, 1998, 2005);
  END IF;
END $$;

-- Volkswagen Passat 2006-2011
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volkswagen';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'passat';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2006 AND year_end = 2011) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2011) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Volkswagen Passat', 'HU66', 'Megamos 48', 'Megamos 48', 'transponder', 'B6 Passat. Megamos 48 transponder. HU66 key blank. Immobilizer 4 system. PIN code required. OBD programmable via VAG-COM/VCDS or aftermarket tool.', true, true, 2006, 2011);
  END IF;
END $$;

-- Volkswagen Golf/GTI 1999-2005
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volkswagen';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'golf-gti';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1999 AND year_end = 2005) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1999, 2005) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Volkswagen Golf/GTI', 'HU66', 'Philips 48 / CAN', 'Megamos 48 (CAN chip)', 'transponder', 'Mk4 Golf/GTI. Megamos 48 (CAN) transponder. HU66 key blank. Immobilizer 3 system. PIN required from dealer or extracted via diagnostics. OBD programmable with PIN.', true, true, 1999, 2005);
  END IF;
END $$;

-- Volkswagen Golf/GTI 2006-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volkswagen';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'golf-gti';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2006 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Volkswagen Golf/GTI', 'HU66', 'Megamos 48', 'Megamos 48', 'transponder', 'Mk5 Golf/GTI. Megamos 48 transponder. HU66 key blank. Immobilizer 4 system. PIN code required. OBD programmable via VAG-COM/VCDS or aftermarket tool.', true, true, 2006, 2009);
  END IF;
END $$;

-- ============================================================
-- MAZDA
-- ============================================================

-- Mazda3 2004-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mazda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'mazda3';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2004 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mazda3', 'MAZ24R', 'Texas 4D63', '4D63 (40-bit)', '313.8 MHz', 'transponder', 'KPU41846', '1st gen Mazda3. Texas 4D63 (40-bit) transponder. MAZ24R key blank. OBD programmable via Mazda IDS or aftermarket tool. Separate remote fob FCC: KPU41846.', false, true, 2004, 2009);
  END IF;
END $$;

-- Mazda3 2010-2013
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mazda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'mazda3';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2010 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mazda3', 'MAZ24R', 'Texas 4D63 80-bit', '4D63 (80-bit)', 'transponder', '2nd gen Mazda3. Texas 4D63 (80-bit) transponder. MAZ24R key blank. OBD programmable via Mazda IDS or aftermarket tool with 80-bit capability.', false, true, 2010, 2013);
  END IF;
END $$;

-- Mazda6 2003-2008
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mazda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'mazda6';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2003 AND year_end = 2008) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2008) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mazda6', 'MAZ24R', 'Texas 4D63', '4D63 (40-bit)', '313.8 MHz', 'transponder', 'KPU41846', '1st gen Mazda6. Texas 4D63 (40-bit) transponder. MAZ24R key blank. OBD programmable via Mazda IDS or aftermarket tool. Separate remote fob FCC: KPU41846.', false, true, 2003, 2008);
  END IF;
END $$;

-- Mazda6 2009-2013
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mazda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'mazda6';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2009 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mazda6', 'MAZ24R', 'Texas 4D63 80-bit', '4D63 (80-bit)', 'transponder', '2nd gen Mazda6. Texas 4D63 (80-bit) transponder. MAZ24R key blank. OBD programmable via Mazda IDS or aftermarket tool with 80-bit capability.', false, true, 2009, 2013);
  END IF;
END $$;

-- Mazda CX-9 2007-2015
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mazda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'cx-9';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2015) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2015) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mazda CX-9', 'MAZ24R', 'Texas 4D63 80-bit', '4D63 (80-bit)', '313.8 MHz', 'transponder', 'WAZX1T763SKE11A04', '1st gen CX-9. Texas 4D63 (80-bit) transponder. MAZ24R key blank. OBD programmable via Mazda IDS or aftermarket tool with 80-bit capability.', false, true, 2007, 2015);
  END IF;
END $$;

-- Mazda MX-5 Miata 1999-2005
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mazda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'mx-5-miata';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1999 AND year_end = 2005) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1999, 2005) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mazda MX-5 Miata', 'MAZ24R', 'Texas 4D63', '4D63 (40-bit)', 'transponder', 'NB Miata. Texas 4D63 (40-bit) transponder. MAZ24R key blank. OBD programmable via Mazda IDS or aftermarket tool.', false, true, 1999, 2005);
  END IF;
END $$;

-- Mazda MX-5 Miata 2006-2015
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mazda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'mx-5-miata';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2006 AND year_end = 2015) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2015) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mazda MX-5 Miata', 'MAZ24R', 'Texas 4D63 80-bit', '4D63 (80-bit)', 'transponder', 'NC Miata. Texas 4D63 (80-bit) transponder. MAZ24R key blank. OBD programmable via Mazda IDS or aftermarket tool with 80-bit capability.', false, true, 2006, 2015);
  END IF;
END $$;

-- ============================================================
-- VOLVO
-- ============================================================

-- Volvo XC90 2003-2015
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volvo';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'xc90';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2003 AND year_end = 2015) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2015) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Volvo XC90', 'NE66', 'Texas 4D', 'Texas 4D (4C clone capable)', '315 MHz', 'transponder', 'LQNP2T-APU', '1st gen XC90. Texas 4D transponder. NE66 key blank. OBD programmable via Volvo VIDA/DiCE or aftermarket tool. Remote fob FCC: LQNP2T-APU. Some models use integrated remote head key.', false, true, 2003, 2015);
  END IF;
END $$;

-- Volvo XC60 2010-2017
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volvo';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'xc60';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2010 AND year_end = 2017) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2017) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Volvo XC60', 'NE66', 'Texas 4D', 'Texas 4D', '315 MHz', 'transponder', 'KR55WK49264', '1st gen XC60. Texas 4D transponder. NE66 key blank. OBD programmable via Volvo VIDA/DiCE or aftermarket tool. Remote head key FCC: KR55WK49264.', false, true, 2010, 2017);
  END IF;
END $$;

-- Volvo S60 2001-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volvo';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 's60';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Volvo S60', 'NE66', 'Texas 4D', 'Texas 4D', 'transponder', '1st gen S60. Texas 4D transponder. NE66 key blank. OBD programmable via Volvo VIDA/DiCE or aftermarket tool.', false, true, 2001, 2009);
  END IF;
END $$;

-- Volvo S60 2011-2018
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volvo';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 's60';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2011 AND year_end = 2018) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2018) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Volvo S60', 'NE66', 'Texas 4D / Smart Key', 'Texas 4D', '315 MHz', 'smart_key', 'KR55WK49264', 'NE66', '2nd gen S60. Texas 4D transponder with smart key available on select trims. NE66 emergency key blank. OBD programmable via Volvo VIDA/DiCE or aftermarket tool. Push-button start on smart key equipped models.', false, true, 2011, 2018);
  END IF;
END $$;

-- Volvo V60 2015-2018
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volvo';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'v60';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2015 AND year_end = 2018) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2018) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Volvo V60', 'NE66', 'Smart Key', 'Texas 4D', '315 MHz', 'smart_key', 'KR55WK49264', 'NE66', '1st gen V60. Smart key with push-button start. NE66 emergency key blank. OBD programmable via Volvo VIDA/DiCE or aftermarket tool.', false, true, 2015, 2018);
  END IF;
END $$;

-- ============================================================
-- ACURA
-- ============================================================

-- Acura MDX 2001-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'acura';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'mdx';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Acura MDX', 'HD106', 'Honda 46 / G Chip', '46 chip (G)', 'transponder', '1st gen MDX. Honda/Acura 46 (G chip) transponder. HD106 key blank. OBD programmable via Honda HDS or aftermarket tool. Self-learn possible with 2 working master keys on some years.', false, true, 2001, 2006);
  END IF;
END $$;

-- Acura RDX 2007-2012
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'acura';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'rdx';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2012) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2012) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Acura RDX', 'HD106', 'Honda 46', '46 chip', 'transponder', '1st gen RDX. Honda/Acura 46 chip transponder. HD106 key blank. OBD programmable via Honda HDS or aftermarket tool.', false, true, 2007, 2012);
  END IF;
END $$;

-- ============================================================
-- LEXUS
-- ============================================================

-- Lexus RX 1999-2003
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lexus';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'rx';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1999 AND year_end = 2003) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1999, 2003) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Lexus RX', 'TOY43', 'Texas Fixed Code 4C', '4C', 'transponder', 'RX 300 (1st gen). 4C fixed-code transponder. TOY43 key blank. On-board programming with 2 working master keys or via Toyota Techstream.', false, true, 1999, 2003);
  END IF;
END $$;

-- Lexus RX 2004-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lexus';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'rx';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2004 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Lexus RX', 'TOY44D-PT', 'Texas 4D67', '4D67', '312 MHz', 'smart_key', 'HYQ14AAB', 'TOY43', 'RX 330/350 (2nd gen). 4D67 transponder. Smart key with push-button start available. TOY43 emergency key blank. Programmable via Toyota Techstream or aftermarket tool.', false, true, 2004, 2009);
  END IF;
END $$;

-- Lexus ES 1997-2003
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lexus';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'es';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1997 AND year_end = 2003) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1997, 2003) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Lexus ES', 'TOY43', 'Texas Fixed Code 4C', '4C', 'transponder', 'ES 300 (3rd/4th gen). 4C fixed-code transponder. TOY43 key blank. On-board programming with 2 working master keys or via Toyota Techstream.', false, true, 1997, 2003);
  END IF;
END $$;

-- Lexus ES 2004-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lexus';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'es';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2004 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Lexus ES', 'TOY44D-PT', 'Texas 4D67', '4D67', 'transponder', 'ES 330 (4th gen). 4D67 transponder. TOY44D-PT key blank. OBD programmable via Toyota Techstream or aftermarket tool. On-board add key with 2 working master keys.', false, true, 2004, 2006);
  END IF;
END $$;

-- Lexus ES 2007-2012
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lexus';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'es';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2012) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2012) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Lexus ES', 'TOY44D-PT', 'Texas 4D67 / Smart Key', '4D67', '312 MHz', 'smart_key', 'HYQ14AAB', 'TOY43', 'ES 350 (5th gen). 4D67 transponder with smart key (Keyless Go) available. TOY43 emergency key blank. Programmable via Toyota Techstream or aftermarket tool. Push-button start on smart key models.', false, true, 2007, 2012);
  END IF;
END $$;

-- Lexus IS 2001-2005
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lexus';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'is';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2005) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2005) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Lexus IS', 'TOY44D-PT', 'Texas 4D67', '4D67', 'transponder', 'IS 300 (1st gen). 4D67 transponder. TOY44D-PT key blank. OBD programmable via Toyota Techstream or aftermarket tool. On-board add key with 2 working master keys.', false, true, 2001, 2005);
  END IF;
END $$;

-- Lexus IS 2006-2013
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lexus';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'is';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2006 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Lexus IS', 'TOY44D-PT', 'Texas 4D67 / Smart Key', '4D67', '312 MHz', 'smart_key', 'HYQ14AAB', 'TOY43', 'IS 250/350 (2nd gen). 4D67 transponder with smart key available. TOY43 emergency key blank. Push-button start on smart key models. Programmable via Toyota Techstream or aftermarket tool.', false, true, 2006, 2013);
  END IF;
END $$;

-- Lexus GX 2003-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lexus';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'gx';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2003 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Lexus GX', 'TOY44D-PT', 'Texas 4D67', '4D67', 'transponder', 'GX 470 (1st gen). 4D67 transponder. TOY44D-PT key blank. OBD programmable via Toyota Techstream or aftermarket tool. On-board add key with 2 working master keys.', false, true, 2003, 2009);
  END IF;
END $$;

-- Lexus LX 1998-2007
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lexus';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'lx';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1998 AND year_end = 2007) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2007) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Lexus LX', 'TOY44D-PT', 'Texas 4D67', '4D67', 'transponder', 'LX 470 (2nd gen). 4D67 transponder. TOY44D-PT key blank. OBD programmable via Toyota Techstream or aftermarket tool. On-board add key with 2 working master keys.', false, true, 1998, 2007);
  END IF;
END $$;

-- Lexus LX 2008-2015
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lexus';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'lx';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2008 AND year_end = 2015) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2015) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Lexus LX', 'TOY44G-PT', 'Texas G Chip', 'G chip (Texas Crypto 80-bit)', '312 MHz', 'smart_key', 'HYQ14ACX', 'TOY43', 'LX 570 (3rd gen). G chip transponder with smart key. Push-button start standard. TOY43 emergency key blank. Programmable via Toyota Techstream or aftermarket tool.', false, true, 2008, 2015);
  END IF;
END $$;

-- Lexus LX 2016-2021
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lexus';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'lx';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2016 AND year_end = 2021) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2021) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Lexus LX', 'TOY44G-PT', 'Texas H Chip', 'H chip (8A / 128-bit AES)', '312 MHz', 'smart_key', 'HYQ14FBA', 'TOY43', 'LX 570 (3rd gen facelift). H chip (8A) transponder with smart key. Push-button start standard. TOY43 emergency key blank. Programmable via Toyota Techstream or aftermarket tool.', false, true, 2016, 2021);
  END IF;
END $$;

-- ============================================================
-- RAM
-- ============================================================

-- RAM 1500 2002-2008
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ram';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = '1500';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2002 AND year_end = 2008) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2002, 2008) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'RAM 1500', 'Y160', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'GQ43VT17T', 'Dodge Ram 1500 (3rd gen, pre-RAM brand split). Philips 46 transponder. Y160 key blank. FOBIK available on later years. PIN required for programming. OBD programmable with PIN via wiTECH or aftermarket tool.', true, true, 2002, 2008);
  END IF;
END $$;

-- RAM 2500 2003-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ram';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = '2500';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2003 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'RAM 2500', 'Y160', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'GQ43VT17T', 'Dodge Ram 2500 (3rd gen). Philips 46 transponder. Y160 key blank. PIN required for programming. OBD programmable with PIN via wiTECH or aftermarket tool.', true, true, 2003, 2009);
  END IF;
END $$;

-- RAM 3500 2003-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ram';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = '3500';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2003 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'RAM 3500', 'Y160', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'GQ43VT17T', 'Dodge Ram 3500 (3rd gen). Philips 46 transponder. Y160 key blank. PIN required for programming. OBD programmable with PIN via wiTECH or aftermarket tool.', true, true, 2003, 2009);
  END IF;
END $$;

-- ============================================================
-- MITSUBISHI
-- ============================================================

-- Mitsubishi Lancer 2002-2007
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mitsubishi';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'lancer';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2002 AND year_end = 2007) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2002, 2007) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Mitsubishi Lancer', 'MIT8', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'OUCG8D-620M-A', '8th gen Lancer. Philips 46 transponder. MIT8 key blank. OBD programmable via Mitsubishi MUT-III or aftermarket tool. PIN may be required for some years.', false, true, 2002, 2007);
  END IF;
END $$;

-- ============================================================
-- INFINITI
-- ============================================================

-- Infiniti QX80 2004-2010 (was QX56)
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'infiniti';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'qx80';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2004 AND year_end = 2010) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2010) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Infiniti QX80', 'NSN14', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'CWTWB1U415', '1st gen (sold as QX56). Philips 46 transponder. NSN14 key blank. OBD programmable via Nissan CONSULT III or aftermarket tool. Separate remote fob.', false, true, 2004, 2010);
  END IF;
END $$;

-- Infiniti QX80 2011-2013 (was QX56)
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'infiniti';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'qx80';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2011 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Infiniti QX80', 'NSN14', 'Philips 46', '46 chip', '315 MHz', 'smart_key', 'CWTWB1G744', 'NSN14', '2nd gen (sold as QX56, renamed QX80 in 2013). Philips 46 transponder. Intelligent Key (smart key) with push-button start. NSN14 emergency key blank. Programmable via Nissan CONSULT III or aftermarket tool.', false, true, 2011, 2013);
  END IF;
END $$;

-- Infiniti QX50 2008-2013 (was EX35/EX37)
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'infiniti';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'qx50';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2008 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Infiniti QX50', 'NSN14', 'Philips 46', '46 chip', '315 MHz', 'smart_key', 'KR55WK49622', 'NSN14', '1st gen (sold as EX35/EX37, renamed QX50 in 2014). Philips 46 transponder. Intelligent Key (smart key) with push-button start. NSN14 emergency key blank. Programmable via Nissan CONSULT III or aftermarket tool.', false, true, 2008, 2013);
  END IF;
END $$;
