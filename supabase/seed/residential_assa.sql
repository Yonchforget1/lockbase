-- ASSA residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'assa';

  -- Twin 6000 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Twin 6000 Deadbolt', 'twin-6000-deadbolt', 'deadbolt', 'ASSA Twin', 6, 'Sidebar with gin bottle pins', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'ASSA-6000', 'ASSA', 'ASSA Twin', 'nickel silver', 'ASSA proprietary restricted blank. Twin sidebar system with unique gin bottle pin design. Cannot be duplicated at hardware stores.');

  -- Protec2 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'ASSA Abloy Protec2 Deadbolt', 'protec2-deadbolt', 'deadbolt', 'Protec2', 6, 'Rotating disc with sidebar, anti-bump', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'ASSA-P2', 'ASSA', 'Protec2', 'nickel silver', 'ASSA Abloy Protec2 restricted blank. Rotating disc element for pick and bump resistance. UL437 listed. Patent protected through 2029.');

  -- Twin Pro Mortise Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Twin Pro Mortise Lock', 'twin-pro-mortise', 'mortise', 'ASSA Twin', 6, 'Sidebar with gin bottle pins', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'ASSA-6000', 'ASSA', 'ASSA Twin', 'nickel silver', 'ASSA Twin keyway mortise cylinder. Used in commercial and high-security residential applications. Restricted key system.');

  -- Max+ Restricted Padlock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Max+ Restricted Padlock', 'max-plus-padlock', 'padlock', 'ASSA Twin', 6, 'Sidebar with gin bottle pins', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'ASSA-6000', 'ASSA', 'ASSA Twin', 'nickel silver', 'High-security padlock with ASSA Twin cylinder. Hardened steel body. Same restricted keyway as Twin 6000 series.');
END $$;
