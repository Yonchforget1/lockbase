-- GMC models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'gmc';

  -- Sierra 1500
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sierra 1500', 'sierra-1500') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Sierra 1500', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Proximity key with push-button start. Requires GM Tech 2 or SPS/TIS2Web. All-keys-lost requires IMMO reset. Autel IM508/608 compatible.', false, true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Sierra 1500', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N-32337100', 'PK3+ transponder system. OBD programmable with 10-minute relearn procedure. GM Tech 2 or Autel IM508.', false, true, 2014, 2018);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Sierra 1500', 'B102-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3 transponder. OBD programmable with 10-minute relearn. GM Tech 2 or compatible aftermarket tool.', false, true, 2007, 2013);

  -- Terrain
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Terrain', 'terrain') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Terrain', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1AA', 'Proximity smart key. GM SPS/TIS2Web or Autel IM508/608 required. All-keys-lost requires IMMO reset.', false, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Terrain', 'B102-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3+ transponder. 10-minute relearn procedure via OBD. GM Tech 2 or compatible tool.', false, true, 2010, 2017);

  -- Acadia
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Acadia', 'acadia') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Acadia', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1AA', 'Proximity key system with push-button start. Requires GM SPS or Autel IM608. All-keys-lost requires IMMO reset.', false, true, 2017, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Acadia', 'B102-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3 transponder system. OBD programmable with 10-minute relearn procedure.', false, true, 2007, 2016);

  -- Yukon
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Yukon', 'yukon') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Yukon', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Proximity key with push-button start. GM SPS/TIS2Web or Autel IM608 required. All-keys-lost requires IMMO reset.', false, true, 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Yukon', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N-32337100', 'PK3+ transponder. OBD programmable with 10-minute relearn. GM Tech 2 or Autel IM508.', false, true, 2015, 2020);

  -- Canyon
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Canyon', 'canyon') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Canyon', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N-32337100', 'PK3+ transponder system. OBD programmable with 10-minute relearn procedure. GM Tech 2 or compatible tool.', false, true, 2015, 2024);
END $$;
