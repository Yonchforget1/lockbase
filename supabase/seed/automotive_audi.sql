-- Audi models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'audi';

  -- A4 (B9 2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'A4', 'a4') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi A4 (B9)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 5/MQB system. Requires VVDI2 with VVDI Audi adapter, Autel IM608 Pro, or dealer ODIS. Component protection must be removed before programming. PIN from BCM2 module or dealer. All keys lost: read BCM2 data via bench or OBDII.', true, false, 'HU66', 2017, 2024);

  -- A4 (B8 2009-2016)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi A4 (B8)', 'HU66', 'Megamos 48', 'Megamos Crypto 48 (CAN)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 4 system. Requires VVDI2, Autel IM608, or dealer ODIS. Can read PIN via OBD on most models. Add key via OBD supported. All keys lost: read component protection data from instrument cluster.', true, true, 'HU66', 2009, 2016);

  -- A6 (C8 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'A6', 'a6') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi A6 (C8)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '4M0959754', 'IMMO 5/MLBevo platform. Requires VVDI2 with Audi adapter, Autel IM608 Pro, or dealer ODIS. Component protection removal required. PIN from BCM2 or dealer. All keys lost: bench read BCM2. Higher security than MQB platform.', true, false, 'HU66', 2019, 2024);

  -- A6 (C7 2012-2018)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi A6 (C7)', 'HU66', 'Hitag Pro', 'Hitag Pro ID49', '433 MHz', 'smart_key', '4M0959754', 'IMMO 4/5 system (MLBevo). Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD supported on earlier models. Component protection on later C7 models. All keys lost: read instrument cluster or BCM2 data.', true, true, 'HU66', 2012, 2018);

  -- Q5 (FY 2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Q5', 'q5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi Q5 (FY)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 5/MQB platform. Requires VVDI2 with Audi adapter, Autel IM608 Pro, or ODIS. Component protection removal required. PIN from BCM2. All keys lost: read BCM2 via bench. Advanced key with Audi connect available.', true, false, 'HU66', 2018, 2024);

  -- Q5 (8R 2009-2017)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi Q5 (8R)', 'HU66', 'Megamos 48', 'Megamos Crypto 48 (CAN)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 4 system. Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD supported. Add key OBD programmable. All keys lost: read data from instrument cluster. Comfort key on equipped models.', true, true, 'HU66', 2009, 2017);

  -- Q7 (4M 2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Q7', 'q7') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi Q7 (4M)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '4M0959754', 'IMMO 5/MLBevo platform. Requires VVDI2 with Audi adapter, Autel IM608 Pro, or ODIS. Component protection removal required. PIN from BCM2 or dealer. All keys lost: bench read BCM2 module.', true, false, 'HU66', 2017, 2024);

  -- Q7 (4L 2007-2015)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi Q7 (4L)', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'proximity', 'NBG010206T', 'IMMO 3/4 system. Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD. Add key programmable via OBD. All keys lost: read data from instrument cluster. Earlier models (2007-2010) use IMMO 3.', true, true, 'HU66', 2007, 2015);

  -- A3 (8V/8Y 2015-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'A3', 'a3') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi A3 (8V/8Y)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 5/MQB platform. 8V (2015-2020), 8Y (2021+). Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection removal required on 2020+. PIN from BCM2. All keys lost: read BCM2 via bench.', true, false, 'HU66', 2015, 2024);

  -- Q3 (F3 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Q3', 'q3') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi Q3 (F3)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 5/MQB platform. Same as A3 platform. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection removal required. PIN from BCM2. All keys lost: read BCM2 via bench.', true, false, 'HU66', 2019, 2024);

  -- e-tron (GE 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'e-tron', 'e-tron') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi e-tron (GE)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '4M0959754', 'IMMO 5/MLBevo platform. Requires VVDI2 with Audi adapter, Autel IM608 Pro, or ODIS. Component protection removal required. PIN from BCM2. All keys lost: bench read BCM2. Electric vehicle — no traditional engine start.', true, false, 'HU66', 2019, 2024);

  -- A5 (F5 2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'A5', 'a5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi A5 (F5)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 5/MQB platform. Same as B9 A4 platform. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection removal required. PIN from BCM2. All keys lost: read BCM2 via bench.', true, false, 'HU66', 2018, 2024);
END $$;
