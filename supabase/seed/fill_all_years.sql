-- Fill missing older year ranges for Honda, Toyota, and Ford models
-- Each block looks up manufacturer and model by slug, then inserts only if the year range doesn't already exist

-- ============================================================
-- HONDA
-- ============================================================

-- Honda Accord 1998-2002
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'accord';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1998 AND year_end = 2002) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2002) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda Accord', 'HD103', 'Megamos 48', '48 chip', 'transponder', '6th gen Accord. Megamos 48 transponder key. Honda HDS or aftermarket tool required. Self-learn possible with 2 working keys.', false, true, 1998, 2002);
  END IF;
END $$;

-- Honda Accord 2003-2007
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'accord';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2003 AND year_end = 2007) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2007) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda Accord', 'HD106', 'Megamos 46', '46 chip (G)', 'transponder', '7th gen Accord. 46 (G chip) transponder. OBD programmable via Honda HDS or aftermarket tool.', false, true, 2003, 2007);
  END IF;
END $$;

-- Honda Civic 1996-2000
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'civic';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1996 AND year_end = 2000) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1996, 2000) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda Civic', 'HD103', 'Megamos 48', '48 chip', 'transponder', '6th gen Civic. Megamos 48 transponder key. Honda HDS or aftermarket tool. Self-learn with 2 working keys.', false, true, 1996, 2000);
  END IF;
END $$;

-- Honda Civic 2001-2005
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'civic';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2005) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2005) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda Civic', 'HD106', 'Megamos 46', '46 chip (G)', 'transponder', '7th gen Civic. 46 (G chip) transponder. OBD programmable via Honda HDS or aftermarket tool.', false, true, 2001, 2005);
  END IF;
END $$;

-- Honda CR-V 1997-2001
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'cr-v';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1997 AND year_end = 2001) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1997, 2001) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda CR-V', 'HD103', 'Megamos 48', '48 chip', 'transponder', '1st gen CR-V. Megamos 48 transponder key. Honda HDS or aftermarket tool required.', false, true, 1997, 2001);
  END IF;
END $$;

-- Honda CR-V 2002-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'cr-v';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2002 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2002, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda CR-V', 'HD106', 'Megamos 46', '46 chip (G)', 'transponder', '2nd gen CR-V. 46 (G chip) transponder. OBD programmable via Honda HDS or aftermarket tool.', false, true, 2002, 2006);
  END IF;
END $$;

-- Honda CR-V 2007-2011
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'cr-v';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2011) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2011) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda CR-V', 'HON66', 'Megamos 46', '46 chip', 'transponder', '3rd gen CR-V. 46 chip transponder. OBD programmable via Honda HDS or aftermarket tool.', false, true, 2007, 2011);
  END IF;
END $$;

-- Honda CR-V 2012-2016
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'cr-v';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2012 AND year_end = 2016) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2016) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda CR-V', 'HON66', 'Megamos 46', '46 chip', 'transponder', '4th gen CR-V. 46 chip transponder. OBD programmable via Honda HDS or aftermarket tool.', false, true, 2012, 2016);
  END IF;
END $$;

-- Honda Odyssey 1999-2004
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'odyssey';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1999 AND year_end = 2004) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1999, 2004) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda Odyssey', 'HD103', 'Megamos 48', '48 chip', 'transponder', '2nd gen Odyssey. Megamos 48 transponder key. Honda HDS or aftermarket tool. Self-learn with 2 working keys.', false, true, 1999, 2004);
  END IF;
END $$;

-- Honda Odyssey 2005-2010
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'odyssey';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2005 AND year_end = 2010) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2010) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda Odyssey', 'HD106', 'Megamos 46', '46 chip (G)', 'transponder', '3rd gen Odyssey. 46 (G chip) transponder. OBD programmable via Honda HDS or aftermarket tool.', false, true, 2005, 2010);
  END IF;
END $$;

-- Honda Pilot 2003-2008
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'pilot';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2003 AND year_end = 2008) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2008) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda Pilot', 'HD106', 'Megamos 46', '46 chip (G)', 'transponder', '1st gen Pilot. 46 (G chip) transponder. OBD programmable via Honda HDS or aftermarket tool.', false, true, 2003, 2008);
  END IF;
END $$;

-- Honda Pilot 2009-2015
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'pilot';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2009 AND year_end = 2015) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2015) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda Pilot', 'HON66', 'Megamos 46', '46 chip', 'transponder', '2nd gen Pilot. 46 chip transponder. OBD programmable via Honda HDS or aftermarket tool.', false, true, 2009, 2015);
  END IF;
END $$;

-- Honda Fit 2007-2008
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'fit';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2008) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2008) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda Fit', 'HD106', 'Megamos 46', '46 chip', 'transponder', '1st gen Fit (GD). 46 chip transponder key. OBD programmable via Honda HDS or aftermarket tool.', false, true, 2007, 2008);
  END IF;
END $$;

-- Honda Fit 2009-2014
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'fit';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2009 AND year_end = 2014) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2014) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda Fit', 'HON66', 'Megamos 46', '46 chip', 'transponder', '2nd gen Fit (GE). 46 chip transponder key. OBD programmable via Honda HDS or aftermarket tool.', false, true, 2009, 2014);
  END IF;
END $$;

-- Honda Ridgeline 2006-2014
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'ridgeline';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2006 AND year_end = 2014) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2014) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda Ridgeline', 'HON66', 'Megamos 46', '46 chip', 'transponder', '1st gen Ridgeline. 46 chip transponder key. OBD programmable via Honda HDS or aftermarket tool.', false, true, 2006, 2014);
  END IF;
END $$;

-- Honda Insight 2000-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'insight';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2000 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda Insight', 'HD103', 'None', 'Non-transponder', 'standard', '1st gen Insight hybrid. Non-transponder mechanical key. No programming required. Cut to code or copy.', false, false, 2000, 2006);
  END IF;
END $$;

-- Honda Passport 1998-2002
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'passport';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1998 AND year_end = 2002) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2002) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Honda Passport', 'HD103', 'Megamos 48', '48 chip', 'transponder', '1st gen Passport (Isuzu-based). Megamos 48 transponder key. Honda HDS or aftermarket tool required.', false, true, 1998, 2002);
  END IF;
END $$;

-- ============================================================
-- TOYOTA
-- ============================================================

-- Toyota Camry 1997-2002
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'camry';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1997 AND year_end = 2002) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1997, 2002) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Camry', 'TOY43', 'Texas Fixed Code', '4C chip', 'transponder', '4th/5th gen Camry. Texas 4C transponder. Techstream or aftermarket tool. May need 2 working keys for self-learn.', false, true, 1997, 2002);
  END IF;
END $$;

-- Toyota Corolla 1998-2002
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'corolla';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1998 AND year_end = 2002) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2002) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Corolla', 'TOY43', 'Texas Fixed Code', '4C chip', 'transponder', '8th gen Corolla. Texas 4C transponder key. Techstream or aftermarket tool. Self-learn possible with 2 working master keys.', false, true, 1998, 2002);
  END IF;
END $$;

-- Toyota Corolla 2003-2008
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'corolla';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2003 AND year_end = 2008) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2008) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Corolla', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '9th gen Corolla. 4D67 transponder. OBD programmable. Customer self-learn with 2 working master keys.', false, true, 2003, 2008);
  END IF;
END $$;

-- Toyota Corolla 2009-2013
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'corolla';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2009 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Corolla', 'TOY44G-PT', 'Texas Crypto 128-bit', 'G chip', 'transponder', '10th gen Corolla. G chip transponder. On-board programming with 2 working keys or Techstream.', false, true, 2009, 2013);
  END IF;
END $$;

-- Toyota 4Runner 1996-2002
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = '4runner';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1996 AND year_end = 2002) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1996, 2002) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota 4Runner', 'TOY43', 'Texas Fixed Code', '4C chip', 'transponder', '3rd gen 4Runner. Texas 4C transponder. Techstream or aftermarket tool. Self-learn with 2 working master keys.', false, true, 1996, 2002);
  END IF;
END $$;

-- Toyota 4Runner 2003-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = '4runner';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2003 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota 4Runner', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '4th gen 4Runner. 4D67 transponder. OBD programmable. Customer self-learn with 2 working master keys.', false, true, 2003, 2009);
  END IF;
END $$;

-- Toyota RAV4 1996-2000
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'rav4';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1996 AND year_end = 2000) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1996, 2000) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota RAV4', 'TOY43', 'Texas Fixed Code', '4C chip', 'transponder', '1st gen RAV4. Texas 4C transponder. Techstream or aftermarket tool. Self-learn with 2 working master keys.', false, true, 1996, 2000);
  END IF;
END $$;

-- Toyota RAV4 2001-2005
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'rav4';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2005) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2005) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota RAV4', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '2nd gen RAV4. 4D67 transponder. OBD programmable. Customer self-learn with 2 working master keys.', false, true, 2001, 2005);
  END IF;
END $$;

-- Toyota RAV4 2006-2012
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'rav4';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2006 AND year_end = 2012) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2012) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota RAV4', 'TOY44G-PT', 'Texas Crypto 128-bit', 'G chip', 'transponder', '3rd gen RAV4. G chip transponder. On-board programming with 2 working keys or Techstream.', false, true, 2006, 2012);
  END IF;
END $$;

-- Toyota RAV4 2013-2018
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'rav4';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2013 AND year_end = 2018) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2018) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota RAV4', 'TOY44G-PT', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBA', '4th gen RAV4. H chip smart key with push-button start on select trims. Techstream or aftermarket tool required.', false, true, 'TOY43', 2013, 2018);
  END IF;
END $$;

-- Toyota Highlander 2001-2007
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'highlander';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2007) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2007) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Highlander', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '1st gen Highlander. 4D67 transponder. OBD programmable. Customer self-learn with 2 working master keys.', false, true, 2001, 2007);
  END IF;
END $$;

-- Toyota Highlander 2008-2013
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'highlander';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2008 AND year_end = 2013) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2013) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Highlander', 'TOY44G-PT', 'Texas Crypto 128-bit', 'G chip', 'transponder', '2nd gen Highlander. G chip transponder. On-board programming with 2 working keys or Techstream.', false, true, 2008, 2013);
  END IF;
END $$;

-- Toyota Highlander 2014-2019
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'highlander';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2014 AND year_end = 2019) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2019) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Highlander', 'TOY44G-PT', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBA', '3rd gen Highlander. H chip smart key. Push-button start on select trims. Techstream or aftermarket tool.', false, true, 'TOY43', 2014, 2019);
  END IF;
END $$;

-- Toyota Tacoma 1995-2004
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'tacoma';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1995 AND year_end = 2004) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1995, 2004) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Tacoma', 'TOY43', 'Texas Fixed Code', '4C chip', 'transponder', '1st gen Tacoma. Texas 4C transponder. Techstream or aftermarket tool. Self-learn with 2 working master keys.', false, true, 1995, 2004);
  END IF;
END $$;

-- Toyota Tacoma 2005-2015
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'tacoma';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2005 AND year_end = 2015) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2015) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Tacoma', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '2nd gen Tacoma. 4D67 transponder. OBD programmable. Customer self-learn with 2 working master keys.', false, true, 2005, 2015);
  END IF;
END $$;

-- Toyota Sienna 1998-2003
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'sienna';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1998 AND year_end = 2003) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2003) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Sienna', 'TOY43', 'Texas Fixed Code', '4C chip', 'transponder', '1st gen Sienna. Texas 4C transponder. Techstream or aftermarket tool. Self-learn with 2 working master keys.', false, true, 1998, 2003);
  END IF;
END $$;

-- Toyota Sienna 2004-2010
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'sienna';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2004 AND year_end = 2010) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2010) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Sienna', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '2nd gen Sienna. 4D67 transponder. OBD programmable. Customer self-learn with 2 working master keys.', false, true, 2004, 2010);
  END IF;
END $$;

-- Toyota Prius 2001-2003
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'prius';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2003) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2003) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Prius', 'TOY43', 'Texas Fixed Code', '4C chip', 'transponder', '1st gen Prius (NHW11). Texas 4C transponder key. Techstream or aftermarket tool. Self-learn with 2 working master keys.', false, true, 2001, 2003);
  END IF;
END $$;

-- Toyota Prius 2004-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'prius';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2004 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Prius', 'TOY44D-PT', 'Texas Fixed Code', '4D67', '315 MHz', 'smart_key', 'MOZB31EG', '2nd gen Prius (NHW20). Smart key system with push-button start. 4D67 chip. Techstream required for programming.', false, true, 'TOY43', 2004, 2009);
  END IF;
END $$;

-- Toyota Avalon 2000-2004
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'avalon';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2000 AND year_end = 2004) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2004) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Avalon', 'TOY43', 'Texas Fixed Code', '4C chip', 'transponder', '2nd gen Avalon. Texas 4C transponder. Techstream or aftermarket tool. Self-learn with 2 working master keys.', false, true, 2000, 2004);
  END IF;
END $$;

-- Toyota Avalon 2005-2012
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'avalon';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2005 AND year_end = 2012) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2012) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Avalon', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '3rd gen Avalon. 4D67 transponder. OBD programmable. Customer self-learn with 2 working master keys.', false, true, 2005, 2012);
  END IF;
END $$;

-- Toyota Tundra 2000-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'tundra';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2000 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Tundra', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '1st gen Tundra. 4D67 transponder. OBD programmable. Customer self-learn with 2 working master keys.', false, true, 2000, 2006);
  END IF;
END $$;

-- Toyota Sequoia 2001-2007
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'sequoia';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2007) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2007) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Sequoia', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '1st gen Sequoia. 4D67 transponder. OBD programmable. Customer self-learn with 2 working master keys.', false, true, 2001, 2007);
  END IF;
END $$;

-- Toyota Land Cruiser 1998-2007
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'land-cruiser';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1998 AND year_end = 2007) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2007) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Toyota Land Cruiser', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '100 series Land Cruiser. 4D67 transponder. OBD programmable. Techstream or aftermarket tool.', false, true, 1998, 2007);
  END IF;
END $$;

-- ============================================================
-- FORD
-- ============================================================

-- Ford F-150 1997-2003
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'f-150';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1997 AND year_end = 2003) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1997, 2003) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford F-150', 'H75', 'Texas Fixed Code', '4C chip', '315 MHz', 'transponder', 'CWTWB1U345', 'PATS system. Texas 4C transponder. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.', true, true, 1997, 2003);
  END IF;
END $$;

-- Ford Explorer 1998-2005
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'explorer';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1998 AND year_end = 2005) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2005) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Explorer', 'H75', 'Texas Fixed Code', '4C chip', '315 MHz', 'transponder', 'CWTWB1U345', '3rd gen Explorer. PATS 4C transponder. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.', true, true, 1998, 2005);
  END IF;
END $$;

-- Ford Explorer 2006-2010
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'explorer';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2006 AND year_end = 2010) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2010) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Explorer', 'H84-PT', 'Texas 4D63', '4D63 80-bit', '315 MHz', 'transponder', 'CWTWB1U793', '4th gen Explorer. PATS 80-bit system. On-board programming with 2 working keys. PIN code bypass via Ford IDS.', true, true, 2006, 2010);
  END IF;
END $$;

-- Ford Explorer 2011-2019
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'explorer';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2011 AND year_end = 2019) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2019) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Explorer', 'H128-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'smart_key', 'M3N5WY8609', '5th gen Explorer. PATS 128-bit. Smart key on select trims. Ford IDS/FDRS or aftermarket tool. Security code may be required.', true, true, 2011, 2019);
  END IF;
END $$;

-- Ford Escape 2001-2007
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'escape';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2007) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2007) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Escape', 'H75', 'Texas 4D63', '4C/4D63', '315 MHz', 'transponder', 'CWTWB1U345', '1st gen Escape. PATS transponder. 2001-2004 uses 4C, 2005-2007 uses 4D63. On-board with 2 keys or Ford IDS.', true, true, 2001, 2007);
  END IF;
END $$;

-- Ford Escape 2008-2012
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'escape';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2008 AND year_end = 2012) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2012) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Escape', 'H84-PT', 'Texas 4D63', '4D63 80-bit', '315 MHz', 'transponder', 'CWTWB1U793', '2nd gen Escape. PATS 80-bit system. On-board programming with 2 working keys. PIN code bypass via Ford IDS.', true, true, 2008, 2012);
  END IF;
END $$;

-- Ford Escape 2013-2019
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'escape';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2013 AND year_end = 2019) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2019) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Escape', 'H128-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'smart_key', 'M3N-A2C31243300', '3rd gen Escape. PATS 128-bit. Smart key on Titanium trim. Ford IDS/FDRS or aftermarket tool required.', true, true, 2013, 2019);
  END IF;
END $$;

-- Ford Mustang 1996-2004
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'mustang';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1996 AND year_end = 2004) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1996, 2004) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Mustang', 'H72', 'Texas Fixed Code', '4C chip', 'transponder', '4th gen Mustang (SN95/New Edge). PATS 4C transponder. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.', true, true, 1996, 2004);
  END IF;
END $$;

-- Ford Mustang 2005-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'mustang';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2005 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Mustang', 'H84-PT', 'Texas 4D63', '4D63 80-bit', '315 MHz', 'transponder', 'CWTWB1U793', '5th gen Mustang (S197). PATS 80-bit system. On-board programming with 2 working keys. PIN code bypass via Ford IDS.', true, true, 2005, 2009);
  END IF;
END $$;

-- Ford Mustang 2010-2014
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'mustang';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2010 AND year_end = 2014) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2014) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Mustang', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', '5th gen Mustang (S197 facelift). PATS 80-bit system. On-board with 2 working keys or Ford IDS with PIN.', true, true, 2010, 2014);
  END IF;
END $$;

-- Ford Expedition 1997-2002
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'expedition';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1997 AND year_end = 2002) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1997, 2002) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Expedition', 'H75', 'Texas Fixed Code', '4C chip', 'transponder', '1st gen Expedition. PATS 4C transponder. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.', true, true, 1997, 2002);
  END IF;
END $$;

-- Ford Expedition 2003-2006
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'expedition';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2003 AND year_end = 2006) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2006) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Expedition', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', '2nd gen Expedition. PATS 80-bit system. On-board programming with 2 working keys. PIN code bypass via Ford IDS.', true, true, 2003, 2006);
  END IF;
END $$;

-- Ford Ranger 1998-2004
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'ranger';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1998 AND year_end = 2004) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2004) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Ranger', 'H75', 'Texas Fixed Code', '4C chip', 'transponder', 'Ford Ranger. PATS 4C transponder. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.', true, true, 1998, 2004);
  END IF;
END $$;

-- Ford Ranger 2005-2011
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'ranger';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2005 AND year_end = 2011) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2011) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Ranger', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', 'Ford Ranger. PATS 80-bit system. On-board programming with 2 working keys. PIN code bypass via Ford IDS.', true, true, 2005, 2011);
  END IF;
END $$;

-- Ford Taurus 1996-2000
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'taurus';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 1996 AND year_end = 2000) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1996, 2000) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Taurus', 'H72', 'Texas Fixed Code', '4C chip', 'transponder', '3rd gen Taurus. PATS 4C transponder. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.', true, true, 1996, 2000);
  END IF;
END $$;

-- Ford Taurus 2001-2007
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'taurus';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2001 AND year_end = 2007) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2007) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Taurus', 'H72-PT', 'Texas 4D60', '4D60 chip', 'transponder', '4th/5th gen Taurus. PATS 4D60 transponder. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.', true, true, 2001, 2007);
  END IF;
END $$;

-- Ford Focus 2000-2004
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'focus';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2000 AND year_end = 2004) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2004) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Focus', 'H75', 'Texas Fixed Code', '4C chip', 'transponder', '1st gen Focus. PATS 4C transponder. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.', true, true, 2000, 2004);
  END IF;
END $$;

-- Ford Focus 2005-2007
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'focus';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2005 AND year_end = 2007) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2007) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Focus', 'H72-PT', 'Texas 4D63', '4D63', 'transponder', '1st gen Focus (facelift). PATS 4D63 transponder. On-board programming with 2 working keys. PIN code bypass via Ford IDS.', true, true, 2005, 2007);
  END IF;
END $$;

-- Ford Focus 2008-2011
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'focus';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2008 AND year_end = 2011) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2011) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Focus', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', '2nd gen Focus (US). PATS 80-bit system. On-board programming with 2 working keys. PIN code bypass via Ford IDS.', true, true, 2008, 2011);
  END IF;
END $$;

-- Ford Fusion 2006-2009
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'fusion';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2006 AND year_end = 2009) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2009) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Fusion', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', '1st gen Fusion. PATS 80-bit system. On-board programming with 2 working keys. PIN code bypass via Ford IDS.', true, true, 2006, 2009);
  END IF;
END $$;

-- Ford Fusion 2010-2012
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'fusion';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2010 AND year_end = 2012) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2012) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Fusion', 'H84-PT', 'Texas 4D63', '4D63 80-bit', '315 MHz', 'transponder', 'CWTWB1U793', '1st gen Fusion (facelift). PATS 80-bit system. On-board with 2 working keys. PIN code via Ford IDS for all-keys-lost.', true, true, 2010, 2012);
  END IF;
END $$;

-- Ford Edge 2007-2010
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'edge';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2007 AND year_end = 2010) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2010) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Edge', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', '1st gen Edge. PATS 80-bit system. On-board programming with 2 working keys. PIN code bypass via Ford IDS.', true, true, 2007, 2010);
  END IF;
END $$;

-- Ford Edge 2011-2014
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  SELECT id INTO model_id FROM public.vehicle_models WHERE manufacturer_id = mfr_id AND slug = 'edge';
  IF NOT EXISTS (SELECT 1 FROM public.vehicle_years WHERE model_id = model_id AND year_start = 2011 AND year_end = 2014) THEN
    INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2014) RETURNING id INTO year_id;
    INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
    VALUES (year_id, mfr_id, 'Ford Edge', 'H128-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'transponder', '1st gen Edge (facelift). PATS 128-bit system. Ford IDS/FDRS or compatible aftermarket tool required. Security code may be needed.', true, true, 2011, 2014);
  END IF;
END $$;
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
