-- Kia models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'kia';

  -- Forte
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Forte', 'forte') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Forte', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'CQOFD00120', 'Smart key with push-button start. Hitag AES on 2020+ models, 2019 may use Hitag 3. Program via Autel IM508/IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU.', true, true, 'HY22', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Forte', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'CQOFD00120', 'Smart key on higher trims. Base trims use flip key with transponder. OBD programmable with PIN. Tools: SmartPro, Autel IM508, VVDI. PIN from immobilizer ECU.', true, true, 'HY22', 2014, 2018);

  -- K5 (formerly Optima)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'K5', 'k5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia K5', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F24', 'Replaces the Optima nameplate. Smart key with Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU dump or OBD.', true, true, 'HY22', 2021, 2024);

  -- Optima
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Optima', 'optima') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Optima', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5JFFGE04', 'Smart key with proximity. OBD programmable with PIN code. Tools: Autel IM508, SmartPro, VVDI. PIN from immobilizer ECU via OBD extraction.', true, true, 'HY22', 2016, 2020);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Optima', 'HY15', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'SY5HMFNA04', 'Transponder key with remote head. OBD programmable with PIN code. PIN from immobilizer ECU or dealer. Tools: SmartPro, Zedfull, Autel.', true, true, 2011, 2015);

  -- Sportage
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sportage', 'sportage') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Sportage', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F27', 'New generation Sportage. Smart key with Hitag AES. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN from ECU. All keys lost supported.', true, true, 'HY22', 2023, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Sportage', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F08', 'Smart key with push-button start. OBD programmable with PIN. 2020+ may use Hitag AES (4A). Tools: Autel IM508/608, SmartPro, VVDI.', true, true, 'HY22', 2017, 2022);

  -- Sorento
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sorento', 'sorento') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Sorento', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F24', 'Smart key with Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU. All keys lost requires PIN extraction.', true, true, 'HY22', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Sorento', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F06', 'Smart proximity key. OBD programmable with PIN code. Tools: Autel IM508, SmartPro, VVDI. PIN from immobilizer ECU via OBD.', true, true, 'HY22', 2016, 2020);

  -- Telluride
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Telluride', 'telluride') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Telluride', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F24', 'Premium smart key system. Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU. All keys lost supported with PIN extraction.', true, true, 'HY22', 2020, 2024);

  -- Soul
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Soul', 'soul') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Soul', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'SY5SKFGE04', 'Smart key with push-button start. Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN from ECU required.', true, true, 'HY22', 2020, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Soul', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'CQOFD00120', 'Smart key on higher trims. Base uses flip key transponder. OBD programmable with PIN. Tools: SmartPro, Autel IM508, VVDI. PIN from immobilizer ECU.', true, true, 'HY22', 2014, 2019);

  -- Seltos
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Seltos', 'seltos') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Seltos', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'SY5SKFGE04', 'Smart key with proximity. Hitag AES encryption. Program via Autel IM508/IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU. All keys lost supported.', true, true, 'HY22', 2021, 2024);

END $$;
