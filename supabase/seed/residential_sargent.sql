-- Sargent residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'sargent';

  -- 8200 Series Mortise Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '8200 Series Mortise Lock', '8200-mortise', 'mortise', 'Sargent LA', 6, 'Spool and serrated pins available', true, true, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '6275LA', 'Sargent', 'Sargent LA', 'nickel silver', 'Sargent 6-pin LA keyway. Commercial/institutional grade mortise lock. Heavy-duty chassis rated for high-traffic environments.');

  -- 6500 Series Cylindrical Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '6500 Series Cylindrical Lock', '6500-cylindrical', 'lever', 'Sargent LA', 6, null, false, false, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '6275LA', 'Sargent', 'Sargent LA', 'nickel silver', 'Sargent LA keyway cylindrical lever lock. Grade 1 commercial duty cycle. Common in schools, hospitals, and office buildings.');

  -- 7800 Series Mortise Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '7800 Series Mortise Lock', '7800-mortise', 'mortise', 'Sargent HA', 5, null, false, false, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '5275HA', 'Sargent', 'Sargent HA', 'nickel silver', 'Sargent 5-pin HA keyway. Standard duty mortise lock for commercial and institutional applications.');

  -- 10 Line Cylindrical Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '10 Line Cylindrical Lock', '10-line-cylindrical', 'lever', 'Sargent LA', 6, null, false, false, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '6275LA', 'Sargent', 'Sargent LA', 'nickel silver', 'Sargent 10 Line bored lock. Heavy-duty cylindrical chassis. 6-pin LA keyway. ADA compliant lever trim available.');
END $$;
