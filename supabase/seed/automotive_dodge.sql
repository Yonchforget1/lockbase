-- Dodge models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'dodge';

  -- Charger
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Charger', 'charger') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Charger', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Fobik smart key with push-button start. Requires Autel IM608, SmartPro, or wiTECH for programming. All-keys-lost requires PIN from CAN bus or dealer. Emergency blade Y159 for door entry only.', true, true, 2015, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Charger', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N-40821302', 'Y160', 'Fobik key. Uses Hitag2 transponder. OBD programmable with PIN code. PIN can be retrieved from CAN bus via Autel, SmartPro, or Abrites. Emergency key blade Y160.', true, true, 2011, 2014);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2010) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Charger', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'First generation Fobik key. PIN code required for programming. Retrieve PIN from dealer or CAN bus. OBD programmable with compatible tool. Emergency blade Y160.', true, true, 2006, 2010);

  -- Challenger
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Challenger', 'challenger') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Challenger', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Fobik smart key. 2019+ uses Hitag AES (4A chip). 2015-2018 uses Hitag2 (46 chip) but same FCC ID. Requires PIN from CAN bus for all-keys-lost. OBD programmable with Autel IM608, SmartPro, or wiTECH.', true, true, 2015, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Challenger', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'Fobik key with Hitag2 transponder. PIN required for programming. PIN from dealer or CAN bus. Some 2008-2009 models may use IYZ-C01C FCC ID. Emergency blade Y160.', true, true, 2008, 2014);

  -- Durango
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Durango', 'durango') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Durango', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Fobik smart key with Hitag AES transponder. Push-button start. Requires wiTECH, Autel IM608, or SmartPro. All-keys-lost requires PIN from CAN bus. Emergency blade Y159.', true, true, 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Durango', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'GQ4-54T', 'Y160', 'Fobik key with Hitag2 transponder. OBD programmable with PIN code. 2014-2018 uses GQ4-54T FCC ID. Some 2019-2020 may transition to Hitag AES. PIN from CAN bus or dealer.', true, true, 2014, 2020);

  -- Journey
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Journey', 'journey') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Journey', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N5WY783X', 'Y160', 'Fobik key. Uses Hitag2 transponder (46 chip). PIN code required for programming, retrieve via CAN bus or dealer. OBD programmable. Some base models may have standard transponder key Y160 without Fobik. Emergency blade Y160.', true, true, 2011, 2020);

  -- Grand Caravan
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Grand Caravan', 'grand-caravan') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Grand Caravan', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N5WY783X', 'Y160', 'Fobik key with integrated remote. Hitag2 transponder. PIN code required for all-keys-lost. Some 2008-2010 models use IYZ-C01C FCC ID. OBD programmable with PIN. Emergency key blade Y160 for door/ignition backup.', true, true, 2008, 2020);

END $$;
