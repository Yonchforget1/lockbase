-- Toyota additional models, years, and keys

-- Tundra
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Tundra', 'tundra') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Tundra', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'New generation smart key. Requires Toyota Techstream or compatible aftermarket tool. All keys must be present during programming.', false, true, 'TOY43', 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Tundra', 'TOY44H-PT', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'transponder', 'HYQ14FBA', 'H chip transponder key. OBD programmable with Techstream or aftermarket tool.', false, true, 2014, 2021);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Tundra', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '4D67 transponder. OBD programmable. Customer self-learn available with 2 working master keys.', false, true, 2007, 2013);
END $$;

-- 4Runner
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '4Runner', '4runner') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota 4Runner', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'Smart key system. Requires Techstream or aftermarket programmer. All existing keys must be present.', false, true, 'TOY43', 2020, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota 4Runner', 'TOY44G-PT', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'transponder', 'HYQ14FBA', 'G chip transponder. OBD programmable. On-board programming with 2 working keys or Techstream.', false, true, 2010, 2019);
END $$;

-- Prius
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Prius', 'prius') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Prius', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', '5th generation Prius. Smart key system. Techstream or compatible aftermarket tool required.', false, true, 'TOY43', 2023, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Prius', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBC', '4th generation Prius. Smart key with push-button start. Techstream or aftermarket tool.', false, true, 'TOY43', 2016, 2022);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Prius', 'TOY51', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'smart_key', 'HYQ14FBA', '3rd generation Prius. Smart key system. G chip. Techstream required for all-keys-lost.', false, true, 'TOY43', 2010, 2015);
END $$;

-- Avalon
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Avalon', 'avalon') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Avalon', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBC', 'Smart key with push-button start. Techstream or compatible aftermarket programmer required.', false, true, 'TOY43', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Avalon', 'TOY51', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'smart_key', 'HYQ14FBA', 'G chip smart key. Techstream or aftermarket tool required. All keys must be present for programming.', false, true, 'TOY43', 2013, 2018);
END $$;

-- Sienna
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sienna', 'sienna') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Sienna', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBN', 'New generation hybrid-only Sienna. Smart key system. Techstream or aftermarket tool.', false, true, 'TOY43', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Sienna', 'TOY51', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'smart_key', 'HYQ14FBA', 'Smart key equipped models. Some base trims use transponder key (TOY44G-PT). Techstream or aftermarket tool.', false, true, 'TOY43', 2011, 2020);
END $$;

-- Sequoia
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sequoia', 'sequoia') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Sequoia', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'New generation Sequoia on TNGA-F platform. Smart key. Techstream or aftermarket programmer.', false, true, 'TOY43', 2023, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Sequoia', 'TOY51', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'smart_key', 'HYQ14FBA', 'Smart key system. Techstream or compatible tool. 2008-2009 models may use 4D chip transponder key instead.', false, true, 'TOY43', 2008, 2022);
END $$;

-- Land Cruiser
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Land Cruiser', 'land-cruiser') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2024, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Land Cruiser', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'New generation Land Cruiser (250 series). Smart key system. Techstream or aftermarket tool required.', false, true, 'TOY43', 2024, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Land Cruiser', 'TOY51', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'smart_key', 'HYQ14FBA', '200 series Land Cruiser. Smart key system. Techstream required for all-keys-lost scenarios.', false, true, 'TOY43', 2008, 2021);
END $$;

-- C-HR
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'C-HR', 'c-hr') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota C-HR', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBC', 'Smart key with push-button start standard on all trims. Techstream or aftermarket programmer.', false, true, 'TOY43', 2018, 2024);
END $$;

-- Venza
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Venza', 'venza') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Venza', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBN', 'Hybrid-only model. Smart key system standard. Techstream or aftermarket tool required.', false, true, 'TOY43', 2021, 2024);
END $$;

-- GR86
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GR86', 'gr86') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota GR86', 'TOY44H-PT', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'transponder', 'HYQ14FBK', 'H chip transponder key. No push-button start. OBD programmable with Techstream or aftermarket tool.', false, true, 2022, 2024);
END $$;

-- Supra
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Supra', 'supra') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Supra', 'HU100R', 'BMW CAS4+/FEM', 'BMW Hitag Pro', '315 MHz', 'smart_key', 'YGOHUF5767', 'BMW A90 platform. Uses BMW key system, NOT Toyota. Requires BMW ISTA/Autel/Xhorse for programming. BMW dealer may be needed for all-keys-lost.', false, false, 2020, 2024);
END $$;

-- Crown
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Crown', 'crown') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Crown', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'New US-market Crown sedan. Smart key with push-button start. Techstream or compatible aftermarket tool required.', false, true, 'TOY43', 2023, 2024);
END $$;
