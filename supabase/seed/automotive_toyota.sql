-- Toyota models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';

  -- Camry
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Camry', 'camry') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Camry', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBC', 'Requires Toyota Techstream or aftermarket tool. All keys must be present during programming.', false, true, 2018, 2024);
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Camry', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'proximity', 'Smart key programming via Techstream. Emergency key blade included.', false, true, 'TOY43', 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Camry', 'TOY44D-PT', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'transponder', 'On-board programming available with 2 working keys. Otherwise requires Techstream.', false, true, 2012, 2017);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2011) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Camry', 'TOY44D-PT', 'Texas Fixed Code', '4D67/4D68', 'transponder', 'OBD programmable. Customer self-learn with 2 working master keys.', false, true, 2003, 2011);

  -- Corolla
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Corolla', 'corolla') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Corolla', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBN', 'Techstream or aftermarket programmer required.', true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Corolla', 'TOY44G-PT', 'Texas Crypto 128-bit', 'G chip', 'transponder', 'G chip transponder. On-board with 2 keys or Techstream.', true, 2014, 2018);

  -- RAV4
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'RAV4', 'rav4') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota RAV4', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBC', 'All keys programming via Techstream. Must have all existing keys present.', true, 2019, 2024);

  -- Tacoma
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Tacoma', 'tacoma') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Tacoma', 'TOY44H-PT', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'transponder', 'H chip transponder key. OBD programming with compatible tool.', true, 2016, 2024);

  -- Highlander
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Highlander', 'highlander') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Highlander', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'Smart key system. Techstream or compatible aftermarket tool.', true, 2020, 2024);
END $$;
