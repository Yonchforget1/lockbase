-- Acura models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'acura';

  -- TLX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'TLX', 'tlx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura TLX', 'HON66', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'KR5TP-4', '2nd gen TLX. Smart key system. Requires Honda HDS or aftermarket tool (Autel, Smart Pro). All keys must be present.', false, true, 'HON66', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura TLX', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V1X', '1st gen TLX. Smart key. Honda HDS or aftermarket programmer. All keys present during programming.', false, true, 'HON66', 2015, 2020);

  -- MDX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'MDX', 'mdx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura MDX', 'HON66', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'KR5TP-4', '4th gen MDX. Smart key system. Honda HDS or aftermarket tool (Autel, Smart Pro). All keys must be present.', false, true, 'HON66', 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura MDX', 'HON66', 'Hitag 3', '47 chip', '313.8 MHz', 'smart_key', 'KR5V1X', '3rd gen MDX. Smart key. Honda HDS or aftermarket tool. All keys present during programming.', false, true, 'HON66', 2014, 2021);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura MDX', 'HON66', 'Megamos 46', '46 chip', '315 MHz', 'smart_key', 'ACJ932HK1210A', '2nd gen MDX. Proximity smart key with Megamos 46 transponder. Honda HDS or aftermarket tool. OBD programmable.', false, true, 'HON66', 2007, 2013);

  -- RDX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'RDX', 'rdx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura RDX', 'HON66', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', '3rd gen RDX. Smart key system. Honda HDS or aftermarket tool (Autel, Smart Pro). All keys must be present.', false, true, 'HON66', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura RDX', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V1X', '2nd gen RDX. Smart key. Honda HDS or aftermarket tool required. All keys present during programming.', false, true, 'HON66', 2013, 2018);

  -- ILX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'ILX', 'ilx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura ILX', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V1X', 'ILX facelift. Smart key system. Honda HDS or aftermarket tool. All keys must be present during programming.', false, true, 'HON66', 2016, 2022);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura ILX', 'HON66', 'Megamos 46', '46 chip', '315 MHz', 'smart_key', 'ACJ932HK1210A', 'Early ILX. Megamos 46 transponder. Honda HDS or aftermarket programmer. OBD programmable.', false, true, 'HON66', 2013, 2015);

  -- Integra
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Integra', 'integra') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura Integra', 'HON66', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'KR5TP-4', 'Revived Integra (Civic-based). Smart key system. Honda HDS or aftermarket tool (Autel, Smart Pro). All keys must be present.', false, true, 'HON66', 2023, 2024);
END $$;
