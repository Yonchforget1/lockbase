-- Ford additional models, years, and keys

-- F-250/F-350 Super Duty
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'F-250/F-350 Super Duty', 'f-250-f-350-super-duty') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-250/F-350 Super Duty', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'PATS system. Smart key with push-button start on higher trims. Ford IDS/FDRS or compatible aftermarket tool. Security code may be required.', true, true, 2017, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-250/F-350 Super Duty', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'transponder', 'M3N-A2C93142600', 'PATS 128-bit transponder. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.', true, true, 2011, 2016);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2010) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-250/F-350 Super Duty', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', 'PATS 80-bit system. On-board programming with 2 working keys. PIN code bypass via Ford IDS.', true, true, 2005, 2010);
END $$;

-- Edge
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Edge', 'edge') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Edge', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key. Push-button start standard. Ford IDS/FDRS or compatible aftermarket tool required.', true, true, 2015, 2024);
END $$;

-- Expedition
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Expedition', 'expedition') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Expedition', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', '4th generation Expedition. Smart key with PATS. Ford IDS/FDRS required for all-keys-lost programming.', true, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Expedition', 'H84-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'transponder', 'M3N-A2C93142600', 'PATS transponder key. 2011+ uses 128-bit, 2007-2010 uses 80-bit 4D63. On-board with 2 keys or Ford IDS.', true, true, 2007, 2017);
END $$;

-- Ranger
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Ranger', 'ranger') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Ranger', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'Reintroduced Ranger. Smart key with PATS system. Ford IDS/FDRS or compatible aftermarket programmer.', true, true, 2019, 2024);
END $$;

-- Maverick
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Maverick', 'maverick') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Maverick', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'Compact truck. Smart key standard on all trims. Ford IDS/FDRS or aftermarket tool required.', true, true, 2022, 2024);
END $$;

-- Bronco
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Bronco', 'bronco') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Bronco', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', '6th generation Bronco. Smart key with push-button start. Ford IDS/FDRS or compatible aftermarket tool.', true, true, 2021, 2024);
END $$;

-- Bronco Sport
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Bronco Sport', 'bronco-sport') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Bronco Sport', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'Compact SUV on Escape platform. Smart key standard. Ford IDS/FDRS or aftermarket programmer.', true, true, 2021, 2024);
END $$;

-- Fusion
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Fusion', 'fusion') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Fusion', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'smart_key', 'M3N-A2C931426', '2nd generation Fusion. Smart key with PATS. Push-button start on most trims. Ford IDS/FDRS or aftermarket tool.', true, true, 2013, 2020);
END $$;

-- Focus
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Focus', 'focus') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Focus', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'transponder', 'M3N-A2C931426', '3rd generation Focus. PATS 128-bit transponder. On-board programming with 2 working keys or Ford IDS with security code.', true, true, 2012, 2018);
END $$;

-- Taurus
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Taurus', 'taurus') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Taurus', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'smart_key', 'M3N-A2C931426', '6th generation Taurus. Smart key with push-button start. PATS 128-bit. Ford IDS/FDRS or compatible aftermarket tool.', true, true, 2010, 2019);
END $$;

-- Transit
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Transit', 'transit') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Transit', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'transponder', 'M3N-A2C93142600', 'Full-size van. PATS 128-bit transponder key. Standard key with remote head. Ford IDS/FDRS or aftermarket tool required. PIN code often needed.', true, true, 2015, 2024);
END $$;
