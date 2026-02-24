-- Hyundai models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';

  -- Elantra
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Elantra', 'elantra') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Elantra', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F27', 'Program via Autel IM508/IM608, SmartPro, or VVDI Key Tool Max. PIN code from immobilizer ECU dump or OBD. All keys lost requires PIN from ECU.', true, true, 'HY22', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Elantra', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'CQOFD00120', 'Smart key programming via Autel, SmartPro, or VVDI. PIN from immobilizer ECU or OBD reading. Proximity system with push-button start.', true, true, 'HY22', 2017, 2020);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Elantra', 'HY15', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'OSLOKA-360T', 'Standard transponder key. OBD programmable with PIN code. PIN extracted from immobilizer ECU or dealer. Aftermarket tools: SmartPro, Zedfull.', true, true, 2011, 2016);

  -- Sonata
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sonata', 'sonata') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Sonata', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F11', 'Program via Autel IM508/IM608, SmartPro, or VVDI Key Tool Max. Digital Key support on some trims. PIN from immobilizer ECU. All keys lost requires PIN extraction.', true, true, 'HY22', 2020, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Sonata', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'CQOFD00120', 'Smart proximity key. Program via OBD with PIN code. Tools: Autel IM508, SmartPro, VVDI. PIN from immobilizer unit or OBD extraction.', true, true, 'HY22', 2015, 2019);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Sonata', 'HY15', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'SY5HMFNA04', 'Transponder key with remote. OBD programmable with PIN. PIN code from immobilizer ECU. Tools: SmartPro, Zedfull, Autel.', true, true, 2011, 2014);

  -- Tucson
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Tucson', 'tucson') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Tucson', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F27', 'New generation smart key with Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU. All keys lost supported with PIN.', true, true, 'HY22', 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Tucson', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F11', 'Smart key with push-button start. OBD programming with PIN. Autel IM508/608, SmartPro, or VVDI. PIN from immobilizer ECU via OBD.', true, true, 'HY22', 2016, 2021);

  -- Santa Fe
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Santa Fe', 'santa-fe') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Santa Fe', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F19', 'Smart proximity key with Hitag AES. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required. Some 2019 models may use Hitag 3 (47 chip).', true, true, 'HY22', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Santa Fe', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5DMFNA433', 'Smart key system. OBD programmable with PIN code. Tools: Autel IM508, SmartPro, VVDI. PIN extracted from immobilizer ECU.', true, true, 'HY22', 2013, 2018);

  -- Kona
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Kona', 'kona') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Kona', 'HY22', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F11', 'Smart key with push-button start. 2018-2019 uses Hitag 3 (47 chip). 2020+ may use Hitag AES (4A chip). OBD programmable with PIN. Tools: Autel, SmartPro, VVDI.', true, true, 'HY22', 2018, 2024);

  -- Palisade
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Palisade', 'palisade') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Palisade', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F19', 'Premium smart key system. Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU. All keys lost requires PIN extraction from immobilizer.', true, true, 'HY22', 2020, 2024);

  -- Venue
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Venue', 'venue') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Venue', 'HY22', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5IGFGE04', 'Smart key with proximity. Some base trims may use standard flip key with transponder. OBD programmable with PIN. Tools: Autel IM508, SmartPro, VVDI.', true, true, 'HY22', 2020, 2024);

  -- Accent
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Accent', 'accent') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Accent', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5IGFGE04', 'Smart key available on higher trims. Base trims use flip key with Hitag 3 transponder. OBD programmable with PIN. Tools: Autel IM508, SmartPro, VVDI.', true, true, 'HY22', 2018, 2024);

END $$;
