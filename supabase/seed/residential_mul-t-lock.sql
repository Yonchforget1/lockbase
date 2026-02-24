-- Mul-T-Lock residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mul-t-lock';

  -- Hercular Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Hercular Deadbolt', 'hercular-deadbolt', 'deadbolt', 'MT5+', 5, 'Pin-in-pin telescoping (10 effective pins), sidebar', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'MTL-MT5+', 'Mul-T-Lock', 'MT5+', 'nickel silver', 'Restricted MT5+ key blank. Pin-in-pin system creates 10 effective shear lines from 5 chambers. Sidebar with alpha spring. Patent protected.');

  -- Cronus Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Cronus Deadbolt', 'cronus-deadbolt', 'deadbolt', 'Interactive+', 5, 'Pin-in-pin telescoping, floating pin element', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'MTL-INT+', 'Mul-T-Lock', 'Interactive+', 'nickel silver', 'Restricted Interactive+ key blank. Features floating pin for interactive element verification. Telescoping pin-in-pin design.');

  -- E-Series Padlock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'E-Series Padlock', 'e-series-padlock', 'padlock', 'MT5+', 5, 'Pin-in-pin telescoping, sidebar', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'MTL-MT5+', 'Mul-T-Lock', 'MT5+', 'nickel silver', 'High-security padlock with Mul-T-Lock MT5+ cylinder. Hardened boron shackle. Same restricted key platform as Hercular.');

  -- Entr Smart Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Entr Smart Lock', 'entr-smart-lock', 'smart_lock', 'MT5+', 5, 'Pin-in-pin telescoping, sidebar', true, true, true, 'Grade 1', 'Motorized smart lock, fingerprint reader, Bluetooth, remote access, up to 20 users')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'MTL-MT5+', 'Mul-T-Lock', 'MT5+', 'nickel silver', 'Physical key override for Entr smart lock. Uses high-security MT5+ cylinder as backup.');
END $$;
