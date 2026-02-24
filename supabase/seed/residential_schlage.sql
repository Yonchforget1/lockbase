-- Schlage residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'schlage';

  -- B60N Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'B60N Single Cylinder Deadbolt', 'b60n', 'deadbolt', 'C', 6, 'Spool pins on positions 2, 4, 5', true, true, true, 'Grade 1')
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, depth_spec, spacing_spec, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Schlage', 'C', 'nickel silver', '0.335, 0.311, 0.287, 0.263, 0.239, 0.215, 0.191, 0.167, 0.143', '.1562, .2500, .3437, .4375, .5312', '5-pin C keyway. Most common Schlage residential keyway.');
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC4', 'Schlage', 'C', 'nickel silver', '6-pin C keyway. Used in higher security applications.');

  -- B60N Primus
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Primus Deadbolt', 'primus-deadbolt', 'deadbolt', 'Primus', 6, 'Finger pins, sidebar', true, true, true, 'Grade 1')
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'P-SC1', 'Schlage', 'Primus', 'nickel silver', 'Primus high-security key. Side-milled for sidebar pins. Restricted blank.');

  -- F51 Knob
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'F51 Entry Knob', 'f51-knob', 'knob', 'C', 5, false, false, false, 'Grade 2')
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Schlage', 'C', 'nickel silver', 'Standard 5-pin SC1 key for residential knob sets.');

  -- FE575 Keypad
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'FE575 Keypad Entry', 'fe575', 'smart_lock', 'C', 5, false, false, false, 'Grade 2', 'Keypad entry, auto-lock, up to 19 codes')
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Schlage', 'C', 'nickel silver', 'Mechanical key backup for electronic lock.');

  -- BE469 Connect
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'BE469 Connect Touchscreen Deadbolt', 'be469', 'smart_lock', 'C', 6, true, true, true, 'Grade 1', 'Z-Wave, touchscreen, up to 30 codes, alarm modes')
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Schlage', 'C', 'nickel silver', 'Physical key override for smart lock.');
END $$;
