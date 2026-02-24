-- Weiser residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'weiser';

  -- Smartcode 10
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'SmartCode 10 Keypad Deadbolt', 'smartcode-10', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 2', 'Keypad entry, up to 30 user codes, auto-lock, SmartKey re-key')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Weiser', 'KW1', 'nickel silver', 'KW1 keyway physical key backup. Same parent company as Kwikset (Spectrum Brands). SmartKey re-key compatible.');

  -- Elements Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Elements Deadbolt', 'elements-deadbolt', 'deadbolt', 'KW1', 5, false, false, false, 'Grade 3', 'SmartKey re-key technology')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Weiser', 'KW1', 'nickel silver', 'Standard KW1 keyway with SmartKey re-key. Budget-friendly residential deadbolt. Cross-compatible with Kwikset KW1 keys.');

  -- Halo Wi-Fi Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Halo Wi-Fi Smart Deadbolt', 'halo-wifi-deadbolt', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 2', 'Wi-Fi, fingerprint reader (select models), app control, up to 250 codes, SmartKey re-key')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Weiser', 'KW1', 'nickel silver', 'Physical key backup for Halo smart lock. KW1 keyway. No hub required — connects directly to Wi-Fi.');

  -- Powerbolt 2 Electronic Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Powerbolt 2 Electronic Deadbolt', 'powerbolt-2', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 3', 'Keypad entry, up to 6 user codes, one-touch locking')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Weiser', 'KW1', 'nickel silver', 'Basic electronic keypad deadbolt with KW1 physical key backup. Budget-friendly keyless option.');
END $$;
