-- Cadillac models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'cadillac';

  -- Escalade
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Escalade', 'escalade') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac Escalade', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Proximity key with push-button start. Requires GM SPS/TIS2Web or Autel IM608Pro. All-keys-lost requires IMMO reset and possible component replacement.', false, true, 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac Escalade', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'proximity', 'HYQ2AB', 'PK3+ transponder with proximity. GM SPS or Autel IM608. OBD programmable with 10-minute relearn.', false, true, 2015, 2020);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac Escalade', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OUC6000066', 'PK3 transponder system. OBD programmable with 10-minute relearn. GM Tech 2 or compatible tool.', false, true, 2007, 2014);

  -- XT5
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XT5', 'xt5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac XT5', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ2AB', 'Proximity smart key with push-button start. GM SPS/TIS2Web or Autel IM608Pro required. All-keys-lost requires IMMO reset.', false, true, 2020, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac XT5', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'proximity', 'HYQ2AB', 'PK3+ transponder with proximity features. GM SPS or Autel IM608. 10-minute relearn procedure.', false, true, 2017, 2019);

  -- XT4
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XT4', 'xt4') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac XT4', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ2AB', 'Proximity key with push-button start. Requires GM SPS/TIS2Web or Autel IM608Pro. All-keys-lost requires IMMO reset.', false, true, 2019, 2024);

  -- CT5
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CT5', 'ct5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac CT5', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Proximity smart key. GM SPS/TIS2Web or Autel IM608Pro required. All-keys-lost may require component replacement.', false, true, 2020, 2024);

  -- CT4
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CT4', 'ct4') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac CT4', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Proximity key with push-button start. GM SPS or Autel IM608Pro required. All-keys-lost may require component replacement.', false, true, 2020, 2024);

  -- XT6
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XT6', 'xt6') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac XT6', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ2AB', 'Proximity smart key with push-button start. Requires GM SPS/TIS2Web or Autel IM608Pro. All-keys-lost requires IMMO reset.', false, true, 2020, 2024);

  -- CTS
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CTS', 'cts') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac CTS', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'proximity', 'HYQ2AB', 'PK3+ transponder with proximity. GM SPS or Autel IM608. OBD programmable with 10-minute relearn.', false, true, 2014, 2019);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac CTS', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N5WY7777A', 'PK3 transponder system. OBD programmable with 10-minute relearn. GM Tech 2 or compatible tool.', false, true, 2008, 2013);
END $$;
