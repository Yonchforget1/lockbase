-- Fill missing older year ranges for Chevrolet, Nissan, Dodge, Jeep, Hyundai, and Kia models
-- Each block looks up manufacturer and model by slug, then inserts only if the year range doesn't already exist

-- ============================================================
-- CHEVROLET
-- ============================================================

-- Chevrolet Silverado 1999-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'silverado';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1999 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1999, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Silverado', 'B102', 'PK3 / Megamos 48', 'PK3 (48 chip)', '315 MHz', 'transponder', 'KOBLEAR1XT', 'PK3 transponder system. 10-minute relearn procedure via OBD or GM Tech 2. B102 double-sided key blank. Separate remote keyless entry fob.', false, true, 1999, 2006);
  END IF;
END $$;

-- Chevrolet Silverado 2007-2013
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'silverado';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Silverado', 'B111', 'PK3+ / Megamos 46', 'PK3+ (46 chip)', '315 MHz', 'transponder', 'OHT01060512', 'PK3+ transponder system. OBD programmable with 10-minute relearn. B111 round-head key blank. GM Tech 2 or aftermarket tool.', false, true, 2007, 2013);
  END IF;
END $$;

-- Chevrolet Tahoe 1995-2000
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'tahoe';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1995 AND year_end = 2000) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1995, 2000) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Tahoe', 'B89', 'VATS / PK2', 'VATS resistor / PK2', 'transponder', 'VATS (Vehicle Anti-Theft System) on 1995-1997, PK2 on 1998-2000. VATS uses resistor pellet key (15 resistance values). PK2 uses passkey transponder. B89 key blank.', false, false, 1995, 2000);
  END IF;
END $$;

-- Chevrolet Tahoe 2001-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'tahoe';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Tahoe', 'B102', 'PK3 / Megamos 48', 'PK3 (48 chip)', '315 MHz', 'transponder', 'KOBLEAR1XT', 'PK3 transponder system. 10-minute relearn procedure via OBD. B102 double-sided key blank. Separate remote fob.', false, true, 2001, 2006);
  END IF;
END $$;

-- Chevrolet Suburban 1995-2000
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'suburban';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1995 AND year_end = 2000) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1995, 2000) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Suburban', 'B89', 'VATS / PK2', 'VATS resistor / PK2', 'transponder', 'VATS on 1995-1997, PK2 on 1998-2000. VATS uses resistor pellet key (15 resistance values). PK2 uses passkey transponder. B89 key blank.', false, false, 1995, 2000);
  END IF;
END $$;

-- Chevrolet Suburban 2001-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'suburban';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Suburban', 'B102', 'PK3 / Megamos 48', 'PK3 (48 chip)', '315 MHz', 'transponder', 'KOBLEAR1XT', 'PK3 transponder system. 10-minute relearn procedure via OBD. B102 double-sided key blank. Separate remote fob.', false, true, 2001, 2006);
  END IF;
END $$;

-- Chevrolet Malibu 1997-2003
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'malibu';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1997 AND year_end = 2003) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1997, 2003) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Malibu', 'B97', 'PK3 / Megamos 48', 'PK3 (48 chip)', '315 MHz', 'transponder', 'KOBUT1BT', '5th gen Malibu. PK3 transponder system. 10-minute relearn via OBD. B97 single-sided key blank with remote head.', false, true, 1997, 2003);
  END IF;
END $$;

-- Chevrolet Malibu 2004-2007
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'malibu';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2004 AND year_end = 2007) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2007) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Malibu', 'B97', 'PK3+ / Megamos 46', 'PK3+ (46 chip)', '315 MHz', 'transponder', '6th gen Malibu. PK3+ upgraded transponder. OBD programmable with 10-minute relearn. B97 key blank.', false, true, 2004, 2007);
  END IF;
END $$;

-- Chevrolet Malibu 2008-2012
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'malibu';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2008 AND year_end = 2012) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2012) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Malibu', 'B111-PT', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', '7th gen Malibu. Philips 46 transponder. OBD programmable with 10-minute relearn. B111-PT transponder key blank.', false, true, 2008, 2012);
  END IF;
END $$;

-- Chevrolet Malibu 2013-2015
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'malibu';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2013 AND year_end = 2015) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2015) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Malibu', 'B111-PT', 'Philips 46', '46 chip', '315 MHz', 'transponder', '8th gen Malibu. Philips 46 transponder. OBD programmable with 10-minute relearn. Some trims have proximity key option.', false, true, 2013, 2015);
  END IF;
END $$;

-- Chevrolet Equinox 2005-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'equinox';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2005 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Equinox', 'B102', 'PK3 / Megamos 48', 'PK3 (48 chip)', '315 MHz', 'transponder', 'KOBGT04A', '1st gen Equinox. PK3 transponder. 10-minute relearn via OBD. B102 double-sided key blank. Separate remote fob.', false, true, 2005, 2009);
  END IF;
END $$;

-- Chevrolet Equinox 2010-2017
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'equinox';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2010 AND year_end = 2017) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2017) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Equinox', 'B111-PT', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', '2nd gen Equinox. Philips 46 transponder. OBD programmable with 10-minute relearn. B111-PT transponder key blank.', false, true, 2010, 2017);
  END IF;
END $$;

-- Chevrolet Traverse 2009-2017
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'traverse';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2009 AND year_end = 2017) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2017) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Traverse', 'B111-PT', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', '1st gen Traverse. Philips 46 transponder. OBD programmable with 10-minute relearn. B111-PT transponder key blank. Some higher trims have proximity key.', false, true, 2009, 2017);
  END IF;
END $$;

-- Chevrolet Blazer (S-10 Blazer) 1995-2005
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'blazer';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1995 AND year_end = 2005) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1995, 2005) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Chevrolet Blazer', 'B89', 'VATS / PK2', 'VATS resistor / PK2', '315 MHz', 'transponder', 'KOBUT1BT', 'S-10 Blazer / old Blazer. VATS resistor pellet key (1995-1997). PK2 passkey transponder (1998-2005). B89 key blank. 15 VATS resistance values.', false, false, 1995, 2005);
  END IF;
END $$;

-- ============================================================
-- NISSAN
-- ============================================================

-- Nissan Altima 1998-2001
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'nissan';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'altima';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1998 AND year_end = 2001) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2001) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Nissan Altima', 'NSN11', 'None', 'No transponder', 'standard', '2nd gen Altima. No transponder or immobilizer system. Standard mechanical key. NSN11 key blank. Cut by code or duplicate from original.', false, false, 1998, 2001);
  END IF;
END $$;

-- Nissan Altima 2002-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'nissan';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'altima';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2002 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2002, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Nissan Altima', 'NSN14', 'Philips 41', '41 chip', 'transponder', '3rd gen Altima. Philips 41 transponder. Requires Nissan CONSULT II or compatible aftermarket tool. On-board programming with 2 registered keys possible. NSN14 key blank.', false, true, 2002, 2006);
  END IF;
END $$;

-- Nissan Altima 2007-2012
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'nissan';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'altima';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2012) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2012) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Nissan Altima', 'NSN14', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'KR55WK48903', '4th gen Altima. Philips 46 transponder. Smart key (Intelligent Key) available on higher trims. OBD programmable via CONSULT III or aftermarket tool. NSN14 key blank for transponder key version.', false, true, 2007, 2012);
  END IF;
END $$;

-- Nissan Sentra 2000-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'nissan';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'sentra';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2000 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Nissan Sentra', 'NSN11', 'Philips 41', '41 chip', 'transponder', '5th gen Sentra. Philips 41 transponder. NATS (Nissan Anti-Theft System). Requires CONSULT II or aftermarket tool. On-board programming with 2 registered keys. NSN11 key blank.', false, true, 2000, 2006);
  END IF;
END $$;

-- Nissan Sentra 2007-2012
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'nissan';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'sentra';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2012) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2012) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Nissan Sentra', 'NSN14', 'Philips 46', '46 chip', 'transponder', '6th gen Sentra (B16). Philips 46 transponder. OBD programmable via CONSULT III or aftermarket tool. NSN14 key blank.', false, true, 2007, 2012);
  END IF;
END $$;

-- Nissan Sentra 2013-2019
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'nissan';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'sentra';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2013 AND year_end = 2019) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2019) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Nissan Sentra', 'NSN14', 'Philips 46', '46 chip', 'transponder', '7th gen Sentra (B17). Philips 46 transponder. OBD programmable via CONSULT III or aftermarket tool. Some higher trims have Intelligent Key (smart key). NSN14 key blank.', false, true, 2013, 2019);
  END IF;
END $$;

-- Nissan Rogue 2008-2013
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'nissan';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'rogue';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2008 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Nissan Rogue', 'NSN14', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'CWTWBU729', '1st gen Rogue. Philips 46 transponder key. OBD programmable via CONSULT III. Some trims have Intelligent Key. NSN14 key blank.', false, true, 2008, 2013);
  END IF;
END $$;

-- Nissan Rogue 2014-2020
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'nissan';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'rogue';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2014 AND year_end = 2020) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2020) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Nissan Rogue', 'NSN14', 'Philips 46', '46 chip', '315 MHz', 'smart_key', 'KR5S180144106', 'NSN14', '2nd gen Rogue. Intelligent Key (smart key) standard on most trims. Philips 46 transponder. Push-button start. CONSULT III or aftermarket tool. Emergency key blade NSN14 for door entry.', false, true, 2014, 2020);
  END IF;
END $$;

-- ============================================================
-- DODGE
-- ============================================================

-- Dodge Durango 1998-2003
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'dodge';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'durango';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1998 AND year_end = 2003) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2003) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Dodge Durango', 'Y159', 'None', 'No transponder', '315 MHz', 'standard', 'GQ43VT9T', '1st gen Durango. No immobilizer/transponder system. Standard mechanical key Y159. Separate remote keyless entry fob FCC: GQ43VT9T. Key cut by code or duplicate.', false, false, 1998, 2003);
  END IF;
END $$;

-- Dodge Durango 2004-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'dodge';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'durango';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2004 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Dodge Durango', 'Y160-PT', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'KOBDT04A', '2nd gen Durango. Philips 46 transponder. OBD programmable with PIN code. PIN from dealer or aftermarket tools. Y160-PT transponder key blank.', true, true, 2004, 2009);
  END IF;
END $$;

-- Dodge Durango 2011-2013
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'dodge';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'durango';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2011 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Dodge Durango', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'IYZ-C01C', 'Y160', '3rd gen Durango. FOBIK key with Hitag2 transponder. PIN required for programming. OBD programmable with PIN from CAN bus or dealer. Emergency blade Y160 for door entry.', true, true, 2011, 2013);
  END IF;
END $$;

-- Dodge Grand Caravan 1996-2000
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'dodge';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'grand-caravan';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1996 AND year_end = 2000) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1996, 2000) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Dodge Grand Caravan', 'Y157', 'None', 'No transponder', 'standard', '3rd gen Grand Caravan. No immobilizer/transponder system. Standard mechanical key Y157. Cut by code or duplicate from original.', false, false, 1996, 2000);
  END IF;
END $$;

-- Dodge Grand Caravan 2001-2007
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'dodge';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'grand-caravan';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2007) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2007) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Dodge Grand Caravan', 'Y160-PT', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'M3N5WY72XX', '4th gen Grand Caravan. Philips 46 transponder (Sentry Key). OBD programmable with PIN code. PIN from dealer or CAN bus tools. Y160-PT transponder key blank.', true, true, 2001, 2007);
  END IF;
END $$;

-- Dodge Journey 2009-2010
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'dodge';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'journey';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2009 AND year_end = 2010) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2010) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Dodge Journey', 'Y160', 'Philips 46', '46 chip', '315 MHz', 'transponder', '1st gen Journey early model years. Philips 46 transponder. OBD programmable with PIN code. PIN from dealer or CAN bus reading. Y160 key blank.', true, true, 2009, 2010);
  END IF;
END $$;

-- ============================================================
-- JEEP
-- ============================================================

-- Jeep Grand Cherokee 1999-2004
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'jeep';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'grand-cherokee';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1999 AND year_end = 2004) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1999, 2004) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Jeep Grand Cherokee WJ', 'Y159', 'Sentry Key (Texas Fixed)', '4D64', '315 MHz', 'transponder', 'GQ43VT9T', 'WJ generation Grand Cherokee. Sentry Key Immobilizer Module (SKIM). Y159 transponder key. OBD programmable with PIN from dealer or PCM. Separate remote fob FCC: GQ43VT9T. 2-key on-board programming available.', true, true, 1999, 2004);
  END IF;
END $$;

-- Jeep Cherokee 1997-2001
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'jeep';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'cherokee';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1997 AND year_end = 2001) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1997, 2001) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Jeep Cherokee XJ', 'Y157', 'SKIM (Sentry Key)', '4D64', 'transponder', 'XJ generation Cherokee. 1997 models have no immobilizer. 1998-2001 use SKIM (Sentry Key Immobilizer Module) with Y157 transponder key. OBD programmable with PIN from dealer or PCM. Non-transponder Y157 for 1997.', true, true, 1997, 2001);
  END IF;
END $$;

-- Jeep Wrangler 1997-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'jeep';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'wrangler';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1997 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1997, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Jeep Wrangler TJ', 'Y159', 'Sentry Key (Texas Fixed)', '4D64', '315 MHz', 'transponder', 'GQ43VT9T', 'TJ generation Wrangler. 1997-1999 use Y157 non-transponder key. 2000-2006 use Y159 with Sentry Key (SKIM). OBD programmable with 4-digit PIN from dealer or PCM. Separate remote fob.', true, true, 1997, 2006);
  END IF;
END $$;

-- Jeep Compass 2007-2016
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'jeep';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'compass';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2016) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2016) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Jeep Compass', 'Y160-PT', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'OHT692713AA', '1st gen Compass (MK49). Philips 46 transponder. OBD programmable with PIN code. PIN from dealer or CAN bus tools. Y160-PT transponder key blank.', true, true, 2007, 2016);
  END IF;
END $$;

-- ============================================================
-- HYUNDAI
-- ============================================================

-- Hyundai Sonata 1999-2005
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'sonata';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1999 AND year_end = 2005) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1999, 2005) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Hyundai Sonata', 'HY14', 'None', 'No transponder', 'standard', '4th/5th gen Sonata (EF). No immobilizer or transponder system. Standard mechanical key. HY14 key blank. Cut by code or duplicate from original.', false, false, 1999, 2005);
  END IF;
END $$;

-- Hyundai Sonata 2006-2010
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'sonata';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2006 AND year_end = 2010) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2010) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Hyundai Sonata', 'HY18', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'OSLOKA-310T', 'NF generation Sonata. Philips 46 transponder. OBD programmable with PIN code. PIN from immobilizer ECU or dealer. HY18 key blank. Tools: SmartPro, Zedfull, Autel.', true, true, 2006, 2010);
  END IF;
END $$;

-- Hyundai Elantra 2001-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'elantra';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Hyundai Elantra', 'HY14', 'None', 'No transponder', 'standard', '3rd gen Elantra (XD). No immobilizer or transponder system. Standard mechanical key. HY14 key blank. Cut by code or duplicate from original.', false, false, 2001, 2006);
  END IF;
END $$;

-- Hyundai Elantra 2007-2010
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'elantra';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2010) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2010) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Hyundai Elantra', 'HY15', 'Philips 46', '46 chip', '315 MHz', 'transponder', '4th gen Elantra (HD). Philips 46 transponder. OBD programmable with PIN code. PIN from immobilizer ECU or dealer. HY15 key blank. Tools: SmartPro, Zedfull.', true, true, 2007, 2010);
  END IF;
END $$;

-- Hyundai Santa Fe 2001-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'santa-fe';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Hyundai Santa Fe', 'HY14', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'OSLOKA-221T', '1st gen Santa Fe (SM). Philips 46 transponder. OBD programmable with PIN code. PIN from immobilizer ECU or dealer. HY14 key blank.', true, true, 2001, 2006);
  END IF;
END $$;

-- Hyundai Santa Fe 2007-2012
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'santa-fe';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2012) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2012) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Hyundai Santa Fe', 'HY18', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'OSLOKA-310T', '2nd gen Santa Fe (CM). Philips 46 transponder. OBD programmable with PIN code. PIN from immobilizer ECU or dealer. HY18 key blank. Tools: SmartPro, Zedfull, Autel.', true, true, 2007, 2012);
  END IF;
END $$;

-- Hyundai Tucson 2005-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'tucson';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2005 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Hyundai Tucson', 'HY14', 'Philips 46', '46 chip', '315 MHz', 'transponder', '1st gen Tucson (JM). Philips 46 transponder. OBD programmable with PIN code. PIN from immobilizer ECU or dealer. HY14 key blank.', true, true, 2005, 2009);
  END IF;
END $$;

-- Hyundai Tucson 2010-2015
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'tucson';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2010 AND year_end = 2015) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2015) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Hyundai Tucson', 'HY18', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'TQ8-RKE-3F03', '2nd gen Tucson (LM/ix35). Philips 46 transponder. OBD programmable with PIN. HY18 key blank. Tools: SmartPro, Zedfull, Autel.', true, true, 2010, 2015);
  END IF;
END $$;

-- Hyundai Accent 2000-2005
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'accent';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2000 AND year_end = 2005) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2005) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Hyundai Accent', 'HY14', 'None', 'No transponder', 'standard', '2nd gen Accent (LC). No immobilizer or transponder system. Standard mechanical key. HY14 key blank. Cut by code or duplicate.', false, false, 2000, 2005);
  END IF;
END $$;

-- Hyundai Accent 2006-2011
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'accent';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2006 AND year_end = 2011) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2011) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Hyundai Accent', 'HY14', 'None', 'No transponder', 'standard', '3rd gen Accent (MC). No immobilizer or transponder system on most US models. Standard mechanical key. HY14 key blank.', false, false, 2006, 2011);
  END IF;
END $$;

-- Hyundai Accent 2012-2017
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'accent';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2012 AND year_end = 2017) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2017) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Hyundai Accent', 'HY18', 'Philips 46', '46 chip', '315 MHz', 'transponder', '4th gen Accent (RB). Philips 46 transponder. OBD programmable with PIN code. PIN from immobilizer ECU. HY18 key blank. Tools: SmartPro, Zedfull, Autel.', true, true, 2012, 2017);
  END IF;
END $$;

-- ============================================================
-- KIA
-- ============================================================

-- Kia Optima 2001-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'kia';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'optima';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Kia Optima', 'KK7', 'None', 'No transponder', 'standard', '1st gen Optima (MS/MG). No immobilizer or transponder system. Standard mechanical key. KK7 key blank. Cut by code or duplicate.', false, false, 2001, 2006);
  END IF;
END $$;

-- Kia Optima 2007-2010
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'kia';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'optima';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2010) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2010) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Kia Optima', 'KK10', 'Philips 46', '46 chip', '315 MHz', 'transponder', '2nd gen Optima (MG). Philips 46 transponder. OBD programmable with PIN code. PIN from immobilizer ECU or dealer. KK10 key blank. Tools: SmartPro, Zedfull.', true, true, 2007, 2010);
  END IF;
END $$;

-- Kia Sorento 2003-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'kia';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'sorento';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2003 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Kia Sorento', 'KK7', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'OSLOKA-310T', '1st gen Sorento (BL). Philips 46 transponder. OBD programmable with PIN code. PIN from immobilizer ECU or dealer. KK7 key blank.', true, true, 2003, 2009);
  END IF;
END $$;

-- Kia Sorento 2010-2015
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'kia';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'sorento';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2010 AND year_end = 2015) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2015) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Kia Sorento', 'KK10', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'TQ8-RKE-3F05', '2nd gen Sorento (XM). Philips 46 transponder. OBD programmable with PIN. KK10 key blank. Tools: SmartPro, Zedfull, Autel.', true, true, 2010, 2015);
  END IF;
END $$;

-- Kia Forte 2010-2013
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'kia';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'forte';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2010 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Kia Forte', 'KK10', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'PINHA-T008', '1st gen Forte (TD). Philips 46 transponder. OBD programmable with PIN code. PIN from immobilizer ECU. KK10 key blank. Tools: SmartPro, Zedfull, Autel.', true, true, 2010, 2013);
  END IF;
END $$;

-- Kia Soul 2010-2013
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'kia';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'soul';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2010 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Kia Soul', 'KK10', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'NY0SEKSAM11ATX', '1st gen Soul (AM). Philips 46 transponder. OBD programmable with PIN code. PIN from immobilizer ECU. KK10 key blank. Tools: SmartPro, Zedfull, Autel.', true, true, 2010, 2013);
  END IF;
END $$;

-- Kia Sportage 2005-2010
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'kia';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'sportage';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2005 AND year_end = 2010) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2010) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Kia Sportage', 'KK7', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'OSLOKA-310T', '2nd gen Sportage (JE/KM). Philips 46 transponder. OBD programmable with PIN code. PIN from immobilizer ECU or dealer. KK7 key blank.', true, true, 2005, 2010);
  END IF;
END $$;

-- Kia Sportage 2011-2016
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'kia';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'sportage';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2011 AND year_end = 2016) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2016) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Kia Sportage', 'KK10', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'TQ8-RKE-3F05', '3rd gen Sportage (SL). Philips 46 transponder. OBD programmable with PIN. KK10 key blank. Tools: SmartPro, Zedfull, Autel.', true, true, 2011, 2016);
  END IF;
END $$;
