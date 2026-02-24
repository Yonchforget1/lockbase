-- MASTER SEED PART2 of 4
-- New manufacturers (31) + key updates A-H
-- Run in order: PART1 -> PART2 -> PART3 -> PART4

-- ============================================================
-- STEP 7: New manufacturers (31 previously empty)
-- ============================================================
-- ============================================================
-- New Manufacturers Part 1: A through M
-- Aston Martin, Bentley, Daewoo, Eagle, Ferrari, Freightliner,
-- Geo, Hummer, International, Isuzu, Kenworth, Lamborghini,
-- Lotus, Lucid, Mack, Maserati, Maybach, McLaren, Mercury
-- ============================================================

-- ============================================================
-- ASTON MARTIN (d770ae7d-38b0-4d95-8c2c-139f5cf861ae)
-- ============================================================

-- Aston Martin DB8 (placeholder for DB generation, actual production ~concept)
-- Using DB11 years as DB8 is concept/limited
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'aston-martin'), 'DB8', 'db8')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2020, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'aston-martin'), 'Aston Martin DB8', 'HU101', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'CWTWB1U773', '2011D-WB1U773', 'Dealer programming required. All keys must be present during programming. Uses Volvo-derived smart key system. Crystal key fob design. Emergency blade HU101 hidden in fob. Programming via Aston Martin diagnostic tool (AMDS) only. No aftermarket tool support. Proximity entry and push-button start.', false, false, 'HU101', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-101', 2020, 2025);

-- Aston Martin Vantage (2006-2017 - V8/V12 Vantage era)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'aston-martin'), 'Vantage', 'vantage')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2017)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'aston-martin'), 'Aston Martin Vantage', 'HU101', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'CWTWB1U773', '2011D-WB1U773', 'Crystal key fob (EWRF) - Emotional Control Unit. Volvo-based platform. Dealer-only programming via AMDS. Transponder in glass key fob. Emergency HU101 blade. All keys lost requires ECU virginization at dealer. No aftermarket support. Key fob is also engine start button - insert into dash slot.', false, false, 'HU101', 'CR2450', 'Lock, Unlock, Trunk', 'T-HU-101', 2006, 2017);

-- Aston Martin Vantage (2018-2025 - New generation)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'aston-martin') AND slug = 'vantage'), 2018, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'aston-martin'), 'Aston Martin Vantage', 'HU101', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'CWTWB1U773', '2011D-WB1U773', 'New generation Vantage on Mercedes-AMG derived platform. Smart key with proximity entry and push-button start. Dealer programming via AMDS required. Emergency blade HU101 concealed in fob. No aftermarket tool support. All keys lost requires dealer intervention with security gateway bypass.', false, false, 'HU101', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-101', 2018, 2025);

-- Aston Martin Rapide (2010-2020)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'aston-martin'), 'Rapide', 'rapide')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2010, 2020)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'aston-martin'), 'Aston Martin Rapide', 'HU101', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'CWTWB1U773', '2011D-WB1U773', 'Four-door GT with crystal key fob (EWRF). Volvo-derived electronics. Dealer-only programming via AMDS diagnostic system. Crystal key doubles as engine start button - insert into dashboard receptacle. Emergency HU101 blade hidden in fob. All keys lost requires ECU reset at dealer. Rapide S (2013+) and Rapide E (electric) variants exist.', false, false, 'HU101', 'CR2450', 'Lock, Unlock, Trunk', 'T-HU-101', 2010, 2020);

-- ============================================================
-- BENTLEY (cf185a83-847e-4025-b725-02a858178b31)
-- ============================================================

-- Bentley Continental GT (2004-2017 - First/Second gen)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'bentley'), 'Continental GT', 'continental-gt')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2004, 2017)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'bentley'), 'Bentley Continental GT', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'smart_key', 'KR55WK45032', '7681D-55WK45032', 'VW/Audi platform shared electronics. Smart key with proximity entry. Programming via Bentley ODIS or VAG tools (VVDI2, Autel IM608 with VW protocol). Megamos 48 transponder - can be cloned with Tango/VVDI. HU66 emergency blade in fob. PIN code from dealer or EEPROM read for all keys lost. Kessy module programming.', true, true, 'HU66', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-66', 2004, 2017);

-- Bentley Continental GT (2018-2025 - Third gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'bentley') AND slug = 'continental-gt'), 2018, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'bentley'), 'Bentley Continental GT', 'HU162', 'Hitag Pro / MQB', 'Hitag Pro 49 (MQB)', '315 MHz', 'smart_key', 'KR5FS14-433', '7681D-FS14433', 'Third-generation Continental GT on VW MLB Evo platform. MQB-style smart key with Hitag Pro chip. Programming via Bentley ODIS or advanced aftermarket (Autel IM608 Pro, VVDI Audi). Security gateway may need bypass. HU162 emergency blade. All keys lost requires IMMO data from cluster/BCM. Component protection active.', true, false, 'HU162', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-162', 2018, 2025);

-- Bentley Flying Spur (2006-2019 - First/Second gen)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'bentley'), 'Flying Spur', 'flying-spur')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2019)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'bentley'), 'Bentley Flying Spur', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'smart_key', 'KR55WK45032', '7681D-55WK45032', 'Four-door sedan on VW platform. Same Kessy smart key system as Continental GT. Megamos 48 transponder. Programming via ODIS or VAG aftermarket tools (VVDI2, Autel). HU66 emergency blade. PIN required for all keys lost - obtain from dealer or EEPROM. OBD add key supported with PIN.', true, true, 'HU66', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-66', 2006, 2019);

-- Bentley Flying Spur (2020-2025 - Third gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'bentley') AND slug = 'flying-spur'), 2020, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'bentley'), 'Bentley Flying Spur', 'HU162', 'Hitag Pro / MQB', 'Hitag Pro 49 (MQB)', '315 MHz', 'smart_key', 'KR5FS14-433', '7681D-FS14433', 'New-gen Flying Spur on VW MLB Evo platform. MQB-style Hitag Pro smart key. Dealer programming via ODIS or advanced aftermarket tools with security gateway bypass. HU162 emergency blade. Component protection active. All keys lost requires cluster/BCM IMMO data extraction.', true, false, 'HU162', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-162', 2020, 2025);

-- Bentley Bentayga (2016-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'bentley'), 'Bentayga', 'bentayga')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2016, 2020)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'bentley'), 'Bentley Bentayga', 'HU66', 'Megamos 48 / Hitag Pro', 'Megamos Crypto 48', '315 MHz', 'smart_key', 'KR55WK45032', '7681D-55WK45032', 'Luxury SUV on VW MLB platform. Kessy smart key system. Earlier models use Megamos 48. Programming via ODIS or VAG aftermarket tools. HU66 emergency blade. PIN from dealer or EEPROM read needed for all keys lost.', true, true, 'HU66', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-HU-66', 2016, 2020);

-- Bentley Bentayga (2021-2025 facelift)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'bentley') AND slug = 'bentayga'), 2021, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'bentley'), 'Bentley Bentayga', 'HU162', 'Hitag Pro / MQB', 'Hitag Pro 49 (MQB)', '315 MHz', 'smart_key', 'KR5FS14-433', '7681D-FS14433', 'Facelifted Bentayga with updated electronics. MQB Hitag Pro smart key. Security gateway present. Programming via ODIS or Autel IM608 Pro with gateway bypass. HU162 emergency blade. Component protection. All keys lost requires BCM/cluster data extraction.', true, false, 'HU162', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-HU-162', 2021, 2025);

-- ============================================================
-- DAEWOO (625b870d-7589-4942-9d44-daf2e4ddcf27)
-- ============================================================

-- Daewoo Lanos (1999-2002)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'daewoo'), 'Lanos', 'lanos')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'daewoo'), 'Daewoo Lanos', 'DWO4R', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Non-transponder vehicle. Standard mechanical key only. DWO4R key blank (also known as DW04RAP). Cut by code or duplicate from original. No immobilizer system. Some models had optional remote keyless entry as dealer accessory. Simple key duplication at any locksmith.', false, false, 'DWO4R', 'N/A', 'N/A', 'N/A', 1999, 2002);

-- Daewoo Leganza (1999-2002)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'daewoo'), 'Leganza', 'leganza')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'daewoo'), 'Daewoo Leganza', 'DWO5', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Non-transponder vehicle. Standard mechanical key DWO5 blank. No immobilizer. Key can be cut by code or duplicated. Mid-size sedan - Daewoo higher trim. Some 2001-2002 models may have optional dealer-installed remote entry. Simple duplication.', false, false, 'DWO5', 'N/A', 'N/A', 'N/A', 1999, 2002);

-- Daewoo Nubira (1999-2002)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'daewoo'), 'Nubira', 'nubira')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'daewoo'), 'Daewoo Nubira', 'DWO4R', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Non-transponder vehicle. Standard mechanical key DWO4R blank. No immobilizer system. Compact sedan/wagon. Key duplication straightforward - cut by code or copy. Available in sedan and wagon body styles. No programming required.', false, false, 'DWO4R', 'N/A', 'N/A', 'N/A', 1999, 2002);

-- ============================================================
-- EAGLE (ffbb759a-605d-4faf-b278-b2232bdcd3fe)
-- ============================================================

-- Eagle Talon (1990-1994 - First gen, standard key)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'eagle'), 'Talon', 'talon')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1990, 1994)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'eagle'), 'Eagle Talon', 'MIT2', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Mitsubishi Eclipse platform (DSM). Non-transponder mechanical key. MIT2 key blank (Mitsubishi profile). No immobilizer. Simple key duplication. First-gen Diamond Star Motors vehicle. Turbo AWD models highly sought after. Standard ignition key.', false, false, 'MIT2', 'N/A', 'N/A', 'N/A', 1990, 1994);

-- Eagle Talon (1995-1998 - Second gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'eagle') AND slug = 'talon'), 1995, 1998)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'eagle'), 'Eagle Talon', 'MIT2', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Second-gen DSM platform. Non-transponder mechanical key. MIT2 key blank. No immobilizer on US models. Simple duplication. Some late models had optional dealer-installed keyless entry. Eagle brand discontinued by Chrysler in 1998.', false, false, 'MIT2', 'N/A', 'N/A', 'N/A', 1995, 1998);

-- Eagle Vision (1993-1997)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'eagle'), 'Vision', 'vision')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1993, 1997)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'eagle'), 'Eagle Vision', 'Y155', 'No transponder', 'None', '315 MHz', 'standard', 'GQ43VT5T', '3513A-43VT5T', 'Chrysler LH platform sedan. Non-transponder key. Y155 key blank (Chrysler profile). Optional keyless entry remote (GQ43VT5T). No immobilizer. Standard key duplication. LH platform shared with Dodge Intrepid and Chrysler Concorde. Remote is standalone - not integrated into key.', false, false, 'Y155', 'CR2016', 'Lock, Unlock, Panic', 'N/A', 1993, 1997);

-- Eagle Summit (1989-1996)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'eagle'), 'Summit', 'summit')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1989, 1996)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'eagle'), 'Eagle Summit', 'MIT2', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Rebadged Mitsubishi Mirage. Non-transponder mechanical key. MIT2 key blank. No immobilizer system. Available as sedan and wagon. Simple key duplication. Mitsubishi 4G series engines. No programming required. Eagle brand by Chrysler using Mitsubishi platforms.', false, false, 'MIT2', 'N/A', 'N/A', 'N/A', 1989, 1996);

-- ============================================================
-- FERRARI (55238534-20a2-4b54-8bda-73c688bfe31b)
-- ============================================================

-- Ferrari 488 (2016-2019)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'ferrari'), '488', '488')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2016, 2019)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'ferrari'), 'Ferrari 488', 'SIP22', 'Megamos 48', 'Megamos Crypto 48', '433 MHz', 'smart_key', 'N/A', 'N/A', 'Ferrari smart key with proximity entry and push-button start. Dealer-only programming via Ferrari diagnostics (SD3/SD4). SIP22 emergency blade. Megamos 48 transponder. No aftermarket tool support for key programming. All keys lost requires ECU replacement or dealer virginization. Very limited locksmith access. 488 GTB and 488 Spider variants.', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2016, 2019);

-- Ferrari F8 Tributo (2020-2024)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'ferrari'), 'F8 Tributo', 'f8-tributo')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2020, 2024)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'ferrari'), 'Ferrari F8 Tributo', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'N/A', 'N/A', 'Successor to 488. Smart key with proximity entry. Ferrari dealer-only programming via SD4 diagnostic system. Hitag Pro transponder (upgraded security from 488). SIP22 emergency blade. No aftermarket support. All keys lost requires dealer with Ferrari online connection. F8 Spider variant also available.', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2020, 2024);

-- Ferrari Roma (2021-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'ferrari'), 'Roma', 'roma')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2021, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'ferrari'), 'Ferrari Roma', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'N/A', 'N/A', 'Grand touring coupe. Smart key with proximity entry and push-button start. Dealer-only programming via Ferrari SD4. Hitag Pro transponder. SIP22 emergency blade concealed in fob. No aftermarket key programming. All keys lost requires dealer intervention with Ferrari online authorization. Roma Spider variant (2023+).', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2021, 2025);

-- Ferrari SF90 (2020-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'ferrari'), 'SF90', 'sf90')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2020, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'ferrari'), 'Ferrari SF90', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'N/A', 'N/A', 'Plug-in hybrid supercar (PHEV). Smart key with proximity entry. Ferrari dealer-only programming via SD4. Hitag Pro chip. SIP22 emergency blade. No aftermarket support for key programming. SF90 Stradale and SF90 Spider variants. All keys lost requires Ferrari online connection. Most advanced Ferrari electronics platform.', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2020, 2025);

-- Ferrari Portofino (2018-2023)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'ferrari'), 'Portofino', 'portofino')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2018, 2023)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'ferrari'), 'Ferrari Portofino', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'N/A', 'N/A', 'Convertible GT replacing California T. Smart key with proximity entry. Dealer-only programming via Ferrari SD4. Hitag Pro transponder. SIP22 emergency blade. No aftermarket key tool support. Portofino M (2021+) is updated variant. All keys lost requires dealer with Ferrari online authorization.', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2018, 2023);

-- ============================================================
-- FREIGHTLINER (1e42cecd-0527-479c-b7a3-113d9ce2a936)
-- ============================================================

-- Freightliner Cascadia (2008-2017 - Original)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'freightliner'), 'Cascadia', 'cascadia')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2017)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'freightliner'), 'Freightliner Cascadia', 'Y160', 'Texas Crypto 4D', '4D63 (80-bit)', 'N/A', 'transponder', 'N/A', 'N/A', 'Class 8 semi-truck. Y160 key blank (also known as FTL1). Transponder key with 4D63 chip. Programming via Daimler ServiceLink or aftermarket tools (Autel IM608, SKP900). Some models use ignition-learn procedure. Detroit Diesel engine ECU integration. Key must match both ignition and door locks. Fleet management often uses keyed-alike systems.', false, true, 'Y160', 'N/A', 'N/A', 'N/A', 2008, 2017);

-- Freightliner Cascadia (2018-2025 - New Cascadia)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'freightliner') AND slug = 'cascadia'), 2018, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'freightliner'), 'Freightliner Cascadia', 'Y160', 'Texas Crypto 4D', '4D63 (80-bit)', 'N/A', 'transponder', 'N/A', 'N/A', 'New Cascadia with updated electronics. Y160 key blank. Enhanced immobilizer with 4D63 80-bit chip. Programming via Daimler DDDL (Detroit Diesel Diagnostic Link) or ServiceLink. Aftermarket: Autel IM608 Pro supports. Detroit DD13/DD15 engine integration. New digital dash cluster. Fleet key management compatible.', false, true, 'Y160', 'N/A', 'N/A', 'N/A', 2018, 2025);

-- Freightliner M2 (2004-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'freightliner'), 'M2', 'm2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2004, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'freightliner'), 'Freightliner M2', 'Y160', 'Texas Crypto 4D', '4D63 (80-bit)', 'N/A', 'transponder', 'N/A', 'N/A', 'Medium-duty truck (M2 106 and M2 112). Y160 key blank. Transponder with 4D63 chip. Programming via Daimler ServiceLink or DDDL. Aftermarket tools support add key. Cummins or Detroit Diesel engine options affect ECU pairing. Used in vocational applications (box trucks, flatbeds, refuse). Fleet keying available.', false, true, 'Y160', 'N/A', 'N/A', 'N/A', 2004, 2025);

-- Freightliner Sprinter (2001-2006 - T1N generation)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'freightliner'), 'Sprinter', 'sprinter')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2001, 2006)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'freightliner'), 'Freightliner Sprinter', 'HU64', 'Texas Crypto 4D', '4D63', '315 MHz', 'transponder', 'N/A', 'N/A', 'Rebadged Mercedes-Benz Sprinter (T1N). HU64 key blank (Mercedes profile). Transponder key with remote head option. Programming via Mercedes Star Diagnostic or aftermarket tools. Same key system as Mercedes Sprinter. Flip key available. No proximity entry. Standard ignition barrel.', false, true, 'HU64', 'CR2032', 'Lock, Unlock', 'T-HU-64', 2001, 2006);

-- Freightliner Sprinter (2007-2018 - NCV3)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'freightliner') AND slug = 'sprinter'), 2007, 2018)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'freightliner'), 'Freightliner Sprinter', 'HU64', 'Texas Crypto 4D', '4D63 (80-bit)', '315 MHz', 'transponder', 'IYZ3312', '2701A-3312', 'NCV3 generation Sprinter. HU64 key blank. Transponder with integrated remote head key. FCC: IYZ3312. Programming via Mercedes DAS/Xentry or aftermarket (Autel IM608, VVDI MB). OBD programmable for add key. All keys lost requires EIS (Electronic Ignition Switch) read. Chrome remote head key with 2 or 3 buttons.', false, true, 'HU64', 'CR2032', 'Lock, Unlock, Panic', 'T-HU-64', 2007, 2018);

-- ============================================================
-- GEO (cc5bd50c-70f4-4956-8150-0d8b846d668a)
-- ============================================================

-- Geo Metro (1989-1997)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'geo'), 'Metro', 'metro')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1989, 1997)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'geo'), 'Geo Metro', 'SUZ17', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Rebadged Suzuki Swift/Cultus. Non-transponder mechanical key. SUZ17 key blank (Suzuki profile). No immobilizer. Simple key duplication. Available as 3-door hatch, 4-door sedan, and 2-door convertible. 3-cylinder or 4-cylinder engine. Known for extreme fuel economy. Became Chevrolet Metro after 1997.', false, false, 'SUZ17', 'N/A', 'N/A', 'N/A', 1989, 1997);

-- Geo Prizm (1989-1997)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'geo'), 'Prizm', 'prizm')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1989, 1997)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'geo'), 'Geo Prizm', 'B65', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Rebadged Toyota Corolla (NUMMI plant). Non-transponder mechanical key. B65 key blank (GM profile, fits Toyota-derived ignition). No immobilizer. Simple key duplication. Built at NUMMI plant in Fremont, CA alongside Toyota Corolla. Became Chevrolet Prizm after 1997. Standard GM keyway.', false, false, 'B65', 'N/A', 'N/A', 'N/A', 1989, 1997);

-- Geo Tracker (1989-1997)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'geo'), 'Tracker', 'tracker')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1989, 1997)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'geo'), 'Geo Tracker', 'SUZ17', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Rebadged Suzuki Sidekick. Non-transponder mechanical key. SUZ17 key blank (Suzuki profile). No immobilizer system. Simple key duplication. Compact SUV available as 2-door convertible or 4-door hardtop. Became Chevrolet Tracker after 1997. Part-time 4WD available.', false, false, 'SUZ17', 'N/A', 'N/A', 'N/A', 1989, 1997);

-- ============================================================
-- HUMMER (f4742222-ccff-49b2-ad6a-0da4a66fed64)
-- ============================================================

-- Hummer H2 (2003-2007 - standard years)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'hummer'), 'H2', 'h2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2003, 2007)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'hummer'), 'Hummer H2', 'B106', 'PK3 (Passkey 3)', 'Megamos 13 / PK3', '315 MHz', 'transponder', 'LHJ011', '2580A-HJ011', 'GM platform (GMT820, based on Tahoe). PK3 (Passkey III) transponder system. B106 key blank with transponder chip. Programming via Tech2 or aftermarket (Autel IM608, VVDI2 GM). 10-minute relearn procedure available for add key with 2 working keys. OBD programmable. Remote head key with 3 buttons. All keys lost requires security bypass or Tech2.', false, true, 'B106', 'CR2032', 'Lock, Unlock, Panic', 'T-B-106', 2003, 2007);

-- Hummer H2 (2008-2009 - final years)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'hummer') AND slug = 'h2'), 2008, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'hummer'), 'Hummer H2', 'B110', 'PK3+ (Passkey 3+)', 'PK3+ / Megamos 46', '315 MHz', 'transponder', 'OUC60270', '3521A-60270', 'Final production years with updated PK3+ system. B110 key blank (larger head). Remote head key integrated transponder and remote. Programming via Tech2, MDI, or aftermarket (Autel IM608, VVDI2). OBD add key with existing working key. 10-minute relearn may work. All keys lost: Tech2 or SPS required.', false, true, 'B110', 'CR2032', 'Lock, Unlock, Remote Start, Panic', 'T-B-110', 2008, 2009);

-- Hummer H3 (2006-2010)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'hummer'), 'H3', 'h3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'hummer'), 'Hummer H3', 'B110', 'PK3+ (Passkey 3+)', 'PK3+ / Megamos 46', '315 MHz', 'transponder', 'OUC60270', '3521A-60270', 'GM platform (GMT345, based on Colorado). PK3+ (Passkey III+) transponder. B110 key blank with integrated remote head. Programming via Tech2/MDI or aftermarket tools (Autel IM608, VVDI2 GM). 10-minute relearn for add key with 2 working keys. OBD programmable. H3T (truck) and H3 Alpha variants. All keys lost requires Tech2 or SPS.', false, true, 'B110', 'CR2032', 'Lock, Unlock, Panic', 'T-B-110', 2006, 2010);

-- ============================================================
-- INTERNATIONAL (480ada81-0f04-4f0f-9f05-516dca8a7bf4)
-- ============================================================

-- International ProStar (2008-2017)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'international'), 'ProStar', 'prostar')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2017)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'international'), 'International ProStar', 'SC1', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Class 8 highway truck by Navistar. SC1 (S1069CM) key blank. Non-transponder mechanical key for most models. No immobilizer on standard configuration. Key operates ignition and door locks. Fleet keying common. Some late models with Cummins ISX may have ECU key pairing. Standard key duplication. Replaced by LT series.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 2008, 2017);

-- International LT (2017-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'international'), 'LT', 'lt')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2017, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'international'), 'International LT', 'SC1', 'Texas Crypto 4D', '4D63', 'N/A', 'transponder', 'N/A', 'N/A', 'Replacement for ProStar. SC1 key blank. Newer models have transponder immobilizer with Navistar proprietary system. Programming via Navistar ServiceMaxx diagnostic tool. Some models still non-transponder depending on configuration. International A26 engine standard. Fleet key management available. Contact dealer for all keys lost situations.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 2017, 2025);

-- International 4300 (2003-2017)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'international'), '4300', '4300')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2003, 2017)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'international'), 'International 4300', 'SC1', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Medium-duty truck (DuraStar series). SC1 key blank. Non-transponder mechanical key. No immobilizer on standard models. DT466/MaxxForce DT engine. Widely used in vocational applications (delivery, utility, municipal). Simple key duplication. Fleet master key systems available. Replaced by MV series in 2018.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 2003, 2017);

-- ============================================================
-- ISUZU (aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c)
-- ============================================================

-- Isuzu Rodeo (1991-1997 - First gen, no transponder)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'isuzu'), 'Rodeo', 'rodeo')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1991, 1997)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'isuzu'), 'Isuzu Rodeo', 'ISU5', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Mid-size SUV. ISU5 key blank (Isuzu profile, also X184/B65 compatible). Non-transponder mechanical key. No immobilizer. Simple key duplication. First generation shared platform with Honda Passport. Standard ignition barrel key.', false, false, 'ISU5', 'N/A', 'N/A', 'N/A', 1991, 1997);

-- Isuzu Rodeo (1998-2004 - Second gen with transponder)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'isuzu') AND slug = 'rodeo'), 1998, 2004)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'isuzu'), 'Isuzu Rodeo', 'ISU5', 'Texas Fixed 4C', '4C chip', '315 MHz', 'transponder', 'HYQ1512R', 'N/A', 'Second-gen Rodeo with immobilizer (1998+). ISU5 key blank with Texas 4C transponder chip. Programming via Isuzu diagnostic tool or aftermarket (Autel, VVDI). 4C chip can be cloned. Optional keyless entry remote (separate unit). OBD programming for add key. All keys lost: ECU reset or chip clone from VIN data.', false, true, 'ISU5', 'CR2016', 'Lock, Unlock, Panic', 'N/A', 1998, 2004);

-- Isuzu Trooper (1992-2002)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'isuzu'), 'Trooper', 'trooper')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1992, 1997)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'isuzu'), 'Isuzu Trooper', 'ISU5', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Full-size SUV. ISU5 key blank. Non-transponder mechanical key (1992-1997). No immobilizer. Simple key duplication. Second-generation body style. Available in 4WD. Rebadged as Acura SLX (1996-1999) and Honda Horizon (Japan).', false, false, 'ISU5', 'N/A', 'N/A', 'N/A', 1992, 1997);

-- Isuzu Trooper (1998-2002 - with transponder)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'isuzu') AND slug = 'trooper'), 1998, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'isuzu'), 'Isuzu Trooper', 'ISU5', 'Texas Fixed 4C', '4C chip', '315 MHz', 'transponder', 'HYQ1512R', 'N/A', 'Trooper with immobilizer (1998+). ISU5 key blank with 4C transponder. Isuzu diagnostic or aftermarket tools for programming. 4C chip cloneable. Separate keyless entry remote. OBD add key supported. All keys lost: clone 4C from EEPROM data. Last year of Trooper production was 2002 in US.', false, true, 'ISU5', 'CR2016', 'Lock, Unlock, Panic', 'N/A', 1998, 2002);

-- Isuzu Ascender (2003-2008)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'isuzu'), 'Ascender', 'ascender')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2003, 2008)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'isuzu'), 'Isuzu Ascender', 'B106', 'PK3 (Passkey 3)', 'Megamos 13 / PK3', '315 MHz', 'transponder', 'L2C0005T', '2580A-C0005T', 'Rebadged Chevrolet TrailBlazer (GMT360 platform). B106 key blank with PK3 transponder - GM key system. Programming via GM Tech2 or aftermarket (Autel, VVDI2 GM). 10-minute relearn procedure for add key. OBD programmable. Separate remote fob (L2C0005T). Same key system as GM SUVs of era.', false, true, 'B106', 'CR2032', 'Lock, Unlock, Panic', 'T-B-106', 2003, 2008);

-- Isuzu NPR (1995-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'isuzu'), 'NPR', 'npr')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1995, 2007)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'isuzu'), 'Isuzu NPR', 'ISU5', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Cab-over medium-duty truck (N-Series). ISU5 key blank. Non-transponder mechanical key. No immobilizer on earlier models. Simple key duplication. Available as NPR, NPR-HD, NQR, NRR. Isuzu 4HK1 diesel or 6.0L GM gas engine options. Fleet keying available. Very common commercial vehicle.', false, false, 'ISU5', 'N/A', 'N/A', 'N/A', 1995, 2007);

-- Isuzu NPR (2008-2025 - with immobilizer)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'isuzu') AND slug = 'npr'), 2008, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'isuzu'), 'Isuzu NPR', 'ISU5', 'Texas Crypto 4D', '4D60 chip', 'N/A', 'transponder', 'N/A', 'N/A', 'Updated NPR with transponder immobilizer. ISU5 key blank with 4D60 chip. Programming via Isuzu IDSS (Isuzu Diagnostic Service System) or select aftermarket tools. OBD add key possible with working key. All keys lost may require ECU intervention via dealer. Isuzu 4HK1/5.2L diesel standard. Gas models (6.6L GM) may use different immobilizer.', false, true, 'ISU5', 'N/A', 'N/A', 'N/A', 2008, 2025);

-- ============================================================
-- KENWORTH (d78fe487-ca66-4907-a957-dcf45c32299b)
-- ============================================================

-- Kenworth T680 (2013-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'kenworth'), 'T680', 't680')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2013, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'kenworth'), 'Kenworth T680', 'Y160', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Class 8 highway truck (PACCAR). Y160 key blank (also known as KW1). Non-transponder mechanical key. No immobilizer on standard ignition. Key operates ignition, doors, and storage. PACCAR MX-13 engine standard. Fleet master key systems available. Simple key duplication. Aerodynamic flagship model. T680 Next Gen (2021+) maintains same key system.', false, false, 'Y160', 'N/A', 'N/A', 'N/A', 2013, 2025);

-- Kenworth T880 (2014-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'kenworth'), 'T880', 't880')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2014, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'kenworth'), 'Kenworth T880', 'Y160', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Vocational Class 8 truck (PACCAR). Y160 key blank. Non-transponder mechanical key. No immobilizer. Used in construction, dump, mixer applications. PACCAR MX-13 or Cummins X15 engines. Same key profile as T680. Fleet keying compatible. Simple key duplication at any locksmith.', false, false, 'Y160', 'N/A', 'N/A', 'N/A', 2014, 2025);

-- Kenworth W900 (1990-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'kenworth'), 'W900', 'w900')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1990, 2006)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'kenworth'), 'Kenworth W900', 'SC1', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Iconic long-hood Class 8 truck. SC1 key blank (older Kenworth profile). Non-transponder mechanical key. No immobilizer. Older W900 models use SC1 keyway. Simple key duplication. Traditional style truck - very popular with owner-operators. Caterpillar or Cummins engines in this era.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 1990, 2006);

-- Kenworth W900 (2007-2025 - updated key)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'kenworth') AND slug = 'w900'), 2007, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'kenworth'), 'Kenworth W900', 'Y160', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Updated W900 with Y160 key blank (PACCAR standardized keyway). Non-transponder mechanical key. No immobilizer. Same key profile as newer T680/T880. PACCAR MX or Cummins X15 engines. Fleet keying compatible across PACCAR trucks. Simple key duplication. W900L (long) and W900B (short) variants.', false, false, 'Y160', 'N/A', 'N/A', 'N/A', 2007, 2025);

-- ============================================================
-- LAMBORGHINI (eae04226-807d-4035-9799-33bd144e1491)
-- ============================================================

-- Lamborghini Huracan (2015-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'lamborghini'), 'Huracan', 'huracan')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2015, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'lamborghini'), 'Lamborghini Huracan', 'HU66', 'Megamos 48 / MQB', 'Megamos AES', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Audi R8 shared platform (VW Group). Smart key with proximity entry and push-button start. Uses VW/Audi Kessy system. Programming via Lamborghini ODIS or VAG aftermarket tools (VVDI2, Autel IM608 with VW/Audi protocol). HU66 emergency blade. Megamos AES transponder on newer models. PIN from dealer or EEPROM for all keys lost. Component protection may be active. Huracan EVO and STO variants.', true, false, 'HU66', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-66', 2015, 2025);

-- Lamborghini Urus (2019-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'lamborghini'), 'Urus', 'urus')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2019, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'lamborghini'), 'Lamborghini Urus', 'HU162', 'Hitag Pro / MQB', 'Hitag Pro 49 (MQB)', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Super SUV on VW MLB Evo platform (shared with Audi Q8/Bentley Bentayga). MQB-style smart key with Hitag Pro. Programming via Lamborghini ODIS or advanced aftermarket (Autel IM608 Pro, VVDI Audi). Security gateway bypass required. HU162 emergency blade. Component protection active. All keys lost requires cluster/BCM data. Urus S and Urus SE (PHEV) variants.', true, false, 'HU162', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-HU-162', 2019, 2025);

-- Lamborghini Aventador (2012-2022)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'lamborghini'), 'Aventador', 'aventador')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2012, 2022)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'lamborghini'), 'Lamborghini Aventador', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Flagship V12 supercar. VW Group Kessy smart key system. Megamos 48 transponder. Programming via Lamborghini ODIS or VAG tools. HU66 emergency blade. Dealer-preferred programming. Some aftermarket support via VVDI2/Autel with VAG protocol. PIN code from dealer or BCM EEPROM read for all keys lost. Aventador S, SVJ, and Ultimae variants. Scissors door design.', true, false, 'HU66', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-66', 2012, 2022);

-- ============================================================
-- LOTUS (abd3ae75-dfbb-475c-b73b-f14c746e95a2)
-- ============================================================

-- Lotus Elise (2005-2011 - US market)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'lotus'), 'Elise', 'elise')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2005, 2011)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'lotus'), 'Lotus Elise', 'TOY43', 'Texas Fixed 4C', '4C chip', '315 MHz', 'transponder', 'N/A', 'N/A', 'Lightweight sports car with Toyota 2ZZ-GE engine. TOY43 key blank (Toyota-derived ignition). Texas 4C transponder chip. Programming via Lotus TechCentre diagnostic or aftermarket tools supporting Toyota protocol. 4C chip can be cloned. Separate keyless entry remote on some trims. Minimal electronics. Key is standard blade with transponder - no remote head key. US market 2005-2011.', false, true, 'TOY43', 'N/A', 'N/A', 'N/A', 2005, 2011);

-- Lotus Evora (2010-2021)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'lotus'), 'Evora', 'evora')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2010, 2021)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'lotus'), 'Lotus Evora', 'TOY43', 'Texas Crypto 4D', '4D67 chip', '315 MHz', 'transponder', 'N/A', 'N/A', 'GT sports car with Toyota 2GR-FE V6. TOY43 key blank (Toyota-derived). 4D67 transponder chip. Programming via Lotus TechCentre or aftermarket tools with Toyota protocol support. Key blade with integrated transponder. Some later models (Evora GT, Evora 400) may have remote head key. OBD programmable with correct tools. All keys lost: ECU reset via Lotus diagnostic.', false, true, 'TOY43', 'CR2016', 'Lock, Unlock', 'N/A', 2010, 2021);

-- Lotus Emira (2022-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'lotus'), 'Emira', 'emira')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2022, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'lotus'), 'Lotus Emira', 'TOY48', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Last ICE Lotus. Smart key with proximity entry and push-button start. Geely-era electronics (Lotus now Geely-owned). TOY48 emergency blade (Toyota-derived). Hitag Pro transponder. Dealer programming via Lotus diagnostic system. Limited aftermarket support. Available with Toyota V6 or AMG 4-cylinder turbo. Emergency blade hidden in smart key fob.', false, false, 'TOY48', 'CR2032', 'Lock, Unlock, Trunk', 'T-TOY-48', 2022, 2025);

-- ============================================================
-- LUCID (baea3e4e-cd68-474a-aeff-2caf7dc675d4)
-- ============================================================

-- Lucid Air (2022-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'lucid'), 'Air', 'air')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2022, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'lucid'), 'Lucid Air', 'N/A (Key Card)', 'NFC/BLE', 'Lucid proprietary', '13.56 MHz (NFC) / BLE', 'smart_key', 'N/A', 'N/A', 'Luxury EV sedan. NO traditional key or blade. Primary: Lucid mobile app (phone key via Bluetooth LE). Secondary: NFC key card (credit card size). NO mechanical key or emergency blade. All programming done through Lucid app or service center. NO locksmith tools available. Emergency entry: contact Lucid roadside assistance. No OBD programming. Trims: Air Pure, Touring, Grand Touring, Sapphire.', false, false, 'N/A', 'N/A', 'N/A', 'N/A', 2022, 2025);

-- Lucid Gravity (2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'lucid'), 'Gravity', 'gravity')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2025, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'lucid'), 'Lucid Gravity', 'N/A (Key Card)', 'NFC/BLE', 'Lucid proprietary', '13.56 MHz (NFC) / BLE', 'smart_key', 'N/A', 'N/A', 'Luxury EV SUV. Same key system as Lucid Air. NO traditional key or blade. Primary: Lucid mobile app (phone key via BLE). Secondary: NFC key card. NO mechanical emergency key. All programming through Lucid app or service center only. NO locksmith tool support. 3-row SUV. Contact Lucid roadside assistance for lockouts.', false, false, 'N/A', 'N/A', 'N/A', 'N/A', 2025, 2025);

-- ============================================================
-- MACK (727ae3da-d2e7-4983-8ad8-48bd59521054)
-- ============================================================

-- Mack Anthem (2018-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'mack'), 'Anthem', 'anthem')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2018, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mack'), 'Mack Anthem', 'SC1', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Class 8 highway truck (Volvo Group). SC1 key blank (Mack/Volvo profile). Non-transponder mechanical key. No immobilizer on standard configuration. Key operates ignition and door locks. Mack MP8 engine (Volvo D13 based). Fleet master key compatible. Simple key duplication. Replaced Mack Pinnacle in highway segment.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 2018, 2025);

-- Mack Granite (2002-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'mack'), 'Granite', 'granite')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2002, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mack'), 'Mack Granite', 'SC1', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Vocational Class 8 truck (construction, dump, refuse). SC1 key blank. Non-transponder mechanical key. No immobilizer. Used in severe-duty applications. Mack MP7 or MP8 engines. Fleet keying available. Simple key duplication. Very rugged design for off-road/construction. One of Mack most popular models.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 2002, 2025);

-- Mack Pinnacle (2006-2019)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'mack'), 'Pinnacle', 'pinnacle')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2019)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mack'), 'Mack Pinnacle', 'SC1', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Highway Class 8 truck (predecessor to Anthem). SC1 key blank. Non-transponder mechanical key. No immobilizer. Mack MP7 or MP8 engines. Fleet keying compatible with other Mack trucks. Simple key duplication. Available as daycab or sleeper. Replaced by Anthem in 2018-2019.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 2006, 2019);

-- ============================================================
-- MASERATI (3b552367-36f7-4a16-98f1-fa0fbba5530e)
-- ============================================================

-- Maserati Ghibli (2014-2023)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'maserati'), 'Ghibli', 'ghibli')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2014, 2023)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'maserati'), 'Maserati Ghibli', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'M3N-7393490', '7812D-7393490', 'FCA/Stellantis platform. Smart key with proximity entry and push-button start. Hitag Pro transponder. Programming via WiTech 2.0 or aftermarket tools (Autel IM608 Pro, OBDSTAR). SIP22 emergency blade. FCC ID: M3N-7393490 (shared with some Chrysler/FCA). All keys lost may require BCM EEPROM work. Maserati-specific fob design.', true, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-SIP-22', 2014, 2023);

-- Maserati Levante (2017-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'maserati'), 'Levante', 'levante')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2017, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'maserati'), 'Maserati Levante', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'M3N-7393490', '7812D-7393490', 'Luxury SUV on FCA/Stellantis platform. Smart key with proximity entry. Hitag Pro transponder. Programming via WiTech 2.0 or Autel IM608 Pro. SIP22 emergency blade. Same key system as Ghibli. All keys lost requires PIN from dealer or BCM EEPROM. Levante Trofeo and GTS variants with V8.', true, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-SIP-22', 2017, 2025);

-- Maserati Quattroporte (2005-2012 - Fifth gen)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'maserati'), 'Quattroporte', 'quattroporte')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2005, 2012)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'maserati'), 'Maserati Quattroporte', 'SIP22', 'Megamos 48', 'Megamos Crypto 48', '433 MHz', 'smart_key', 'RX2TRF937', 'N/A', 'Fifth-gen Quattroporte. Smart key fob with proximity entry. Megamos 48 transponder. SIP22 emergency blade. Dealer programming via Maserati diagnostic (SD2/SD3). Limited aftermarket support. Ferrari-derived electronics (Maserati was Ferrari subsidiary). All keys lost requires ECU virginization at dealer. Luxury flagship sedan.', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2005, 2012);

-- Maserati Quattroporte (2013-2025 - Sixth gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'maserati') AND slug = 'quattroporte'), 2013, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'maserati'), 'Maserati Quattroporte', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'M3N-7393490', '7812D-7393490', 'Sixth-gen on FCA platform. Smart key with proximity entry. Hitag Pro transponder. WiTech 2.0 or aftermarket (Autel IM608 Pro) for programming. SIP22 emergency blade. PIN from dealer or BCM EEPROM for all keys lost. Same key system as Ghibli/Levante on FCA platform. Quattroporte GTS with V8.', true, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-SIP-22', 2013, 2025);

-- Maserati GranTurismo (2008-2019 - First gen)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'maserati'), 'GranTurismo', 'granturismo')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2019)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'maserati'), 'Maserati GranTurismo', 'SIP22', 'Megamos 48', 'Megamos Crypto 48', '433 MHz', 'smart_key', 'RX2TRF937', 'N/A', 'GT coupe with Ferrari V8. Smart key with proximity entry. Megamos 48 transponder. SIP22 emergency blade. Dealer programming via Maserati diagnostic (SD3). Ferrari-derived electronics. Limited aftermarket support. All keys lost requires ECU virginization. GranTurismo S and MC Stradale variants. GranCabrio convertible version.', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2008, 2019);

-- Maserati GranTurismo (2023-2025 - New gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'maserati') AND slug = 'granturismo'), 2023, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'maserati'), 'Maserati GranTurismo', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'M3N-7393490', '7812D-7393490', 'All-new GranTurismo on Stellantis platform. Smart key with proximity entry. Hitag Pro transponder. Programming via WiTech 2.0 or advanced aftermarket. SIP22 emergency blade. Nettuno V6 twin-turbo engine. Also available as Folgore (full EV). Same key platform as other Stellantis Maserati models.', true, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-SIP-22', 2023, 2025);

-- ============================================================
-- MAYBACH (d59cf9b2-8e75-4a23-906f-a4fa48834a8e)
-- ============================================================

-- Maybach 57 (2003-2012)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'maybach'), '57', '57')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2003, 2012)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'maybach'), 'Maybach 57', 'HU64', 'Texas Crypto 4D', '4D63', '315 MHz', 'smart_key', 'KR55WK49031', '2701A-55WK49031', 'Ultra-luxury sedan based on Mercedes-Benz W240 platform. HU64 emergency blade (Mercedes profile). Smart key with chrome fob. Programming via Mercedes Star Diagnostic (SDS/DAS) or Xentry. EIS (Electronic Ignition Switch) system - infrared key. NEC chip processor in EIS. Aftermarket: VVDI MB, CGDI MB can read EIS. All keys lost requires EIS read and key file generation. Very expensive replacement.', false, false, 'HU64', 'CR2025', 'Lock, Unlock, Trunk, Panic', 'T-HU-64', 2003, 2012);

-- Maybach 62 (2003-2012)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'maybach'), '62', '62')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2003, 2012)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'maybach'), 'Maybach 62', 'HU64', 'Texas Crypto 4D', '4D63', '315 MHz', 'smart_key', 'KR55WK49031', '2701A-55WK49031', 'Long-wheelbase ultra-luxury sedan. Same key system as Maybach 57. HU64 emergency blade. Mercedes EIS infrared smart key system. NEC processor. Programming via SDS/Xentry or VVDI MB/CGDI MB. All keys lost requires EIS read. 62 S Landaulet (open-top rear) is rarest variant. Chrome fob design. Extremely expensive key replacement - dealer preferred.', false, false, 'HU64', 'CR2025', 'Lock, Unlock, Trunk, Panic', 'T-HU-64', 2003, 2012);

-- Maybach S-Class (2015-2025 - Mercedes-Maybach)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'maybach'), 'S-Class', 's-class')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2015, 2020)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'maybach'), 'Maybach S-Class', 'HU64', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'IYZDC12K', '2701A-DC12K', 'Mercedes-Maybach S-Class (W222 platform). HU64 emergency blade. Hitag Pro transponder. Chrome-accented key fob. Programming via Mercedes Xentry or aftermarket (VVDI MB, Autel IM608 MB). EIS/EZS system with NEC/Renesas processor. All keys lost requires EIS read. FBS3 key system. OBD blocked - must work via direct EIS connection for all keys lost.', false, false, 'HU64', 'CR2025', 'Lock, Unlock, Trunk, Panic', 'T-HU-64', 2015, 2020);

-- Maybach S-Class (2021-2025 - W223)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'maybach') AND slug = 's-class'), 2021, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'maybach'), 'Maybach S-Class', 'HU64', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'IYZDC12K', '2701A-DC12K', 'New-gen Mercedes-Maybach S-Class (W223). HU64 emergency blade. FBS4 key system (most secure Mercedes system). Hitag Pro transponder. Dealer programming via Xentry strongly recommended. Aftermarket: limited support, VVDI MB/CGDI MB may support with latest updates. All keys lost extremely difficult - requires EZS replacement or advanced EEPROM work. No OBD key programming. S580 and S680 (V12) variants.', false, false, 'HU64', 'CR2025', 'Lock, Unlock, Trunk, Panic', 'T-HU-64', 2021, 2025);

-- ============================================================
-- MCLAREN (38a73d4d-8219-4c7e-b414-3abdfb70f40e)
-- ============================================================

-- McLaren 720S (2018-2024)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'mclaren'), '720S', '720s')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2018, 2024)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mclaren'), 'McLaren 720S', 'N/A', 'McLaren proprietary', 'McLaren proprietary', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Super Series supercar. McLaren proprietary smart key fob - no emergency blade or keyhole. Proximity entry with push-button start. Dealer-only programming via McLaren DiagTool. NO aftermarket tool support. NO emergency mechanical key or blade. All keys lost requires McLaren dealer with online connection. Dihedral doors. 720S Spider variant available. Key fob is custom McLaren design.', false, false, 'N/A', 'CR2032', 'Lock, Unlock', 'N/A', 2018, 2024);

-- McLaren GT (2020-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'mclaren'), 'GT', 'gt')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2020, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mclaren'), 'McLaren GT', 'N/A', 'McLaren proprietary', 'McLaren proprietary', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Grand touring supercar. McLaren proprietary smart key - no emergency blade. Proximity entry and push-button start. Dealer-only programming via McLaren DiagTool. NO aftermarket support. NO mechanical key backup. All keys lost requires McLaren dealer. Grand touring focus with luggage space. Same key platform as 720S.', false, false, 'N/A', 'CR2032', 'Lock, Unlock', 'N/A', 2020, 2025);

-- McLaren Artura (2022-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'mclaren'), 'Artura', 'artura')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2022, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mclaren'), 'McLaren Artura', 'N/A', 'McLaren proprietary', 'McLaren proprietary', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Plug-in hybrid (PHEV) supercar. New McLaren Carbon Lightweight Architecture (MCLA). McLaren proprietary smart key - no emergency blade. Proximity entry and push-button start. Dealer-only programming via McLaren DiagTool. NO aftermarket support. V6 twin-turbo + electric motor. All keys lost requires McLaren dealer with online authorization. New electronics architecture.', false, false, 'N/A', 'CR2032', 'Lock, Unlock', 'N/A', 2022, 2025);

-- ============================================================
-- MERCURY (c0671824-dcb0-49e0-bbec-a0adf7566fb9)
-- ============================================================

-- Mercury Grand Marquis (1992-2002 - PATS era begins 1996)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'mercury'), 'Grand Marquis', 'grand-marquis')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1992, 1995)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mercury'), 'Mercury Grand Marquis', 'H75', 'No transponder', 'None', '315 MHz', 'standard', 'GQ43VT4T', '3513A-43VT4T', 'Pre-PATS Grand Marquis. H75 key blank (Ford 8-cut). Non-transponder mechanical key. No immobilizer. Optional separate keyless entry remote (GQ43VT4T). Simple key duplication. Panther platform (shared with Crown Victoria and Town Car). Standard Ford ignition.', false, false, 'H75', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'N/A', 1992, 1995);

-- Mercury Grand Marquis (1996-2002 - PATS I)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'mercury') AND slug = 'grand-marquis'), 1996, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mercury'), 'Mercury Grand Marquis', 'H72', 'Texas Fixed 4C', '4C chip (Texas Glass)', '315 MHz', 'transponder', 'GQ43VT4T', '3513A-43VT4T', 'PATS (Passive Anti-Theft System) introduced. H72 key blank (Ford 10-cut) with 4C glass transponder. PATS I system. Programming: 2-key on-board programming (need 2 working keys to add 3rd). Aftermarket tools: Autel IM608, VVDI Key Tool. OBD programmable with PIN. Separate keyless entry remote. All keys lost: PATS PIN from Ford or EEPROM read of PCM.', true, true, 'H72', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'T-H-72', 1996, 2002);

-- Mercury Grand Marquis (2003-2011 - PATS II)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'mercury') AND slug = 'grand-marquis'), 2003, 2011)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mercury'), 'Mercury Grand Marquis', 'H92', 'Texas Crypto 4D', '4D63 (80-bit)', '315 MHz', 'transponder', 'CWTWB1U793', '2011D-WB1U793', 'PATS II system with 80-bit 4D63 chip. H92 key blank (Ford 8-cut, new profile). Remote head key with integrated transponder and buttons. FCC: CWTWB1U793. OBD programmable with PATS PIN. Aftermarket: Autel IM608, VVDI2 Ford, Lonsdor K518. 2-key on-board programming still works. All keys lost: PATS PIN from dealer or EEPROM/PCM read. Last Panther platform. Mercury discontinued 2011.', true, true, 'H92', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'T-H-92', 2003, 2011);

-- Mercury Mountaineer (1997-2001 - First gen)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'mercury'), 'Mountaineer', 'mountaineer')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1997, 2001)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mercury'), 'Mercury Mountaineer', 'H75', 'Texas Fixed 4C', '4C chip (Texas Glass)', '315 MHz', 'transponder', 'GQ43VT4T', '3513A-43VT4T', 'Rebadged Ford Explorer (first gen). H75 key blank with 4C transponder. PATS I system. 2-key on-board programming. OBD programmable with PATS PIN. Separate keyless entry remote. Aftermarket: Autel, VVDI, Zed-Full. All keys lost: PATS PIN from Ford or PCM EEPROM read. Mid-size SUV.', true, true, 'H75', 'CR2032', 'Lock, Unlock, Panic', 'T-H-75', 1997, 2001);

-- Mercury Mountaineer (2002-2010 - Second gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'mercury') AND slug = 'mountaineer'), 2002, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mercury'), 'Mercury Mountaineer', 'H92', 'Texas Crypto 4D', '4D63 (80-bit)', '315 MHz', 'transponder', 'CWTWB1U793', '2011D-WB1U793', 'Second-gen Mountaineer (Ford Explorer platform). H92 key blank with 80-bit 4D63 chip. PATS II system. Remote head key with integrated buttons. OBD programmable with PATS PIN. 2-key on-board programming. Aftermarket: Autel IM608, VVDI2 Ford, Lonsdor. All keys lost: PATS PIN from dealer or PCM read. V6 or V8 options.', true, true, 'H92', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'T-H-92', 2002, 2010);

-- Mercury Sable (1996-2005)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'mercury'), 'Sable', 'sable')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1996, 2005)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mercury'), 'Mercury Sable', 'H75', 'Texas Fixed 4C', '4C chip (Texas Glass)', '315 MHz', 'transponder', 'GQ43VT4T', '3513A-43VT4T', 'Rebadged Ford Taurus. H75 key blank with 4C transponder. PATS I system (1996+). 2-key on-board programming. OBD add key with PATS PIN. Aftermarket tools: Autel, VVDI, Zed-Full. 4C chip cloneable. All keys lost: PATS PIN from Ford or PCM read. Available as sedan and wagon. Duratec V6.', true, true, 'H75', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'T-H-75', 1996, 2005);

-- Mercury Sable (2008-2009 - Final gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'mercury') AND slug = 'sable'), 2008, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mercury'), 'Mercury Sable', 'H92', 'Texas Crypto 4D', '4D63 (80-bit)', '315 MHz', 'transponder', 'CWTWB1U793', '2011D-WB1U793', 'Final-gen Sable (rebadged Ford Taurus/Five Hundred). H92 key blank with 80-bit 4D63 chip. PATS II system. Remote head key with integrated buttons. OBD programmable with PATS PIN. Aftermarket: Autel IM608, VVDI2. All keys lost: PIN from dealer or PCM read. Short production run before Mercury discontinuation.', true, true, 'H92', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'T-H-92', 2008, 2009);

-- Mercury Milan (2006-2011)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'mercury'), 'Milan', 'milan')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2011)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'mercury'), 'Mercury Milan', 'H92', 'Texas Crypto 4D', '4D63 (80-bit)', '315 MHz', 'transponder', 'CWTWB1U793', '2011D-WB1U793', 'Rebadged Ford Fusion (CD3 platform). H92 key blank with 80-bit 4D63 chip. PATS II system. Remote head key with 3+1 buttons. OBD programmable with PATS PIN. 2-key on-board programming available. Aftermarket: Autel IM608, VVDI2 Ford, Lonsdor K518. All keys lost: PATS PIN from Ford dealer or PCM EEPROM read. Milan Hybrid available (2010-2011). Mercury brand discontinued after 2011.', true, true, 'H92', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'T-H-92', 2006, 2011);
-- =============================================================================
-- Part 2: Manufacturers O through Z
-- Oldsmobile, Peterbilt, Plymouth, Polestar, Pontiac, Rivian,
-- Rolls-Royce, Saab, Saturn, Scion, Smart, Suzuki
-- =============================================================================

-- =============================================================================
-- OLDSMOBILE (aa4ca167-f020-4494-accb-2c04ea82f9a3)
-- =============================================================================

-- Oldsmobile Alero (1999-2004)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile'), 'Alero', 'alero')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2004)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile'), 'Oldsmobile Alero', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn procedure via OBD. Requires 2 working keys or GM Tech 2 for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2004);

-- Oldsmobile Intrigue (1998-2002)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile'), 'Intrigue', 'intrigue')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1998, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile'), 'Oldsmobile Intrigue', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn procedure via OBD. GM Tech 2 required for all-keys-lost situations.', false, true, 'B97', NULL, NULL, 'T-B97', 1998, 2002);

-- Oldsmobile Bravada (1999-2004) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile'), 'Bravada', 'bravada')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2004)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile'), 'Oldsmobile Bravada', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn via OBD. Requires 2 working keys or GM Tech 2 for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2004);

-- Oldsmobile Bravada (1996-1998) - VATS
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile') AND slug = 'bravada'), 1996, 1998)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile'), 'Oldsmobile Bravada', 'B89', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard key with no transponder. Some models may have VATS resistor key - measure resistance value (1-15) if anti-theft present.', false, false, NULL, NULL, NULL, NULL, 1996, 1998);

-- Oldsmobile Aurora (2001-2003) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile'), 'Aurora', 'aurora')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2001, 2003)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile'), 'Oldsmobile Aurora', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn procedure via OBD. GM Tech 2 for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 2001, 2003);

-- Oldsmobile Aurora (1995-1999) - VATS
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile') AND slug = 'aurora'), 1995, 1999)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile'), 'Oldsmobile Aurora', 'B89', 'VATS', 'Resistor', NULL, 'transponder', NULL, NULL, 'VATS (Vehicle Anti-Theft System) resistor key. Measure resistance pellet value (1 of 15 values). Replace with matching resistor key blank.', false, false, NULL, NULL, NULL, NULL, 1995, 1999);

-- Oldsmobile Silhouette (1999-2004)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile'), 'Silhouette', 'silhouette')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2004)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile'), 'Oldsmobile Silhouette', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn procedure via OBD. GM Tech 2 required for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2004);

-- Oldsmobile Silhouette (1997-1998) - standard
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile') AND slug = 'silhouette'), 1997, 1998)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'oldsmobile'), 'Oldsmobile Silhouette', 'B89', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard mechanical key. No transponder or anti-theft system. Cut by code or duplicate from existing key.', false, false, NULL, NULL, NULL, NULL, 1997, 1998);

-- =============================================================================
-- PETERBILT (94fd4d3b-da9d-4226-a28f-16d2759ac41b)
-- =============================================================================

-- Peterbilt 579 (2013-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'peterbilt'), '579', '579')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2013, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'peterbilt'), 'Peterbilt 579', 'Y160', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard commercial truck key. Y160 keyway. No transponder. Key can be cut by code using key code from door lock or ignition. Some fleet vehicles may use SC1 keyway.', false, false, NULL, NULL, NULL, NULL, 2013, 2025);

-- Peterbilt 389 (2007-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'peterbilt'), '389', '389')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'peterbilt'), 'Peterbilt 389', 'Y160', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard commercial truck key. Y160 keyway. No transponder or immobilizer. Cut by code or duplicate existing key.', false, false, NULL, NULL, NULL, NULL, 2007, 2025);

-- Peterbilt 567 (2014-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'peterbilt'), '567', '567')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2014, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'peterbilt'), 'Peterbilt 567', 'Y160', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard commercial truck key. Y160 keyway. No transponder. Key cut by code from lock or ignition cylinder.', false, false, NULL, NULL, NULL, NULL, 2014, 2025);

-- =============================================================================
-- PLYMOUTH (1929610e-f799-45b5-b41e-3740e9b28661)
-- =============================================================================

-- Plymouth Prowler (1997-2002)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'plymouth'), 'Prowler', 'prowler')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1997, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'plymouth'), 'Plymouth Prowler', 'Y160-PT', 'Chrysler encrypted', 'Texas Crypto 4D64', '315 MHz', 'transponder', 'GQ43VT9T', '3521A-VT9T', 'Chrysler transponder system. Requires DRBIII or compatible tool (Autel, SmartPro) for programming. PIN code from dealer required for all-keys-lost.', true, true, 'Y160', NULL, NULL, 'T-Y160', 1997, 2002);

-- Plymouth Neon (2000-2001) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'plymouth'), 'Neon', 'neon')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2000, 2001)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'plymouth'), 'Plymouth Neon', 'Y160-PT', 'Chrysler encrypted', 'Texas Crypto 4D64', '315 MHz', 'transponder', 'GQ43VT7T', '3521A-VT7T', 'Chrysler SENTRY KEY transponder. Requires 2 working keys for on-board programming or DRBIII/Autel tool. PIN required for all-keys-lost.', true, true, 'Y160', NULL, NULL, 'T-Y160', 2000, 2001);

-- Plymouth Neon (1995-1999) - standard
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'plymouth') AND slug = 'neon'), 1995, 1999)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'plymouth'), 'Plymouth Neon', 'Y159', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard mechanical key. No transponder or immobilizer. Cut by code or duplicate from existing key.', false, false, NULL, NULL, NULL, NULL, 1995, 1999);

-- Plymouth Breeze (1996-2000)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'plymouth'), 'Breeze', 'breeze')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1996, 2000)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'plymouth'), 'Plymouth Breeze', 'Y159', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard mechanical key. No transponder system. Cut by code or duplicate existing key.', false, false, NULL, NULL, NULL, NULL, 1996, 2000);

-- Plymouth Voyager (2000-2000) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'plymouth'), 'Voyager', 'voyager')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2000, 2000)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'plymouth'), 'Plymouth Voyager', 'Y160-PT', 'Chrysler encrypted', 'Texas Crypto 4D64', '315 MHz', 'transponder', 'GQ43VT18T', '3521A-VT18T', 'Chrysler SENTRY KEY transponder. Requires 2 working keys for on-board programming or DRBIII. PIN from dealer for all-keys-lost.', true, true, 'Y160', NULL, NULL, 'T-Y160', 2000, 2000);

-- Plymouth Voyager (1996-1999) - standard
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'plymouth') AND slug = 'voyager'), 1996, 1999)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'plymouth'), 'Plymouth Voyager', 'Y159', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard mechanical key. No immobilizer. Cut by code or duplicate from existing key.', false, false, NULL, NULL, NULL, NULL, 1996, 1999);

-- =============================================================================
-- POLESTAR (2e44f1ef-fe8c-4df0-89e1-71b48333dc92)
-- =============================================================================

-- Polestar 2 (2021-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'polestar'), 'Polestar 2', 'polestar-2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2021, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'polestar'), 'Polestar Polestar 2', 'N/A', 'Polestar Digital Key', 'BLE/NFC', '433 MHz', 'smart_key', 'CXTM001', '4250A-TM001', 'Digital key card and phone key via Polestar app. BLE-based proximity. Dealer-only programming via Polestar VIDA. No traditional mechanical key. Emergency NFC card provided.', false, false, NULL, 'CR2032', '3', NULL, 2021, 2025);

-- Polestar 3 (2024-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'polestar'), 'Polestar 3', 'polestar-3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2024, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'polestar'), 'Polestar Polestar 3', 'N/A', 'Polestar Digital Key', 'BLE/NFC/UWB', '433 MHz', 'smart_key', 'CXTM002', '4250A-TM002', 'Digital key card and phone key via Polestar app. UWB-based proximity with BLE fallback. Dealer-only programming. No traditional blade key.', false, false, NULL, 'CR2032', '3', NULL, 2024, 2025);

-- =============================================================================
-- PONTIAC (93ee9460-9d23-4913-9ae7-bd05aeb38afa)
-- =============================================================================

-- Pontiac G6 (2005-2010) - PK3+/Megamos 46
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'G6', 'g6')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2005, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac G6', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'KOBGT04A', '3521A-GT04A', 'PK3+ transponder system. 10-minute key learn procedure via OBD. Requires 2 working keys or GM Tech 2 for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2005, 2010);

-- Pontiac Grand Prix (2004-2008) - PK3+/Megamos 46
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Grand Prix', 'grand-prix')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2004, 2008)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac Grand Prix', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'KOBGT04A', '3521A-GT04A', 'PK3+ transponder system. 10-minute OBD key learn. GM Tech 2 or Autel IM508 for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2004, 2008);

-- Pontiac Grand Prix (1999-2003) - PK3
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'pontiac') AND slug = 'grand-prix'), 1999, 2003)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac Grand Prix', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn procedure via OBD. GM Tech 2 required for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2003);

-- Pontiac Vibe (2003-2010)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Vibe', 'vibe')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2009, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac Vibe', 'TOY44D-PT', 'Texas Crypto 4D67', '4D67 chip', '315 MHz', 'transponder', 'GQ43VT14T', '1470A-VT14T', 'Toyota-based platform (Matrix). Uses Toyota 4D67 transponder. Requires Toyota TIS or compatible tool for programming.', false, true, 'TOY44', NULL, NULL, 'T-TOY44', 2009, 2010);

-- Pontiac Vibe (2003-2008)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'pontiac') AND slug = 'vibe'), 2003, 2008)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac Vibe', 'TOY43-PT', 'Texas Crypto 4D67', '4D67 chip', '315 MHz', 'transponder', 'GQ43VT14T', '1470A-VT14T', 'Toyota-based platform (Matrix). Uses Toyota 4D67 transponder. Requires Toyota TIS or compatible tool. 2 working keys needed for on-board programming.', false, true, 'TOY43', NULL, NULL, 'T-TOY43', 2003, 2008);

-- Pontiac GTO (2004-2006)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'GTO', 'gto')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2004, 2006)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac GTO', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'QQY8V00GH40001', '3521A-GH40001', 'PK3+ transponder (Holden-based platform). 10-minute key learn via OBD. GM Tech 2 or compatible for all-keys-lost.', false, true, 'B111', NULL, NULL, 'T-B111', 2004, 2006);

-- Pontiac Solstice (2006-2009)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Solstice', 'solstice')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac Solstice', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'KOBGT04A', '3521A-GT04A', 'PK3+ transponder system. 10-minute key learn via OBD. GM Tech 2 or Autel IM508 for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2006, 2009);

-- Pontiac Torrent (2006-2009)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Torrent', 'torrent')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac Torrent', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'KOBGT04A', '3521A-GT04A', 'PK3+ transponder system. 10-minute key learn via OBD. GM Tech 2 or compatible aftermarket tool for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2006, 2009);

-- Pontiac Grand Am (1999-2005) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Grand Am', 'grand-am')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2005)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac Grand Am', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn via OBD. Requires 2 working keys or GM Tech 2 for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2005);

-- Pontiac Grand Am (1996-1998) - standard
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'pontiac') AND slug = 'grand-am'), 1996, 1998)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac Grand Am', 'B89', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard mechanical key. No transponder. Cut by code or duplicate from existing key.', false, false, NULL, NULL, NULL, NULL, 1996, 1998);

-- Pontiac Firebird (1999-2002) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Firebird', 'firebird')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac Firebird', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn via OBD. GM Tech 2 for all-keys-lost situations.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2002);

-- Pontiac Firebird (1994-1998) - VATS
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'pontiac') AND slug = 'firebird'), 1994, 1998)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac Firebird', 'B82-P', 'VATS', 'Resistor', NULL, 'transponder', NULL, NULL, 'VATS (Vehicle Anti-Theft System) resistor key. Measure resistance pellet value (1 of 15 values). Match with correct VATS key blank. Double-sided key.', false, false, NULL, NULL, NULL, NULL, 1994, 1998);

-- Pontiac Sunfire (1999-2005) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Sunfire', 'sunfire')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2005)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac Sunfire', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn procedure via OBD. GM Tech 2 or compatible tool for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2005);

-- Pontiac Sunfire (1995-1998) - standard
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'pontiac') AND slug = 'sunfire'), 1995, 1998)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac Sunfire', 'B89', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard mechanical key. No transponder. Cut by code or duplicate from existing key.', false, false, NULL, NULL, NULL, NULL, 1995, 1998);

-- Pontiac Montana (1999-2009) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Montana', 'montana')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'pontiac'), 'Pontiac Montana', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn via OBD. GM Tech 2 or compatible aftermarket tool for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2009);

-- =============================================================================
-- RIVIAN (57f1ad02-2948-4fb8-81bc-e3623a430f52)
-- =============================================================================

-- Rivian R1T (2022-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'rivian'), 'R1T', 'r1t')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2022, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'rivian'), 'Rivian R1T', 'N/A', 'Rivian Digital Key', 'BLE/UWB', '315 MHz', 'proximity', 'TXERT1F22', '7922A-RT1F22', 'Phone key via Rivian app (BLE/UWB). Key card NFC backup. No traditional mechanical key or blade. Dealer-only programming through Rivian service center. OTA updates may affect key system.', false, false, NULL, 'CR2032', '5', NULL, 2022, 2025);

-- Rivian R1S (2022-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'rivian'), 'R1S', 'r1s')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2022, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'rivian'), 'Rivian R1S', 'N/A', 'Rivian Digital Key', 'BLE/UWB', '315 MHz', 'proximity', 'TXERT1F22', '7922A-RT1F22', 'Phone key via Rivian app (BLE/UWB). Key card NFC backup. No traditional mechanical key. Dealer-only programming through Rivian service center.', false, false, NULL, 'CR2032', '5', NULL, 2022, 2025);

-- Rivian R2 (2026-2026)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'rivian'), 'R2', 'r2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2026, 2026)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'rivian'), 'Rivian R2', 'N/A', 'Rivian Digital Key', 'BLE/UWB', '315 MHz', 'proximity', NULL, NULL, 'Phone key via Rivian app. NFC key card backup. No traditional blade key. Dealer-only service. Upcoming model - key details subject to change.', false, false, NULL, 'CR2032', '5', NULL, 2026, 2026);

-- =============================================================================
-- ROLLS-ROYCE (63ac183a-ae00-4cd2-964c-8c6611229229)
-- =============================================================================

-- Rolls-Royce Ghost (2021-2025) - BMW ISTA based
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'rolls-royce'), 'Ghost', 'ghost')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2021, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'rolls-royce'), 'Rolls-Royce Ghost', 'HU100R', 'BMW CAS4+/FEM', 'Hitag Pro', '433 MHz', 'smart_key', 'YGOHUF5767', '2694A-HUF5767', 'BMW-based platform. Smart key with push-button start. Requires BMW ISTA or Autel IM608 with BMW license. ISN code required from CAS/FEM module for all-keys-lost.', true, true, 'HU100R', 'CR2450', '4', 'T-HU100R', 2021, 2025);

-- Rolls-Royce Ghost (2010-2020) - first gen
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'rolls-royce') AND slug = 'ghost'), 2010, 2020)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'rolls-royce'), 'Rolls-Royce Ghost', 'HU92R', 'BMW CAS3/CAS4', 'Hitag2 46', '433 MHz', 'smart_key', 'YGOHUF5662', '2694A-HUF5662', 'BMW-based platform (F-series). CAS3/CAS4 smart key system. Requires BMW ISTA or Autel IM608. ISN code from CAS module needed for all-keys-lost.', true, true, 'HU92', 'CR2450', '4', 'T-HU92R', 2010, 2020);

-- Rolls-Royce Wraith (2014-2023)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'rolls-royce'), 'Wraith', 'wraith')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2014, 2023)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'rolls-royce'), 'Rolls-Royce Wraith', 'HU92R', 'BMW CAS4', 'Hitag2 46', '433 MHz', 'smart_key', 'YGOHUF5662', '2694A-HUF5662', 'BMW-based platform. CAS4 smart key with comfort access. BMW ISTA or Autel IM608 required. ISN code from CAS module needed for all-keys-lost.', true, true, 'HU92', 'CR2450', '4', 'T-HU92R', 2014, 2023);

-- Rolls-Royce Phantom (2018-2025) - VIII gen
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'rolls-royce'), 'Phantom', 'phantom')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2018, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'rolls-royce'), 'Rolls-Royce Phantom', 'HU100R', 'BMW FEM/BDC', 'Hitag Pro', '433 MHz', 'smart_key', 'YGOHUF5767', '2694A-HUF5767', 'BMW-based platform (G-series architecture). FEM/BDC smart key system. Requires BMW ISTA or Autel IM608 with BMW license. ISN code required for all-keys-lost.', true, true, 'HU100R', 'CR2450', '4', 'T-HU100R', 2018, 2025);

-- Rolls-Royce Phantom (2003-2017) - VII gen
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'rolls-royce') AND slug = 'phantom'), 2003, 2017)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'rolls-royce'), 'Rolls-Royce Phantom', 'HU92R', 'BMW CAS2/CAS3', 'Hitag2 46', '433 MHz', 'smart_key', 'LX8766S', '2694A-8766S', 'BMW-based platform. CAS2/CAS3 smart key system. BMW ISTA or compatible tool required. ISN code from CAS module for all-keys-lost.', true, true, 'HU92', 'CR2450', '4', 'T-HU92R', 2003, 2017);

-- Rolls-Royce Cullinan (2019-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'rolls-royce'), 'Cullinan', 'cullinan')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2019, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'rolls-royce'), 'Rolls-Royce Cullinan', 'HU100R', 'BMW FEM/BDC', 'Hitag Pro', '433 MHz', 'smart_key', 'YGOHUF5767', '2694A-HUF5767', 'BMW-based platform (G-series). FEM/BDC smart key with comfort access. Requires BMW ISTA or Autel IM608 with BMW license. ISN code required.', true, true, 'HU100R', 'CR2450', '4', 'T-HU100R', 2019, 2025);

-- =============================================================================
-- SAAB (5bfa56d0-7d83-477e-bbcb-efd199e29aa9)
-- =============================================================================

-- Saab 9-3 (2008-2011) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'saab'), '9-3', '9-3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2011)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'saab'), 'Saab 9-3', 'NE66', 'Saab TWICE', 'T5 Hitag2', '433 MHz', 'smart_key', 'LTQSAAM433TX', '3412A-SAAM433TX', 'Saab TWICE (Theft Warning Integrated Central Electronics) system. Requires Saab Tech 2 or Autel IM608 for programming. PIN code from CIM module required.', true, true, 'NE66', 'CR2032', '4', 'T-NE66', 2008, 2011);

-- Saab 9-3 (2003-2007) - transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'saab') AND slug = '9-3'), 2003, 2007)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'saab'), 'Saab 9-3', 'NE66-PT', 'Saab TWICE', 'T5 chip', '433 MHz', 'transponder', 'LTQSAAM433TX', '3412A-SAAM433TX', 'Saab TWICE transponder system. Requires Saab Tech 2 or compatible tool. PIN code from CIM (Column Integration Module) required for programming.', true, true, 'NE66', NULL, NULL, 'T-NE66', 2003, 2007);

-- Saab 9-3 (1999-2002) - old gen transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'saab') AND slug = '9-3'), 1999, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'saab'), 'Saab 9-3', 'NE38-PT', 'Saab TWICE', 'T5 chip', '315 MHz', 'transponder', 'LTQSAAM315T', '3412A-SAAM315T', 'Saab TWICE transponder. Early system. Requires Saab Tech 2 for programming. PIN code from TWICE module needed.', true, true, 'NE38', NULL, NULL, 'T-NE38', 1999, 2002);

-- Saab 9-5 (2010-2011) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'saab'), '9-5', '9-5')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2010, 2011)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'saab'), 'Saab 9-5', 'HU100', 'Hitag2 Extended', 'Hitag2 46', '433 MHz', 'smart_key', 'NBG009768T', '3521A-009768T', 'New generation 9-5 (GM Epsilon II platform). Smart key with push-button start. Requires Saab Tech 2/MDI or Autel IM608 for programming.', true, true, 'HU100', 'CR2032', '4', 'T-HU100', 2010, 2011);

-- Saab 9-5 (2003-2009) - transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'saab') AND slug = '9-5'), 2003, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'saab'), 'Saab 9-5', 'NE66-PT', 'Saab TWICE', 'T5 chip', '433 MHz', 'transponder', 'LTQSAAM433TX', '3412A-SAAM433TX', 'Saab TWICE transponder system. Requires Saab Tech 2 or compatible tool. PIN code from CIM module required.', true, true, 'NE66', NULL, NULL, 'T-NE66', 2003, 2009);

-- Saab 9-5 (1999-2002) - transponder early
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'saab') AND slug = '9-5'), 1999, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'saab'), 'Saab 9-5', 'NE38-PT', 'Saab TWICE', 'T5 chip', '315 MHz', 'transponder', 'LTQSAAM315T', '3412A-SAAM315T', 'Saab TWICE transponder. Requires Saab Tech 2. PIN code from TWICE module needed for programming.', true, true, 'NE38', NULL, NULL, 'T-NE38', 1999, 2002);

-- Saab 9-2X (2005-2006) - Subaru-based
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'saab'), '9-2X', '9-2x')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2005, 2006)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'saab'), 'Saab 9-2X', 'NSN14-PT', 'Texas 4D62', '4D62 chip', '315 MHz', 'transponder', 'NHVWB1U711', '1788D-WB1U711', 'Subaru Impreza-based platform. Uses Subaru transponder system. Requires Subaru SSM or compatible tool. On-board programming with 2 working keys possible.', false, true, 'NSN14', NULL, NULL, 'T-NSN14', 2005, 2006);

-- =============================================================================
-- SATURN (b84089ae-17f6-4e0c-bf18-0da3409755b5)
-- =============================================================================

-- Saturn Vue (2008-2010) - PK3+/Megamos 46
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'saturn'), 'Vue', 'vue')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'saturn'), 'Saturn Vue', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', '3521A-01060512', 'PK3+ transponder system. 10-minute key learn via OBD. GM Tech 2 or Autel IM508 for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2008, 2010);

-- Saturn Vue (2002-2007) - PK3
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'saturn') AND slug = 'vue'), 2002, 2007)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'saturn'), 'Saturn Vue', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn via OBD. GM Tech 2 for all-keys-lost situations.', false, true, 'B97', NULL, NULL, 'T-B97', 2002, 2007);

-- Saturn Ion (2003-2007) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'saturn'), 'Ion', 'ion')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2003, 2007)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'saturn'), 'Saturn Ion', 'B102-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn via OBD. Uses B102 sidebar keyway. GM Tech 2 or compatible tool for all-keys-lost.', false, true, 'B102', NULL, NULL, 'T-B102', 2003, 2007);

-- Saturn Outlook (2007-2010) - PK3+/Megamos 46
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'saturn'), 'Outlook', 'outlook')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'saturn'), 'Saturn Outlook', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', '3521A-01060512', 'PK3+ transponder system. 10-minute key learn via OBD. GM Tech 2 or Autel IM508/608 for all-keys-lost.', false, true, 'B111', NULL, NULL, 'T-B111', 2007, 2010);

-- Saturn Aura (2007-2009) - PK3+/Megamos 46
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'saturn'), 'Aura', 'aura')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'saturn'), 'Saturn Aura', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'KOBGT04A', '3521A-GT04A', 'PK3+ transponder system. 10-minute key learn via OBD. GM Tech 2 or Autel IM508 for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2007, 2009);

-- Saturn Sky (2007-2010) - PK3+/Megamos 46
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'saturn'), 'Sky', 'sky')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'saturn'), 'Saturn Sky', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'KOBGT04A', '3521A-GT04A', 'PK3+ transponder system (Kappa platform, shared with Pontiac Solstice). 10-minute key learn via OBD. GM Tech 2 for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2007, 2010);

-- =============================================================================
-- SCION (d57863be-57d9-4c3f-a0c6-abd7e7e04829)
-- =============================================================================

-- Scion tC (2011-2016) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'tC', 'tc')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2011, 2016)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'Scion tC', 'TOY48-PT', 'Texas Crypto 128-bit AES', 'H chip (128-bit)', '315 MHz', 'smart_key', 'HYQ14FBA', '1551A-14FBA', 'Toyota H-chip smart key system. Requires Toyota TIS/Techstream or Autel IM608 for programming. All-keys-lost requires PIN from dealer or SEED calculation.', true, true, 'TOY48', 'CR2032', '4', 'T-TOY48', 2011, 2016);

-- Scion tC (2005-2010) - transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'scion') AND slug = 'tc'), 2005, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'Scion tC', 'TOY44D-PT', 'Texas Crypto 4D67', '4D67 chip', '315 MHz', 'transponder', 'MOZB41TG', '1551A-B41TG', 'Toyota 4D67 transponder system. On-board programming with 1 working master key. Toyota TIS for all-keys-lost.', false, true, 'TOY44', NULL, NULL, 'T-TOY44', 2005, 2010);

-- Scion xB (2008-2015) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'xB', 'xb')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2015)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'Scion xB', 'TOY44G-PT', 'Texas Crypto G chip', 'G chip (80-bit)', '315 MHz', 'transponder', 'MOZB41TG', '1551A-B41TG', 'Toyota G-chip transponder. On-board programming possible with existing master key. Toyota TIS/Techstream or Autel IM608 for all-keys-lost.', false, true, 'TOY44', NULL, NULL, 'T-TOY44', 2008, 2015);

-- Scion xB (2004-2006) - transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'scion') AND slug = 'xb'), 2004, 2006)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'Scion xB', 'TOY43-PT', 'Texas Crypto 4D67', '4D67 chip', '315 MHz', 'transponder', 'MOZB31TG', '1551A-B31TG', 'Toyota 4D67 transponder system. On-board programming with master key. Toyota TIS or compatible tool for all-keys-lost.', false, true, 'TOY43', NULL, NULL, 'T-TOY43', 2004, 2006);

-- Scion xD (2008-2014)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'xD', 'xd')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2014)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'Scion xD', 'TOY44G-PT', 'Texas Crypto G chip', 'G chip (80-bit)', '315 MHz', 'transponder', 'MOZB41TG', '1551A-B41TG', 'Toyota G-chip transponder. On-board programming with existing master key. Toyota TIS for all-keys-lost situations.', false, true, 'TOY44', NULL, NULL, 'T-TOY44', 2008, 2014);

-- Scion iA (2016-2016) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'iA', 'ia')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2016, 2016)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'Scion iA', 'TOY48-PT', 'Texas Crypto 128-bit AES', 'H chip (128-bit)', '315 MHz', 'smart_key', 'WAZSKE13D01', '1551A-SKE13D01', 'Mazda 2-based platform. Toyota H-chip smart key. Requires Toyota TIS/Techstream or Autel IM608 for programming. PIN required for all-keys-lost.', true, true, 'TOY48', 'CR2032', '3', 'T-TOY48', 2016, 2016);

-- Scion iM (2016-2016) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'iM', 'im')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2016, 2016)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'Scion iM', 'TOY48-PT', 'Texas Crypto 128-bit AES', 'H chip (128-bit)', '315 MHz', 'smart_key', 'HYQ14FBA', '1551A-14FBA', 'Toyota Corolla-based platform. H-chip smart key. Requires Toyota TIS/Techstream or Autel IM608. PIN required for all-keys-lost.', true, true, 'TOY48', 'CR2032', '4', 'T-TOY48', 2016, 2016);

-- Scion FR-S (2013-2016)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'FR-S', 'fr-s')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2013, 2016)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'scion'), 'Scion FR-S', 'TOY44G-PT', 'Texas Crypto G chip', 'G chip (80-bit)', '315 MHz', 'smart_key', 'HYQ14ACX', '1551A-14ACX', 'Subaru BRZ-based platform with Toyota key system. Smart key with push-button start. Toyota TIS or Autel IM608 for programming. PIN needed for all-keys-lost.', true, true, 'TOY44', 'CR2032', '4', 'T-TOY44', 2013, 2016);

-- =============================================================================
-- SMART (90c3220c-263d-402d-b654-7d16be5e93ab)
-- =============================================================================

-- Smart Fortwo (2016-2019) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'smart'), 'Fortwo', 'fortwo')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2016, 2019)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'smart'), 'Smart Fortwo', 'HU64', 'Mercedes IR/NEC', 'NEC chip', '315 MHz', 'smart_key', 'CWTWB1G767', '7812A-WB1G767', 'Mercedes-based platform (Renault-built). Uses Mercedes key system. Requires Mercedes Xentry/DAS or Autel IM608. IR-based key with chrome fob.', true, true, 'HU64', 'CR2025', '3', 'T-HU64', 2016, 2019);

-- Smart Fortwo (2008-2015) - transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'smart') AND slug = 'fortwo'), 2008, 2015)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'smart'), 'Smart Fortwo', 'HU64-PT', 'Mercedes IR', 'NEC chip', '315 MHz', 'transponder', 'KR55WK45144', '7812A-WK45144', 'Mercedes-based key system. Chrome key fob with IR communication. Requires Mercedes Xentry/DAS or compatible tool. EIS (Electronic Ignition Switch) programming required.', true, true, 'HU64', 'CR2025', '3', 'T-HU64', 2008, 2015);

-- Smart Forfour (2016-2019) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'smart'), 'Forfour', 'forfour')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2016, 2019)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'smart'), 'Smart Forfour', 'HU64', 'Mercedes IR/NEC', 'NEC chip', '315 MHz', 'smart_key', 'CWTWB1G767', '7812A-WB1G767', 'Mercedes-based platform. Same key system as Fortwo. Requires Mercedes Xentry/DAS or Autel IM608. IR key with chrome fob design.', true, true, 'HU64', 'CR2025', '3', 'T-HU64', 2016, 2019);

-- =============================================================================
-- SUZUKI (7f478bc6-34fa-4989-be53-03ee1e0a6607)
-- =============================================================================

-- Suzuki Grand Vitara (2007-2013) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Grand Vitara', 'grand-vitara')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2013)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Suzuki Grand Vitara', 'SUZ17-PT', 'Hitag2 46', '46 chip', '315 MHz', 'transponder', 'KBRTS005', '1348-TS005', 'Hitag2 transponder system. OBD programmable with Suzuki SDT-II or Autel IM508. PIN code may be needed for all-keys-lost.', true, true, 'SUZ17', NULL, NULL, 'T-SUZ17', 2007, 2013);

-- Suzuki Grand Vitara (1999-2005) - transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'suzuki') AND slug = 'grand-vitara'), 1999, 2005)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Suzuki Grand Vitara', 'SUZ17-PT', 'Texas Crypto 4D65', '4D65 chip', '315 MHz', 'transponder', 'KBRTS003', '1348-TS003', 'Texas Crypto 4D65 transponder. Requires Suzuki SDT or compatible tool. On-board registration with existing master key possible.', false, true, 'SUZ17', NULL, NULL, 'T-SUZ17', 1999, 2005);

-- Suzuki SX4 (2007-2013)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'SX4', 'sx4')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2013)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Suzuki SX4', 'SUZ17-PT', 'Hitag2 46', '46 chip', '315 MHz', 'transponder', 'KBRTS005', '1348-TS005', 'Hitag2 transponder system. OBD programmable with Suzuki SDT-II or Autel IM508. PIN required for all-keys-lost.', true, true, 'SUZ17', NULL, NULL, 'T-SUZ17', 2007, 2013);

-- Suzuki Kizashi (2010-2013) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Kizashi', 'kizashi')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2010, 2013)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Suzuki Kizashi', 'SUZ17', 'Hitag2 46', '46 chip', '315 MHz', 'smart_key', 'KBRTS009', '1348-TS009', 'Smart key with push-button start (select trims). Hitag2 transponder. Requires Suzuki SDT-II or Autel IM608 for programming. Emergency blade in fob.', true, true, 'SUZ17', 'CR2032', '4', 'T-SUZ17', 2010, 2013);

-- Suzuki XL-7 (2007-2009) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'XL-7', 'xl-7')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Suzuki XL-7', 'SUZ17-PT', 'Hitag2 46', '46 chip', '315 MHz', 'transponder', 'KBRTS005', '1348-TS005', 'Hitag2 transponder system. GM Saturn Vue-based platform for 2007+. OBD programmable with Suzuki SDT-II or compatible tool.', true, true, 'SUZ17', NULL, NULL, 'T-SUZ17', 2007, 2009);

-- Suzuki XL-7 (2002-2006) - transponder early
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = (SELECT id FROM public.manufacturers WHERE slug = 'suzuki') AND slug = 'xl-7'), 2002, 2006)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Suzuki XL-7', 'SUZ17-PT', 'Texas Crypto 4D65', '4D65 chip', '315 MHz', 'transponder', 'KBRTS003', '1348-TS003', 'Texas Crypto 4D65 transponder. Suzuki SDT or compatible tool. On-board registration with existing master key possible.', false, true, 'SUZ17', NULL, NULL, 'T-SUZ17', 2002, 2006);

-- Suzuki Forenza (2004-2008) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Forenza', 'forenza')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2004, 2008)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Suzuki Forenza', 'TOY43-PT', 'Megamos 13', '13 chip', '315 MHz', 'transponder', 'KBRTS004', '1348-TS004', 'Daewoo Lacetti-based platform. Megamos 13 transponder. OBD programmable. Suzuki SDT or compatible aftermarket tool.', false, true, 'TOY43', NULL, NULL, 'T-TOY43', 2004, 2008);

-- Suzuki Reno (2005-2008) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Reno', 'reno')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2005, 2008)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Suzuki Reno', 'TOY43-PT', 'Megamos 13', '13 chip', '315 MHz', 'transponder', 'KBRTS004', '1348-TS004', 'Daewoo-based platform (Lacetti hatchback). Megamos 13 transponder. OBD programmable with Suzuki SDT or compatible tool.', false, true, 'TOY43', NULL, NULL, 'T-TOY43', 2005, 2008);

-- Suzuki Aerio (2002-2007) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Aerio', 'aerio')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2002, 2007)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), (SELECT id FROM public.manufacturers WHERE slug = 'suzuki'), 'Suzuki Aerio', 'SUZ17-PT', 'Texas Crypto 4D65', '4D65 chip', '315 MHz', 'transponder', 'KBRTS003', '1348-TS003', 'Texas Crypto 4D65 transponder. Suzuki SDT or compatible tool. On-board registration with master key possible on some models.', false, true, 'SUZ17', NULL, NULL, 'T-SUZ17', 2002, 2007);

-- ============================================================
-- STEP 8: Update keys with detailed data
-- ============================================================
-- ============================================================
-- Part 1: Add new columns + Update keys for manufacturers A-C
-- (Acura, Alfa Romeo, Audi, BMW, Buick, Cadillac, Chevrolet, Chrysler)
-- ============================================================

-- Add new columns
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS ic_number TEXT;
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS battery_type TEXT;
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS buttons TEXT;
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS test_key_blank TEXT;
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS image_url TEXT;

-- ============================================================
-- ACURA
-- ============================================================

-- Acura ILX 2013-2015 (smart_key, ACJ932HK1210A, Megamos 46, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'ACJ932HK1210A',
  ic_number = '3109A-CJ932HK1210A',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura ILX' AND year_start = 2013 AND year_end = 2015;

-- Acura ILX 2016-2022 (smart_key, KR5V1X, Hitag 3, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5V1X',
  ic_number = '7812D-V1X',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura ILX' AND year_start = 2016 AND year_end = 2022;

-- Acura Integra 2023-2024 (smart_key, KR5TP-4, Hitag Pro, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TP-4',
  ic_number = '7812D-TP4',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura Integra' AND year_start = 2023 AND year_end = 2024;

-- Acura MDX 2001-2006 (transponder, HD106, no remote)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HD106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Acura MDX' AND year_start = 2001 AND year_end = 2006;

-- Acura MDX 2007-2013 (smart_key, ACJ932HK1210A, Megamos 46, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'ACJ932HK1210A',
  ic_number = '3109A-CJ932HK1210A',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura MDX' AND year_start = 2007 AND year_end = 2013;

-- Acura MDX 2014-2021 (smart_key, KR5V1X, Hitag 3, 313.8 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5V1X',
  ic_number = '7812D-V1X',
  remote_frequency = '313.8 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura MDX' AND year_start = 2014 AND year_end = 2021;

-- Acura MDX 2022-2024 (smart_key, KR5TP-4, Hitag Pro, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TP-4',
  ic_number = '7812D-TP4',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura MDX' AND year_start = 2022 AND year_end = 2024;

-- Acura RDX 2007-2012 (transponder, HD106, no remote)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HD106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Acura RDX' AND year_start = 2007 AND year_end = 2012;

-- Acura RDX 2013-2018 (smart_key, KR5V1X, Hitag 3, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5V1X',
  ic_number = '7812D-V1X',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura RDX' AND year_start = 2013 AND year_end = 2018;

-- Acura RDX 2019-2024 (smart_key, KR5V2X, Hitag Pro, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5V2X',
  ic_number = '7812D-V2X',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura RDX' AND year_start = 2019 AND year_end = 2024;

-- Acura TLX 2015-2020 (smart_key, KR5V1X, Hitag 3, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5V1X',
  ic_number = '7812D-V1X',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura TLX' AND year_start = 2015 AND year_end = 2020;

-- Acura TLX 2021-2024 (smart_key, KR5TP-4, Hitag Pro, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5TP-4',
  ic_number = '7812D-TP4',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HON66',
  test_key_blank = 'T-HON-66',
  image_url = NULL
WHERE model_name = 'Acura TLX' AND year_start = 2021 AND year_end = 2024;

-- ============================================================
-- ALFA ROMEO
-- ============================================================

-- Alfa Romeo Giulia 2017-2024 (smart_key, M3N-7393490, Hitag AES, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-7393490',
  ic_number = '7812A-7393490',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'SIP22',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Alfa Romeo Giulia%' AND year_start = 2017 AND year_end = 2024;

-- Alfa Romeo Stelvio 2018-2024 (smart_key, M3N-7393490, Hitag AES, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-7393490',
  ic_number = '7812A-7393490',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'SIP22',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Alfa Romeo Stelvio%' AND year_start = 2018 AND year_end = 2024;

-- Alfa Romeo Tonale 2023-2024 (smart_key, KR5ALFA434, Hitag AES, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR5ALFA434',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'SIP22',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Alfa Romeo Tonale' AND year_start = 2023 AND year_end = 2024;

-- ============================================================
-- AUDI
-- ============================================================

-- Audi A3 2015-2024 (smart_key, IYZFBSB802, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi A3%' AND year_start = 2015 AND year_end = 2024;

-- Audi A4 B8 2009-2016 (smart_key, IYZFBSB802, Megamos 48, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi A4 (B8)%' AND year_start = 2009 AND year_end = 2016;

-- Audi A4 B9 2017-2024 (smart_key, IYZFBSB802, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi A4 (B9)%' AND year_start = 2017 AND year_end = 2024;

-- Audi A5 2018-2024 (smart_key, IYZFBSB802, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi A5%' AND year_start = 2018 AND year_end = 2024;

-- Audi A6 C7 2012-2018 (smart_key, 4M0959754, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = '4M0959754',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi A6 (C7)%' AND year_start = 2012 AND year_end = 2018;

-- Audi A6 C8 2019-2024 (smart_key, 4M0959754, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = '4M0959754',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi A6 (C8)%' AND year_start = 2019 AND year_end = 2024;

-- Audi Q3 2019-2024 (smart_key, IYZFBSB802, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi Q3%' AND year_start = 2019 AND year_end = 2024;

-- Audi Q5 8R 2009-2017 (smart_key, IYZFBSB802, Megamos 48, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi Q5 (8R)%' AND year_start = 2009 AND year_end = 2017;

-- Audi Q5 FY 2018-2024 (smart_key, IYZFBSB802, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IYZFBSB802',
  ic_number = '2694A-FBSB802',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi Q5 (FY)%' AND year_start = 2018 AND year_end = 2024;

-- Audi Q7 4L 2007-2015 (proximity, NBG010206T, Megamos 48, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'NBG010206T',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi Q7 (4L)%' AND year_start = 2007 AND year_end = 2015;

-- Audi Q7 4M 2017-2024 (smart_key, 4M0959754, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = '4M0959754',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi Q7 (4M)%' AND year_start = 2017 AND year_end = 2024;

-- Audi e-tron 2019-2024 (smart_key, 4M0959754, Megamos AES, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = '4M0959754',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU66',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'Audi e-tron%' AND year_start = 2019 AND year_end = 2024;

-- ============================================================
-- BMW
-- ============================================================

-- BMW 2 Series F22/F45 2014-2019 (smart_key, KR55WK49863, CAS4, 315/433 MHz)
-- Covers both original and duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49863',
  ic_number = '2694A-WK49863',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 2 Series (F22%' AND year_start = 2014 AND year_end = 2019;

-- BMW 2 Series F44/G42 2020-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 2 Series (F44%' AND year_start = 2020 AND year_end = 2024;

-- BMW 3 Series 1999-2005 (transponder, EWS3, HU58, no remote fob)
UPDATE public.automotive_keys SET
  fcc_id = 'LX8FZV',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU58',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 3 Series%' AND year_start = 1999 AND year_end = 2005;

-- BMW 3 Series 2006-2011 (transponder, CAS3, HU92)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49127',
  ic_number = '2694A-WK49127',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 3 Series%' AND year_start = 2006 AND year_end = 2011;

-- BMW 3 Series F30 2012-2018 (smart_key, KR55WK49863, CAS4, 315/433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49863',
  ic_number = '2694A-WK49863',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 3 Series (F30)%' AND year_start = 2012 AND year_end = 2018;

-- BMW 3 Series G20 2019-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 3 Series (G20)%' AND year_start = 2019 AND year_end = 2024;

-- BMW 4 Series G22 2021-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 4 Series (G22)%' AND year_start = 2021 AND year_end = 2024;

-- BMW 5 Series 1997-2003 (transponder, EWS3, HU58)
UPDATE public.automotive_keys SET
  fcc_id = 'LX8FZV',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU58',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 5 Series%' AND year_start = 1997 AND year_end = 2003;

-- BMW 5 Series 2004-2010 (transponder, CAS3, HU92)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49127',
  ic_number = '2694A-WK49127',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 5 Series%' AND year_start = 2004 AND year_end = 2010;

-- BMW 5 Series F10 2011-2016 (smart_key, YGOHUF5767, CAS4, 315/433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'YGOHUF5767',
  ic_number = NULL,
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 5 Series (F10)%' AND year_start = 2011 AND year_end = 2016;

-- BMW 5 Series G30 2017-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 5 Series (G30)%' AND year_start = 2017 AND year_end = 2024;

-- BMW 6 Series F06/F12/F13 2012-2017 (smart_key, YGOHUF5767, CAS4+, 315/433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'YGOHUF5767',
  ic_number = NULL,
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 6 Series (F06%' AND year_start = 2012 AND year_end = 2017;

-- BMW 6 Series GT G32 2018-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 6 Series GT%' AND year_start = 2018 AND year_end = 2024;

-- BMW 7 Series 2002-2008 (transponder, CAS2, HU92)
UPDATE public.automotive_keys SET
  fcc_id = 'LX8FZV',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 7 Series%' AND year_start = 2002 AND year_end = 2008;

-- BMW 7 Series 2009-2015 (smart_key, YGOHUF5767, CAS4, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'YGOHUF5767',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 7 Series%' AND year_start = 2009 AND year_end = 2015;

-- BMW 7 Series G11/G70 2016-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 7 Series (G11%' AND year_start = 2016 AND year_end = 2024;

-- BMW 8 Series G14/G15/G16 2019-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW 8 Series%' AND year_start = 2019 AND year_end = 2024;

-- BMW X1 2013-2015 (transponder, CAS4, HU92)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49863',
  ic_number = '2694A-WK49863',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X1%' AND year_start = 2013 AND year_end = 2015;

-- BMW X1 F48/U11 2016-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X1 (F48%' AND year_start = 2016 AND year_end = 2024;

-- BMW X2 F39/U10 2018-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X2%' AND year_start = 2018 AND year_end = 2024;

-- BMW X3 2004-2010 (transponder, CAS3, HU92)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49127',
  ic_number = '2694A-WK49127',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X3%' AND year_start = 2004 AND year_end = 2010;

-- BMW X3 F25 2011-2017 (smart_key, KR55WK49863, CAS4, 315/433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49863',
  ic_number = '2694A-WK49863',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X3 (F25)%' AND year_start = 2011 AND year_end = 2017;

-- BMW X3 G01 2018-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X3 (G01)%' AND year_start = 2018 AND year_end = 2024;

-- BMW X4 F26 2015-2018 (smart_key, KR55WK49863, CAS4+, 315/433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'KR55WK49863',
  ic_number = '2694A-WK49863',
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X4 (F26)%' AND year_start = 2015 AND year_end = 2018;

-- BMW X4 G02 2019-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X4 (G02)%' AND year_start = 2019 AND year_end = 2024;

-- BMW X5 2000-2006 (transponder, EWS3, HU58)
UPDATE public.automotive_keys SET
  fcc_id = 'LX8FZV',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU58',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X5%' AND year_start = 2000 AND year_end = 2006;

-- BMW X5 2007-2013 (smart_key, YGOHUF5767, CAS3, 315 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'YGOHUF5767',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X5%' AND year_start = 2007 AND year_end = 2013;

-- BMW X5 F15 2014-2018 (smart_key, N5F-ID2A, CAS4+, 315/433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X5 (F15)%' AND year_start = 2014 AND year_end = 2018;

-- BMW X5 G05 2019-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X5 (G05)%' AND year_start = 2019 AND year_end = 2024;

-- BMW X6 F16 2015-2019 (smart_key, N5F-ID2A, CAS4+, 315/433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '315 MHz / 433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU92R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X6 (F16)%' AND year_start = 2015 AND year_end = 2019;

-- BMW X6 G06 2020-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X6 (G06)%' AND year_start = 2020 AND year_end = 2024;

-- BMW X7 G07 2019-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW X7 (G07)%' AND year_start = 2019 AND year_end = 2024;

-- BMW Z4 G29 2019-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW Z4 (G29)%' AND year_start = 2019 AND year_end = 2024;

-- BMW i4 G26 2022-2024 (smart_key, IDGNG1, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'IDGNG1',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW i4 (G26)%' AND year_start = 2022 AND year_end = 2024;

-- BMW iX I20 2022-2024 (smart_key, N5F-ID2A, Hitag Pro, 433 MHz)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'N5F-ID2A',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2450',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'HU100R',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name LIKE 'BMW iX%' AND year_start = 2022 AND year_end = 2024;

-- ============================================================
-- BUICK
-- ============================================================

-- Buick Enclave 2008-2017 (transponder, B106-PT, OHT01060512, flip key remote head)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Enclave' AND year_start = 2008 AND year_end = 2017;

-- Buick Enclave 2018-2024 (proximity, B111-PT, HYQ4EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4EA',
  ic_number = '1551A-4EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Enclave' AND year_start = 2018 AND year_end = 2024;

-- Buick Encore 2013-2017 (transponder, B106-PT, OHT01060512, flip key remote head)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Encore' AND year_start = 2013 AND year_end = 2017;

-- Buick Encore 2018-2024 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Encore' AND year_start = 2018 AND year_end = 2024;

-- Buick Envision 2016-2020 (transponder, B111-PT, M3N-32337100)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-32337100',
  ic_number = '7812A-32337100',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Envision' AND year_start = 2016 AND year_end = 2020;

-- Buick Envision 2021-2024 (proximity, B111-PT, HYQ4EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4EA',
  ic_number = '1551A-4EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Envision' AND year_start = 2021 AND year_end = 2024;

-- Buick LaCrosse 2010-2016 (transponder, B106-PT, OHT01060512, flip key remote head)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick LaCrosse' AND year_start = 2010 AND year_end = 2016;

-- Buick LaCrosse 2017-2019 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick LaCrosse' AND year_start = 2017 AND year_end = 2019;

-- Buick Regal 2011-2017 (transponder, B106-PT, OHT01060512, flip key remote head)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Regal' AND year_start = 2011 AND year_end = 2017;

-- Buick Regal 2018-2020 (proximity, B111-PT, HYQ4EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4EA',
  ic_number = '1551A-4EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Buick Regal' AND year_start = 2018 AND year_end = 2020;

-- ============================================================
-- CADILLAC
-- ============================================================

-- Cadillac ATS 2013-2019 (proximity, B111-PT, HYQ2AB)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac ATS' AND year_start = 2013 AND year_end = 2019;

-- Cadillac CT4 2020-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac CT4' AND year_start = 2020 AND year_end = 2024;

-- Cadillac CT5 2020-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac CT5' AND year_start = 2020 AND year_end = 2024;

-- Cadillac CTS 2008-2013 (transponder, B106-PT, M3N5WY7777A, flip key remote head)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N5WY7777A',
  ic_number = '7812A-5WY7777A',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac CTS' AND year_start = 2008 AND year_end = 2013;

-- Cadillac CTS 2014-2019 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac CTS' AND year_start = 2014 AND year_end = 2019;

-- Cadillac DTS 2006-2011 (transponder, B106-PT, OUC6000066, remote head key)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'OUC6000066',
  ic_number = '3521A-6000066',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac DTS' AND year_start = 2006 AND year_end = 2011;

-- Cadillac DeVille 2000-2005 (transponder, B97, PK3)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'KOBUT1BT',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac DeVille' AND year_start = 2000 AND year_end = 2005;

-- Cadillac Escalade 2007-2014 (transponder, B106-PT, OUC6000066, remote head key)
UPDATE public.automotive_keys SET
  fcc_id = 'OUC6000066',
  ic_number = '3521A-6000066',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Escalade' AND year_start = 2007 AND year_end = 2014;

-- Cadillac Escalade 2015-2020 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Escalade' AND year_start = 2015 AND year_end = 2020;

-- Cadillac Escalade 2021-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Escalade' AND year_start = 2021 AND year_end = 2024;

-- Cadillac Escalade ESV 2007-2014 (transponder, B106-PT, OUC6000066)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'OUC6000066',
  ic_number = '3521A-6000066',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Escalade ESV' AND year_start = 2007 AND year_end = 2014;

-- Cadillac Escalade ESV 2015-2020 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Escalade ESV' AND year_start = 2015 AND year_end = 2020;

-- Cadillac Escalade ESV 2021-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Escalade ESV' AND year_start = 2021 AND year_end = 2024;

-- Cadillac Lyriq 2023-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac Lyriq' AND year_start = 2023 AND year_end = 2024;

-- Cadillac SRX 2004-2009 (transponder, B106-PT, OUC6000066)
UPDATE public.automotive_keys SET
  fcc_id = 'OUC6000066',
  ic_number = '3521A-6000066',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac SRX' AND year_start = 2004 AND year_end = 2009;

-- Cadillac SRX 2010-2016 (proximity, B111-PT, NBG009768T)
UPDATE public.automotive_keys SET
  fcc_id = 'NBG009768T',
  ic_number = NULL,
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac SRX' AND year_start = 2010 AND year_end = 2016;

-- Cadillac STS 2005-2011 (transponder, B106-PT, OUC6000066)
-- Covers both duplicate records
UPDATE public.automotive_keys SET
  fcc_id = 'OUC6000066',
  ic_number = '3521A-6000066',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B106',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac STS' AND year_start = 2005 AND year_end = 2011;

-- Cadillac XT4 2019-2024 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac XT4' AND year_start = 2019 AND year_end = 2024;

-- Cadillac XT5 2017-2019 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac XT5' AND year_start = 2017 AND year_end = 2019;

-- Cadillac XT5 2020-2024 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac XT5' AND year_start = 2020 AND year_end = 2024;

-- Cadillac XT6 2020-2024 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Cadillac XT6' AND year_start = 2020 AND year_end = 2024;

-- ============================================================
-- CHEVROLET
-- ============================================================

-- Chevrolet Silverado 2019-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Silverado' AND year_start = 2019 AND year_end = 2024;

-- Chevrolet Silverado 2014-2018 (transponder, B111-PT, M3N-32337100, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-32337100',
  ic_number = '7812A-32337100',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Silverado' AND year_start = 2014 AND year_end = 2018;

-- Chevrolet Equinox 2018-2024 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Equinox' AND year_start = 2018 AND year_end = 2024;

-- Chevrolet Malibu 2016-2024 (proximity, B111-PT, HYQ4EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4EA',
  ic_number = '1551A-4EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Malibu' AND year_start = 2016 AND year_end = 2024;

-- Chevrolet Traverse 2018-2024 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Traverse' AND year_start = 2018 AND year_end = 2024;

-- Chevrolet Tahoe 2021-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Tahoe' AND year_start = 2021 AND year_end = 2024;

-- Chevrolet Tahoe 2015-2020 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Tahoe' AND year_start = 2015 AND year_end = 2020;

-- Chevrolet Tahoe 2007-2014 (transponder, B102-PT, OHT01060512, remote head key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Tahoe' AND year_start = 2007 AND year_end = 2014;

-- Chevrolet Suburban 2021-2024 (proximity, B111-PT, HYQ1EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ1EA',
  ic_number = '1551A-1EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Suburban' AND year_start = 2021 AND year_end = 2024;

-- Chevrolet Suburban 2015-2020 (proximity, B111-PT, HYQ2AB)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ2AB',
  ic_number = '1551A-2AB',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Hatch',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Suburban' AND year_start = 2015 AND year_end = 2020;

-- Chevrolet Suburban 2007-2014 (transponder, B102-PT, OHT01060512, remote head key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Suburban' AND year_start = 2007 AND year_end = 2014;

-- Chevrolet Camaro 2016-2024 (proximity, B111-PT, HYQ4EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4EA',
  ic_number = '1551A-4EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Camaro' AND year_start = 2016 AND year_end = 2024;

-- Chevrolet Camaro 2010-2015 (transponder, B111-PT, OHT01060512, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Camaro' AND year_start = 2010 AND year_end = 2015;

-- Chevrolet Camaro 1998-2002 (transponder, B97, PK3 - transponder only, separate remote)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Camaro' AND year_start = 1998 AND year_end = 2002;

-- Chevrolet Colorado 2015-2024 (transponder, B111-PT, M3N-32337100, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-32337100',
  ic_number = '7812A-32337100',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Colorado' AND year_start = 2015 AND year_end = 2024;

-- Chevrolet Colorado 2004-2012 (transponder, B102, PK3 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Colorado' AND year_start = 2004 AND year_end = 2012;

-- Chevrolet Blazer 2019-2024 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Blazer' AND year_start = 2019 AND year_end = 2024;

-- Chevrolet Trailblazer 2021-2024 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Trailblazer' AND year_start = 2021 AND year_end = 2024;

-- Chevrolet Impala 2014-2020 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Impala' AND year_start = 2014 AND year_end = 2020;

-- Chevrolet Impala 2006-2013 (transponder, B102-PT, OHT01060512, remote head key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Impala' AND year_start = 2006 AND year_end = 2013;

-- Chevrolet Impala 2000-2005 (transponder, B97, PK3 - transponder only, separate remote)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Impala' AND year_start = 2000 AND year_end = 2005;

-- Chevrolet Cruze 2016-2019 (proximity, B111-PT, HYQ4EA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4EA',
  ic_number = '1551A-4EA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start, Trunk',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Cruze' AND year_start = 2016 AND year_end = 2019;

-- Chevrolet Cruze 2011-2015 (transponder, B111-PT, OHT01060512, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Cruze' AND year_start = 2011 AND year_end = 2015;

-- Chevrolet Sonic 2012-2020 (transponder, B111-PT, OHT01060512, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Sonic' AND year_start = 2012 AND year_end = 2020;

-- Chevrolet Spark 2013-2022 (transponder, B111-PT, OHT01060512, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Spark' AND year_start = 2013 AND year_end = 2022;

-- Chevrolet Trax 2024 (proximity, B111-PT, HYQ4AA)
UPDATE public.automotive_keys SET
  fcc_id = 'HYQ4AA',
  ic_number = '1551A-4AA',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Trax' AND year_start = 2024 AND year_end = 2024;

-- Chevrolet Trax 2015-2022 (transponder, B111-PT, OHT01060512, flip key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'B111',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Trax' AND year_start = 2015 AND year_end = 2022;

-- Chevrolet Cobalt 2005-2010 (transponder, B102, PK3+ - transponder only, separate remote)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Cobalt' AND year_start = 2005 AND year_end = 2010;

-- Chevrolet HHR 2006-2011 (transponder, B102, PK3+ - transponder only, separate remote)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet HHR' AND year_start = 2006 AND year_end = 2011;

-- Chevrolet Avalanche 2007-2013 (transponder, B102-PT, OHT01060512, remote head key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic, Remote Start',
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Avalanche' AND year_start = 2007 AND year_end = 2013;

-- Chevrolet Avalanche 2002-2006 (transponder, B97, PK3 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Avalanche' AND year_start = 2002 AND year_end = 2006;

-- Chevrolet Monte Carlo 2000-2007 (transponder, B97, PK3 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Monte Carlo' AND year_start = 2000 AND year_end = 2007;

-- Chevrolet S-10 1998-2004 (transponder, B97, PK3 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet S-10' AND year_start = 1998 AND year_end = 2004;

-- Chevrolet Express 2010-2024 (transponder, B102-PT, OHT01060512, remote head key)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT01060512',
  ic_number = '3521A-T01060512',
  remote_frequency = '315 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Panic',
  emergency_key_blank = 'B102',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Express' AND year_start = 2010 AND year_end = 2024;

-- Chevrolet Express 1998-2009 (transponder, B97, PK3 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'B97',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chevrolet Express' AND year_start = 1998 AND year_end = 2009;

-- ============================================================
-- CHRYSLER
-- ============================================================

-- Chrysler 300 2019-2024 (smart_key, M3N-40821302, Hitag AES, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-40821302',
  ic_number = '7812A-40821302',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'Y159',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler 300' AND year_start = 2019 AND year_end = 2024;

-- Chrysler 300 2011-2018 (smart_key, M3N-40821302, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-40821302',
  ic_number = '7812A-40821302',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler 300' AND year_start = 2011 AND year_end = 2018;

-- Chrysler Pacifica 2017-2024 (smart_key, M3N-97395900, Hitag AES, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-97395900',
  ic_number = '7812A-97395900',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Sliding Doors, Hatch, Panic',
  emergency_key_blank = 'Y159',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Pacifica' AND year_start = 2017 AND year_end = 2024;

-- Chrysler Town & Country 2008-2016 (smart_key, M3N5WY783X, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N5WY783X',
  ic_number = '7812A-5WY783X',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Sliding Doors, Hatch, Panic',
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Town & Country' AND year_start = 2008 AND year_end = 2016;

-- Chrysler 200 2015-2017 (smart_key, M3N-40821302, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-40821302',
  ic_number = '7812A-40821302',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'Y159',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler 200' AND year_start = 2015 AND year_end = 2017;

-- Chrysler 200 2011-2014 (smart_key, M3N-40821302, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'M3N-40821302',
  ic_number = '7812A-40821302',
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler 200' AND year_start = 2011 AND year_end = 2014;

-- Chrysler Sebring 2007-2010 (smart_key/Fobik, OHT692427AA, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT692427AA',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Sebring' AND year_start = 2007 AND year_end = 2010;

-- Chrysler Sebring 2001-2006 (transponder, Y160, Megamos 46 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Sebring' AND year_start = 2001 AND year_end = 2006;

-- Chrysler PT Cruiser 2006-2010 (smart_key/Fobik, OHT692427AA, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT692427AA',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Trunk, Panic',
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler PT Cruiser' AND year_start = 2006 AND year_end = 2010;

-- Chrysler PT Cruiser 2001-2005 (transponder, Y160, Megamos 46 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler PT Cruiser' AND year_start = 2001 AND year_end = 2005;

-- Chrysler Crossfire 2004-2008 (transponder, HU64, Mercedes IR - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'HU64',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Crossfire' AND year_start = 2004 AND year_end = 2008;

-- Chrysler Aspen 2007-2009 (smart_key/Fobik, OHT692427AA, Hitag2, 433 MHz)
UPDATE public.automotive_keys SET
  fcc_id = 'OHT692427AA',
  ic_number = NULL,
  remote_frequency = '433 MHz',
  battery_type = 'CR2032',
  buttons = 'Lock, Unlock, Hatch, Panic',
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Aspen' AND year_start = 2007 AND year_end = 2009;

-- Chrysler Concorde 1998-2004 (transponder, Y160, Megamos 46 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler Concorde' AND year_start = 1998 AND year_end = 2004;

-- Chrysler LHS 1999-2001 (transponder, Y160, Megamos 46 - transponder only)
UPDATE public.automotive_keys SET
  fcc_id = NULL,
  ic_number = NULL,
  remote_frequency = NULL,
  battery_type = NULL,
  buttons = NULL,
  emergency_key_blank = 'Y160',
  test_key_blank = NULL,
  image_url = NULL
WHERE model_name = 'Chrysler LHS' AND year_start = 1999 AND year_end = 2001;
-- ============================================================
-- UPDATE automotive_keys: Fill missing columns for manufacturers D-H
-- (Dodge, Fiat, Ford, Genesis, GMC, Honda, Hyundai)
-- Targets: battery_type, buttons, emergency_key_blank, ic_number,
--          test_key_blank, image_url, fcc_id, remote_frequency
-- ============================================================

-- ============================================================
-- DODGE
-- ============================================================

-- Dodge Avenger 2008-2014 (FOBIK)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Avenger' AND year_start = 2008 AND year_end = 2014;

-- Dodge Caliber 2007-2012 (FOBIK)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Caliber' AND year_start = 2007 AND year_end = 2012;

-- Dodge Challenger 2008-2014 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'IYZ-C01C',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Challenger' AND year_start = 2008 AND year_end = 2014;

-- Dodge Challenger 2015-2024 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic, Remote Start',
    emergency_key_blank = 'Y164-PT',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Challenger' AND year_start = 2015 AND year_end = 2024;

-- Dodge Charger 2006-2010 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY72XX',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Charger' AND year_start = 2006 AND year_end = 2010;

-- Dodge Charger 2011-2014 (FOBIK)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Charger' AND year_start = 2011 AND year_end = 2014;

-- Dodge Charger 2015-2024 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic, Remote Start',
    emergency_key_blank = 'Y164-PT',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Charger' AND year_start = 2015 AND year_end = 2024;

-- Dodge Dakota 2000-2007 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Dakota' AND year_start = 2000 AND year_end = 2007;

-- Dodge Dakota 2008-2011 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'KOBDT04A',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Dakota' AND year_start = 2008 AND year_end = 2011;

-- Dodge Dart 2013-2016 (proximity/smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank = 'Y170',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Dart' AND year_start = 2013 AND year_end = 2016;

-- Dodge Durango 1998-2003 (standard, no transponder)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Durango' AND year_start = 1998 AND year_end = 2003;

-- Dodge Durango 2004-2009 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'KOBDT04A',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Durango' AND year_start = 2004 AND year_end = 2009;

-- Dodge Durango 2011-2013 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'IYZ-C01C',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Durango' AND year_start = 2011 AND year_end = 2013;

-- Dodge Durango 2014-2020 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Hatch, Panic, Remote Start',
    emergency_key_blank = 'Y164-PT',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Durango' AND year_start = 2014 AND year_end = 2020;

-- Dodge Durango 2021-2024 (proximity)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-5WY783X',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Hatch, Panic, Remote Start',
    emergency_key_blank = 'Y170',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Durango' AND year_start = 2021 AND year_end = 2024;

-- Dodge Grand Caravan 1996-2000 (standard)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Grand Caravan' AND year_start = 1996 AND year_end = 2000;

-- Dodge Grand Caravan 2001-2007 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY72XX',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Grand Caravan' AND year_start = 2001 AND year_end = 2007;

-- Dodge Grand Caravan 2008-2020 (FOBIK)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Power Doors',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Grand Caravan' AND year_start = 2008 AND year_end = 2020;

-- Dodge Journey 2009-2010 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'OHT692713AA',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Journey' AND year_start = 2009 AND year_end = 2010;

-- Dodge Journey 2011-2020 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'IYZ-C01C',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Journey' AND year_start = 2011 AND year_end = 2020;

-- Dodge Magnum 2005-2008 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY72XX',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank = 'Y164',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Magnum' AND year_start = 2005 AND year_end = 2008;

-- Dodge Neon 2000-2005 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Neon' AND year_start = 2000 AND year_end = 2005;

-- Dodge Nitro 2007-2011 (FOBIK)
UPDATE public.automotive_keys
SET fcc_id = 'KOBDT04A',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'Y159',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Nitro' AND year_start = 2007 AND year_end = 2011;

-- Dodge Ram Van 1998-2003 (standard, no transponder)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Dodge Ram Van' AND year_start = 1998 AND year_end = 2003;


-- ============================================================
-- FIAT
-- ============================================================

-- Fiat 500 2012-2019 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'SIP22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Fiat 500' AND year_start = 2012 AND year_end = 2019;

-- Fiat 500L 2014-2020 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'LTQF12AM433TX',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'SIP22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Fiat 500L' AND year_start = 2014 AND year_end = 2020;

-- Fiat 500X 2016-2018 (transponder with remote)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'SIP22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Fiat 500X' AND year_start = 2016 AND year_end = 2018;

-- Fiat 500X 2019-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'SIP22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name LIKE 'Fiat 500X%' AND year_start = 2019 AND year_end = 2024;


-- ============================================================
-- FORD
-- ============================================================

-- Ford Crown Victoria 1998-2004 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Crown Victoria' AND year_start = 1998 AND year_end = 2004;

-- Ford Crown Victoria 2005-2011 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Crown Victoria' AND year_start = 2005 AND year_end = 2011;

-- Ford Excursion 2000-2005 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Excursion' AND year_start = 2000 AND year_end = 2005;

-- Ford F-150 1997-2003 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-150' AND year_start = 1997 AND year_end = 2003;

-- Ford F-150 2005-2014 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-150' AND year_start = 2005 AND year_end = 2014;

-- Ford F-150 2015-2020 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142300',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-150' AND year_start = 2015 AND year_end = 2020;

-- Ford F-150 2021-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-150' AND year_start = 2021 AND year_end = 2024;

-- Ford Explorer 1998-2005 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U345',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Explorer' AND year_start = 1998 AND year_end = 2005;

-- Ford Explorer 2006-2010 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Explorer' AND year_start = 2006 AND year_end = 2010;

-- Ford Explorer 2011-2019 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY8609',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Explorer' AND year_start = 2011 AND year_end = 2019;

-- Ford Explorer 2020-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Explorer' AND year_start = 2020 AND year_end = 2024;

-- Ford Escape 2001-2007 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U345',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Escape' AND year_start = 2001 AND year_end = 2007;

-- Ford Escape 2008-2012 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Escape' AND year_start = 2008 AND year_end = 2012;

-- Ford Escape 2013-2019 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C31243300',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Escape' AND year_start = 2013 AND year_end = 2019;

-- Ford Escape 2020-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Escape' AND year_start = 2020 AND year_end = 2024;

-- Ford Edge 2007-2010 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = '164-R8040',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Edge' AND year_start = 2007 AND year_end = 2010;

-- Ford Edge 2011-2014 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY8609',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Edge' AND year_start = 2011 AND year_end = 2014;

-- Ford Edge 2015-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C31243300',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Edge' AND year_start = 2015 AND year_end = 2024;

-- Ford Expedition 1997-2002 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Expedition' AND year_start = 1997 AND year_end = 2002;

-- Ford Expedition 2003-2006 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Expedition' AND year_start = 2003 AND year_end = 2006;

-- Ford Expedition 2007-2017 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Expedition' AND year_start = 2007 AND year_end = 2017;

-- Ford Expedition 2018-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Expedition' AND year_start = 2018 AND year_end = 2024;

-- Ford F-250/F-350 Super Duty 2005-2010 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-250/F-350 Super Duty' AND year_start = 2005 AND year_end = 2010;

-- Ford F-250/F-350 Super Duty 2011-2016 (transponder)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-250/F-350 Super Duty' AND year_start = 2011 AND year_end = 2016;

-- Ford F-250/F-350 Super Duty 2017-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-250/F-350 Super Duty' AND year_start = 2017 AND year_end = 2024;

-- Ford F-350/F-450 Chassis Cab 2008-2016 (transponder)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-350/F-450 Chassis Cab' AND year_start = 2008 AND year_end = 2016;

-- Ford F-350/F-450 Chassis Cab 2017-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford F-350/F-450 Chassis Cab' AND year_start = 2017 AND year_end = 2024;

-- Ford Fiesta 2011-2019 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Fiesta' AND year_start = 2011 AND year_end = 2019;

-- Ford Five Hundred 2005-2007 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Five Hundred' AND year_start = 2005 AND year_end = 2007;

-- Ford Flex 2009-2012 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Flex' AND year_start = 2009 AND year_end = 2012;

-- Ford Flex 2013-2019 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY8609',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Flex' AND year_start = 2013 AND year_end = 2019;

-- Ford Focus 2000-2004 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Focus' AND year_start = 2000 AND year_end = 2004;

-- Ford Focus 2005-2007 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Focus' AND year_start = 2005 AND year_end = 2007;

-- Ford Focus 2008-2011 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Focus' AND year_start = 2008 AND year_end = 2011;

-- Ford Focus 2012-2018 (transponder)
UPDATE public.automotive_keys
SET fcc_id = 'OUCD6000022',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Focus' AND year_start = 2012 AND year_end = 2018;

-- Ford Freestyle 2005-2007 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Freestyle' AND year_start = 2005 AND year_end = 2007;

-- Ford Fusion 2006-2009 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Fusion' AND year_start = 2006 AND year_end = 2009;

-- Ford Fusion 2010-2012 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Fusion' AND year_start = 2010 AND year_end = 2012;

-- Ford Fusion 2013-2020 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C31243300',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Fusion' AND year_start = 2013 AND year_end = 2020;

-- Ford Maverick 2022-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Maverick' AND year_start = 2022 AND year_end = 2024;

-- Ford Mustang 1996-2004 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Mustang' AND year_start = 1996 AND year_end = 2004;

-- Ford Mustang 2005-2009 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Mustang' AND year_start = 2005 AND year_end = 2009;

-- Ford Mustang 2010-2014 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = '164-R8087',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Mustang' AND year_start = 2010 AND year_end = 2014;

-- Ford Mustang 2015-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C31243800',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Mustang' AND year_start = 2015 AND year_end = 2024;

-- Ford Ranger 1998-2004 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Ranger' AND year_start = 1998 AND year_end = 2004;

-- Ford Ranger 2005-2011 (transponder only)
UPDATE public.automotive_keys
SET fcc_id = 'CWTWB1U793',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Ranger' AND year_start = 2005 AND year_end = 2011;

-- Ford Ranger 2019-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142300',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Ranger' AND year_start = 2019 AND year_end = 2024;

-- Ford Taurus 1996-2000 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Taurus' AND year_start = 1996 AND year_end = 2000;

-- Ford Taurus 2001-2007 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Taurus' AND year_start = 2001 AND year_end = 2007;

-- Ford Taurus 2010-2019 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N5WY8609',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Taurus' AND year_start = 2010 AND year_end = 2019;

-- Ford Transit 2015-2024 (transponder, separate remote)
UPDATE public.automotive_keys
SET fcc_id = '164-R8128',
    remote_frequency = '315 MHz',
    battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Transit' AND year_start = 2015 AND year_end = 2024;

-- Ford Windstar 1999-2003 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Windstar' AND year_start = 1999 AND year_end = 2003;

-- Ford Bronco 2021-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Rear Window',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Bronco' AND year_start = 2021 AND year_end = 2024;

-- Ford Bronco Sport 2021-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'M3N-A2C93142600',
    remote_frequency = '902 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'H75',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Ford Bronco Sport' AND year_start = 2021 AND year_end = 2024;


-- ============================================================
-- GENESIS
-- ============================================================

-- Genesis G70 2019-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'TQ8-FOB-4F36',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Genesis G70' AND year_start = 2019 AND year_end = 2024;

-- Genesis G80 2017-2020 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'SY5IGFGE04',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Genesis G80' AND year_start = 2017 AND year_end = 2020;

-- Genesis G80 2021-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'TQ8-FOB-4F35',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Genesis G80' AND year_start = 2021 AND year_end = 2024;

-- Genesis GV70 2022-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'TQ8-FOB-4F35',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Genesis GV70' AND year_start = 2022 AND year_end = 2024;

-- Genesis GV80 2021-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'TQ8-FOB-4F35',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Genesis GV80' AND year_start = 2021 AND year_end = 2024;


-- ============================================================
-- GMC
-- ============================================================

-- GMC Acadia 2007-2016 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Acadia' AND year_start = 2007 AND year_end = 2016;

-- GMC Acadia 2017-2024 (proximity)
UPDATE public.automotive_keys
SET fcc_id = 'HYQ4EA',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'B111',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Acadia' AND year_start = 2017 AND year_end = 2024;

-- GMC Canyon 2015-2024 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Canyon' AND year_start = 2015 AND year_end = 2024;

-- GMC Envoy 2002-2009 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Envoy' AND year_start = 2002 AND year_end = 2009;

-- GMC Jimmy 1998-2005 (transponder only, separate remote)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Jimmy' AND year_start = 1998 AND year_end = 2005;

-- GMC Savana 1998-2009 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Savana' AND year_start = 1998 AND year_end = 2009;

-- GMC Savana 2010-2024 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Savana' AND year_start = 2010 AND year_end = 2024;

-- GMC Sierra 1500 2007-2013 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Sierra 1500' AND year_start = 2007 AND year_end = 2013;

-- GMC Sierra 1500 2014-2018 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Sierra 1500' AND year_start = 2014 AND year_end = 2018;

-- GMC Sierra 1500 2019-2024 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'B111',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Sierra 1500' AND year_start = 2019 AND year_end = 2024;

-- GMC Sierra 2500/3500 HD 2007-2014 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Sierra 2500/3500 HD' AND year_start = 2007 AND year_end = 2014;

-- GMC Sierra 2500/3500 HD 2015-2019 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Sierra 2500/3500 HD' AND year_start = 2015 AND year_end = 2019;

-- GMC Sierra 2500/3500 HD 2020-2024 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'B111',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Sierra 2500/3500 HD' AND year_start = 2020 AND year_end = 2024;

-- GMC Terrain 2010-2017 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Terrain' AND year_start = 2010 AND year_end = 2017;

-- GMC Terrain 2018-2024 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'B111',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Terrain' AND year_start = 2018 AND year_end = 2024;

-- GMC Yukon 2015-2020 (transponder)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Yukon' AND year_start = 2015 AND year_end = 2020;

-- GMC Yukon 2021-2024 (proximity)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'B111',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'GMC Yukon' AND year_start = 2021 AND year_end = 2024;


-- ============================================================
-- HONDA
-- ============================================================

-- Honda Accord 1998-2002 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Accord' AND year_start = 1998 AND year_end = 2002;

-- Honda Accord 2003-2007 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Accord' AND year_start = 2003 AND year_end = 2007;

-- Honda Accord 2008-2017 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'ACJ932HK1210A',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Accord' AND year_start = 2008 AND year_end = 2017;

-- Honda Accord 2018-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Accord' AND year_start = 2018 AND year_end = 2024;

-- Honda Civic 1996-2000 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Civic' AND year_start = 1996 AND year_end = 2000;

-- Honda Civic 2001-2005 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Civic' AND year_start = 2001 AND year_end = 2005;

-- Honda Civic 2006-2015 (transponder/smart_key mixed)
UPDATE public.automotive_keys
SET fcc_id = 'ACJ932HK1210A',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Civic' AND year_start = 2006 AND year_end = 2015;

-- Honda Civic 2016-2021 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Civic' AND year_start = 2016 AND year_end = 2021;

-- Honda Civic 2022-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Civic' AND year_start = 2022 AND year_end = 2024;

-- Honda CR-V 1997-2001 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda CR-V' AND year_start = 1997 AND year_end = 2001;

-- Honda CR-V 2002-2006 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda CR-V' AND year_start = 2002 AND year_end = 2006;

-- Honda CR-V 2007-2011 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda CR-V' AND year_start = 2007 AND year_end = 2011;

-- Honda CR-V 2012-2016 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda CR-V' AND year_start = 2012 AND year_end = 2016;

-- Honda CR-V 2017-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'ACJ932HK1310A',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda CR-V' AND year_start = 2017 AND year_end = 2024;

-- Honda CR-Z 2011-2016 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda CR-Z' AND year_start = 2011 AND year_end = 2016;

-- Honda Crosstour 2010-2011 (transponder/smart mixed)
UPDATE public.automotive_keys
SET fcc_id = 'ACJ932HK1210A',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Crosstour' AND year_start = 2010 AND year_end = 2011;

-- Honda Crosstour 2012-2015 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Crosstour' AND year_start = 2012 AND year_end = 2015;

-- Honda Element 2003-2006 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Element' AND year_start = 2003 AND year_end = 2006;

-- Honda Element 2007-2011 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Element' AND year_start = 2007 AND year_end = 2011;

-- Honda Fit 2007-2008 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Fit' AND year_start = 2007 AND year_end = 2008;

-- Honda Fit 2009-2014 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Fit' AND year_start = 2009 AND year_end = 2014;

-- Honda Fit 2015-2020 (remote head key)
UPDATE public.automotive_keys
SET fcc_id = 'MLBHLIK6-1TA',
    remote_frequency = '315 MHz',
    battery_type = 'CR1616',
    buttons = 'Lock, Unlock, Panic',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Fit' AND year_start = 2015 AND year_end = 2020;

-- Honda HR-V 2016-2022 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'KR5V1X',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda HR-V' AND year_start = 2016 AND year_end = 2022;

-- Honda HR-V 2023-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda HR-V' AND year_start = 2023 AND year_end = 2024;

-- Honda Insight 2000-2006 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Insight' AND year_start = 2000 AND year_end = 2006;

-- Honda Insight 2010-2014 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'ACJ932HK1210A',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Insight' AND year_start = 2010 AND year_end = 2014;

-- Honda Insight 2019-2022 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Insight' AND year_start = 2019 AND year_end = 2022;

-- Honda Odyssey 1999-2004 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Odyssey' AND year_start = 1999 AND year_end = 2004;

-- Honda Odyssey 2005-2010 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Odyssey' AND year_start = 2005 AND year_end = 2010;

-- Honda Odyssey 2011-2017 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'ACJ932HK1310A',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Sliding Doors, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Odyssey' AND year_start = 2011 AND year_end = 2017;

-- Honda Odyssey 2018-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Sliding Doors, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Odyssey' AND year_start = 2018 AND year_end = 2024;

-- Honda Passport 1998-2002 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Passport' AND year_start = 1998 AND year_end = 2002;

-- Honda Passport 2019-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Passport' AND year_start = 2019 AND year_end = 2024;

-- Honda Pilot 2003-2008 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Pilot' AND year_start = 2003 AND year_end = 2008;

-- Honda Pilot 2009-2015 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Pilot' AND year_start = 2009 AND year_end = 2015;

-- Honda Pilot 2016-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Pilot' AND year_start = 2016 AND year_end = 2024;

-- Honda Prelude 1997-2001 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Prelude' AND year_start = 1997 AND year_end = 2001;

-- Honda Prologue 2024 (smart_key / GM platform)
UPDATE public.automotive_keys
SET fcc_id = 'HYQ1EA',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Prologue' AND year_start = 2024 AND year_end = 2024;

-- Honda Ridgeline 2006-2014 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Ridgeline' AND year_start = 2006 AND year_end = 2014;

-- Honda Ridgeline 2017-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'KR5V1X',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'HON66',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda Ridgeline' AND year_start = 2017 AND year_end = 2024;

-- Honda S2000 2000-2009 (transponder only)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Honda S2000' AND year_start = 2000 AND year_end = 2009;


-- ============================================================
-- HYUNDAI
-- ============================================================

-- Hyundai Accent 2000-2005 (standard/transponder, no remote on key)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Accent' AND year_start = 2000 AND year_end = 2005;

-- Hyundai Accent 2006-2011 (transponder, no remote on key)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Accent' AND year_start = 2006 AND year_end = 2011;

-- Hyundai Accent 2012-2017 (remote head key)
UPDATE public.automotive_keys
SET fcc_id = 'TQ8-RKE-4F17',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic',
    emergency_key_blank = 'HY18',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Accent' AND year_start = 2012 AND year_end = 2017;

-- Hyundai Accent 2018-2024 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'TQ8-FOB-4F11',
    remote_frequency = '433 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Accent' AND year_start = 2018 AND year_end = 2024;

-- Hyundai Azera 2006-2011 (transponder, no remote on key)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Azera' AND year_start = 2006 AND year_end = 2011;

-- Hyundai Azera 2012-2017 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Azera' AND year_start = 2012 AND year_end = 2017;

-- Hyundai Elantra 2001-2006 (standard/transponder, no remote on key)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Elantra' AND year_start = 2001 AND year_end = 2006;

-- Hyundai Elantra 2007-2010 (transponder, no remote on key)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Elantra' AND year_start = 2007 AND year_end = 2010;

-- Hyundai Elantra 2011-2016 (smart_key)
UPDATE public.automotive_keys
SET fcc_id = 'SY5HMFNA04',
    remote_frequency = '315 MHz',
    battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Elantra' AND year_start = 2011 AND year_end = 2016;

-- Hyundai Elantra 2017-2020 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Elantra' AND year_start = 2017 AND year_end = 2020;

-- Hyundai Elantra 2021-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Elantra' AND year_start = 2021 AND year_end = 2024;

-- Hyundai Genesis Coupe 2010-2016 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Genesis Coupe' AND year_start = 2010 AND year_end = 2016;

-- Hyundai Ioniq 2017-2022 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Ioniq' AND year_start = 2017 AND year_end = 2022;

-- Hyundai Ioniq 5 2022-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Ioniq 5' AND year_start = 2022 AND year_end = 2024;

-- Hyundai Kona 2018-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Kona' AND year_start = 2018 AND year_end = 2024;

-- Hyundai Palisade 2020-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Palisade' AND year_start = 2020 AND year_end = 2024;

-- Hyundai Santa Cruz 2022-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Santa Cruz' AND year_start = 2022 AND year_end = 2024;

-- Hyundai Santa Fe 2013-2018 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Santa Fe' AND year_start = 2013 AND year_end = 2018;

-- Hyundai Santa Fe 2019-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Santa Fe' AND year_start = 2019 AND year_end = 2024;

-- Hyundai Sonata 2011-2014 (transponder with remote)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Sonata' AND year_start = 2011 AND year_end = 2014;

-- Hyundai Sonata 2015-2019 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Sonata' AND year_start = 2015 AND year_end = 2019;

-- Hyundai Sonata 2020-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Sonata' AND year_start = 2020 AND year_end = 2024;

-- Hyundai Tiburon 2003-2008 (transponder, no remote on key)
UPDATE public.automotive_keys
SET battery_type = NULL,
    buttons = NULL,
    emergency_key_blank = NULL,
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Tiburon' AND year_start = 2003 AND year_end = 2008;

-- Hyundai Tucson 2016-2021 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Tucson' AND year_start = 2016 AND year_end = 2021;

-- Hyundai Tucson 2022-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Tucson' AND year_start = 2022 AND year_end = 2024;

-- Hyundai Veloster 2012-2017 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Veloster' AND year_start = 2012 AND year_end = 2017;

-- Hyundai Veloster 2019-2021 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Veloster' AND year_start = 2019 AND year_end = 2021;

-- Hyundai Venue 2020-2024 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Venue' AND year_start = 2020 AND year_end = 2024;

-- Hyundai Veracruz 2007-2012 (smart_key)
UPDATE public.automotive_keys
SET battery_type = 'CR2032',
    buttons = 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank = 'HY22',
    ic_number = NULL,
    test_key_blank = NULL,
    image_url = NULL
WHERE model_name = 'Hyundai Veracruz' AND year_start = 2007 AND year_end = 2012;
-- =============================================
