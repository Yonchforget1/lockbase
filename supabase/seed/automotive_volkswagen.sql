-- Volkswagen models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volkswagen';

  -- Jetta (2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Jetta', 'jetta') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Jetta (MK7)', 'HU162', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '3G0959752', 'MQB platform / IMMO 5. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or dealer ODIS. Component protection on 2020+ models. PIN from BCM2. All keys lost: read BCM2 via bench or OBDII. KESSY equipped models use smart key.', true, false, 'HU162', 2019, 2024);

  -- Jetta (2011-2018)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Jetta (MK6)', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'transponder', '5K0837202AK', 'PQ platform / IMMO 4. Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD supported. OBD add key programming available. All keys lost: read data from instrument cluster. Non-KESSY models use standard flip key.', true, true, 'HU66', 2011, 2018);

  -- Tiguan (2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Tiguan', 'tiguan') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Tiguan (MK2)', 'HU162', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '3G0959752', 'MQB platform / IMMO 5. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection on later models. PIN from BCM2. All keys lost: read BCM2 via bench. KESSY standard on SEL and above trims.', true, false, 'HU162', 2018, 2024);

  -- Tiguan (2009-2017)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Tiguan (MK1)', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'transponder', '5K0837202AK', 'PQ platform / IMMO 4. Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD. OBD programmable for add key. All keys lost: read instrument cluster data. Standard flip key with remote.', true, true, 'HU66', 2009, 2017);

  -- Atlas (2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Atlas', 'atlas') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Atlas', 'HU162', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '3G0959752', 'MQB platform / IMMO 5. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection on 2020+ models. PIN from BCM2. All keys lost: read BCM2 via bench. KESSY standard on most trims.', true, false, 'HU162', 2018, 2024);

  -- Golf/GTI (MK7/MK8 2015-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Golf/GTI', 'golf-gti') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Golf/GTI (MK7/MK8)', 'HU162', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', 'NBG010180T', 'MQB platform / IMMO 5. MK7 (2015-2021), MK8 (2022+). Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection on MK8 models. PIN from BCM2. All keys lost: read BCM2 via bench. KESSY on GTI Autobahn and above.', true, false, 'HU162', 2015, 2024);

  -- Golf (MK6 2010-2014)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Golf/GTI (MK6)', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'transponder', '5K0837202AK', 'PQ platform / IMMO 4. Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD. OBD programmable for add key. All keys lost: read instrument cluster. Standard flip key remote.', true, true, 'HU66', 2010, 2014);

  -- Passat (2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Passat', 'passat') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Passat (NMS)', 'HU162', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '3G0959752', 'MQB platform / IMMO 5. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection on later models. PIN from BCM2. All keys lost: read BCM2 via bench. KESSY standard on most trims.', true, false, 'HU162', 2020, 2024);

  -- Passat (2012-2019)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Passat (NMS B7)', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'transponder', '5K0837202AK', 'PQ/NMS platform / IMMO 4. Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD supported. OBD programmable for add key. All keys lost: read instrument cluster data. Flip key with remote standard.', true, true, 'HU66', 2012, 2019);

  -- Taos (2022-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Taos', 'taos') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Taos', 'HU162', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '3G0959752', 'MQB platform / IMMO 5. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection present. PIN from BCM2. All keys lost: read BCM2 via bench. KESSY on SEL trim and above.', true, false, 'HU162', 2022, 2024);

  -- ID.4 (2021-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'ID.4', 'id-4') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen ID.4 (MEB)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '3G0959752', 'MEB electric platform / IMMO 5. Requires dealer ODIS or Autel IM608 Pro. Limited aftermarket support — newer platform. Component protection present. PIN from BCM2. All keys lost: dealer recommended. Electric vehicle — no traditional engine start. Smartphone key also supported.', true, false, 'N/A', 2021, 2024);
END $$;
