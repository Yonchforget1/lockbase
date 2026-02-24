-- Nissan models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'nissan';

  -- Altima
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Altima', 'altima') RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Altima', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'Intelligent key. Requires Nissan CONSULT or compatible aftermarket tool.', true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Altima', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR5S180144014', 'Intelligent key system. CONSULT III or aftermarket tool.', true, 2013, 2018);

  -- Rogue
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Rogue', 'rogue') RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Rogue', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'Intelligent key. Nissan CONSULT or aftermarket programmer.', true, 2021, 2024);

  -- Sentra
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sentra', 'sentra') RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Sentra', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'Push-button start with intelligent key. CONSULT required.', true, 2020, 2024);
END $$;
