-- BMW models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'bmw';

  -- 3 Series (G20 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '3 Series', '3-series') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 3 Series (G20)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'BDC/FEM system. Requires ISTA+, Autel IM608 Pro, or Xhorse VVDI2/VVDI BMW. ISN (IMMO Secret Number) required from DME — read via OBD or bench. All keys lost requires ISN read from ECU. Comfort Access standard.', true, false, 'HU100R', 2019, 2024);

  -- 3 Series (F30 2012-2018)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 3 Series (F30)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS4)', '315 MHz / 433 MHz', 'smart_key', 'KR55WK49863', 'CAS4/CAS4+ system. Program via ISTA, Autel IM608 Pro, VVDI2, or Yanhua ACDP. ISN required — read CAS4 via OBD or remove for bench read. Supports add key and all keys lost.', true, true, 'HU92R', 2012, 2018);

  -- 5 Series (G30 2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '5 Series', '5-series') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 5 Series (G30)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'FEM/BDC system (2017-2018), BDC module (2019+). Requires ISTA+, Autel IM608 Pro, or VVDI2/VVDI BMW. ISN read from DME required. Display Key option available on some trims. All keys lost: read ISN from ECU via bench or OBD.', true, false, 'HU100R', 2017, 2024);

  -- 5 Series (F10 2011-2016)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 5 Series (F10)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS4)', '315 MHz / 433 MHz', 'smart_key', 'YGOHUF5767', 'CAS4/CAS4+ system. ISN required from CAS module. Program via ISTA, Autel IM608 Pro, VVDI2, or Yanhua ACDP. CAS4 can be read via OBD on earlier models; CAS4+ may require bench.', true, true, 'HU92R', 2011, 2016);

  -- X3 (G01 2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'X3', 'x3') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X3 (G01)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'FEM/BDC system. Requires ISTA+, Autel IM608 Pro, or VVDI2. ISN required from DME. Comfort Access standard on most trims. All keys lost requires ISN read from ECU.', true, false, 'HU100R', 2018, 2024);

  -- X3 (F25 2011-2017)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X3 (F25)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS4)', '315 MHz / 433 MHz', 'smart_key', 'KR55WK49863', 'CAS4/CAS4+ immobilizer. ISN required from CAS module. Program via ISTA, VVDI2, or Autel IM608 Pro. OBD programmable on CAS4; CAS4+ may require bench read.', true, true, 'HU92R', 2011, 2017);

  -- X5 (G05 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'X5', 'x5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X5 (G05)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'N5F-ID2A', 'BDC system. Requires ISTA+, Autel IM608 Pro, or VVDI2/VVDI BMW. ISN from DME required. Display Key available as option. All keys lost: bench read ISN from ECU.', true, false, 'HU100R', 2019, 2024);

  -- X5 (F15 2014-2018)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X5 (F15)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS4+)', '315 MHz / 433 MHz', 'smart_key', 'N5F-ID2A', 'CAS4+ system. ISN read required from CAS module — bench read recommended. Program via ISTA, VVDI2, Autel IM608 Pro, or Yanhua ACDP. Comfort Access equipped.', true, true, 'HU92R', 2014, 2018);

  -- X1 (2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'X1', 'x1') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X1 (F48/U11)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'FEM/BDC system. Requires ISTA+, Autel IM608 Pro, or VVDI2. ISN from DME required. F48 (2016-2022) uses FEM, U11 (2023+) uses BDC. All keys lost supported with ISN.', true, false, 'HU100R', 2016, 2024);

  -- 7 Series (G11/G70 2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '7 Series', '7-series') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 7 Series (G11/G70)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'N5F-ID2A', 'FEM/BDC system. Display Key standard on 2016+. Requires ISTA+ or Autel IM608 Pro. ISN from DME required. All keys lost: read ISN via bench from ECU. High-security programming.', true, false, 'HU100R', 2016, 2024);

  -- 4 Series (G22 2021-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '4 Series', '4-series') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 4 Series (G22)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'BDC system. Same platform as G20 3 Series. Requires ISTA+, Autel IM608 Pro, or VVDI2. ISN from DME required. Comfort Access standard.', true, false, 'HU100R', 2021, 2024);

  -- X7 (G07 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'X7', 'x7') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X7 (G07)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'N5F-ID2A', 'BDC system. Display Key available. Requires ISTA+, Autel IM608 Pro, or VVDI2/VVDI BMW. ISN from DME required. All keys lost: bench read ISN from ECU. High-security vehicle.', true, false, 'HU100R', 2019, 2024);
END $$;
