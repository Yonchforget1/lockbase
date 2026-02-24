-- Mitsubishi models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mitsubishi';

  -- Outlander
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Outlander', 'outlander') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Outlander', 'MIT11R', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'OUCJ166N', 'New generation on Nissan-Renault platform. Smart key system. Requires MUT-III or compatible aftermarket tool (Autel, SmartPro). All keys must be present.', false, true, 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Outlander', 'MIT11R', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'OUC644M-KEY-N', 'Smart key with push-button start. Program via MUT-III or aftermarket tool. Pincode from BCM may be required for all-keys-lost.', true, true, 2014, 2021);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Outlander', 'MIT3', 'Philips Crypto', '46 chip', '315 MHz', 'transponder', 'OUC644M-KEY-N', 'Transponder key with separate remote. Philips 46 chip. MUT-III or aftermarket tool. Pin code from dealer may be required.', true, true, 2007, 2013);

  -- Eclipse Cross
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Eclipse Cross', 'eclipse-cross') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Eclipse Cross', 'MIT11R', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'OUCJ166N', 'Smart key with push-button start. MUT-III or aftermarket programmer. 2022+ facelift uses updated firmware. All keys programmed simultaneously.', false, true, 2018, 2024);

  -- Outlander Sport
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Outlander Sport', 'outlander-sport') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Outlander Sport', 'MIT11R', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'OUCJ166N', 'Smart key on SE and above trims. Push-button start. MUT-III or aftermarket tool required.', false, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Outlander Sport', 'MIT11R', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'OUC644M-KEY-N', 'Smart key on higher trims. Base models use transponder key (MIT3). MUT-III or aftermarket tool. Pin code may be required.', true, true, 2011, 2017);

  -- Mirage
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Mirage', 'mirage') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Mirage', 'MIT11R', 'Hitag 2', '46 chip', '315 MHz', 'transponder', 'OUC644M-KEY-N', 'Transponder key with separate remote on most trims. No push-button start on base models. MUT-III or aftermarket OBD tool. Budget-friendly key replacement.', true, true, 2014, 2024);

  -- Lancer
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Lancer', 'lancer') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Lancer', 'MIT3', 'Philips Crypto', '46 chip', '315 MHz', 'transponder', 'OUC644M-KEY-N', 'Transponder key with separate remote fob. Philips 46 chip. MUT-III or aftermarket tool. Evolution models may have smart key option. Discontinued after 2017.', true, true, 2008, 2017);
END $$;
