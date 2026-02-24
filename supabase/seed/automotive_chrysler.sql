-- Chrysler models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chrysler';

  -- 300
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '300', '300') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler 300', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Fobik smart key with Hitag AES transponder. Push-button start. 2019+ models use 4A chip. Requires Autel IM608, SmartPro, or wiTECH. All-keys-lost requires PIN from CAN bus. Emergency blade Y159.', true, true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler 300', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N-40821302', 'Y160', 'Fobik key with Hitag2 transponder (46 chip). PIN code required for programming. Retrieve PIN from CAN bus or dealer. OBD programmable. Same platform as Dodge Charger. Emergency blade Y160.', true, true, 2011, 2018);

  -- Pacifica
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Pacifica', 'pacifica') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler Pacifica', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-97395900', 'Y159', 'Fobik smart key. 2017-2018 uses Hitag2 (46 chip), 2019+ uses Hitag AES (4A chip). Push-button start. Requires Autel IM608, SmartPro, or wiTECH. PIN required for all-keys-lost via CAN bus. Some models have KeySense feature (speed-limited key).', true, true, 2017, 2024);

  -- Town & Country
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Town & Country', 'town-and-country') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler Town & Country', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N5WY783X', 'Y160', 'Fobik key with integrated remote. Hitag2 transponder. PIN required for programming via CAN bus or dealer. OBD programmable. Replaced by Pacifica in 2017. Some 2008-2010 may use IYZ-C01C FCC ID. Emergency blade Y160.', true, true, 2008, 2016);

  -- 200
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '200', '200') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler 200', 'Y159-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Second generation Chrysler 200. Smart proximity key with push-button start. Fobik style. PIN required for all-keys-lost. OBD programmable. Emergency blade Y159.', true, true, 2015, 2017);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler 200', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N-40821302', 'Y160', 'First generation Chrysler 200 (replaced Sebring). Fobik key with Hitag2 transponder. PIN code required. OBD programmable with PIN from CAN bus or dealer. Emergency blade Y160.', true, true, 2011, 2014);

END $$;
