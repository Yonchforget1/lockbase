-- Corbin Russwin residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'corbin-russwin';

  -- CL3300 Series Cylindrical Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'CL3300 Series Cylindrical Lock', 'cl3300-cylindrical', 'lever', 'Corbin Russwin D1', 6, null, false, false, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '59D1', 'Corbin Russwin', 'D1', 'nickel silver', 'Corbin Russwin D1 keyway (6-pin). Grade 1 cylindrical lever lock. Common in commercial and institutional buildings. Also known as 59D1-6PIN.');

  -- ML2000 Series Mortise Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'ML2000 Series Mortise Lock', 'ml2000-mortise', 'mortise', 'Corbin Russwin D1', 6, 'Spool pins optional', true, false, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '59D1', 'Corbin Russwin', 'D1', 'nickel silver', 'Corbin Russwin D1 keyway mortise cylinder. Heavy-duty mortise chassis for high-traffic commercial applications. UL listed for 3-hour fire rating.');

  -- CL3800 Series Cylindrical Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'CL3800 Series Cylindrical Lock', 'cl3800-cylindrical', 'lever', 'Corbin Russwin D1', 6, null, false, false, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '59D1', 'Corbin Russwin', 'D1', 'nickel silver', 'Corbin Russwin D1 keyway. CL3800 is the heavy-duty bored lock with Newport lever trim. Vandal-resistant design.');

  -- Access 800 Series Mortise
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Access 800LP1 Mortise Lock', 'access-800-mortise', 'mortise', 'Corbin Russwin D1', 6, null, false, false, false, 'Grade 1', 'Integrated access control, RFID compatible, audit trail')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '59D1', 'Corbin Russwin', 'D1', 'nickel silver', 'Physical key override for Access 800 electronic mortise lock. Standard D1 keyway cylinder.');
END $$;
