-- Volvo models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volvo';

  -- XC90
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XC90', 'xc90') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volvo XC90', 'Smart Key Fob Only', 'Hitag Pro AES', '128-bit AES', '433 MHz', 'smart_key', 'KR5V2X', 'SPA platform. Fully keyless system. Requires Volvo VIDA/DiCE or dealer programming. Aftermarket support limited (Lonsdor, VVDI). Emergency key blade NE66 included in fob.', false, false, 'NE66', 2016, 2024);

  -- XC60
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XC60', 'xc60') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volvo XC60', 'Smart Key Fob Only', 'Hitag Pro AES', '128-bit AES', '433 MHz', 'smart_key', 'KR5V2X', 'SPA platform. Fully keyless with push-button start. Volvo VIDA/DiCE required. Limited aftermarket support. Emergency blade NE66 stored in fob casing.', false, false, 'NE66', 2018, 2024);

  -- XC40
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XC40', 'xc40') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volvo XC40', 'Smart Key Fob Only', 'Hitag Pro AES', '128-bit AES', '433 MHz', 'smart_key', 'KR5V2X', 'CMA platform. Fully keyless system. Volvo VIDA/DiCE or dealer only. Some aftermarket tools gaining support (Lonsdor K518). Emergency key blade NE66. EV Recharge models same key system.', false, false, 'NE66', 2019, 2024);

  -- S60
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'S60', 's60') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volvo S60', 'Smart Key Fob Only', 'Hitag Pro AES', '128-bit AES', '433 MHz', 'smart_key', 'KR5V2X', 'SPA platform. Fully keyless system with push-button start. Volvo VIDA/DiCE or dealer programming. Emergency key blade NE66 hidden in fob.', false, false, 'NE66', 2019, 2024);

  -- V60
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'V60', 'v60') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volvo V60', 'Smart Key Fob Only', 'Hitag Pro AES', '128-bit AES', '433 MHz', 'smart_key', 'KR5V2X', 'SPA platform. Same key system as S60/XC60. Volvo VIDA/DiCE or dealer only. Cross Country variant uses identical key system. Emergency blade NE66.', false, false, 'NE66', 2019, 2024);

  -- S90
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'S90', 's90') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volvo S90', 'Smart Key Fob Only', 'Hitag Pro AES', '128-bit AES', '433 MHz', 'smart_key', 'KR5V2X', 'SPA platform flagship sedan. Fully keyless with push-button start. Volvo VIDA/DiCE required for programming. Very limited aftermarket support. Emergency key blade NE66.', false, false, 'NE66', 2017, 2024);
END $$;
