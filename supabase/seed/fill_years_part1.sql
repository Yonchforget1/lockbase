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
