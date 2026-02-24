-- Land Rover models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'land-rover';

  -- Range Rover (2022-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Range Rover', 'range-rover') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Range Rover (L460)', 'HU101', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'HK83-15K601-AB', 'JLR Pathfinder SDD required for dealer-level programming. Autel IM608 Pro and Lonsdor K518 support add key and all keys lost. KVM (Key Vehicle Module) may need virginization for AKL on 2022+. Emergency blade HU101. Extremely complex immobilizer — recommend dealer backup.', true, false, 'HU101', 2022, 2024);

  -- Range Rover (2013-2021)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Range Rover (L405)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'JLR SDD/Pathfinder for dealer programming. Autel IM608 Pro, Lonsdor K518, and OBDSTAR support add key via OBD. All keys lost requires KVM module replacement or virginization. PIN/security code required from dealer or EEPROM read.', true, false, 'HU101', 2013, 2021);

  -- Range Rover Sport (2023-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Range Rover Sport', 'range-rover-sport') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Range Rover Sport (L461)', 'HU101', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'HK83-15K601-AB', 'JLR Pathfinder required. Autel IM608 Pro and Lonsdor K518 support add key. All keys lost requires KVM virginization or replacement. New generation platform with enhanced immobilizer security. Emergency blade HU101.', true, false, 'HU101', 2023, 2024);

  -- Range Rover Sport (2014-2022)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Range Rover Sport (L494)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'JLR SDD/Pathfinder for programming. Autel IM608 Pro, Lonsdor K518 support add key via OBD. All keys lost: KVM replacement or virginization required. Security access code needed. 5-button smart key fob.', true, false, 'HU101', 2014, 2022);

  -- Discovery (2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Discovery', 'discovery') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Discovery 5 (L462)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJXF18A', 'JLR SDD/Pathfinder for dealer programming. Autel IM608 Pro and Lonsdor K518 support add key and all keys lost. KVM virginization may be needed for AKL. Shares platform with Range Rover Sport L494.', true, false, 'HU101', 2017, 2024);

  -- Defender (2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Defender', 'defender') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Defender (L663)', 'HU101', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'HK83-15K601-AB', 'New Defender platform (L663). JLR Pathfinder required. Autel IM608 Pro and Lonsdor K518 have limited support. All keys lost requires KVM module work. Very high security system. Emergency blade HU101 for door only.', true, false, 'HU101', 2020, 2024);

  -- Range Rover Evoque (2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Range Rover Evoque', 'range-rover-evoque') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Range Rover Evoque (L551)', 'HU101', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJXF18A', 'Second-gen Evoque on PTA platform. JLR Pathfinder for dealer programming. Autel IM608 Pro and Lonsdor K518 support add key. AKL requires KVM virginization. Enhanced security over first gen.', true, false, 'HU101', 2020, 2024);

  -- Range Rover Evoque (2012-2019)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Range Rover Evoque (L538)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'First-gen Evoque. JLR SDD for dealer programming. Autel IM608 Pro, Lonsdor K518, OBDSTAR support add key via OBD. All keys lost: KVM replacement or EEPROM read. 5-button smart fob.', true, false, 'HU101', 2012, 2019);

  -- Discovery Sport (2015-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Discovery Sport', 'discovery-sport') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Discovery Sport (L550)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJXF18A', 'JLR SDD/Pathfinder for programming. Autel IM608 Pro and Lonsdor K518 support add key via OBD. All keys lost requires KVM module virginization or replacement. 2020+ facelift may have updated security. Emergency key blade HU101.', true, false, 'HU101', 2015, 2024);
END $$;
