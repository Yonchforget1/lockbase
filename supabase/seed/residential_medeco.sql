-- Medeco residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'medeco';

  -- Maxum Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Maxum Deadbolt', 'maxum-deadbolt', 'deadbolt', 'Medeco Original', 6, 'Spool pins, chisel point rotating pins', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'A1515', 'Medeco', 'Medeco Original', 'nickel silver', 'Medeco proprietary restricted blank. Angled cuts with rotation. DO NOT duplicate at hardware stores. Locksmith authorization required.');

  -- M3 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'M3 Deadbolt', 'm3-deadbolt', 'deadbolt', 'Medeco M3', 6, 'Rotating pins with sidebar, slider mechanism', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'M3-SC1', 'Medeco', 'Medeco M3', 'nickel silver', 'Medeco M3 restricted key. Features angled cuts, rotation, and fore-aft positioning for slider. UL437 listed. Patent protected.');

  -- Nexgen Padlock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Nexgen Padlock', 'nexgen-padlock', 'padlock', 'Medeco Biaxial', 6, 'Rotating pins with sidebar', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KY-P-BX', 'Medeco', 'Medeco Biaxial', 'nickel silver', 'Restricted Medeco Biaxial key blank. Hardened steel shackle padlock. Boron alloy anti-cut protection.');

  -- Medeco 4 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Medeco 4 Deadbolt', 'medeco-4-deadbolt', 'deadbolt', 'Medeco 4', 6, 'Rotating pins, sidebar, slider, ball bearing', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'M4-BX', 'Medeco', 'Medeco 4', 'nickel silver', 'Latest generation Medeco restricted blank. Four levels of security: rotation, sidebar, slider, and ball bearing. UL437 listed. DO NOT duplicate.');
END $$;
