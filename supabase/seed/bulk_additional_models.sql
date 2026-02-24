-- Bulk additional vehicle models, years, and automotive key data
-- Adds MISSING models across all major manufacturers

-- ============================================================
-- CHEVROLET - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';

  -- Tahoe
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Tahoe', 'tahoe') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Tahoe', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Proximity key with push-button start. GM SPS/TIS2Web or Autel IM608. All-keys-lost requires IMMO reset.', true, 2021, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Tahoe', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'proximity', 'HYQ2AB', 'PK3+ transponder with proximity. OBD programmable with 10-minute relearn. GM Tech 2 or Autel IM508.', true, 2015, 2020);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Tahoe', 'B102-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3 transponder. OBD programmable with 10-minute relearn procedure.', true, 2007, 2014);

  -- Suburban
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Suburban', 'suburban') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Suburban', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Proximity key with push-button start. GM SPS/TIS2Web or Autel IM608. All-keys-lost requires IMMO reset.', true, 2021, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Suburban', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'proximity', 'HYQ2AB', 'PK3+ with proximity. 10-minute relearn via OBD. GM Tech 2 or Autel IM508.', true, 2015, 2020);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Suburban', 'B102-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3 transponder. 10-minute OBD relearn. GM Tech 2 or compatible tool.', true, 2007, 2014);

  -- Camaro
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Camaro', 'camaro') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Camaro', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4EA', '6th gen Camaro. Proximity key with push-button start. GM SPS/TIS2Web or Autel IM608.', true, 2016, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Camaro', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', '5th gen Camaro. PK3+ transponder. OBD 10-minute relearn with 2 existing keys or GM Tech 2.', true, 2010, 2015);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2002) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Camaro', 'B97', 'PK3 Megamos', '46 chip', 'transponder', '4th gen Camaro. PK3 transponder system. 10-minute OBD relearn procedure.', true, 1998, 2002);

  -- Colorado
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Colorado', 'colorado') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Colorado', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N-32337100', 'PK3+ transponder. OBD 10-minute relearn. GM Tech 2 or Autel IM508. 2023+ may use proximity on higher trims.', true, 2015, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2012) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Colorado', 'B102', 'Megamos 46', '46 chip', 'transponder', 'PK3 transponder system. OBD 10-minute relearn with 2 keys or GM Tech 2.', true, 2004, 2012);

  -- Blazer (new)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Blazer', 'blazer') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Blazer', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4AA', 'Proximity key with push-button start. GM SPS/TIS2Web or Autel IM608.', true, 2019, 2024);

  -- Trailblazer (new subcompact)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Trailblazer', 'trailblazer') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Trailblazer', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4AA', 'Subcompact SUV. Proximity key standard. GM SPS or Autel IM608.', true, 2021, 2024);

  -- Impala
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Impala', 'impala') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Impala', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4AA', '10th gen Impala. Proximity key with push-button start. GM SPS or Autel IM608.', true, 2014, 2020);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Impala', 'B102-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', '9th gen Impala. PK3 transponder. 10-minute OBD relearn.', true, 2006, 2013);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2005) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Impala', 'B97', 'PK3 Megamos', '46 chip', 'transponder', 'PK3 transponder system. 10-minute OBD relearn procedure with 2 working keys.', true, 2000, 2005);

  -- Cruze
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Cruze', 'cruze') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Cruze', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4EA', '2nd gen Cruze. Proximity key with push-button start. GM SPS or Autel IM608.', true, 2016, 2019);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Cruze', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', '1st gen Cruze. PK3+ transponder. OBD 10-minute relearn procedure.', true, 2011, 2015);

  -- Sonic
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sonic', 'sonic') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Sonic', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3+ transponder key. OBD 10-minute relearn. Some trims have proximity key option.', true, 2012, 2020);

  -- Spark
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Spark', 'spark') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Spark', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3+ transponder. OBD programmable with 10-minute relearn. GM Tech 2 or Autel IM508.', true, 2013, 2022);

  -- Trax
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Trax', 'trax') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2024, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Trax', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4AA', '2nd gen Trax. Proximity key standard. GM SPS or Autel IM608.', true, 2024, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Trax', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', '1st gen Trax. PK3+ transponder. OBD 10-minute relearn.', true, 2015, 2022);

  -- Cobalt
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Cobalt', 'cobalt') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2010) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Cobalt', 'B102', 'Megamos 46', '46 chip', 'transponder', 'PK3+ transponder system. OBD 10-minute relearn with 2 working keys or GM Tech 2.', true, 2005, 2010);

  -- HHR
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'HHR', 'hhr') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2011) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet HHR', 'B102', 'Megamos 46', '46 chip', 'transponder', 'PK3+ transponder. OBD 10-minute relearn procedure. GM Tech 2 or compatible.', true, 2006, 2011);

  -- Avalanche
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Avalanche', 'avalanche') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Avalanche', 'B102-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3 transponder. 10-minute OBD relearn. GM Tech 2 or compatible tool.', true, 2007, 2013);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2002, 2006) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Avalanche', 'B97', 'PK3 Megamos', '46 chip', 'transponder', 'PK3 transponder system. OBD 10-minute relearn with 2 working keys.', true, 2002, 2006);

  -- Monte Carlo
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Monte Carlo', 'monte-carlo') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2007) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Monte Carlo', 'B97', 'PK3 Megamos', '46 chip', 'transponder', 'PK3 transponder system. 10-minute OBD relearn. GM Tech 2 or aftermarket tool.', true, 2000, 2007);

  -- S-10
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'S-10', 's-10') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2004) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet S-10', 'B97', 'PK3 Megamos', '46 chip', 'transponder', 'PK3 transponder. OBD 10-minute relearn. Some 1998-1999 models may use VATS system instead.', true, 1998, 2004);

  -- Express
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Express', 'express') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Express', 'B102-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3 transponder. OBD 10-minute relearn. Commercial van - transponder key standard, no proximity option.', true, 2010, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2009) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Express', 'B97', 'PK3 Megamos', '46 chip', 'transponder', 'PK3 transponder. 10-minute OBD relearn with 2 working keys.', true, 1998, 2009);
END $$;

-- ============================================================
-- NISSAN - Missing models (going back to 1995+)
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'nissan';

  -- Pathfinder
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Pathfinder', 'pathfinder') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Pathfinder', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'Intelligent key. Requires Nissan CONSULT III or compatible aftermarket tool.', true, 2022, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Pathfinder', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR5S180144014', 'Intelligent key system. CONSULT III or aftermarket tool. PIN may be required.', true, 2013, 2020);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2012) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Pathfinder', 'NSN14', 'Philips 46', '46 chip', 'transponder', 'Transponder key. OBD programmable with CONSULT or aftermarket tool. PIN code may be needed for all-keys-lost.', true, 2005, 2012);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1996, 2004) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Pathfinder', 'DA34', 'Fixed code', '41 chip', 'transponder', 'Early immobilizer system. Nissan PIN required. CONSULT II or aftermarket tool for programming.', true, 1996, 2004);

  -- Murano
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Murano', 'murano') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Murano', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR5S180144014', 'Intelligent key. CONSULT III or aftermarket tool. 2019+ may use Hitag AES (4A chip).', true, 2015, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Murano', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR55WK48903', 'Intelligent key system. CONSULT III or aftermarket programmer. PIN may be needed.', true, 2009, 2014);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2008) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Murano', 'NSN14', 'Philips 46', '46 chip', '315 MHz', 'smart_key', 'KBRASTU15', '1st gen Murano. One of first Nissan Intelligent Key vehicles. CONSULT II/III required.', true, 2003, 2008);

  -- Frontier
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Frontier', 'frontier') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Frontier', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', '3rd gen Frontier. Intelligent key with push-button start. CONSULT III or aftermarket tool.', true, 2022, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Frontier', 'NSN14', 'Philips 46', '46 chip', 'transponder', '2nd gen Frontier. Standard transponder key. OBD programmable via CONSULT or aftermarket tool. No intelligent key option.', true, 2005, 2021);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2004) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Frontier', 'DA34', 'Fixed code', '41 chip', 'transponder', '1st gen Frontier. Early Nissan immobilizer. CONSULT II or aftermarket programmer. PIN code required.', true, 1998, 2004);

  -- Maxima
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Maxima', 'maxima') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2023) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Maxima', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR5S180144014', '8th gen Maxima. Intelligent key standard. CONSULT III or aftermarket tool.', true, 2016, 2023);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Maxima', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR55WK48903', '7th gen Maxima. Intelligent key. CONSULT III or aftermarket programmer.', true, 2009, 2015);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2008) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Maxima', 'NSN14', 'Philips 46', '46 chip', '315 MHz', 'smart_key', 'KBRASTU15', '6th gen Maxima. Early intelligent key system. CONSULT II/III. PIN may be required.', true, 2004, 2008);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1995, 2003) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Maxima', 'DA34', 'Fixed code', '41 chip', 'transponder', 'Standard transponder key. NATS immobilizer. CONSULT II or aftermarket tool. PIN code required.', true, 1995, 2003);

  -- Versa
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Versa', 'versa') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Versa', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', '3rd gen Versa. Intelligent key with push-button start on most trims. CONSULT III or aftermarket tool.', true, 2020, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Versa', 'NSN14', 'Philips 46', '46 chip', 'transponder', 'CWTWB1U751', '2nd gen Versa. Transponder key with separate remote. OBD programmable. CONSULT or aftermarket.', true, 2012, 2019);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2011) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Versa', 'NSN14', 'Philips 46', '46 chip', 'transponder', '1st gen Versa. Transponder key. CONSULT II/III or aftermarket tool. OBD programmable.', true, 2007, 2011);

  -- Kicks
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Kicks', 'kicks') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Kicks', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'Intelligent key with push-button start. 2018-2019 uses Hitag 2 (46 chip). 2020+ uses Hitag AES (4A). CONSULT III or aftermarket.', true, 2018, 2024);

  -- Armada
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Armada', 'armada') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Armada', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR5S180144014', '2nd gen Armada. Intelligent key. CONSULT III or aftermarket tool. 2021+ may use Hitag AES.', true, 2017, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Armada', 'NSN14', 'Philips 46', '46 chip', '315 MHz', 'smart_key', 'CWTWB1U758', '1st gen Armada. Intelligent key. CONSULT II/III or aftermarket tool.', true, 2005, 2015);

  -- Titan
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Titan', 'titan') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Titan', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR5S180144014', '2nd gen Titan. Intelligent key. CONSULT III or aftermarket tool. Some trims use transponder key.', true, 2016, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Titan', 'NSN14', 'Philips 46', '46 chip', 'transponder', '1st gen Titan. Transponder key with separate remote. OBD programmable. CONSULT II/III.', true, 2004, 2015);

  -- Xterra
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Xterra', 'xterra') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Xterra', 'NSN14', 'Philips 46', '46 chip', 'transponder', '2nd gen Xterra. Transponder key with separate remote. OBD programmable. CONSULT II/III or aftermarket.', true, 2005, 2015);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2004) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Xterra', 'DA34', 'Fixed code', '41 chip', 'transponder', '1st gen Xterra. NATS immobilizer. CONSULT II or aftermarket tool. PIN required.', true, 2000, 2004);

  -- Quest
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Quest', 'quest') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Quest', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'CWTWB1U787', '4th gen Quest. Intelligent key system. CONSULT III or aftermarket tool.', true, 2011, 2017);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2009) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Quest', 'NSN14', 'Philips 46', '46 chip', 'transponder', '3rd gen Quest. Transponder key with separate remote. OBD programmable. CONSULT II/III.', true, 2004, 2009);

  -- 350Z/370Z
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '350Z/370Z', '350z-370z') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan 370Z', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR55WK49622', '370Z. Intelligent key system. CONSULT III or aftermarket tool.', true, 2009, 2020);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2008) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan 350Z', 'NSN14', 'Philips 46', '46 chip', 'transponder', '350Z. Transponder key with separate remote. OBD programmable. CONSULT II/III.', true, 2003, 2008);

  -- Juke
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Juke', 'juke') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Juke', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'CWTWB1U808', 'Intelligent key on SL/SV trims. Base S trim uses transponder key. CONSULT III or aftermarket.', true, 2011, 2017);

  -- Leaf
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Leaf', 'leaf') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Leaf', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN1', '2nd gen Leaf. Intelligent key. CONSULT III or aftermarket tool. Electric vehicle - no traditional ignition.', true, 2018, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Leaf', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'CWTWB1U808', '1st gen Leaf. Intelligent key system. EV - push-button start only. CONSULT III.', true, 2011, 2017);
END $$;

-- ============================================================
-- RAM - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ram';

  -- 2500
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '2500', '2500') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ram 2500', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'OHT4882056', 'Y159', '5th gen Ram HD. Fobik smart key with Hitag AES. Requires Autel IM608, SmartPro, or wiTECH. PIN from CAN bus for all-keys-lost.', true, true, 2019, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ram 2500', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'GQ4-54T', 'Y160', '4th gen Ram HD. Fobik key with Hitag2 transponder. PIN required. OBD programmable. Some base models use standard Y160 transponder key.', true, true, 2010, 2018);

  -- 3500
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '3500', '3500') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ram 3500', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'OHT4882056', 'Y159', '5th gen Ram 3500 HD. Same key system as 2500. Fobik smart key. Autel IM608, SmartPro, or wiTECH required.', true, true, 2019, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ram 3500', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'GQ4-54T', 'Y160', '4th gen Ram 3500 HD. Fobik key with Hitag2. PIN code required for programming. OBD programmable.', true, true, 2010, 2018);

  -- ProMaster
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'ProMaster', 'promaster') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ram ProMaster', 'SIP22', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'GQ4-97T', 'SIP22', 'Fiat Ducato platform. Uses SIP22 key blade (NOT Y159/Y160). 2014-2018 uses Hitag2 (46 chip). 2019+ uses Hitag AES (4A). Requires wiTECH or Autel IM608. PIN required for all-keys-lost.', true, true, 2014, 2024);
END $$;

-- ============================================================
-- TOYOTA - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';

  -- Matrix
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Matrix', 'matrix') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Matrix', 'TOY44G-PT', 'Texas Crypto 128-bit', 'G chip', 'transponder', 'G chip transponder. OBD programmable with Techstream or aftermarket tool.', false, true, 2009, 2013);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2008) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Matrix', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '4D67 transponder. OBD programmable. Customer self-learn with 2 working master keys.', false, true, 2003, 2008);

  -- Yaris
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Yaris', 'yaris') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Yaris', 'TOY44H-PT', 'Texas Crypto 128-bit AES', 'H chip (8A)', 'transponder', 'H chip transponder key. OBD programmable with Techstream or aftermarket tool.', false, true, 2015, 2020);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Yaris', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '4D67 transponder key. OBD programmable. Self-learn with 2 working master keys.', false, true, 2007, 2014);

  -- Celica
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Celica', 'celica') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2005) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Celica', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '7th gen Celica. 4D67 transponder. OBD programmable with Techstream or aftermarket. Self-learn with 2 master keys.', false, true, 2000, 2005);

  -- Echo
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Echo', 'echo') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2005) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Echo', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '4D67 transponder. OBD programmable. Customer self-learn available with 2 working master keys.', false, true, 2000, 2005);

  -- Solara
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Solara', 'solara') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2008) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Solara', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '2nd gen Solara. 4D67 transponder. OBD programmable. Self-learn with 2 master keys.', false, true, 2004, 2008);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1999, 2003) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Solara', 'TOY43', 'Texas Fixed Code', '4C chip', 'transponder', '1st gen Solara. 4C transponder. Techstream or aftermarket tool. May need 2 working keys for self-learn.', false, true, 1999, 2003);

  -- FJ Cruiser
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'FJ Cruiser', 'fj-cruiser') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota FJ Cruiser', 'TOY44G-PT', 'Texas Crypto 128-bit', 'G chip', 'transponder', 'G chip transponder key. OBD programmable with Techstream or aftermarket tool.', false, true, 2010, 2014);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2009) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota FJ Cruiser', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '4D67 transponder key. OBD programmable. Self-learn with 2 working master keys.', false, true, 2007, 2009);

  -- bZ4X
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'bZ4X', 'bz4x') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota bZ4X', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'Electric vehicle. Smart key with push-button start. Techstream or compatible aftermarket tool required.', false, true, 'TOY43', 2023, 2024);
END $$;

-- ============================================================
-- HONDA - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';

  -- Element
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Element', 'element') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2011) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Element', 'HON66', 'Megamos 46', '46 chip', 'transponder', 'Transponder key with separate remote. OBD programmable via Honda HDS or aftermarket tool.', false, true, 2007, 2011);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2006) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Element', 'HON66', 'Megamos 13', '13 chip', 'transponder', 'Early Element. Transponder key. Honda HDS or aftermarket for programming. Self-learn possible with 2 working keys.', false, true, 2003, 2006);

  -- S2000
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'S2000', 's2000') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2009) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda S2000', 'HON66', 'Megamos 13', '13 chip', 'transponder', 'Transponder key. Honda HDS for programming. 2006+ uses 46 chip. Self-learn possible with 2 working keys.', false, true, 2000, 2009);

  -- Insight
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Insight', 'insight') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Insight', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', '3rd gen Insight hybrid. Smart key with push-button start. Honda HDS or aftermarket tool.', false, true, 2019, 2022);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Insight', 'HON66', 'Megamos 46', '46 chip', 'transponder', '2nd gen Insight hybrid. Transponder key. OBD programmable via Honda HDS or aftermarket.', false, true, 2010, 2014);

  -- Crosstour
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Crosstour', 'crosstour') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Crosstour', 'HON66', 'Megamos 46', '46 chip', '315 MHz', 'smart_key', 'ACJ932HK1210A', 'Smart key with push-button start. Based on Accord platform. Honda HDS or aftermarket tool.', false, true, 2012, 2015);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2011) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Crosstour', 'HON66', 'Megamos 46', '46 chip', 'transponder', 'Accord Crosstour. Transponder key. Honda HDS or aftermarket for programming.', false, true, 2010, 2011);

  -- Prelude
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Prelude', 'prelude') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1997, 2001) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Prelude', 'HON66', 'Megamos 13', '13 chip', 'transponder', '5th gen Prelude. Transponder key. Honda HDS or aftermarket tool. Self-learn possible with 2 working keys.', false, true, 1997, 2001);

  -- CR-Z
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CR-Z', 'cr-z') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda CR-Z', 'HON66', 'Megamos 46', '46 chip', '315 MHz', 'smart_key', 'ACJ932HK1210A', 'Hybrid sport coupe. Smart key on EX trim. Base uses transponder key. Honda HDS or aftermarket.', false, true, 2011, 2016);

  -- Prologue
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Prologue', 'prologue') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2024, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Prologue', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Electric SUV on GM Ultium platform. Uses GM key system, NOT Honda. GM SPS/TIS2Web or Autel IM608 required.', false, true, 2024, 2024);
END $$;

-- ============================================================
-- FORD - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';

  -- Flex
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Flex', 'flex') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Flex', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key. Push-button start on most trims. Ford IDS/FDRS or compatible aftermarket tool.', true, true, 2013, 2019);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2012) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Flex', 'H84-PT', 'Texas 4D63', '4D63 80-bit', '315 MHz', 'transponder', 'M3N5WY783X', 'PATS 80-bit transponder. On-board with 2 working keys or Ford IDS with security code.', true, true, 2009, 2012);

  -- Fiesta
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Fiesta', 'fiesta') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Fiesta', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'transponder', 'M3N-A2C93142600', 'PATS 128-bit transponder. On-board with 2 working keys. Ford IDS with security code for all-keys-lost.', true, true, 2011, 2019);

  -- Crown Victoria
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Crown Victoria', 'crown-victoria') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2011) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Crown Victoria', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', 'PATS 80-bit. On-board with 2 working keys. Ford IDS for all-keys-lost. Very common police/fleet vehicle.', true, true, 2005, 2011);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2004) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Crown Victoria', 'H74', 'Texas 4D60', '4D60 40-bit', 'transponder', 'PATS 40-bit transponder. On-board programming with 2 working keys. Ford IDS for all-keys-lost. Common police interceptor.', true, true, 1998, 2004);

  -- Freestyle / Five Hundred (same platform)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Five Hundred', 'five-hundred') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2007) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Five Hundred', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', 'PATS 80-bit. On-board with 2 working keys. Ford IDS for all-keys-lost. Became Taurus in 2008.', true, true, 2005, 2007);

  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Freestyle', 'freestyle') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2007) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Freestyle', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', 'PATS 80-bit. On-board with 2 working keys. Ford IDS for all-keys-lost. Became Taurus X in 2008.', true, true, 2005, 2007);

  -- Windstar
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Windstar', 'windstar') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1999, 2003) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Windstar', 'H74', 'Texas 4D60', '4D60 40-bit', 'transponder', 'PATS 40-bit transponder. On-board with 2 working keys. Ford IDS for single key. Minivan.', true, true, 1999, 2003);

  -- Excursion
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Excursion', 'excursion') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2005) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Excursion', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', 'PATS 80-bit. 2000-2002 may use 4D60 (40-bit). On-board with 2 working keys. Ford IDS for all-keys-lost. Full-size SUV.', true, true, 2000, 2005);

  -- F-350/F-450 Chassis
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'F-350/F-450 Chassis Cab', 'f-350-f-450-chassis-cab') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-350/F-450 Chassis Cab', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'PATS system. Smart key on higher trims. Ford IDS/FDRS required. Commercial chassis vehicle.', true, true, 2017, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-350/F-450 Chassis Cab', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', 'PATS transponder. 2011+ uses 128-bit. On-board with 2 working keys or Ford IDS.', true, true, 2008, 2016);
END $$;

-- ============================================================
-- DODGE - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'dodge';

  -- Dart
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Dart', 'dart') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Dart', 'SIP22', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N-40821302', 'SIP22', 'Built on Fiat Compact Wide platform. Uses SIP22 key blade. Fobik smart key. PIN required. OBD programmable with Autel IM608, SmartPro, or wiTECH.', true, true, 2013, 2016);

  -- Avenger
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Avenger', 'avenger') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Avenger', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N5WY783X', 'Y160', 'Fobik key. Hitag2 transponder. PIN required for programming. OBD programmable. Some base trims may use standard transponder key Y160.', true, true, 2008, 2014);

  -- Caliber
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Caliber', 'caliber') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2012) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Caliber', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'Fobik key with Hitag2 transponder. PIN code required for programming. OBD programmable.', true, true, 2007, 2012);

  -- Neon
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Neon', 'neon') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2005) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Neon', 'Y160', 'Megamos 46', '46 chip', 'transponder', '2nd gen Neon. Transponder key. PIN code required. DRB III or aftermarket tool for programming.', true, true, 2000, 2005);

  -- Dakota
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Dakota', 'dakota') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2011) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Dakota', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'Fobik key. Hitag2 transponder. PIN required. OBD programmable.', true, true, 2008, 2011);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2007) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Dakota', 'Y160', 'Megamos 46', '46 chip', 'transponder', 'Transponder key with separate remote. DRB III or aftermarket tool. PIN code required.', true, true, 2000, 2007);

  -- Nitro
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Nitro', 'nitro') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2011) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Nitro', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'Fobik key with Hitag2 transponder. PIN code required. OBD programmable. Shared platform with Jeep Liberty.', true, true, 2007, 2011);

  -- Magnum
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Magnum', 'magnum') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2008) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Magnum', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'Fobik key. Hitag2 transponder. Same platform as Charger/300. PIN required. OBD programmable.', true, true, 2005, 2008);

  -- Ram Van (pre-split)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Ram Van', 'ram-van') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2003) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Ram Van', 'Y170', 'None', 'No chip', 'standard', 'No transponder system. Standard metal key. No programming needed. Some late models may have SKIM system.', false, false, 1998, 2003);
END $$;

-- ============================================================
-- HYUNDAI - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';

  -- Veloster
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Veloster', 'veloster') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Veloster', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F11', '2nd gen Veloster. Smart key with Hitag AES. Program via Autel IM608, SmartPro, VVDI. PIN from ECU.', true, true, 'HY22', 2019, 2021);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Veloster', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5HMFNA04', '1st gen Veloster. Smart key on higher trims. Base uses transponder flip key. PIN required. OBD programmable.', true, true, 'HY22', 2012, 2017);

  -- Genesis Coupe (Hyundai brand, not Genesis brand)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Genesis Coupe', 'genesis-coupe') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Genesis Coupe', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5HMFNA04', 'Smart key with push-button start. OBD programmable with PIN. Tools: Autel IM508, SmartPro, VVDI.', true, true, 'HY22', 2010, 2016);

  -- Ioniq (hybrid/EV)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Ioniq', 'ioniq') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Ioniq', 'HY22', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F11', 'Hybrid/PHEV/EV. Smart key standard. Push-button start. Program via Autel IM608, SmartPro, VVDI. PIN required from ECU.', true, true, 'HY22', 2017, 2022);

  -- Santa Cruz
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Santa Cruz', 'santa-cruz') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Santa Cruz', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F27', 'Sport adventure vehicle. Smart key with Hitag AES. Program via Autel IM608, SmartPro, VVDI. PIN from ECU.', true, true, 'HY22', 2022, 2024);

  -- Tiburon
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Tiburon', 'tiburon') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2008) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Tiburon', 'HY15', 'Philips 46', '46 chip', 'transponder', '2nd gen Tiburon. Transponder key with remote. PIN code required. SmartPro, Zedfull, or aftermarket tool.', true, true, 2003, 2008);

  -- Azera
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Azera', 'azera') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Azera', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5HMFNA04', 'Smart key with push-button start. OBD programmable with PIN. Tools: Autel IM508, SmartPro.', true, true, 'HY22', 2012, 2017);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2011) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Azera', 'HY15', 'Philips 46', '46 chip', 'transponder', '1st gen Azera. Transponder key with remote. PIN code required. OBD programmable. SmartPro or Zedfull.', true, true, 2006, 2011);

  -- Veracruz
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Veracruz', 'veracruz') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2012) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Veracruz', 'HY18R', 'Philips 46', '46 chip', '315 MHz', 'smart_key', 'SY5SVISMKFNA04', 'Smart key on Limited trim. Standard trims use transponder key HY15. PIN code required. OBD programmable.', true, true, 'HY22', 2007, 2012);

  -- Ioniq 5
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Ioniq 5', 'ioniq-5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Ioniq 5', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F45', 'Electric vehicle. Smart key with Digital Key 2.0 support. Hitag AES. Program via Autel IM608. PIN from ECU.', true, true, 'HY22', 2022, 2024);
END $$;

-- ============================================================
-- KIA - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'kia';

  -- Rio
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Rio', 'rio') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Rio', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F11', '4th gen Rio. Smart key on higher trims. Base uses flip key transponder. PIN required. OBD programmable.', true, true, 'HY22', 2018, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Rio', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'transponder', 'TQ8-RKE-4F31', '3rd gen Rio. Flip key with transponder. OBD programmable with PIN. Tools: Autel IM508, SmartPro.', true, true, 2012, 2017);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2011) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Rio', 'HY15', 'Philips 46', '46 chip', 'transponder', '2nd gen Rio. Transponder key with remote head. PIN code required. OBD programmable. SmartPro or Zedfull.', true, true, 2006, 2011);

  -- Sedona
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sedona', 'sedona') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Sedona', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5YPFGE06', '3rd gen Sedona. Smart key with push-button start. OBD programmable with PIN. Became Carnival in 2022.', true, true, 'HY22', 2015, 2021);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Sedona', 'HY15', 'Philips 46', '46 chip', 'transponder', '2nd gen Sedona. Transponder key with remote. PIN code required. SmartPro or Zedfull.', true, true, 2006, 2014);

  -- Stinger
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Stinger', 'stinger') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2023) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Stinger', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F15', 'Performance sedan. Smart key with push-button start. 2018-2019 uses Hitag 3. 2020+ uses Hitag AES. PIN from ECU.', true, true, 'HY22', 2018, 2023);

  -- Carnival
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Carnival', 'carnival') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Carnival', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F24', 'Replaces Sedona nameplate. Smart key with Hitag AES. Program via Autel IM608, SmartPro, VVDI. PIN from ECU.', true, true, 'HY22', 2022, 2024);

  -- EV6
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'EV6', 'ev6') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia EV6', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F45', 'Electric vehicle. Smart key with Digital Key 2.0 support. Hitag AES. Program via Autel IM608. PIN from ECU.', true, true, 'HY22', 2022, 2024);

  -- Cadenza
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Cadenza', 'cadenza') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Cadenza', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5KHFNA433', 'Full-size sedan. Smart key with push-button start. OBD programmable with PIN. Autel IM508 or SmartPro.', true, true, 'HY22', 2014, 2020);

  -- Spectra
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Spectra', 'spectra') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2009) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Spectra', 'HY15', 'Philips 46', '46 chip', 'transponder', 'Transponder key. PIN code required. OBD programmable. SmartPro, Zedfull, or Autel.', true, true, 2004, 2009);

  -- Amanti
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Amanti', 'amanti') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2009) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Amanti', 'HY15', 'Philips 46', '46 chip', 'transponder', 'Full-size sedan. Transponder key. PIN code required. SmartPro, Zedfull, or aftermarket tool.', true, true, 2004, 2009);
END $$;

-- ============================================================
-- SUBARU - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';

  -- BRZ
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'BRZ', 'brz') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru BRZ', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', '2nd gen BRZ. Push-button start. SSM IV or Autel IM608/SmartPro required.', false, true, 2022, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru BRZ', 'DAT17', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHC', '1st gen BRZ. Smart key on Limited/Premium. Base uses transponder key. SSM III/IV.', false, true, 2013, 2020);

  -- Tribeca
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Tribeca', 'tribeca') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Tribeca', 'NSN19', 'Texas Fixed Code', '4D62', '315 MHz', 'transponder', 'CWTWB1U811', 'Mid-size SUV. Transponder key with separate remote. OBD programmable. Pin code may be needed for all-keys-lost.', true, true, 2006, 2014);

  -- Baja
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Baja', 'baja') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2006) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Baja', 'NSN19', 'Texas Fixed Code', '4D62', '315 MHz', 'transponder', 'CWTWB1U811', 'Sport utility truck. Transponder key with separate remote. OBD programmable. PIN may be needed.', true, true, 2003, 2006);

  -- Solterra
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Solterra', 'solterra') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Solterra', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'Electric SUV. Joint platform with Toyota bZ4X. Uses TOYOTA key system. Techstream or compatible tool required.', false, true, 'TOY43', 2023, 2024);
END $$;

-- ============================================================
-- CHRYSLER - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chrysler';

  -- Sebring
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sebring', 'sebring') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2010) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler Sebring', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', '3rd gen Sebring. Fobik key. Hitag2 transponder. PIN required. OBD programmable.', true, true, 2007, 2010);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2006) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler Sebring', 'Y160', 'Megamos 46', '46 chip', 'transponder', '2nd gen Sebring. Transponder key with separate remote. PIN required. DRB III or aftermarket tool.', true, true, 2001, 2006);

  -- PT Cruiser
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'PT Cruiser', 'pt-cruiser') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2010) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler PT Cruiser', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'Late model PT Cruiser with Fobik key. Hitag2. PIN required. OBD programmable.', true, true, 2006, 2010);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2001, 2005) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler PT Cruiser', 'Y160', 'Megamos 46', '46 chip', 'transponder', 'Early PT Cruiser. Transponder key with separate remote. SKIM system. PIN required. DRB III or aftermarket.', true, true, 2001, 2005);

  -- Crossfire
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Crossfire', 'crossfire') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2008) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler Crossfire', 'HU64', 'Mercedes IR', 'Mercedes chip', 'transponder', 'Based on Mercedes SLK platform. Uses Mercedes key system (HU64 blade). Requires Mercedes Star Diagnostic or compatible tool. NOT standard Chrysler key system.', true, false, 2004, 2008);

  -- Aspen
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Aspen', 'aspen') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2009) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler Aspen', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'Full-size SUV. Same platform as Dodge Durango. Fobik key. Hitag2. PIN required. OBD programmable.', true, true, 2007, 2009);

  -- Concorde
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Concorde', 'concorde') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2004) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler Concorde', 'Y160', 'Megamos 46', '46 chip', 'transponder', 'Full-size sedan. SKIM transponder system. PIN code required. DRB III or aftermarket tool. 1998 may not have transponder.', true, true, 1998, 2004);

  -- LHS
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'LHS', 'lhs') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1999, 2001) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler LHS', 'Y160', 'Megamos 46', '46 chip', 'transponder', 'Premium sedan. SKIM transponder system. PIN code required. DRB III or aftermarket tool.', true, true, 1999, 2001);
END $$;

-- ============================================================
-- JEEP - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'jeep';

  -- Liberty
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Liberty', 'liberty') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2012) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Liberty KK', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', '2nd gen Liberty. Fobik key with Hitag2 transponder. PIN required. OBD programmable.', true, true, 2008, 2012);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2002, 2007) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Liberty KJ', 'Y160', 'Megamos 46', '46 chip', 'transponder', '1st gen Liberty. Transponder key with separate remote. SKIM system. PIN required. DRB III or aftermarket.', true, true, 2002, 2007);

  -- Patriot
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Patriot', 'patriot') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Patriot MK', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'Fobik key on higher trims. Base models use Y160 transponder key with separate remote. PIN required. OBD programmable.', true, true, 2007, 2017);

  -- Commander
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Commander', 'commander') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2010) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Commander XK', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'Fobik key with Hitag2 transponder. PIN required. OBD programmable. Shared platform with Grand Cherokee WK.', true, true, 2006, 2010);

  -- Grand Wagoneer
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Grand Wagoneer', 'grand-wagoneer') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Grand Wagoneer', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Premium full-size SUV. Fobik smart key with Hitag AES. Push-button start. Autel IM608, SmartPro, or wiTECH. PIN from CAN bus.', true, true, 2022, 2024);

  -- Wagoneer
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Wagoneer', 'wagoneer') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Wagoneer', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Full-size SUV. Same key system as Grand Wagoneer. Fobik smart key with Hitag AES. Autel IM608, SmartPro, or wiTECH.', true, true, 2022, 2024);
END $$;

-- ============================================================
-- GMC - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'gmc';

  -- Envoy
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Envoy', 'envoy') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2002, 2009) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Envoy', 'B97', 'PK3 Megamos', '46 chip', '315 MHz', 'transponder', 'L2C0007T', 'PK3 transponder. OBD 10-minute relearn with 2 working keys. GM Tech 2 or aftermarket tool.', true, 2002, 2009);

  -- Sierra 2500/3500
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sierra 2500/3500', 'sierra-2500-3500') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Sierra 2500/3500 HD', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Proximity key. GM SPS/TIS2Web or Autel IM608. All-keys-lost requires IMMO reset.', true, 2020, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Sierra 2500/3500 HD', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N-32337100', 'PK3+ transponder. OBD 10-minute relearn. GM Tech 2 or Autel IM508.', true, 2015, 2019);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Sierra 2500/3500 HD', 'B102-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3 transponder. 10-minute OBD relearn. GM Tech 2 or compatible.', true, 2007, 2014);

  -- Savana
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Savana', 'savana') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Savana', 'B102-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'Full-size van. PK3 transponder. 10-minute OBD relearn. Same as Chevy Express. No proximity option.', true, 2010, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2009) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Savana', 'B97', 'PK3 Megamos', '46 chip', 'transponder', 'PK3 transponder. OBD 10-minute relearn. GM Tech 2 or aftermarket tool.', true, 1998, 2009);

  -- Jimmy
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Jimmy', 'jimmy') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 1998, 2005) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Jimmy', 'B97', 'PK3 Megamos', '46 chip', 'transponder', 'PK3 transponder. OBD 10-minute relearn with 2 working keys. GM Tech 2 or compatible.', true, 1998, 2005);
END $$;

-- ============================================================
-- CADILLAC - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'cadillac';

  -- ATS
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'ATS', 'ats') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac ATS', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'proximity', 'HYQ2AB', 'PK3+ transponder with proximity. GM SPS or Autel IM608. OBD programmable with 10-minute relearn.', true, 2013, 2019);

  -- SRX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'SRX', 'srx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac SRX', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'proximity', 'NBG009768T', '2nd gen SRX. PK3+ transponder with proximity. GM SPS or Autel IM608. Replaced by XT5 in 2017.', true, 2010, 2016);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2004, 2009) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac SRX', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OUC6000066', '1st gen SRX. PK3 transponder. 10-minute OBD relearn. GM Tech 2 or aftermarket.', true, 2004, 2009);

  -- DTS
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'DTS', 'dts') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2011) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac DTS', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OUC6000066', 'PK3 transponder. OBD 10-minute relearn. GM Tech 2 or compatible. Common fleet/livery vehicle.', true, 2006, 2011);

  -- DeVille
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'DeVille', 'deville') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2000, 2005) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac DeVille', 'B97', 'PK3 Megamos', '46 chip', 'transponder', 'PK3 transponder. 10-minute OBD relearn with 2 working keys. GM Tech 2 or aftermarket tool.', true, 2000, 2005);

  -- STS
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'STS', 'sts') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2011) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac STS', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OUC6000066', 'PK3+ transponder. Some trims have proximity. OBD 10-minute relearn. GM Tech 2 or aftermarket.', true, 2005, 2011);

  -- Lyriq
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Lyriq', 'lyriq') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac Lyriq', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Electric luxury SUV. Proximity key with push-button start. GM SPS/TIS2Web or Autel IM608Pro. Phone-as-key feature available.', true, 2023, 2024);

  -- Escalade ESV
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Escalade ESV', 'escalade-esv') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac Escalade ESV', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Extended wheelbase Escalade. Same key system as standard Escalade. Proximity key. GM SPS or Autel IM608Pro.', true, 2021, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac Escalade ESV', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'proximity', 'HYQ2AB', 'PK3+ transponder with proximity. GM SPS or Autel IM608. 10-minute relearn procedure.', true, 2015, 2020);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac Escalade ESV', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OUC6000066', 'PK3 transponder. OBD 10-minute relearn. GM Tech 2 or compatible.', true, 2007, 2014);
END $$;

-- ============================================================
-- BMW - Missing models
-- ============================================================
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'bmw';

  -- 2 Series
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '2 Series', '2-series') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 2 Series (F44/G42)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'BDC system. Requires ISTA+, Autel IM608 Pro, or VVDI2. ISN from DME required. Comfort Access standard on most trims.', true, false, 'HU100R', 2020, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 2 Series (F22/F45)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS4)', '315 MHz / 433 MHz', 'smart_key', 'KR55WK49863', 'CAS4/FEM system. ISN required from CAS module. Program via ISTA, VVDI2, or Autel IM608 Pro.', true, true, 'HU92R', 2014, 2019);

  -- 6 Series
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '6 Series', '6-series') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 6 Series GT (G32)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'N5F-ID2A', 'FEM/BDC system. Requires ISTA+, Autel IM608 Pro, or VVDI2. ISN from DME required.', true, false, 'HU100R', 2018, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 6 Series (F06/F12/F13)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS4+)', '315 MHz / 433 MHz', 'smart_key', 'YGOHUF5767', 'CAS4+ system. ISN read required from CAS module. Bench read recommended. ISTA, VVDI2, or Autel IM608 Pro.', true, true, 'HU92R', 2012, 2017);

  -- 8 Series
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '8 Series', '8-series') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 8 Series (G14/G15/G16)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'N5F-ID2A', 'BDC system. Display Key available. Requires ISTA+, Autel IM608 Pro, or VVDI2. ISN from DME. High-security vehicle.', true, false, 'HU100R', 2019, 2024);

  -- X2
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'X2', 'x2') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X2 (F39/U10)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'FEM/BDC system. Requires ISTA+, Autel IM608 Pro, or VVDI2. ISN from DME required. Comfort Access on most trims.', true, false, 'HU100R', 2018, 2024);

  -- X4
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'X4', 'x4') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X4 (G02)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'BDC system. Same platform as X3 G01. Requires ISTA+, Autel IM608 Pro, or VVDI2. ISN from DME.', true, false, 'HU100R', 2019, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X4 (F26)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS4+)', '315 MHz / 433 MHz', 'smart_key', 'KR55WK49863', 'CAS4+ system. ISN required from CAS module. Bench read may be needed. ISTA, VVDI2, or Autel IM608 Pro.', true, true, 'HU92R', 2015, 2018);

  -- X6
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'X6', 'x6') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X6 (G06)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'N5F-ID2A', 'BDC system. Same platform as X5 G05. Display Key available. ISTA+, Autel IM608 Pro, or VVDI2. ISN from DME.', true, false, 'HU100R', 2020, 2024);
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X6 (F16)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS4+)', '315 MHz / 433 MHz', 'smart_key', 'N5F-ID2A', 'CAS4+ system. ISN read from CAS module. Bench read recommended. ISTA, VVDI2, or Autel IM608 Pro.', true, true, 'HU92R', 2015, 2019);

  -- Z4
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Z4', 'z4') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW Z4 (G29)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'BDC system. Shared platform with Toyota Supra. ISTA+, Autel IM608 Pro, or VVDI2. ISN from DME required.', true, false, 'HU100R', 2019, 2024);

  -- i4
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'i4', 'i4') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW i4 (G26)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'Electric sedan. BDC system. Digital Key Plus standard. ISTA+, Autel IM608 Pro, or VVDI2. ISN from DME.', true, false, 'HU100R', 2022, 2024);

  -- iX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'iX', 'ix') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW iX (I20)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'N5F-ID2A', 'Electric SUV. BDC system. Digital Key Plus and UWB standard. ISTA+, Autel IM608 Pro. ISN from DME. High-security vehicle.', true, false, 'HU100R', 2022, 2024);
END $$;
