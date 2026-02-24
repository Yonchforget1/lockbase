-- Tesla models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'tesla';

  -- Model 3 (2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Model 3', 'model-3') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Tesla Model 3', 'N/A (Key Card)', 'NFC/BLE', 'Tesla proprietary', '13.56 MHz (NFC) / 433 MHz (fob)', 'smart_key', '1133148', 'NO traditional key or transponder. Primary: phone key via Tesla app (Bluetooth LE). Secondary: NFC key card (credit card size, 13.56 MHz). Optional: key fob accessory (Bluetooth, FCC ID 1133148). All programming done through Tesla app or service center. NO locksmith tools available. Emergency entry: 12V jump post under front tow hook cover. No OBD programming possible. Key card pairing via touchscreen with existing authenticated device.', false, false, 'N/A', 2018, 2024);

  -- Model Y (2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Model Y', 'model-y') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Tesla Model Y', 'N/A (Key Card)', 'NFC/BLE', 'Tesla proprietary', '13.56 MHz (NFC) / 433 MHz (fob)', 'smart_key', '1133148', 'Same key system as Model 3. NO traditional key or transponder. Primary: phone key via Tesla app (Bluetooth LE). Secondary: NFC key card. Optional: key fob accessory. All programming through Tesla app or service center only. NO locksmith tool support. Emergency entry: 12V jump post under nose cone. Key card pairing requires authenticated device on touchscreen.', false, false, 'N/A', 2020, 2024);

  -- Model S (2012-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Model S', 'model-s') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Tesla Model S (Refresh)', 'N/A (Key Card)', 'NFC/BLE', 'Tesla proprietary', '13.56 MHz (NFC) / 433 MHz (fob)', 'smart_key', '1133148', 'Refreshed Model S (2021+) uses same key card/phone key system as Model 3/Y. NO traditional key. Primary: phone key via Tesla app. Secondary: NFC key card. Optional: key fob. Programming through Tesla app or service center only. NO locksmith tools. Yoke steering option. Emergency entry via 12V jump post.', false, false, 'N/A', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Tesla Model S (Pre-Refresh)', 'N/A (Key Fob)', 'NFC/BLE', 'Tesla proprietary', '433 MHz', 'smart_key', '1133148', 'Pre-refresh Model S uses key fob as primary key (looks like Model S silhouette). Phone key added via software update on later models. Key fob uses 433 MHz passive entry. Programming through Tesla service center or app. NO locksmith tool support. 2012-2017 fobs had known relay attack vulnerability (patched via update). Emergency entry: manual cable release in front trunk area.', false, false, 'N/A', 2012, 2020);

  -- Model X (2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Model X', 'model-x') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Tesla Model X (Refresh)', 'N/A (Key Card)', 'NFC/BLE', 'Tesla proprietary', '13.56 MHz (NFC) / 433 MHz (fob)', 'smart_key', '1133148', 'Refreshed Model X (2021+) uses key card/phone key system like Model 3/Y. NO traditional key. Primary: phone key via Tesla app. Secondary: NFC key card. Optional: key fob. Programming through Tesla app or service center only. NO locksmith tools. Falcon wing doors. Emergency entry via 12V jump post.', false, false, 'N/A', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Tesla Model X (Pre-Refresh)', 'N/A (Key Fob)', 'NFC/BLE', 'Tesla proprietary', '433 MHz', 'smart_key', '1133148', 'Pre-refresh Model X uses key fob as primary key (Model X silhouette shape). Phone key added via later software updates. Key fob 433 MHz passive entry. Programming via Tesla service center or app only. NO locksmith tool support. Falcon wing doors require key fob for auto-open. Emergency entry: manual cable in front trunk.', false, false, 'N/A', 2016, 2020);
END $$;
