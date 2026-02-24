-- Brinks residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'brinks';

  -- Commercial Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Commercial Deadbolt', 'commercial-deadbolt', 'deadbolt', 'KW1', 5, false, false, false, 'Grade 2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Brinks', 'KW1', 'nickel silver', 'Standard KW1 keyway. Brinks Grade 2 commercial-rated deadbolt. Compatible with Kwikset key blanks.');

  -- Push Pull Rotate Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Push Pull Rotate Deadbolt', 'push-pull-rotate', 'deadbolt', 'KW1', 5, false, false, false, 'Grade 3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Brinks', 'KW1', 'nickel silver', 'KW1 keyway residential deadbolt. Push-pull-rotate mechanism for easy operation. Budget-friendly Grade 3 option.');

  -- Digital Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Digital Deadbolt', 'digital-deadbolt', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 3', 'Keypad entry, up to 12 user codes, backlit keypad, auto-lock')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Brinks', 'KW1', 'nickel silver', 'Physical key backup for digital keypad deadbolt. Standard KW1 keyway. Battery powered — no hardwiring needed.');

  -- Array Smart Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Array Smart Deadbolt', 'array-smart-deadbolt', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 2', 'Wi-Fi, app control, up to 50 user codes, auto-lock, activity log, guest access')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Brinks', 'KW1', 'nickel silver', 'KW1 keyway physical key backup for Array smart lock. Wi-Fi connected — no hub required. Brinks Home Security ecosystem compatible.');
END $$;
