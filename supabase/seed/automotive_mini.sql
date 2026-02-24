-- Mini models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mini';

  -- Cooper (2014-2024 F-series/current)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Cooper', 'cooper') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mini Cooper (F56 LCI/F56 LCI2)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'NBGIDGNG1', 'BMW FEM/BDC system. Requires BMW ISTA+, Autel IM608 Pro, VVDI2/VVDI BMW, or Yanhua ACDP. ISN (IMMO Secret Number) read from DME required. All keys lost: read ISN via OBD or bench from ECU. Comfort Access available. Emergency blade HU100R.', true, false, 'HU100R', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mini Cooper (F56)', 'HU92R', 'Hitag Pro', 'HITAG PRO 49', '315 MHz / 433 MHz', 'smart_key', 'CWTWB1G767', 'BMW CAS/FEM system. Requires BMW ISTA+, Autel IM608 Pro, VVDI2, or Yanhua ACDP. ISN required from CAS/FEM module. OBD programmable on CAS models; FEM may require bench read. Emergency blade HU92R concealed in fob.', true, true, 'HU92R', 2014, 2018);

  -- Countryman (2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Countryman', 'countryman') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mini Countryman (F60)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'NBGIDGNG1', 'BMW UKL/FAAR platform. FEM/BDC system. Requires BMW ISTA+, Autel IM608 Pro, or VVDI2/VVDI BMW. ISN read from DME required. All keys lost supported with ISN. Shares platform with BMW X1. Emergency blade HU100R.', true, false, 'HU100R', 2017, 2024);

  -- Countryman (2011-2016)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mini Countryman (R60)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS3+)', '315 MHz / 433 MHz', 'smart_key', 'KR55WK49333', 'BMW CAS3/CAS3+ system. Program via BMW ISTA, VVDI2, Autel IM608, or Yanhua ACDP. ISN from CAS module required. OBD programming supported. All keys lost: read CAS via OBD or bench. Emergency blade HU92R.', true, true, 'HU92R', 2011, 2016);

  -- Clubman (2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Clubman', 'clubman') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mini Clubman (F54)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'NBGIDGNG1', 'BMW UKL platform. FEM/BDC system same as Cooper F56 and Countryman F60. Requires BMW ISTA+, Autel IM608 Pro, or VVDI2/VVDI BMW. ISN from DME required. All keys lost with ISN read. Split barn-door tailgate — unique feature. Emergency blade HU100R.', true, false, 'HU100R', 2016, 2024);
END $$;
