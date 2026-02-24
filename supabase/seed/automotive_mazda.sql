-- Mazda models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mazda';

  -- CX-5
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CX-5', 'cx-5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda CX-5', 'MAZ24R', 'Hitag Pro', '49 chip (Hitag Pro)', '315 MHz', 'smart_key', 'WAZSKE13D03', 'Push-button start. Requires Mazda IDS/M-MDS or aftermarket tool (Autel, SmartPro). Must register all keys at once.', false, true, 2017, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda CX-5', 'MAZ24R', 'Hitag 3', '49 chip', '315 MHz', 'smart_key', 'WAZSKE13D01', 'Smart key system. Mazda IDS or compatible aftermarket tool required. Proximity entry and push-button start.', false, true, 2013, 2016);

  -- CX-9
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CX-9', 'cx-9') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda CX-9', 'MAZ24R', 'Hitag Pro', '49 chip (Hitag Pro)', '315 MHz', 'smart_key', 'WAZSKE13D03', 'Push-button start standard. Mazda IDS or aftermarket tool (Autel IM608, XTOOL). All keys must be present during programming.', false, true, 2016, 2024);

  -- CX-30
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CX-30', 'cx-30') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda CX-30', 'MAZ24R', 'Hitag Pro', '49 chip (Hitag Pro)', '315 MHz', 'smart_key', 'WAZSKE13D03', 'Push-button start. Mazda IDS/M-MDS or Autel IM608. Must program all keys simultaneously. Emergency key blade included in fob.', false, true, 2020, 2024);

  -- Mazda3
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Mazda3', 'mazda3') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda Mazda3', 'MAZ24R', 'Hitag Pro', '49 chip (Hitag Pro)', '315 MHz', 'smart_key', 'WAZSKE13D03', '4th gen Mazda3. Push-button start. Mazda IDS or aftermarket tool required. All keys registered at once.', false, true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda Mazda3', 'MAZ24R', 'Hitag 3', '49 chip', '315 MHz', 'smart_key', 'WAZSKE13D01', '3rd gen Mazda3. Smart key with push-button start on select trims. Mazda IDS or compatible aftermarket programmer.', false, true, 2014, 2018);

  -- Mazda6
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Mazda6', 'mazda6') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda Mazda6', 'MAZ24R', 'Hitag 3', '49 chip', '315 MHz', 'smart_key', 'WAZSKE13D01', 'Smart key with push-button start. Mazda IDS or aftermarket tool. Discontinued after 2021 model year.', false, true, 2014, 2021);

  -- MX-5 Miata
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'MX-5 Miata', 'mx-5-miata') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda MX-5 Miata', 'MAZ24R', 'Hitag Pro', '49 chip (Hitag Pro)', '315 MHz', 'smart_key', 'SKE13D-02', 'ND generation Miata. Push-button start on Grand Touring and above. Mazda IDS or aftermarket programmer.', false, true, 2016, 2024);

  -- CX-50
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CX-50', 'cx-50') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda CX-50', 'MAZ24R', 'Hitag Pro', '49 chip (Hitag Pro)', '315 MHz', 'smart_key', 'WAZSKE13D03', 'Push-button start standard. Built on Mazda large platform. Mazda IDS or Autel IM608. Emergency key blade included in fob.', false, true, 2023, 2024);
END $$;
