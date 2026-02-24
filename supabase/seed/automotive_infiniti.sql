-- Infiniti models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'infiniti';

  -- QX60
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'QX60', 'qx60') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti QX60', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'All-new QX60 platform (2022+). Intelligent key. Requires Nissan CONSULT III+ or aftermarket tool (Autel, Smart Pro). All keys must be present.', false, true, 'NSN14', 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti QX60', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR5S180144014', 'QX60 (formerly JX35). Intelligent key system. Nissan CONSULT III+ or aftermarket tool. OBD programmable.', false, true, 'NSN14', 2014, 2021);

  -- QX80
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'QX80', 'qx80') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti QX80', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'QX80 facelift. Intelligent key with Hitag AES. Nissan CONSULT III+ or aftermarket tool. All keys must be present.', false, true, 'NSN14', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti QX80', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'CWTWB1G767', 'QX80 (1st gen). Intelligent key. Hitag 2 transponder. Nissan CONSULT III+ or aftermarket tool. OBD programmable.', false, true, 'NSN14', 2014, 2018);

  -- QX50
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'QX50', 'qx50') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti QX50', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', '2nd gen QX50. Intelligent key with Hitag AES. Nissan CONSULT III+ or aftermarket tool (Autel, Smart Pro).', false, true, 'NSN14', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti QX50', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'S180144014', '1st gen QX50. Intelligent key. Hitag 2 transponder. CONSULT III+ or aftermarket tool.', false, true, 'NSN14', 2014, 2018);

  -- Q50
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Q50', 'q50') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti Q50', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'Q50 refresh. Intelligent key with Hitag AES (4A chip). Nissan CONSULT III+ or aftermarket tool. All keys present.', false, true, 'NSN14', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti Q50', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR5S180144014', 'Q50 (V37). Intelligent key system. Hitag 2 transponder. CONSULT III+ or aftermarket tool. OBD programmable.', false, true, 'NSN14', 2014, 2018);

  -- Q60
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Q60', 'q60') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti Q60', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'Q60 coupe. Intelligent key with Hitag AES. Nissan CONSULT III+ or aftermarket tool. All keys must be present.', false, true, 'NSN14', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti Q60', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'CWTWB1G767', 'Q60 (CV37). Intelligent key system. Hitag 2 transponder. CONSULT III+ or aftermarket tool. OBD programmable.', false, true, 'NSN14', 2017, 2018);
END $$;
