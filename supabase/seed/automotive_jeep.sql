-- Jeep models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'jeep';

  -- Wrangler
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Wrangler', 'wrangler') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Wrangler JL', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'OHT1130261', 'Y159', 'JL generation Wrangler. Fobik smart key with Hitag AES transponder. Push-button start on most trims. Requires Autel IM608, SmartPro, or wiTECH. PIN required for all-keys-lost via CAN bus. Emergency blade Y159 for door entry.', true, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Wrangler JK', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'JK generation Wrangler. Fobik key with Hitag2 transponder. PIN required for programming. OBD programmable with PIN from CAN bus or dealer. 2007-2011 may use different key blade profile. Emergency blade Y160.', true, true, 2007, 2017);

  -- Grand Cherokee
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Grand Cherokee', 'grand-cherokee') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Grand Cherokee WL', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'WL generation Grand Cherokee. Fobik smart key with Hitag AES (4A chip). Push-button start standard. Requires Autel IM608, SmartPro, or wiTECH. All-keys-lost requires PIN from CAN bus. Also available as Grand Cherokee L (3-row). Emergency blade Y159.', true, true, 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Grand Cherokee WK2', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'GQ4-54T', 'Y160', 'WK2 generation. Fobik key with Hitag2 transponder (46 chip). PIN code required for programming. OBD programmable. 2019+ may have transitioned to Hitag AES on some builds. PIN from CAN bus or dealer. Emergency blade Y160.', true, true, 2014, 2021);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Grand Cherokee WK', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'WK/WK2 generation. 2008+ uses Fobik key. 2005-2007 uses Y160 transponder key with separate remote (FCC: OHT692427AA). PIN required for all-keys-lost. OBD programmable. Emergency blade Y160.', true, true, 2005, 2013);

  -- Cherokee
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Cherokee', 'cherokee') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Cherokee KL', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'GQ4-54T', 'Y159', 'KL generation Cherokee. 2014-2018 uses Hitag2 (46 chip), 2019+ uses Hitag AES (4A chip). Fobik smart key with push-button start. PIN required for all-keys-lost. OBD programmable. Requires Autel IM608, SmartPro, or wiTECH. Emergency blade Y159.', true, true, 2014, 2024);

  -- Compass
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Compass', 'compass') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Compass MP', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Second generation Compass (MP platform). Fobik smart key. 2017-2018 uses Hitag2 (46 chip), 2019+ uses Hitag AES (4A chip). Push-button start on higher trims. PIN required for all-keys-lost. OBD programmable. Emergency blade Y159.', true, true, 2017, 2024);

  -- Gladiator
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Gladiator', 'gladiator') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Gladiator JT', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'OHT1130261', 'Y159', 'JT Gladiator pickup. Same platform as Wrangler JL. Fobik smart key with Hitag AES transponder. Push-button start on most trims. Requires Autel IM608, SmartPro, or wiTECH. PIN required for all-keys-lost via CAN bus. Emergency blade Y159.', true, true, 2020, 2024);

  -- Renegade
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Renegade', 'renegade') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Renegade BU', 'SIP22', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'SIP22', 'Built on Fiat Small Wide platform (shared with Fiat 500X). Uses SIP22 key blade (not Y159/Y160). 2015-2017 uses Hitag2 (46 chip), 2018+ uses Hitag AES (4A chip). Smart key with push-button start. PIN required for all-keys-lost. OBD programmable with Autel IM608, SmartPro, or wiTECH.', true, true, 2015, 2024);

END $$;
