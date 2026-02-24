-- Honda models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';

  -- Civic
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Civic', 'civic') RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Civic', 'HON66', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'KR5TP-4', 'Requires Honda HDS or compatible aftermarket tool. Proximity key system.', true, 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Civic', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', 'Smart key. Honda HDS tool or aftermarket programmer required.', true, 2016, 2021);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Civic', 'HON66', 'Megamos 46', '46 chip', 'transponder', 'OBD programmable with Honda HDS. Aftermarket tools available.', true, 2006, 2015);

  -- Accord
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Accord', 'accord') RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Accord', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'CWTWB1G0090', 'Smart proximity key. Program via Honda HDS or aftermarket.', true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Accord', 'HON66', 'Megamos 46', '46 chip', 'transponder', 'Standard transponder. OBD programmable.', true, 2008, 2017);

  -- CR-V
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CR-V', 'cr-v') RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda CR-V', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', 'Smart key system. Honda HDS or aftermarket programmer.', true, 2017, 2024);

  -- Pilot
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Pilot', 'pilot') RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Pilot', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', 'Proximity key. All keys must be present for programming.', true, 2016, 2024);
END $$;
