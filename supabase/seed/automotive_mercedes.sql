-- Mercedes-Benz models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mercedes-benz';

  -- C-Class (W206 2022-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'C-Class', 'c-class') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz C-Class (W206)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS4 system. Requires VVDI MB Tool, Autel IM608 Pro with G-Box3, or dealer XENTRY. EIS/EZS read required for all keys lost — must read NEC chip on EZS. Keyless Go standard. Password calculation via server.', true, false, 'HU64', 2022, 2024);

  -- C-Class (W205 2015-2021)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz C-Class (W205)', 'Smart Key Fob', 'Hitag Pro', 'NEC Pro', '315 MHz', 'smart_key', 'IYZDC07', 'FBS3 system. Requires VVDI MB Tool, Autel IM608 with XP400 Pro, or dealer XENTRY/DAS. EIS/EZS read via OBD for key data. Keyless Go on most trims. All keys lost: read EIS via OBD or IR.', true, false, 'HU64', 2015, 2021);

  -- E-Class (W213 2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'E-Class', 'e-class') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz E-Class (W213)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS3 (2017-2019) / FBS4 (2020+). Requires VVDI MB, Autel IM608 Pro, or XENTRY. EIS/EZS data read required. Keyless Go standard. 2020+ FBS4 requires server calculation for password. All keys lost: read EZS NEC chip.', true, false, 'HU64', 2017, 2024);

  -- E-Class (W212 2010-2016)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz E-Class (W212)', 'Smart Key Fob', 'Hitag 2', 'NEC', '315 MHz', 'smart_key', 'IYZDC07', 'FBS3 system. IR key system — uses infrared for EIS communication. Requires VVDI MB Tool or dealer XENTRY/DAS. EIS read via OBD or IR adapter. All keys lost: read EIS NEC chip via OBD. Supports Keyless Go on equipped models.', true, false, 'HU64', 2010, 2016);

  -- GLC (X253 2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GLC', 'glc') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz GLC (X253/X254)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS3 (2016-2019) / FBS4 (2020+). Requires VVDI MB, Autel IM608 Pro, or XENTRY. EIS/EZS read required. Keyless Go standard. 2020+ models use FBS4 — password via server calculation. All keys lost: read EZS.', true, false, 'HU64', 2016, 2024);

  -- GLE (V167 2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GLE', 'gle') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz GLE (V167)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS4 system. Requires VVDI MB Tool with server calculation, Autel IM608 Pro with G-Box3, or dealer XENTRY. EIS/EZS read required. Keyless Go standard. All keys lost: read EZS NEC chip and calculate password via server.', true, false, 'HU64', 2020, 2024);

  -- GLE (W166 2016-2019)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz GLE (W166)', 'Smart Key Fob', 'Hitag Pro', 'NEC Pro', '315 MHz', 'smart_key', 'IYZDC07', 'FBS3 system. Requires VVDI MB Tool or dealer XENTRY/DAS. EIS read via OBD. Keyless Go on most trims. All keys lost: read EIS NEC chip data via OBD or IR adapter.', true, false, 'HU64', 2016, 2019);

  -- S-Class (W223 2021-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'S-Class', 's-class') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz S-Class (W223)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZMS1', 'FBS4 system. High-security vehicle. Requires VVDI MB with server calculation, Autel IM608 Pro with G-Box3, or dealer XENTRY. EIS/EZS read required. All keys lost: read EZS NEC chip. Digital key via smartphone also supported.', true, false, 'HU64', 2021, 2024);

  -- S-Class (W222 2014-2020)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz S-Class (W222)', 'Smart Key Fob', 'Hitag Pro', 'NEC Pro', '315 MHz', 'smart_key', 'IYZDC07', 'FBS3 (2014-2019) / FBS4 (2020). Requires VVDI MB or dealer XENTRY. EIS read via OBD for FBS3 models. 2020 model uses FBS4 with server calculation. Keyless Go standard. All keys lost: read EIS NEC data.', true, false, 'HU64', 2014, 2020);

  -- A-Class (W177 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'A-Class', 'a-class') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz A-Class (W177)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS4 system. Requires VVDI MB with server calculation, Autel IM608 Pro, or XENTRY. EIS/EZS read required. Keyless Go standard. All keys lost: read EZS NEC chip and calculate via server.', true, false, 'HU64', 2019, 2024);

  -- GLB (X247 2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GLB', 'glb') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz GLB (X247)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS4 system. Same platform as A-Class/GLA. Requires VVDI MB with server calculation, Autel IM608 Pro, or XENTRY. EIS/EZS read required. Keyless Go standard. All keys lost: read EZS NEC chip.', true, false, 'HU64', 2020, 2024);

  -- GLA (H247 2021-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GLA', 'gla') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz GLA (H247)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS4 system. Same MFA2 platform as A-Class/GLB. Requires VVDI MB with server calculation, Autel IM608 Pro, or XENTRY. EIS/EZS read required. Keyless Go standard. All keys lost: read EZS NEC chip.', true, false, 'HU64', 2021, 2024);
END $$;
