-- Defiant residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'defiant';

  -- Single Cylinder Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Single Cylinder Deadbolt', 'single-cylinder-deadbolt', 'deadbolt', 'KW1', 5, false, false, false, 'Grade 3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Defiant', 'KW1', 'nickel silver', 'Uses standard KW1 keyway. Compatible with Kwikset key blanks.');

  -- Brandywine Entry Knob
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Brandywine Entry Knob', 'brandywine-knob', 'knob', 'KW1', 5, false, false, false, 'Grade 3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Defiant', 'KW1', 'nickel silver', 'Standard entry knob. KW1 keyway for easy replacement.');

  -- Electronic Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Square Electronic Deadbolt', 'square-electronic', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 3', 'Keypad entry, up to 16 user codes, auto-lock')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Defiant', 'KW1', 'nickel silver', 'Physical key backup for electronic deadbolt. KW1 keyway.');

  -- Hartford Lever
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Hartford Entry Lever', 'hartford-lever', 'lever', 'KW1', 5, false, false, false, 'Grade 3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Defiant', 'KW1', 'nickel silver', 'Entry lever handle set. Standard KW1 key.');
END $$;
