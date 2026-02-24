-- Lincoln models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lincoln';

  -- Navigator
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Navigator', 'navigator') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln Navigator', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key system. Ford IDS/FDRS or Autel IM608 required. PIN code required for all-keys-lost (from PCM or dealer). Phone-as-a-key available on 2020+.', true, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln Navigator', 'H75', 'Texas 4D63', '4D63 80-bit', '315 MHz', 'transponder', 'M3N5WY8609', 'PATS system with 4D63 80-bit chip. On-board programming with 2 working keys. PIN code bypass via Ford IDS for all-keys-lost.', true, true, 2007, 2017);

  -- Aviator
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Aviator', 'aviator') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln Aviator', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key with push-button start. Ford IDS/FDRS or Autel IM608 required. PIN code required for all-keys-lost. Phone-as-a-key supported.', true, true, 2020, 2024);

  -- Corsair
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Corsair', 'corsair') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln Corsair', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key system. Ford IDS/FDRS, Autel IM608, or SmartPro required. PIN code required for all-keys-lost. Phone-as-a-key supported on 2020+.', true, true, 2020, 2024);

  -- Nautilus
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Nautilus', 'nautilus') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln Nautilus', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key with push-button start. Ford IDS/FDRS or Autel IM608 required. PIN code needed for all-keys-lost scenarios.', true, true, 2019, 2024);

  -- MKZ
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'MKZ', 'mkz') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln MKZ', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key system. Ford IDS/FDRS or compatible aftermarket tool required. PIN code required for all-keys-lost.', true, true, 2017, 2020);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln MKZ', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'smart_key', 'M3N5WY8609', 'PATS 128-bit smart key. Ford IDS/FDRS required. On-board programming with 2 working keys or PIN code for all-keys-lost.', true, true, 2013, 2016);

  -- MKC
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'MKC', 'mkc') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln MKC', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key system. Ford IDS/FDRS or Autel IM608 required. PIN code needed for all-keys-lost. On-board programming with 2 working keys.', true, true, 2015, 2019);

  -- Continental
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Continental', 'continental') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln Continental', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'PATS smart key with push-button start. Ford IDS/FDRS or Autel IM608 required. PIN code required for all-keys-lost scenarios.', true, true, 2017, 2020);
END $$;
