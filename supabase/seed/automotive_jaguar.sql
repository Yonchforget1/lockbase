-- Jaguar models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'jaguar';

  -- F-Pace (2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'F-Pace', 'f-pace') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar F-Pace (X761)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'JLR SDD/Pathfinder for dealer programming. Autel IM608 Pro and Lonsdor K518 support add key via OBD. All keys lost requires KVM module virginization or replacement. Same JLR platform as Land Rover. Security access code required.', true, false, 'HU101', 2017, 2024);

  -- E-Pace (2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'E-Pace', 'e-pace') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar E-Pace (X540)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'JLR SDD/Pathfinder required. Autel IM608 Pro and Lonsdor K518 support add key. All keys lost requires KVM replacement or virginization. Shares platform with Land Rover Discovery Sport. Emergency blade HU101.', true, false, 'HU101', 2018, 2024);

  -- XF (2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XF', 'xf') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar XF (X260)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'Second-gen XF on iQ[Al] platform. JLR SDD/Pathfinder for programming. Autel IM608 Pro, Lonsdor K518 support add key via OBD. AKL requires KVM module work. 5-button smart key fob.', true, false, 'HU101', 2016, 2024);

  -- XF (2009-2015)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar XF (X250)', 'HU101', 'Hitag 2', 'PCF7945 (46 chip)', '315 MHz', 'smart_key', 'KOBJTF10A', 'First-gen XF. JLR SDD for programming. Older immobilizer system — more aftermarket tool support. Autel IM608, VVDI2, and Lonsdor K518 can add keys. All keys lost supported via OBD on most years. Less restrictive than newer models.', false, true, 'HU101', 2009, 2015);

  -- XE (2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XE', 'xe') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar XE (X760)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF18A', 'JLR iQ[Al] platform. SDD/Pathfinder for dealer programming. Autel IM608 Pro and Lonsdor K518 support add key. All keys lost requires KVM virginization. Same immobilizer complexity as F-Pace.', true, false, 'HU101', 2017, 2024);

  -- F-Type (2014-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'F-Type', 'f-type') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar F-Type (X152)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'Sports car platform. JLR SDD/Pathfinder for programming. Autel IM608 Pro and Lonsdor K518 support add key. AKL requires KVM module virginization or replacement. Premium fob design. Emergency blade HU101 for door/glove box.', true, false, 'HU101', 2014, 2024);

  -- I-Pace (2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'I-Pace', 'i-pace') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar I-Pace (X590)', 'HU101', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF18A', 'All-electric vehicle. JLR Pathfinder required. Limited aftermarket support — Autel IM608 Pro has partial coverage. AKL very complex, recommend dealer. No traditional ignition — push button start only. Emergency blade HU101 for door access.', true, false, 'HU101', 2019, 2024);
END $$;
