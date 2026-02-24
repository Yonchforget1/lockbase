-- Ford models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';

  -- F-150
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'F-150', 'f-150') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, pin_code_required, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-150', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'PATS system. Requires Ford IDS/FDRS or compatible tool. Must have admin key or security code.', true, false, 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, pin_code_required, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-150', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'transponder', 'M3N-A2C93142600', 'PATS 128-bit. Requires 2 working keys for on-board or Ford IDS with security code.', true, true, 2015, 2020);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, pin_code_required, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-150', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', 'PATS system. On-board programming with 2 working keys. PIN code bypass available via Ford IDS.', true, true, 2005, 2014);

  -- Explorer
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Explorer', 'explorer') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Explorer', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'Smart key with PATS. Ford IDS/FDRS required for all-keys-lost.', true, 2020, 2024);

  -- Escape
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Escape', 'escape') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Escape', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'Proximity smart key. Ford IDS/FDRS or aftermarket tool required.', true, 2020, 2024);

  -- Mustang
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Mustang', 'mustang') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Mustang', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'smart_key', 'M3N-A2C931426', 'Smart key system. PATS 128-bit. Ford IDS/FDRS or compatible programmer.', true, 2015, 2024);
END $$;
