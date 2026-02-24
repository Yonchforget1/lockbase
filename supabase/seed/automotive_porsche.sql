-- Porsche models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'porsche';

  -- Cayenne (2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Cayenne', 'cayenne') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche Cayenne (E3/9YA)', 'N/A (Smart Fob Only)', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'IYZPK3', 'Third-gen Cayenne. Porsche PIWIS 3 (dealer tool) required for most programming. Autel IM608 Pro has limited add key support. All keys lost typically dealer only. Very restricted immobilizer system. No emergency key blade on newer fobs — separate valet key available.', true, false, 'N/A', 2019, 2024);

  -- Cayenne (2011-2018)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche Cayenne (92A/958)', 'HU66', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KR55WK50138', 'Second-gen Cayenne. Porsche PIWIS 2/3 for dealer programming. Autel IM608 Pro and Lonsdor K518 support add key on some years. AKL very limited with aftermarket tools. Emergency blade HU66 concealed in fob. Kessy (Keyless Entry Start and Exit System).', true, false, 'HU66', 2011, 2018);

  -- Macan (2015-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Macan', 'macan') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche Macan (95B)', 'HU66', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'IYZPK3', 'Shares MLB platform with Audi Q5. Porsche PIWIS 2/3 for dealer programming. Autel IM608 Pro supports add key on 2015-2019. Lonsdor K518 has partial support. AKL often requires dealer. Emergency blade HU66 in fob. Kessy system standard.', true, false, 'HU66', 2015, 2024);

  -- 911 (992, 2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '911', '911') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche 911 (992)', 'N/A (Smart Fob Only)', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', '9J1959753', 'Current-gen 992. Porsche PIWIS 3 required — virtually no aftermarket support for programming. Dealer only for add key and all keys lost. Fob shaped like car silhouette. Ignition switch on left (Porsche tradition). Extremely high security.', true, false, 'N/A', 2020, 2024);

  -- 911 (991, 2012-2019)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche 911 (991)', 'HU66', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KR55WK50138', 'Porsche PIWIS 2/3 for dealer programming. Limited aftermarket support — Autel IM608 Pro may support add key on earlier 991 models. AKL typically dealer only. Emergency blade HU66 in fob. Left-side ignition switch. Kessy equipped.', true, false, 'HU66', 2012, 2019);

  -- Panamera (2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Panamera', 'panamera') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche Panamera (971)', 'N/A (Smart Fob Only)', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'IYZPK3', 'Second-gen Panamera on MSB platform. Porsche PIWIS 3 required. Very limited aftermarket support. Add key and AKL typically dealer only. Push-button start with left-side ignition position. High-security immobilizer.', true, false, 'N/A', 2017, 2024);

  -- Panamera (2010-2016)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche Panamera (970)', 'HU66', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KR55WK50138', 'First-gen Panamera. Porsche PIWIS 2 for dealer programming. Autel IM608 Pro has limited add key support. AKL usually dealer only. Emergency blade HU66 concealed in fob. Kessy system. Left-side ignition.', true, false, 'HU66', 2010, 2016);

  -- Taycan (2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Taycan', 'taycan') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche Taycan (Y1A)', 'N/A (Smart Fob Only)', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', '9J1959753', 'All-electric vehicle on J1 platform. Porsche PIWIS 3 required — dealer only for all key programming. No aftermarket tool support. Phone key available via Porsche Connect app. No emergency blade. Extremely restricted system.', true, false, 'N/A', 2020, 2024);
END $$;
