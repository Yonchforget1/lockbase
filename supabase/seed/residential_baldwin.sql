-- Baldwin residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'baldwin';

  -- Prestige Series Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Prestige Series Deadbolt', 'prestige-deadbolt', 'deadbolt', 'SC1', 5, null, false, false, false, 'Grade 2', 'SmartKey re-key technology (Kwikset platform)')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Baldwin', 'SC1', 'nickel silver', 'Uses Schlage C keyway via Kwikset SmartKey platform. Standard 5-pin SC1 blank.');

  -- Estate Series Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Estate Series Deadbolt', 'estate-deadbolt', 'deadbolt', 'Baldwin Estate', 6, 'Spool pins', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'BA1', 'Baldwin', 'Baldwin Estate', 'nickel silver', 'Proprietary Baldwin Estate keyway. 6-pin high-security cylinder. Premium solid brass construction.');

  -- Reserve Series Entry
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Reserve Series Entry', 'reserve-entry', 'lever', 'SC1', 5, false, false, false, 'Grade 2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Baldwin', 'SC1', 'nickel silver', 'Premium decorative entry set. Standard SC1 keyway for easy rekeying and key duplication.');

  -- Evolved Smart Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Evolved Smart Lock', 'evolved-smart-lock', 'smart_lock', 'SC1', 5, false, false, false, 'Grade 2', 'Z-Wave, Bluetooth, up to 50 user codes, auto-lock, one-touch locking')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Baldwin', 'SC1', 'nickel silver', 'Physical key backup for smart lock. SC1 keyway with SmartKey re-key capability.');
END $$;
