-- Alfa Romeo models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'alfa-romeo';

  -- Giulia (2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Giulia', 'giulia') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Alfa Romeo Giulia (952)', 'SIP22', 'Hitag AES', 'HITAG AES 4A', '433 MHz', 'smart_key', 'M3N-7393490', 'FCA/Stellantis Giorgio platform. WiTech 2.0 for dealer programming. Autel IM608 Pro supports add key via OBD. Lonsdor K518 has partial support. All keys lost may require BCM replacement or EEPROM/flash work. Smart key with push-button start. Emergency blade SIP22. Quadrifoglio uses same key system.', true, false, 'SIP22', 2017, 2024);

  -- Stelvio (2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Stelvio', 'stelvio') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Alfa Romeo Stelvio (949)', 'SIP22', 'Hitag AES', 'HITAG AES 4A', '433 MHz', 'smart_key', 'M3N-7393490', 'Shares Giorgio platform with Giulia. WiTech 2.0 for dealer programming. Autel IM608 Pro supports add key. Same immobilizer system as Giulia. AKL may require BCM replacement or EEPROM work. Smart key with push-button start. Emergency blade SIP22. SUV variant of Giulia platform.', true, false, 'SIP22', 2018, 2024);

  -- Tonale (2023-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Tonale', 'tonale') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Alfa Romeo Tonale', 'SIP22', 'Hitag AES', 'HITAG AES 4A', '433 MHz', 'smart_key', 'KR5ALFA434', 'Stellantis STLA Medium platform. WiTech 2.0 for dealer programming. Very new model — limited aftermarket tool coverage. Autel IM608 Pro may have partial support. All keys lost likely dealer only initially. Smart key with push-button start. PHEV option available. Emergency blade SIP22.', true, false, 'SIP22', 2023, 2024);
END $$;
