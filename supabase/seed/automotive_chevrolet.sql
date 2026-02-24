-- Chevrolet models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';

  -- Silverado
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Silverado', 'silverado') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Silverado', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Prox key system. Requires GM Tech 2 or SPS/TIS2Web. All-keys-lost requires IMMO reset.', true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Silverado', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N-32337100', 'PK3+ transponder. OBD programmable with 10-minute relearn procedure.', true, 2014, 2018);

  -- Equinox
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Equinox', 'equinox') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Equinox', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4AA', 'Proximity key. GM Tech 2 or compatible aftermarket tool.', true, 2018, 2024);

  -- Malibu
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Malibu', 'malibu') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Malibu', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4EA', 'Smart key with push-button start. OBD programmable.', true, 2016, 2024);

  -- Traverse
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Traverse', 'traverse') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Traverse', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4AA', 'Smart proximity key. GM SPS or compatible tool required.', true, 2018, 2024);
END $$;
