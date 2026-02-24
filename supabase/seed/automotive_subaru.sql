-- Subaru models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';

  -- Outback
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Outback', 'outback') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Outback', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'Requires Subaru Select Monitor (SSM) IV or compatible aftermarket tool (Autel, SmartPro). All keys must be present during programming. Push-button start system.', false, true, 2020, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Outback', 'DAT17', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHC', 'Smart key system. Program via SSM III/IV or aftermarket tool. Proximity entry and push-button start.', false, true, 2015, 2019);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Outback', 'NSN19', 'Texas Fixed Code', '4D62', '315 MHz', 'transponder', 'CWTWB1U811', 'Transponder key with separate remote. OBD programmable with aftermarket tools. Pincode may be needed for all-keys-lost.', true, true, 2010, 2014);

  -- Forester
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Forester', 'forester') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Forester', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'Push-button start with proximity entry. Requires SSM IV or Autel IM608/SmartPro. All keys must be present.', false, true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Forester', 'DAT17', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHC', 'Smart key. Program via SSM III or aftermarket. Some trims use transponder key without push-button start.', false, true, 2014, 2018);

  -- Crosstrek
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Crosstrek', 'crosstrek') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Crosstrek', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'Push-button start. SSM IV or compatible aftermarket tool required. All keys must be registered together.', false, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Crosstrek', 'DAT17', 'Texas Fixed Code', '4D62', '315 MHz', 'transponder', 'CWTWB1U811', 'Transponder key with separate remote fob. OBD programmable. Pin code required for all-keys-lost via aftermarket tool.', true, true, 2013, 2017);

  -- Impreza
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Impreza', 'impreza') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Impreza', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'Push-button start on most trims. SSM IV or aftermarket tool. Base trims may use standard transponder key (DAT17).', false, true, 2017, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Impreza', 'NSN19', 'Texas Fixed Code', '4D62', '315 MHz', 'transponder', 'CWTWB1U811', 'Transponder key with separate remote. OBD programming available. Pin code needed for all-keys-lost situations.', true, true, 2012, 2016);

  -- WRX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'WRX', 'wrx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru WRX', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'New generation WRX. Push-button start standard. SSM IV or Autel/SmartPro required for programming.', false, true, 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru WRX', 'DAT17', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHC', 'Smart key on Limited/Premium trims. Base uses transponder key. SSM III/IV or aftermarket tool.', false, true, 2015, 2021);

  -- Legacy
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Legacy', 'legacy') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Legacy', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'Push-button start standard. SSM IV or compatible aftermarket tool. All existing keys must be present during registration.', false, true, 2020, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Legacy', 'DAT17', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHC', 'Smart key system. SSM III or aftermarket programmer. Proximity entry and push-button start on most trims.', false, true, 2015, 2019);

  -- Ascent
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Ascent', 'ascent') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Ascent', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'Push-button start standard on all trims. SSM IV or Autel IM608/SmartPro. All keys must be present for registration.', false, true, 2019, 2024);
END $$;
