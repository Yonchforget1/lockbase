-- Emtek residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'emtek';

  -- Regular Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Regular Deadbolt', 'regular-deadbolt', 'deadbolt', 'SC1', 5, false, false, false, 'Grade 2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Emtek', 'SC1', 'nickel silver', 'Standard SC1 Schlage C keyway. Emtek focuses on designer hardware aesthetics. Multiple decorative rosette and lever options available.');

  -- EMPowered Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'EMPowered Deadbolt', 'empowered-deadbolt', 'smart_lock', 'SC1', 5, false, false, false, 'Grade 2', 'Bluetooth, Apple HomeKit, August app integration, auto-lock, auto-unlock, DoorSense')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Emtek', 'SC1', 'nickel silver', 'Physical key backup for EMPowered smart deadbolt. Uses August smart lock module inside Emtek decorative hardware. SC1 keyway.');

  -- Providence Entry Set
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Providence Entry Set', 'providence-entry', 'knob', 'SC1', 5, false, false, false, 'Grade 2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Emtek', 'SC1', 'nickel silver', 'Decorative crystal knob entry set. SC1 keyway. Emtek uses Schlage C compatible cylinders across their residential line.');

  -- Helios Lever Entry Set
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Helios Lever Entry Set', 'helios-lever-entry', 'lever', 'SC1', 5, false, false, false, 'Grade 2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Emtek', 'SC1', 'nickel silver', 'Designer lever entry set. SC1 Schlage C keyway. Available in 20+ finish options. Solid forged brass construction.');
END $$;
