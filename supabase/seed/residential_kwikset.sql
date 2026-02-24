-- Kwikset residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'kwikset';

  -- 980 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, '980 Single Cylinder Deadbolt', '980', 'deadbolt', 'KW1', 5, false, false, false, 'Grade 2', 'SmartKey re-key technology')
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, depth_spec, spacing_spec, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Kwikset', 'KW1', 'nickel silver', '0.329, 0.305, 0.281, 0.257, 0.233, 0.209, 0.185', '.247, .371, .495, .619, .743', 'Standard 5-pin KW1 keyway. Most common Kwikset key.');

  -- 660 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '660 Contemporary Deadbolt', '660', 'deadbolt', 'KW1', 5, false, false, false, 'Grade 3')
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Kwikset', 'KW1', 'nickel silver', 'Standard Kwikset keyway. Grade 3 residential.');

  -- SmartCode 916
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'SmartCode 916 Touchscreen', 'smartcode-916', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 2', 'Z-Wave Plus, touchscreen, SmartKey, up to 30 codes, auto-lock')
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Kwikset', 'KW1', 'nickel silver', 'Physical key backup. SmartKey allows easy re-keying.');

  -- Kevo
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Kevo Contemporary', 'kevo', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 2', 'Bluetooth Smart, touch-to-open, eKeys, SmartKey re-key')
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Kwikset', 'KW1', 'nickel silver', 'Physical key backup for Kevo smart lock.');

  -- 400T Entry Knob
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '400T Tylo Entry Knob', '400t', 'knob', 'KW1', 5, false, false, false, 'Grade 3')
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Kwikset', 'KW1', 'nickel silver', 'Standard KW1 entry knob key.');
END $$;
