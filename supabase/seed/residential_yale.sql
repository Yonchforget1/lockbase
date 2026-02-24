-- Yale residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'yale';

  -- Assure Lock SL
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Assure Lock SL', 'assure-lock-sl', 'smart_lock', 'Y1', 5, false, false, false, 'Grade 2', 'Touchscreen, Z-Wave, HomeKit, key-free deadbolt, up to 25 codes')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'Y1', 'Yale', 'Y1', 'nickel silver', 'Yale Assure Lock SL is a key-free lock. No physical key backup - touchscreen only.');

  -- Assure Lock 2
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Assure Lock 2', 'assure-lock-2', 'smart_lock', 'Y1', 5, false, false, false, 'Grade 2', 'Wi-Fi, Bluetooth, Apple Home Key, Matter, auto-lock, DoorSense')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'Y1', 'Yale', 'Y1', 'nickel silver', 'Optional key cylinder module available. Key-free by default.');

  -- 840 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '840 Deadbolt', '840-deadbolt', 'deadbolt', 'Y1', 5, false, false, false, 'Grade 3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, depth_spec, notes)
  VALUES (lock_id, mfr_id, 'Y1', 'Yale', 'Y1', 'nickel silver', '0.320, 0.296, 0.272, 0.248, 0.224, 0.200', 'Standard Yale 5-pin key. Y1 keyway compatible.');

  -- YRD256 Touchscreen Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'YRD256 Touchscreen Deadbolt', 'yrd256', 'smart_lock', 'Y1', 5, false, false, false, 'Grade 2', 'Touchscreen, Z-Wave, up to 25 user codes, auto-lock, one-touch locking')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'Y1', 'Yale', 'Y1', 'nickel silver', 'Physical key backup included with touchscreen smart lock.');
END $$;
