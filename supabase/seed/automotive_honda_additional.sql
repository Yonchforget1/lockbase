-- Honda additional models, years, and keys

-- HR-V
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'HR-V', 'hr-v') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda HR-V', 'HON66', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'KR5TP-4', 'New generation HR-V. Smart key with push-button start. Honda HDS or compatible aftermarket tool required.', false, true, 2023, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda HR-V', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', 'Smart key equipped trims. Some base trims use transponder key. Honda HDS or aftermarket programmer.', false, true, 2016, 2022);
END $$;

-- Odyssey
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Odyssey', 'odyssey') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Odyssey', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', '5th generation Odyssey. Smart key with push-button start. Honda HDS or aftermarket tool required.', false, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Odyssey', 'HON66', 'Megamos 46', '46 chip', '315 MHz', 'smart_key', 'CWTWB1G0090', '4th generation Odyssey. Smart key on Touring trims. Some trims use transponder key with 46 chip.', false, true, 2011, 2017);
END $$;

-- Ridgeline
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Ridgeline', 'ridgeline') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Ridgeline', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', '2nd generation Ridgeline. Smart key with push-button start standard. Honda HDS or aftermarket programmer.', false, true, 2017, 2024);
END $$;

-- Passport
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Passport', 'passport') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Passport', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', 'Smart key with push-button start. Honda HDS or compatible aftermarket tool. All keys must be present during programming.', false, true, 2019, 2024);
END $$;

-- Fit
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Fit', 'fit') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Fit', 'HON66', 'Megamos 46', '46 chip', 'transponder', 'A2C98676600', '3rd generation Fit. Transponder key standard. EX and above trims may have smart key option. OBD programmable via Honda HDS or aftermarket.', false, true, 2015, 2020);
END $$;
