-- Lexus models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lexus';

  -- RX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'RX', 'rx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus RX500h', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FLB', 'Requires Toyota Techstream or aftermarket tool (Autel, Xhorse). All keys must be present during programming. New platform (RX 5th gen).', false, true, 'TOY48', 2023, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus RX350', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBA', 'Smart key system. Program via Toyota Techstream or aftermarket (Autel, Xhorse). All existing keys must be present.', false, true, 'TOY48', 2016, 2022);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus RX350', 'TOY48', 'Texas Fixed Code', 'D chip (4D-67/4D-68)', '315 MHz', 'smart_key', 'HYQ14AAB', 'Older smart key system. Texas 4D transponder. Techstream or aftermarket tool required. All keys must be present.', false, true, 'TOY48', 2010, 2015);

  -- ES
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'ES', 'es') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus ES350', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'Smart key system (7th gen ES). Program via Toyota Techstream or aftermarket tool. All keys must be present during programming.', false, true, 'TOY48', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus ES350', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBA', 'Smart key. Techstream or aftermarket programmer. All keys must be present.', false, true, 'TOY48', 2013, 2018);

  -- NX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'NX', 'nx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus NX', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', '2nd gen NX. Smart key system. Toyota Techstream or aftermarket tool (Autel, Xhorse). All keys must be present.', false, true, 'TOY48', 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus NX', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBA', '1st gen NX. Smart key. Techstream or aftermarket tool required. All keys present during programming.', false, true, 'TOY48', 2015, 2021);

  -- IS
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'IS', 'is') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus IS', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'IS facelift (2021+). Smart key system. Techstream or aftermarket tool. All keys must be present.', false, true, 'TOY48', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus IS', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBA', '3rd gen IS. Smart key. Toyota Techstream or aftermarket programmer required. All keys present.', false, true, 'TOY48', 2014, 2020);

  -- GX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GX', 'gx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2024, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus GX550', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FLB', 'All-new GX550 platform (2024+). Smart key. Techstream or aftermarket tool. All keys must be present.', false, true, 'TOY48', 2024, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2023) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus GX460', 'TOY48', 'Texas Fixed Code', 'D chip (4D-67/4D-68)', '315 MHz', 'smart_key', 'HYQ14AAB', 'GX460 smart key system. Texas 4D transponder. Techstream or aftermarket tool. All keys must be present during programming.', false, true, 'TOY48', 2010, 2023);

  -- UX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'UX', 'ux') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus UX', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'Subcompact crossover. Smart key system. Techstream or aftermarket tool (Autel, Xhorse). All keys must be present.', false, true, 'TOY48', 2019, 2024);

  -- LC
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'LC', 'lc') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus LC', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'Flagship coupe. Smart key system. Toyota Techstream or aftermarket tool. All keys must be present during programming.', false, true, 'TOY48', 2018, 2024);

  -- LX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'LX', 'lx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus LX600', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FLB', 'LX600 (4th gen, TNGA-F platform). Smart key. Techstream or aftermarket tool. All keys must be present.', false, true, 'TOY48', 2022, 2024);
END $$;
