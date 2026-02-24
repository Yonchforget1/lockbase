-- Genesis models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'genesis';

  -- G70
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'G70', 'g70') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Genesis G70', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F17', 'Luxury smart key with Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from immobilizer ECU. 2019-2020 models may use Hitag 3 (47 chip). All keys lost requires PIN extraction.', true, true, 'HY22', 2019, 2024);

  -- G80
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'G80', 'g80') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Genesis G80', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F35', 'New generation G80. Hitag AES encryption with advanced smart key. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN from immobilizer ECU required. Digital Key support on select trims.', true, true, 'HY22', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Genesis G80', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5DHFNA433', 'Smart key with proximity. Hitag 3 transponder. OBD programmable with PIN code. Tools: Autel IM508/IM608, SmartPro, VVDI. PIN from immobilizer ECU via OBD.', true, true, 'HY22', 2017, 2020);

  -- GV70
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GV70', 'gv70') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Genesis GV70', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F35', 'Luxury compact SUV. Hitag AES smart key system. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU. All keys lost supported with PIN extraction. Digital Key available on select trims.', true, true, 'HY22', 2022, 2024);

  -- GV80
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GV80', 'gv80') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Genesis GV80', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F35', 'Flagship SUV. Hitag AES smart key with advanced proximity. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from immobilizer ECU. All keys lost requires PIN extraction. Digital Key support.', true, true, 'HY22', 2021, 2024);

END $$;
