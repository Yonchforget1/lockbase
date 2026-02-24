-- Buick models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'buick';

  -- Encore
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Encore', 'encore') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Encore', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4AA', 'Proximity smart key with push-button start. GM SPS/TIS2Web or Autel IM508/608 required. All-keys-lost requires IMMO reset.', false, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Encore', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3+ transponder. OBD programmable with 10-minute relearn procedure. GM Tech 2 or compatible tool.', false, true, 2013, 2017);

  -- Enclave
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Enclave', 'enclave') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Enclave', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4EA', 'Proximity key system. Requires GM SPS or Autel IM608. All-keys-lost requires IMMO reset.', false, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Enclave', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3+ transponder system. 10-minute relearn procedure via OBD. GM Tech 2 or compatible aftermarket tool.', false, true, 2008, 2017);

  -- Envision
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Envision', 'envision') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Envision', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4EA', 'Proximity smart key with push-button start. GM SPS/TIS2Web or Autel IM608 required. All-keys-lost requires IMMO reset.', false, true, 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Envision', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N-32337100', 'PK3+ transponder. OBD programmable with 10-minute relearn. GM Tech 2 or Autel IM508.', false, true, 2016, 2020);

  -- Regal
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Regal', 'regal') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Regal', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4EA', 'Proximity key with push-button start. GM SPS or Autel IM608 required.', false, true, 2018, 2020);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Regal', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3+ transponder. OBD programmable with 10-minute relearn procedure.', false, true, 2011, 2017);

  -- LaCrosse
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'LaCrosse', 'lacrosse') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick LaCrosse', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4AA', 'Proximity key system with push-button start. GM SPS/TIS2Web or Autel IM608 required.', false, true, 2017, 2019);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick LaCrosse', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3+ transponder. 10-minute relearn via OBD. GM Tech 2 or compatible aftermarket tool.', false, true, 2010, 2016);
END $$;
