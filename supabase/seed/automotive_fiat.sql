-- Fiat models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'fiat';

  -- 500 (2012-2019)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '500', '500') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Fiat 500', 'SIP22', 'Megamos 48', 'Megamos Crypto 48', '433 MHz', 'transponder', 'LTQF12AM433TX', 'Fiat Delphi immobilizer system. Program via WiTech or aftermarket tools (Autel IM608, VVDI2, Zed-Full). Flip key with 3-button remote. OBD programming supported for add key. All keys lost requires PIN from dealer or EEPROM/BCM read. SIP22 key blade.', false, true, 'SIP22', 2012, 2019);

  -- 500X (2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '500X', '500x') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Fiat 500X (Facelift)', 'SIP22', 'Hitag AES', 'HITAG AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'FCA/Stellantis platform. WiTech 2.0 for dealer programming. Autel IM608 Pro supports add key. Hitag AES immobilizer — more secure than older Megamos. All keys lost may require BCM replacement or EEPROM work. Emergency blade SIP22.', true, false, 'SIP22', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Fiat 500X', 'SIP22', 'Megamos 48', 'Megamos Crypto 48', '433 MHz', 'smart_key', 'M3N-40821302', 'FCA platform. WiTech for dealer programming. Autel IM608, Lonsdor K518, VVDI2 support add key via OBD. Megamos 48 immobilizer. All keys lost: PIN code from dealer or BCM EEPROM read. Smart key with push-button start. Emergency blade SIP22.', false, true, 'SIP22', 2016, 2018);

  -- 500L (2014-2020)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '500L', '500l') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Fiat 500L', 'SIP22', 'Megamos 48', 'Megamos Crypto 48', '433 MHz', 'transponder', 'LTQF12AM433TX', 'Fiat/FCA platform. WiTech or aftermarket tools (Autel IM608, VVDI2, Zed-Full) for programming. Flip key with 3-button remote. OBD programmable for add key. All keys lost requires PIN code from dealer or EEPROM read from BCM. SIP22 blade.', false, true, 'SIP22', 2014, 2020);
END $$;
