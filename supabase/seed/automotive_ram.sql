-- Ram models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ram';

  -- Ram 1500
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '1500', '1500') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ram 1500', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'OHT4882056', 'Y159', '5th gen Ram 1500. Fobik smart key with Hitag AES transponder. Push-button start standard. Requires Autel IM608, SmartPro, Abrites, or wiTECH. All-keys-lost requires PIN from CAN bus. Emergency blade Y159 for door only.', true, true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ram 1500', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'GQ4-54T', 'Y160', '4th gen Ram 1500. Fobik key with Hitag2 transponder. PIN required for programming. PIN retrievable from CAN bus or dealer. OBD programmable. Some base models may use standard Y160 transponder key without Fobik remote.', true, true, 2013, 2018);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2012) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ram 1500', 'Y164-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N5WY783X', 'Y164', 'Fobik key. Early Ram brand models (separated from Dodge in 2009). Hitag2 transponder with 46 chip. PIN code required. Some 2009 models may still be titled as Dodge Ram. OBD programmable with PIN. Emergency blade Y164.', true, true, 2009, 2012);

END $$;
