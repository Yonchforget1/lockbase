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
  VALUES (gen_random_uuid(), 'd770ae7d-38b0-4d95-8c2c-139f5cf861ae', 'DB8', 'db8')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2020, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd770ae7d-38b0-4d95-8c2c-139f5cf861ae', 'Aston Martin DB8', 'HU101', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'CWTWB1U773', '2011D-WB1U773', 'Dealer programming required. All keys must be present during programming. Uses Volvo-derived smart key system. Crystal key fob design. Emergency blade HU101 hidden in fob. Programming via Aston Martin diagnostic tool (AMDS) only. No aftermarket tool support. Proximity entry and push-button start.', false, false, 'HU101', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-101', 2020, 2025);

-- Aston Martin Vantage (2006-2017 - V8/V12 Vantage era)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd770ae7d-38b0-4d95-8c2c-139f5cf861ae', 'Vantage', 'vantage')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2017)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd770ae7d-38b0-4d95-8c2c-139f5cf861ae', 'Aston Martin Vantage', 'HU101', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'CWTWB1U773', '2011D-WB1U773', 'Crystal key fob (EWRF) - Emotional Control Unit. Volvo-based platform. Dealer-only programming via AMDS. Transponder in glass key fob. Emergency HU101 blade. All keys lost requires ECU virginization at dealer. No aftermarket support. Key fob is also engine start button - insert into dash slot.', false, false, 'HU101', 'CR2450', 'Lock, Unlock, Trunk', 'T-HU-101', 2006, 2017);

-- Aston Martin Vantage (2018-2025 - New generation)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'd770ae7d-38b0-4d95-8c2c-139f5cf861ae' AND slug = 'vantage'), 2018, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd770ae7d-38b0-4d95-8c2c-139f5cf861ae', 'Aston Martin Vantage', 'HU101', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'CWTWB1U773', '2011D-WB1U773', 'New generation Vantage on Mercedes-AMG derived platform. Smart key with proximity entry and push-button start. Dealer programming via AMDS required. Emergency blade HU101 concealed in fob. No aftermarket tool support. All keys lost requires dealer intervention with security gateway bypass.', false, false, 'HU101', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-101', 2018, 2025);

-- Aston Martin Rapide (2010-2020)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd770ae7d-38b0-4d95-8c2c-139f5cf861ae', 'Rapide', 'rapide')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2010, 2020)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd770ae7d-38b0-4d95-8c2c-139f5cf861ae', 'Aston Martin Rapide', 'HU101', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'CWTWB1U773', '2011D-WB1U773', 'Four-door GT with crystal key fob (EWRF). Volvo-derived electronics. Dealer-only programming via AMDS diagnostic system. Crystal key doubles as engine start button - insert into dashboard receptacle. Emergency HU101 blade hidden in fob. All keys lost requires ECU reset at dealer. Rapide S (2013+) and Rapide E (electric) variants exist.', false, false, 'HU101', 'CR2450', 'Lock, Unlock, Trunk', 'T-HU-101', 2010, 2020);

-- ============================================================
-- BENTLEY (cf185a83-847e-4025-b725-02a858178b31)
-- ============================================================

-- Bentley Continental GT (2004-2017 - First/Second gen)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'cf185a83-847e-4025-b725-02a858178b31', 'Continental GT', 'continental-gt')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2004, 2017)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'cf185a83-847e-4025-b725-02a858178b31', 'Bentley Continental GT', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'smart_key', 'KR55WK45032', '7681D-55WK45032', 'VW/Audi platform shared electronics. Smart key with proximity entry. Programming via Bentley ODIS or VAG tools (VVDI2, Autel IM608 with VW protocol). Megamos 48 transponder - can be cloned with Tango/VVDI. HU66 emergency blade in fob. PIN code from dealer or EEPROM read for all keys lost. Kessy module programming.', true, true, 'HU66', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-66', 2004, 2017);

-- Bentley Continental GT (2018-2025 - Third gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'cf185a83-847e-4025-b725-02a858178b31' AND slug = 'continental-gt'), 2018, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'cf185a83-847e-4025-b725-02a858178b31', 'Bentley Continental GT', 'HU162', 'Hitag Pro / MQB', 'Hitag Pro 49 (MQB)', '315 MHz', 'smart_key', 'KR5FS14-433', '7681D-FS14433', 'Third-generation Continental GT on VW MLB Evo platform. MQB-style smart key with Hitag Pro chip. Programming via Bentley ODIS or advanced aftermarket (Autel IM608 Pro, VVDI Audi). Security gateway may need bypass. HU162 emergency blade. All keys lost requires IMMO data from cluster/BCM. Component protection active.', true, false, 'HU162', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-162', 2018, 2025);

-- Bentley Flying Spur (2006-2019 - First/Second gen)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'cf185a83-847e-4025-b725-02a858178b31', 'Flying Spur', 'flying-spur')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2019)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'cf185a83-847e-4025-b725-02a858178b31', 'Bentley Flying Spur', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'smart_key', 'KR55WK45032', '7681D-55WK45032', 'Four-door sedan on VW platform. Same Kessy smart key system as Continental GT. Megamos 48 transponder. Programming via ODIS or VAG aftermarket tools (VVDI2, Autel). HU66 emergency blade. PIN required for all keys lost - obtain from dealer or EEPROM. OBD add key supported with PIN.', true, true, 'HU66', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-66', 2006, 2019);

-- Bentley Flying Spur (2020-2025 - Third gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'cf185a83-847e-4025-b725-02a858178b31' AND slug = 'flying-spur'), 2020, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'cf185a83-847e-4025-b725-02a858178b31', 'Bentley Flying Spur', 'HU162', 'Hitag Pro / MQB', 'Hitag Pro 49 (MQB)', '315 MHz', 'smart_key', 'KR5FS14-433', '7681D-FS14433', 'New-gen Flying Spur on VW MLB Evo platform. MQB-style Hitag Pro smart key. Dealer programming via ODIS or advanced aftermarket tools with security gateway bypass. HU162 emergency blade. Component protection active. All keys lost requires cluster/BCM IMMO data extraction.', true, false, 'HU162', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-162', 2020, 2025);

-- Bentley Bentayga (2016-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'cf185a83-847e-4025-b725-02a858178b31', 'Bentayga', 'bentayga')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2016, 2020)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'cf185a83-847e-4025-b725-02a858178b31', 'Bentley Bentayga', 'HU66', 'Megamos 48 / Hitag Pro', 'Megamos Crypto 48', '315 MHz', 'smart_key', 'KR55WK45032', '7681D-55WK45032', 'Luxury SUV on VW MLB platform. Kessy smart key system. Earlier models use Megamos 48. Programming via ODIS or VAG aftermarket tools. HU66 emergency blade. PIN from dealer or EEPROM read needed for all keys lost.', true, true, 'HU66', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-HU-66', 2016, 2020);

-- Bentley Bentayga (2021-2025 facelift)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'cf185a83-847e-4025-b725-02a858178b31' AND slug = 'bentayga'), 2021, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'cf185a83-847e-4025-b725-02a858178b31', 'Bentley Bentayga', 'HU162', 'Hitag Pro / MQB', 'Hitag Pro 49 (MQB)', '315 MHz', 'smart_key', 'KR5FS14-433', '7681D-FS14433', 'Facelifted Bentayga with updated electronics. MQB Hitag Pro smart key. Security gateway present. Programming via ODIS or Autel IM608 Pro with gateway bypass. HU162 emergency blade. Component protection. All keys lost requires BCM/cluster data extraction.', true, false, 'HU162', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-HU-162', 2021, 2025);

-- ============================================================
-- DAEWOO (625b870d-7589-4942-9d44-daf2e4ddcf27)
-- ============================================================

-- Daewoo Lanos (1999-2002)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '625b870d-7589-4942-9d44-daf2e4ddcf27', 'Lanos', 'lanos')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '625b870d-7589-4942-9d44-daf2e4ddcf27', 'Daewoo Lanos', 'DWO4R', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Non-transponder vehicle. Standard mechanical key only. DWO4R key blank (also known as DW04RAP). Cut by code or duplicate from original. No immobilizer system. Some models had optional remote keyless entry as dealer accessory. Simple key duplication at any locksmith.', false, false, 'DWO4R', 'N/A', 'N/A', 'N/A', 1999, 2002);

-- Daewoo Leganza (1999-2002)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '625b870d-7589-4942-9d44-daf2e4ddcf27', 'Leganza', 'leganza')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '625b870d-7589-4942-9d44-daf2e4ddcf27', 'Daewoo Leganza', 'DWO5', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Non-transponder vehicle. Standard mechanical key DWO5 blank. No immobilizer. Key can be cut by code or duplicated. Mid-size sedan - Daewoo higher trim. Some 2001-2002 models may have optional dealer-installed remote entry. Simple duplication.', false, false, 'DWO5', 'N/A', 'N/A', 'N/A', 1999, 2002);

-- Daewoo Nubira (1999-2002)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '625b870d-7589-4942-9d44-daf2e4ddcf27', 'Nubira', 'nubira')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '625b870d-7589-4942-9d44-daf2e4ddcf27', 'Daewoo Nubira', 'DWO4R', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Non-transponder vehicle. Standard mechanical key DWO4R blank. No immobilizer system. Compact sedan/wagon. Key duplication straightforward - cut by code or copy. Available in sedan and wagon body styles. No programming required.', false, false, 'DWO4R', 'N/A', 'N/A', 'N/A', 1999, 2002);

-- ============================================================
-- EAGLE (ffbb759a-605d-4faf-b278-b2232bdcd3fe)
-- ============================================================

-- Eagle Talon (1990-1994 - First gen, standard key)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'ffbb759a-605d-4faf-b278-b2232bdcd3fe', 'Talon', 'talon')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1990, 1994)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'ffbb759a-605d-4faf-b278-b2232bdcd3fe', 'Eagle Talon', 'MIT2', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Mitsubishi Eclipse platform (DSM). Non-transponder mechanical key. MIT2 key blank (Mitsubishi profile). No immobilizer. Simple key duplication. First-gen Diamond Star Motors vehicle. Turbo AWD models highly sought after. Standard ignition key.', false, false, 'MIT2', 'N/A', 'N/A', 'N/A', 1990, 1994);

-- Eagle Talon (1995-1998 - Second gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'ffbb759a-605d-4faf-b278-b2232bdcd3fe' AND slug = 'talon'), 1995, 1998)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'ffbb759a-605d-4faf-b278-b2232bdcd3fe', 'Eagle Talon', 'MIT2', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Second-gen DSM platform. Non-transponder mechanical key. MIT2 key blank. No immobilizer on US models. Simple duplication. Some late models had optional dealer-installed keyless entry. Eagle brand discontinued by Chrysler in 1998.', false, false, 'MIT2', 'N/A', 'N/A', 'N/A', 1995, 1998);

-- Eagle Vision (1993-1997)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'ffbb759a-605d-4faf-b278-b2232bdcd3fe', 'Vision', 'vision')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1993, 1997)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'ffbb759a-605d-4faf-b278-b2232bdcd3fe', 'Eagle Vision', 'Y155', 'No transponder', 'None', '315 MHz', 'standard', 'GQ43VT5T', '3513A-43VT5T', 'Chrysler LH platform sedan. Non-transponder key. Y155 key blank (Chrysler profile). Optional keyless entry remote (GQ43VT5T). No immobilizer. Standard key duplication. LH platform shared with Dodge Intrepid and Chrysler Concorde. Remote is standalone - not integrated into key.', false, false, 'Y155', 'CR2016', 'Lock, Unlock, Panic', 'N/A', 1993, 1997);

-- Eagle Summit (1989-1996)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'ffbb759a-605d-4faf-b278-b2232bdcd3fe', 'Summit', 'summit')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1989, 1996)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'ffbb759a-605d-4faf-b278-b2232bdcd3fe', 'Eagle Summit', 'MIT2', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Rebadged Mitsubishi Mirage. Non-transponder mechanical key. MIT2 key blank. No immobilizer system. Available as sedan and wagon. Simple key duplication. Mitsubishi 4G series engines. No programming required. Eagle brand by Chrysler using Mitsubishi platforms.', false, false, 'MIT2', 'N/A', 'N/A', 'N/A', 1989, 1996);

-- ============================================================
-- FERRARI (55238534-20a2-4b54-8bda-73c688bfe31b)
-- ============================================================

-- Ferrari 488 (2016-2019)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '55238534-20a2-4b54-8bda-73c688bfe31b', '488', '488')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2016, 2019)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '55238534-20a2-4b54-8bda-73c688bfe31b', 'Ferrari 488', 'SIP22', 'Megamos 48', 'Megamos Crypto 48', '433 MHz', 'smart_key', 'N/A', 'N/A', 'Ferrari smart key with proximity entry and push-button start. Dealer-only programming via Ferrari diagnostics (SD3/SD4). SIP22 emergency blade. Megamos 48 transponder. No aftermarket tool support for key programming. All keys lost requires ECU replacement or dealer virginization. Very limited locksmith access. 488 GTB and 488 Spider variants.', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2016, 2019);

-- Ferrari F8 Tributo (2020-2024)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '55238534-20a2-4b54-8bda-73c688bfe31b', 'F8 Tributo', 'f8-tributo')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2020, 2024)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '55238534-20a2-4b54-8bda-73c688bfe31b', 'Ferrari F8 Tributo', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'N/A', 'N/A', 'Successor to 488. Smart key with proximity entry. Ferrari dealer-only programming via SD4 diagnostic system. Hitag Pro transponder (upgraded security from 488). SIP22 emergency blade. No aftermarket support. All keys lost requires dealer with Ferrari online connection. F8 Spider variant also available.', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2020, 2024);

-- Ferrari Roma (2021-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '55238534-20a2-4b54-8bda-73c688bfe31b', 'Roma', 'roma')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2021, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '55238534-20a2-4b54-8bda-73c688bfe31b', 'Ferrari Roma', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'N/A', 'N/A', 'Grand touring coupe. Smart key with proximity entry and push-button start. Dealer-only programming via Ferrari SD4. Hitag Pro transponder. SIP22 emergency blade concealed in fob. No aftermarket key programming. All keys lost requires dealer intervention with Ferrari online authorization. Roma Spider variant (2023+).', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2021, 2025);

-- Ferrari SF90 (2020-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '55238534-20a2-4b54-8bda-73c688bfe31b', 'SF90', 'sf90')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2020, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '55238534-20a2-4b54-8bda-73c688bfe31b', 'Ferrari SF90', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'N/A', 'N/A', 'Plug-in hybrid supercar (PHEV). Smart key with proximity entry. Ferrari dealer-only programming via SD4. Hitag Pro chip. SIP22 emergency blade. No aftermarket support for key programming. SF90 Stradale and SF90 Spider variants. All keys lost requires Ferrari online connection. Most advanced Ferrari electronics platform.', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2020, 2025);

-- Ferrari Portofino (2018-2023)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '55238534-20a2-4b54-8bda-73c688bfe31b', 'Portofino', 'portofino')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2018, 2023)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '55238534-20a2-4b54-8bda-73c688bfe31b', 'Ferrari Portofino', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'N/A', 'N/A', 'Convertible GT replacing California T. Smart key with proximity entry. Dealer-only programming via Ferrari SD4. Hitag Pro transponder. SIP22 emergency blade. No aftermarket key tool support. Portofino M (2021+) is updated variant. All keys lost requires dealer with Ferrari online authorization.', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2018, 2023);

-- ============================================================
-- FREIGHTLINER (1e42cecd-0527-479c-b7a3-113d9ce2a936)
-- ============================================================

-- Freightliner Cascadia (2008-2017 - Original)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '1e42cecd-0527-479c-b7a3-113d9ce2a936', 'Cascadia', 'cascadia')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2017)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '1e42cecd-0527-479c-b7a3-113d9ce2a936', 'Freightliner Cascadia', 'Y160', 'Texas Crypto 4D', '4D63 (80-bit)', 'N/A', 'transponder', 'N/A', 'N/A', 'Class 8 semi-truck. Y160 key blank (also known as FTL1). Transponder key with 4D63 chip. Programming via Daimler ServiceLink or aftermarket tools (Autel IM608, SKP900). Some models use ignition-learn procedure. Detroit Diesel engine ECU integration. Key must match both ignition and door locks. Fleet management often uses keyed-alike systems.', false, true, 'Y160', 'N/A', 'N/A', 'N/A', 2008, 2017);

-- Freightliner Cascadia (2018-2025 - New Cascadia)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '1e42cecd-0527-479c-b7a3-113d9ce2a936' AND slug = 'cascadia'), 2018, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '1e42cecd-0527-479c-b7a3-113d9ce2a936', 'Freightliner Cascadia', 'Y160', 'Texas Crypto 4D', '4D63 (80-bit)', 'N/A', 'transponder', 'N/A', 'N/A', 'New Cascadia with updated electronics. Y160 key blank. Enhanced immobilizer with 4D63 80-bit chip. Programming via Daimler DDDL (Detroit Diesel Diagnostic Link) or ServiceLink. Aftermarket: Autel IM608 Pro supports. Detroit DD13/DD15 engine integration. New digital dash cluster. Fleet key management compatible.', false, true, 'Y160', 'N/A', 'N/A', 'N/A', 2018, 2025);

-- Freightliner M2 (2004-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '1e42cecd-0527-479c-b7a3-113d9ce2a936', 'M2', 'm2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2004, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '1e42cecd-0527-479c-b7a3-113d9ce2a936', 'Freightliner M2', 'Y160', 'Texas Crypto 4D', '4D63 (80-bit)', 'N/A', 'transponder', 'N/A', 'N/A', 'Medium-duty truck (M2 106 and M2 112). Y160 key blank. Transponder with 4D63 chip. Programming via Daimler ServiceLink or DDDL. Aftermarket tools support add key. Cummins or Detroit Diesel engine options affect ECU pairing. Used in vocational applications (box trucks, flatbeds, refuse). Fleet keying available.', false, true, 'Y160', 'N/A', 'N/A', 'N/A', 2004, 2025);

-- Freightliner Sprinter (2001-2006 - T1N generation)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '1e42cecd-0527-479c-b7a3-113d9ce2a936', 'Sprinter', 'sprinter')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2001, 2006)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '1e42cecd-0527-479c-b7a3-113d9ce2a936', 'Freightliner Sprinter', 'HU64', 'Texas Crypto 4D', '4D63', '315 MHz', 'transponder', 'N/A', 'N/A', 'Rebadged Mercedes-Benz Sprinter (T1N). HU64 key blank (Mercedes profile). Transponder key with remote head option. Programming via Mercedes Star Diagnostic or aftermarket tools. Same key system as Mercedes Sprinter. Flip key available. No proximity entry. Standard ignition barrel.', false, true, 'HU64', 'CR2032', 'Lock, Unlock', 'T-HU-64', 2001, 2006);

-- Freightliner Sprinter (2007-2018 - NCV3)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '1e42cecd-0527-479c-b7a3-113d9ce2a936' AND slug = 'sprinter'), 2007, 2018)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '1e42cecd-0527-479c-b7a3-113d9ce2a936', 'Freightliner Sprinter', 'HU64', 'Texas Crypto 4D', '4D63 (80-bit)', '315 MHz', 'transponder', 'IYZ3312', '2701A-3312', 'NCV3 generation Sprinter. HU64 key blank. Transponder with integrated remote head key. FCC: IYZ3312. Programming via Mercedes DAS/Xentry or aftermarket (Autel IM608, VVDI MB). OBD programmable for add key. All keys lost requires EIS (Electronic Ignition Switch) read. Chrome remote head key with 2 or 3 buttons.', false, true, 'HU64', 'CR2032', 'Lock, Unlock, Panic', 'T-HU-64', 2007, 2018);

-- ============================================================
-- GEO (cc5bd50c-70f4-4956-8150-0d8b846d668a)
-- ============================================================

-- Geo Metro (1989-1997)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'cc5bd50c-70f4-4956-8150-0d8b846d668a', 'Metro', 'metro')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1989, 1997)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'cc5bd50c-70f4-4956-8150-0d8b846d668a', 'Geo Metro', 'SUZ17', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Rebadged Suzuki Swift/Cultus. Non-transponder mechanical key. SUZ17 key blank (Suzuki profile). No immobilizer. Simple key duplication. Available as 3-door hatch, 4-door sedan, and 2-door convertible. 3-cylinder or 4-cylinder engine. Known for extreme fuel economy. Became Chevrolet Metro after 1997.', false, false, 'SUZ17', 'N/A', 'N/A', 'N/A', 1989, 1997);

-- Geo Prizm (1989-1997)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'cc5bd50c-70f4-4956-8150-0d8b846d668a', 'Prizm', 'prizm')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1989, 1997)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'cc5bd50c-70f4-4956-8150-0d8b846d668a', 'Geo Prizm', 'B65', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Rebadged Toyota Corolla (NUMMI plant). Non-transponder mechanical key. B65 key blank (GM profile, fits Toyota-derived ignition). No immobilizer. Simple key duplication. Built at NUMMI plant in Fremont, CA alongside Toyota Corolla. Became Chevrolet Prizm after 1997. Standard GM keyway.', false, false, 'B65', 'N/A', 'N/A', 'N/A', 1989, 1997);

-- Geo Tracker (1989-1997)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'cc5bd50c-70f4-4956-8150-0d8b846d668a', 'Tracker', 'tracker')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1989, 1997)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'cc5bd50c-70f4-4956-8150-0d8b846d668a', 'Geo Tracker', 'SUZ17', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Rebadged Suzuki Sidekick. Non-transponder mechanical key. SUZ17 key blank (Suzuki profile). No immobilizer system. Simple key duplication. Compact SUV available as 2-door convertible or 4-door hardtop. Became Chevrolet Tracker after 1997. Part-time 4WD available.', false, false, 'SUZ17', 'N/A', 'N/A', 'N/A', 1989, 1997);

-- ============================================================
-- HUMMER (f4742222-ccff-49b2-ad6a-0da4a66fed64)
-- ============================================================

-- Hummer H2 (2003-2007 - standard years)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'f4742222-ccff-49b2-ad6a-0da4a66fed64', 'H2', 'h2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2003, 2007)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'f4742222-ccff-49b2-ad6a-0da4a66fed64', 'Hummer H2', 'B106', 'PK3 (Passkey 3)', 'Megamos 13 / PK3', '315 MHz', 'transponder', 'LHJ011', '2580A-HJ011', 'GM platform (GMT820, based on Tahoe). PK3 (Passkey III) transponder system. B106 key blank with transponder chip. Programming via Tech2 or aftermarket (Autel IM608, VVDI2 GM). 10-minute relearn procedure available for add key with 2 working keys. OBD programmable. Remote head key with 3 buttons. All keys lost requires security bypass or Tech2.', false, true, 'B106', 'CR2032', 'Lock, Unlock, Panic', 'T-B-106', 2003, 2007);

-- Hummer H2 (2008-2009 - final years)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'f4742222-ccff-49b2-ad6a-0da4a66fed64' AND slug = 'h2'), 2008, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'f4742222-ccff-49b2-ad6a-0da4a66fed64', 'Hummer H2', 'B110', 'PK3+ (Passkey 3+)', 'PK3+ / Megamos 46', '315 MHz', 'transponder', 'OUC60270', '3521A-60270', 'Final production years with updated PK3+ system. B110 key blank (larger head). Remote head key integrated transponder and remote. Programming via Tech2, MDI, or aftermarket (Autel IM608, VVDI2). OBD add key with existing working key. 10-minute relearn may work. All keys lost: Tech2 or SPS required.', false, true, 'B110', 'CR2032', 'Lock, Unlock, Remote Start, Panic', 'T-B-110', 2008, 2009);

-- Hummer H3 (2006-2010)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'f4742222-ccff-49b2-ad6a-0da4a66fed64', 'H3', 'h3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'f4742222-ccff-49b2-ad6a-0da4a66fed64', 'Hummer H3', 'B110', 'PK3+ (Passkey 3+)', 'PK3+ / Megamos 46', '315 MHz', 'transponder', 'OUC60270', '3521A-60270', 'GM platform (GMT345, based on Colorado). PK3+ (Passkey III+) transponder. B110 key blank with integrated remote head. Programming via Tech2/MDI or aftermarket tools (Autel IM608, VVDI2 GM). 10-minute relearn for add key with 2 working keys. OBD programmable. H3T (truck) and H3 Alpha variants. All keys lost requires Tech2 or SPS.', false, true, 'B110', 'CR2032', 'Lock, Unlock, Panic', 'T-B-110', 2006, 2010);

-- ============================================================
-- INTERNATIONAL (480ada81-0f04-4f0f-9f05-516dca8a7bf4)
-- ============================================================

-- International ProStar (2008-2017)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '480ada81-0f04-4f0f-9f05-516dca8a7bf4', 'ProStar', 'prostar')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2017)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '480ada81-0f04-4f0f-9f05-516dca8a7bf4', 'International ProStar', 'SC1', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Class 8 highway truck by Navistar. SC1 (S1069CM) key blank. Non-transponder mechanical key for most models. No immobilizer on standard configuration. Key operates ignition and door locks. Fleet keying common. Some late models with Cummins ISX may have ECU key pairing. Standard key duplication. Replaced by LT series.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 2008, 2017);

-- International LT (2017-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '480ada81-0f04-4f0f-9f05-516dca8a7bf4', 'LT', 'lt')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2017, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '480ada81-0f04-4f0f-9f05-516dca8a7bf4', 'International LT', 'SC1', 'Texas Crypto 4D', '4D63', 'N/A', 'transponder', 'N/A', 'N/A', 'Replacement for ProStar. SC1 key blank. Newer models have transponder immobilizer with Navistar proprietary system. Programming via Navistar ServiceMaxx diagnostic tool. Some models still non-transponder depending on configuration. International A26 engine standard. Fleet key management available. Contact dealer for all keys lost situations.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 2017, 2025);

-- International 4300 (2003-2017)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '480ada81-0f04-4f0f-9f05-516dca8a7bf4', '4300', '4300')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2003, 2017)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '480ada81-0f04-4f0f-9f05-516dca8a7bf4', 'International 4300', 'SC1', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Medium-duty truck (DuraStar series). SC1 key blank. Non-transponder mechanical key. No immobilizer on standard models. DT466/MaxxForce DT engine. Widely used in vocational applications (delivery, utility, municipal). Simple key duplication. Fleet master key systems available. Replaced by MV series in 2018.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 2003, 2017);

-- ============================================================
-- ISUZU (aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c)
-- ============================================================

-- Isuzu Rodeo (1991-1997 - First gen, no transponder)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c', 'Rodeo', 'rodeo')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1991, 1997)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c', 'Isuzu Rodeo', 'ISU5', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Mid-size SUV. ISU5 key blank (Isuzu profile, also X184/B65 compatible). Non-transponder mechanical key. No immobilizer. Simple key duplication. First generation shared platform with Honda Passport. Standard ignition barrel key.', false, false, 'ISU5', 'N/A', 'N/A', 'N/A', 1991, 1997);

-- Isuzu Rodeo (1998-2004 - Second gen with transponder)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c' AND slug = 'rodeo'), 1998, 2004)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c', 'Isuzu Rodeo', 'ISU5', 'Texas Fixed 4C', '4C chip', '315 MHz', 'transponder', 'HYQ1512R', 'N/A', 'Second-gen Rodeo with immobilizer (1998+). ISU5 key blank with Texas 4C transponder chip. Programming via Isuzu diagnostic tool or aftermarket (Autel, VVDI). 4C chip can be cloned. Optional keyless entry remote (separate unit). OBD programming for add key. All keys lost: ECU reset or chip clone from VIN data.', false, true, 'ISU5', 'CR2016', 'Lock, Unlock, Panic', 'N/A', 1998, 2004);

-- Isuzu Trooper (1992-2002)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c', 'Trooper', 'trooper')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1992, 1997)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c', 'Isuzu Trooper', 'ISU5', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Full-size SUV. ISU5 key blank. Non-transponder mechanical key (1992-1997). No immobilizer. Simple key duplication. Second-generation body style. Available in 4WD. Rebadged as Acura SLX (1996-1999) and Honda Horizon (Japan).', false, false, 'ISU5', 'N/A', 'N/A', 'N/A', 1992, 1997);

-- Isuzu Trooper (1998-2002 - with transponder)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c' AND slug = 'trooper'), 1998, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c', 'Isuzu Trooper', 'ISU5', 'Texas Fixed 4C', '4C chip', '315 MHz', 'transponder', 'HYQ1512R', 'N/A', 'Trooper with immobilizer (1998+). ISU5 key blank with 4C transponder. Isuzu diagnostic or aftermarket tools for programming. 4C chip cloneable. Separate keyless entry remote. OBD add key supported. All keys lost: clone 4C from EEPROM data. Last year of Trooper production was 2002 in US.', false, true, 'ISU5', 'CR2016', 'Lock, Unlock, Panic', 'N/A', 1998, 2002);

-- Isuzu Ascender (2003-2008)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c', 'Ascender', 'ascender')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2003, 2008)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c', 'Isuzu Ascender', 'B106', 'PK3 (Passkey 3)', 'Megamos 13 / PK3', '315 MHz', 'transponder', 'L2C0005T', '2580A-C0005T', 'Rebadged Chevrolet TrailBlazer (GMT360 platform). B106 key blank with PK3 transponder - GM key system. Programming via GM Tech2 or aftermarket (Autel, VVDI2 GM). 10-minute relearn procedure for add key. OBD programmable. Separate remote fob (L2C0005T). Same key system as GM SUVs of era.', false, true, 'B106', 'CR2032', 'Lock, Unlock, Panic', 'T-B-106', 2003, 2008);

-- Isuzu NPR (1995-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c', 'NPR', 'npr')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1995, 2007)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c', 'Isuzu NPR', 'ISU5', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Cab-over medium-duty truck (N-Series). ISU5 key blank. Non-transponder mechanical key. No immobilizer on earlier models. Simple key duplication. Available as NPR, NPR-HD, NQR, NRR. Isuzu 4HK1 diesel or 6.0L GM gas engine options. Fleet keying available. Very common commercial vehicle.', false, false, 'ISU5', 'N/A', 'N/A', 'N/A', 1995, 2007);

-- Isuzu NPR (2008-2025 - with immobilizer)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c' AND slug = 'npr'), 2008, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa5fa5a6-2ee1-4073-aef4-ddc639f00b5c', 'Isuzu NPR', 'ISU5', 'Texas Crypto 4D', '4D60 chip', 'N/A', 'transponder', 'N/A', 'N/A', 'Updated NPR with transponder immobilizer. ISU5 key blank with 4D60 chip. Programming via Isuzu IDSS (Isuzu Diagnostic Service System) or select aftermarket tools. OBD add key possible with working key. All keys lost may require ECU intervention via dealer. Isuzu 4HK1/5.2L diesel standard. Gas models (6.6L GM) may use different immobilizer.', false, true, 'ISU5', 'N/A', 'N/A', 'N/A', 2008, 2025);

-- ============================================================
-- KENWORTH (d78fe487-ca66-4907-a957-dcf45c32299b)
-- ============================================================

-- Kenworth T680 (2013-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd78fe487-ca66-4907-a957-dcf45c32299b', 'T680', 't680')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2013, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd78fe487-ca66-4907-a957-dcf45c32299b', 'Kenworth T680', 'Y160', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Class 8 highway truck (PACCAR). Y160 key blank (also known as KW1). Non-transponder mechanical key. No immobilizer on standard ignition. Key operates ignition, doors, and storage. PACCAR MX-13 engine standard. Fleet master key systems available. Simple key duplication. Aerodynamic flagship model. T680 Next Gen (2021+) maintains same key system.', false, false, 'Y160', 'N/A', 'N/A', 'N/A', 2013, 2025);

-- Kenworth T880 (2014-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd78fe487-ca66-4907-a957-dcf45c32299b', 'T880', 't880')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2014, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd78fe487-ca66-4907-a957-dcf45c32299b', 'Kenworth T880', 'Y160', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Vocational Class 8 truck (PACCAR). Y160 key blank. Non-transponder mechanical key. No immobilizer. Used in construction, dump, mixer applications. PACCAR MX-13 or Cummins X15 engines. Same key profile as T680. Fleet keying compatible. Simple key duplication at any locksmith.', false, false, 'Y160', 'N/A', 'N/A', 'N/A', 2014, 2025);

-- Kenworth W900 (1990-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd78fe487-ca66-4907-a957-dcf45c32299b', 'W900', 'w900')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1990, 2006)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd78fe487-ca66-4907-a957-dcf45c32299b', 'Kenworth W900', 'SC1', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Iconic long-hood Class 8 truck. SC1 key blank (older Kenworth profile). Non-transponder mechanical key. No immobilizer. Older W900 models use SC1 keyway. Simple key duplication. Traditional style truck - very popular with owner-operators. Caterpillar or Cummins engines in this era.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 1990, 2006);

-- Kenworth W900 (2007-2025 - updated key)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'd78fe487-ca66-4907-a957-dcf45c32299b' AND slug = 'w900'), 2007, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd78fe487-ca66-4907-a957-dcf45c32299b', 'Kenworth W900', 'Y160', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Updated W900 with Y160 key blank (PACCAR standardized keyway). Non-transponder mechanical key. No immobilizer. Same key profile as newer T680/T880. PACCAR MX or Cummins X15 engines. Fleet keying compatible across PACCAR trucks. Simple key duplication. W900L (long) and W900B (short) variants.', false, false, 'Y160', 'N/A', 'N/A', 'N/A', 2007, 2025);

-- ============================================================
-- LAMBORGHINI (eae04226-807d-4035-9799-33bd144e1491)
-- ============================================================

-- Lamborghini Huracan (2015-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'eae04226-807d-4035-9799-33bd144e1491', 'Huracan', 'huracan')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2015, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'eae04226-807d-4035-9799-33bd144e1491', 'Lamborghini Huracan', 'HU66', 'Megamos 48 / MQB', 'Megamos AES', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Audi R8 shared platform (VW Group). Smart key with proximity entry and push-button start. Uses VW/Audi Kessy system. Programming via Lamborghini ODIS or VAG aftermarket tools (VVDI2, Autel IM608 with VW/Audi protocol). HU66 emergency blade. Megamos AES transponder on newer models. PIN from dealer or EEPROM for all keys lost. Component protection may be active. Huracan EVO and STO variants.', true, false, 'HU66', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-66', 2015, 2025);

-- Lamborghini Urus (2019-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'eae04226-807d-4035-9799-33bd144e1491', 'Urus', 'urus')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2019, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'eae04226-807d-4035-9799-33bd144e1491', 'Lamborghini Urus', 'HU162', 'Hitag Pro / MQB', 'Hitag Pro 49 (MQB)', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Super SUV on VW MLB Evo platform (shared with Audi Q8/Bentley Bentayga). MQB-style smart key with Hitag Pro. Programming via Lamborghini ODIS or advanced aftermarket (Autel IM608 Pro, VVDI Audi). Security gateway bypass required. HU162 emergency blade. Component protection active. All keys lost requires cluster/BCM data. Urus S and Urus SE (PHEV) variants.', true, false, 'HU162', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-HU-162', 2019, 2025);

-- Lamborghini Aventador (2012-2022)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'eae04226-807d-4035-9799-33bd144e1491', 'Aventador', 'aventador')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2012, 2022)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'eae04226-807d-4035-9799-33bd144e1491', 'Lamborghini Aventador', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Flagship V12 supercar. VW Group Kessy smart key system. Megamos 48 transponder. Programming via Lamborghini ODIS or VAG tools. HU66 emergency blade. Dealer-preferred programming. Some aftermarket support via VVDI2/Autel with VAG protocol. PIN code from dealer or BCM EEPROM read for all keys lost. Aventador S, SVJ, and Ultimae variants. Scissors door design.', true, false, 'HU66', 'CR2032', 'Lock, Unlock, Trunk', 'T-HU-66', 2012, 2022);

-- ============================================================
-- LOTUS (abd3ae75-dfbb-475c-b73b-f14c746e95a2)
-- ============================================================

-- Lotus Elise (2005-2011 - US market)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'abd3ae75-dfbb-475c-b73b-f14c746e95a2', 'Elise', 'elise')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2005, 2011)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'abd3ae75-dfbb-475c-b73b-f14c746e95a2', 'Lotus Elise', 'TOY43', 'Texas Fixed 4C', '4C chip', '315 MHz', 'transponder', 'N/A', 'N/A', 'Lightweight sports car with Toyota 2ZZ-GE engine. TOY43 key blank (Toyota-derived ignition). Texas 4C transponder chip. Programming via Lotus TechCentre diagnostic or aftermarket tools supporting Toyota protocol. 4C chip can be cloned. Separate keyless entry remote on some trims. Minimal electronics. Key is standard blade with transponder - no remote head key. US market 2005-2011.', false, true, 'TOY43', 'N/A', 'N/A', 'N/A', 2005, 2011);

-- Lotus Evora (2010-2021)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'abd3ae75-dfbb-475c-b73b-f14c746e95a2', 'Evora', 'evora')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2010, 2021)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'abd3ae75-dfbb-475c-b73b-f14c746e95a2', 'Lotus Evora', 'TOY43', 'Texas Crypto 4D', '4D67 chip', '315 MHz', 'transponder', 'N/A', 'N/A', 'GT sports car with Toyota 2GR-FE V6. TOY43 key blank (Toyota-derived). 4D67 transponder chip. Programming via Lotus TechCentre or aftermarket tools with Toyota protocol support. Key blade with integrated transponder. Some later models (Evora GT, Evora 400) may have remote head key. OBD programmable with correct tools. All keys lost: ECU reset via Lotus diagnostic.', false, true, 'TOY43', 'CR2016', 'Lock, Unlock', 'N/A', 2010, 2021);

-- Lotus Emira (2022-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'abd3ae75-dfbb-475c-b73b-f14c746e95a2', 'Emira', 'emira')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2022, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'abd3ae75-dfbb-475c-b73b-f14c746e95a2', 'Lotus Emira', 'TOY48', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Last ICE Lotus. Smart key with proximity entry and push-button start. Geely-era electronics (Lotus now Geely-owned). TOY48 emergency blade (Toyota-derived). Hitag Pro transponder. Dealer programming via Lotus diagnostic system. Limited aftermarket support. Available with Toyota V6 or AMG 4-cylinder turbo. Emergency blade hidden in smart key fob.', false, false, 'TOY48', 'CR2032', 'Lock, Unlock, Trunk', 'T-TOY-48', 2022, 2025);

-- ============================================================
-- LUCID (baea3e4e-cd68-474a-aeff-2caf7dc675d4)
-- ============================================================

-- Lucid Air (2022-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'baea3e4e-cd68-474a-aeff-2caf7dc675d4', 'Air', 'air')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2022, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'baea3e4e-cd68-474a-aeff-2caf7dc675d4', 'Lucid Air', 'N/A (Key Card)', 'NFC/BLE', 'Lucid proprietary', '13.56 MHz (NFC) / BLE', 'smart_key', 'N/A', 'N/A', 'Luxury EV sedan. NO traditional key or blade. Primary: Lucid mobile app (phone key via Bluetooth LE). Secondary: NFC key card (credit card size). NO mechanical key or emergency blade. All programming done through Lucid app or service center. NO locksmith tools available. Emergency entry: contact Lucid roadside assistance. No OBD programming. Trims: Air Pure, Touring, Grand Touring, Sapphire.', false, false, 'N/A', 'N/A', 'N/A', 'N/A', 2022, 2025);

-- Lucid Gravity (2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'baea3e4e-cd68-474a-aeff-2caf7dc675d4', 'Gravity', 'gravity')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2025, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'baea3e4e-cd68-474a-aeff-2caf7dc675d4', 'Lucid Gravity', 'N/A (Key Card)', 'NFC/BLE', 'Lucid proprietary', '13.56 MHz (NFC) / BLE', 'smart_key', 'N/A', 'N/A', 'Luxury EV SUV. Same key system as Lucid Air. NO traditional key or blade. Primary: Lucid mobile app (phone key via BLE). Secondary: NFC key card. NO mechanical emergency key. All programming through Lucid app or service center only. NO locksmith tool support. 3-row SUV. Contact Lucid roadside assistance for lockouts.', false, false, 'N/A', 'N/A', 'N/A', 'N/A', 2025, 2025);

-- ============================================================
-- MACK (727ae3da-d2e7-4983-8ad8-48bd59521054)
-- ============================================================

-- Mack Anthem (2018-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '727ae3da-d2e7-4983-8ad8-48bd59521054', 'Anthem', 'anthem')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2018, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '727ae3da-d2e7-4983-8ad8-48bd59521054', 'Mack Anthem', 'SC1', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Class 8 highway truck (Volvo Group). SC1 key blank (Mack/Volvo profile). Non-transponder mechanical key. No immobilizer on standard configuration. Key operates ignition and door locks. Mack MP8 engine (Volvo D13 based). Fleet master key compatible. Simple key duplication. Replaced Mack Pinnacle in highway segment.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 2018, 2025);

-- Mack Granite (2002-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '727ae3da-d2e7-4983-8ad8-48bd59521054', 'Granite', 'granite')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2002, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '727ae3da-d2e7-4983-8ad8-48bd59521054', 'Mack Granite', 'SC1', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Vocational Class 8 truck (construction, dump, refuse). SC1 key blank. Non-transponder mechanical key. No immobilizer. Used in severe-duty applications. Mack MP7 or MP8 engines. Fleet keying available. Simple key duplication. Very rugged design for off-road/construction. One of Mack most popular models.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 2002, 2025);

-- Mack Pinnacle (2006-2019)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '727ae3da-d2e7-4983-8ad8-48bd59521054', 'Pinnacle', 'pinnacle')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2019)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '727ae3da-d2e7-4983-8ad8-48bd59521054', 'Mack Pinnacle', 'SC1', 'No transponder', 'None', 'N/A', 'standard', 'N/A', 'N/A', 'Highway Class 8 truck (predecessor to Anthem). SC1 key blank. Non-transponder mechanical key. No immobilizer. Mack MP7 or MP8 engines. Fleet keying compatible with other Mack trucks. Simple key duplication. Available as daycab or sleeper. Replaced by Anthem in 2018-2019.', false, false, 'SC1', 'N/A', 'N/A', 'N/A', 2006, 2019);

-- ============================================================
-- MASERATI (3b552367-36f7-4a16-98f1-fa0fbba5530e)
-- ============================================================

-- Maserati Ghibli (2014-2023)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '3b552367-36f7-4a16-98f1-fa0fbba5530e', 'Ghibli', 'ghibli')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2014, 2023)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '3b552367-36f7-4a16-98f1-fa0fbba5530e', 'Maserati Ghibli', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'M3N-7393490', '7812D-7393490', 'FCA/Stellantis platform. Smart key with proximity entry and push-button start. Hitag Pro transponder. Programming via WiTech 2.0 or aftermarket tools (Autel IM608 Pro, OBDSTAR). SIP22 emergency blade. FCC ID: M3N-7393490 (shared with some Chrysler/FCA). All keys lost may require BCM EEPROM work. Maserati-specific fob design.', true, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-SIP-22', 2014, 2023);

-- Maserati Levante (2017-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '3b552367-36f7-4a16-98f1-fa0fbba5530e', 'Levante', 'levante')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2017, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '3b552367-36f7-4a16-98f1-fa0fbba5530e', 'Maserati Levante', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'M3N-7393490', '7812D-7393490', 'Luxury SUV on FCA/Stellantis platform. Smart key with proximity entry. Hitag Pro transponder. Programming via WiTech 2.0 or Autel IM608 Pro. SIP22 emergency blade. Same key system as Ghibli. All keys lost requires PIN from dealer or BCM EEPROM. Levante Trofeo and GTS variants with V8.', true, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-SIP-22', 2017, 2025);

-- Maserati Quattroporte (2005-2012 - Fifth gen)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '3b552367-36f7-4a16-98f1-fa0fbba5530e', 'Quattroporte', 'quattroporte')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2005, 2012)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '3b552367-36f7-4a16-98f1-fa0fbba5530e', 'Maserati Quattroporte', 'SIP22', 'Megamos 48', 'Megamos Crypto 48', '433 MHz', 'smart_key', 'RX2TRF937', 'N/A', 'Fifth-gen Quattroporte. Smart key fob with proximity entry. Megamos 48 transponder. SIP22 emergency blade. Dealer programming via Maserati diagnostic (SD2/SD3). Limited aftermarket support. Ferrari-derived electronics (Maserati was Ferrari subsidiary). All keys lost requires ECU virginization at dealer. Luxury flagship sedan.', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2005, 2012);

-- Maserati Quattroporte (2013-2025 - Sixth gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '3b552367-36f7-4a16-98f1-fa0fbba5530e' AND slug = 'quattroporte'), 2013, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '3b552367-36f7-4a16-98f1-fa0fbba5530e', 'Maserati Quattroporte', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'M3N-7393490', '7812D-7393490', 'Sixth-gen on FCA platform. Smart key with proximity entry. Hitag Pro transponder. WiTech 2.0 or aftermarket (Autel IM608 Pro) for programming. SIP22 emergency blade. PIN from dealer or BCM EEPROM for all keys lost. Same key system as Ghibli/Levante on FCA platform. Quattroporte GTS with V8.', true, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-SIP-22', 2013, 2025);

-- Maserati GranTurismo (2008-2019 - First gen)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '3b552367-36f7-4a16-98f1-fa0fbba5530e', 'GranTurismo', 'granturismo')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2019)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '3b552367-36f7-4a16-98f1-fa0fbba5530e', 'Maserati GranTurismo', 'SIP22', 'Megamos 48', 'Megamos Crypto 48', '433 MHz', 'smart_key', 'RX2TRF937', 'N/A', 'GT coupe with Ferrari V8. Smart key with proximity entry. Megamos 48 transponder. SIP22 emergency blade. Dealer programming via Maserati diagnostic (SD3). Ferrari-derived electronics. Limited aftermarket support. All keys lost requires ECU virginization. GranTurismo S and MC Stradale variants. GranCabrio convertible version.', false, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk', 'T-SIP-22', 2008, 2019);

-- Maserati GranTurismo (2023-2025 - New gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '3b552367-36f7-4a16-98f1-fa0fbba5530e' AND slug = 'granturismo'), 2023, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '3b552367-36f7-4a16-98f1-fa0fbba5530e', 'Maserati GranTurismo', 'SIP22', 'Hitag Pro', '47 chip', '433 MHz', 'smart_key', 'M3N-7393490', '7812D-7393490', 'All-new GranTurismo on Stellantis platform. Smart key with proximity entry. Hitag Pro transponder. Programming via WiTech 2.0 or advanced aftermarket. SIP22 emergency blade. Nettuno V6 twin-turbo engine. Also available as Folgore (full EV). Same key platform as other Stellantis Maserati models.', true, false, 'SIP22', 'CR2032', 'Lock, Unlock, Trunk, Panic', 'T-SIP-22', 2023, 2025);

-- ============================================================
-- MAYBACH (d59cf9b2-8e75-4a23-906f-a4fa48834a8e)
-- ============================================================

-- Maybach 57 (2003-2012)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd59cf9b2-8e75-4a23-906f-a4fa48834a8e', '57', '57')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2003, 2012)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd59cf9b2-8e75-4a23-906f-a4fa48834a8e', 'Maybach 57', 'HU64', 'Texas Crypto 4D', '4D63', '315 MHz', 'smart_key', 'KR55WK49031', '2701A-55WK49031', 'Ultra-luxury sedan based on Mercedes-Benz W240 platform. HU64 emergency blade (Mercedes profile). Smart key with chrome fob. Programming via Mercedes Star Diagnostic (SDS/DAS) or Xentry. EIS (Electronic Ignition Switch) system - infrared key. NEC chip processor in EIS. Aftermarket: VVDI MB, CGDI MB can read EIS. All keys lost requires EIS read and key file generation. Very expensive replacement.', false, false, 'HU64', 'CR2025', 'Lock, Unlock, Trunk, Panic', 'T-HU-64', 2003, 2012);

-- Maybach 62 (2003-2012)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd59cf9b2-8e75-4a23-906f-a4fa48834a8e', '62', '62')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2003, 2012)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd59cf9b2-8e75-4a23-906f-a4fa48834a8e', 'Maybach 62', 'HU64', 'Texas Crypto 4D', '4D63', '315 MHz', 'smart_key', 'KR55WK49031', '2701A-55WK49031', 'Long-wheelbase ultra-luxury sedan. Same key system as Maybach 57. HU64 emergency blade. Mercedes EIS infrared smart key system. NEC processor. Programming via SDS/Xentry or VVDI MB/CGDI MB. All keys lost requires EIS read. 62 S Landaulet (open-top rear) is rarest variant. Chrome fob design. Extremely expensive key replacement - dealer preferred.', false, false, 'HU64', 'CR2025', 'Lock, Unlock, Trunk, Panic', 'T-HU-64', 2003, 2012);

-- Maybach S-Class (2015-2025 - Mercedes-Maybach)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd59cf9b2-8e75-4a23-906f-a4fa48834a8e', 'S-Class', 's-class')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2015, 2020)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd59cf9b2-8e75-4a23-906f-a4fa48834a8e', 'Maybach S-Class', 'HU64', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'IYZDC12K', '2701A-DC12K', 'Mercedes-Maybach S-Class (W222 platform). HU64 emergency blade. Hitag Pro transponder. Chrome-accented key fob. Programming via Mercedes Xentry or aftermarket (VVDI MB, Autel IM608 MB). EIS/EZS system with NEC/Renesas processor. All keys lost requires EIS read. FBS3 key system. OBD blocked - must work via direct EIS connection for all keys lost.', false, false, 'HU64', 'CR2025', 'Lock, Unlock, Trunk, Panic', 'T-HU-64', 2015, 2020);

-- Maybach S-Class (2021-2025 - W223)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'd59cf9b2-8e75-4a23-906f-a4fa48834a8e' AND slug = 's-class'), 2021, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd59cf9b2-8e75-4a23-906f-a4fa48834a8e', 'Maybach S-Class', 'HU64', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'IYZDC12K', '2701A-DC12K', 'New-gen Mercedes-Maybach S-Class (W223). HU64 emergency blade. FBS4 key system (most secure Mercedes system). Hitag Pro transponder. Dealer programming via Xentry strongly recommended. Aftermarket: limited support, VVDI MB/CGDI MB may support with latest updates. All keys lost extremely difficult - requires EZS replacement or advanced EEPROM work. No OBD key programming. S580 and S680 (V12) variants.', false, false, 'HU64', 'CR2025', 'Lock, Unlock, Trunk, Panic', 'T-HU-64', 2021, 2025);

-- ============================================================
-- MCLAREN (38a73d4d-8219-4c7e-b414-3abdfb70f40e)
-- ============================================================

-- McLaren 720S (2018-2024)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '38a73d4d-8219-4c7e-b414-3abdfb70f40e', '720S', '720s')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2018, 2024)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '38a73d4d-8219-4c7e-b414-3abdfb70f40e', 'McLaren 720S', 'N/A', 'McLaren proprietary', 'McLaren proprietary', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Super Series supercar. McLaren proprietary smart key fob - no emergency blade or keyhole. Proximity entry with push-button start. Dealer-only programming via McLaren DiagTool. NO aftermarket tool support. NO emergency mechanical key or blade. All keys lost requires McLaren dealer with online connection. Dihedral doors. 720S Spider variant available. Key fob is custom McLaren design.', false, false, 'N/A', 'CR2032', 'Lock, Unlock', 'N/A', 2018, 2024);

-- McLaren GT (2020-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '38a73d4d-8219-4c7e-b414-3abdfb70f40e', 'GT', 'gt')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2020, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '38a73d4d-8219-4c7e-b414-3abdfb70f40e', 'McLaren GT', 'N/A', 'McLaren proprietary', 'McLaren proprietary', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Grand touring supercar. McLaren proprietary smart key - no emergency blade. Proximity entry and push-button start. Dealer-only programming via McLaren DiagTool. NO aftermarket support. NO mechanical key backup. All keys lost requires McLaren dealer. Grand touring focus with luggage space. Same key platform as 720S.', false, false, 'N/A', 'CR2032', 'Lock, Unlock', 'N/A', 2020, 2025);

-- McLaren Artura (2022-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '38a73d4d-8219-4c7e-b414-3abdfb70f40e', 'Artura', 'artura')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2022, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '38a73d4d-8219-4c7e-b414-3abdfb70f40e', 'McLaren Artura', 'N/A', 'McLaren proprietary', 'McLaren proprietary', '315 MHz', 'smart_key', 'N/A', 'N/A', 'Plug-in hybrid (PHEV) supercar. New McLaren Carbon Lightweight Architecture (MCLA). McLaren proprietary smart key - no emergency blade. Proximity entry and push-button start. Dealer-only programming via McLaren DiagTool. NO aftermarket support. V6 twin-turbo + electric motor. All keys lost requires McLaren dealer with online authorization. New electronics architecture.', false, false, 'N/A', 'CR2032', 'Lock, Unlock', 'N/A', 2022, 2025);

-- ============================================================
-- MERCURY (c0671824-dcb0-49e0-bbec-a0adf7566fb9)
-- ============================================================

-- Mercury Grand Marquis (1992-2002 - PATS era begins 1996)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'c0671824-dcb0-49e0-bbec-a0adf7566fb9', 'Grand Marquis', 'grand-marquis')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1992, 1995)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'c0671824-dcb0-49e0-bbec-a0adf7566fb9', 'Mercury Grand Marquis', 'H75', 'No transponder', 'None', '315 MHz', 'standard', 'GQ43VT4T', '3513A-43VT4T', 'Pre-PATS Grand Marquis. H75 key blank (Ford 8-cut). Non-transponder mechanical key. No immobilizer. Optional separate keyless entry remote (GQ43VT4T). Simple key duplication. Panther platform (shared with Crown Victoria and Town Car). Standard Ford ignition.', false, false, 'H75', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'N/A', 1992, 1995);

-- Mercury Grand Marquis (1996-2002 - PATS I)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'c0671824-dcb0-49e0-bbec-a0adf7566fb9' AND slug = 'grand-marquis'), 1996, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'c0671824-dcb0-49e0-bbec-a0adf7566fb9', 'Mercury Grand Marquis', 'H72', 'Texas Fixed 4C', '4C chip (Texas Glass)', '315 MHz', 'transponder', 'GQ43VT4T', '3513A-43VT4T', 'PATS (Passive Anti-Theft System) introduced. H72 key blank (Ford 10-cut) with 4C glass transponder. PATS I system. Programming: 2-key on-board programming (need 2 working keys to add 3rd). Aftermarket tools: Autel IM608, VVDI Key Tool. OBD programmable with PIN. Separate keyless entry remote. All keys lost: PATS PIN from Ford or EEPROM read of PCM.', true, true, 'H72', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'T-H-72', 1996, 2002);

-- Mercury Grand Marquis (2003-2011 - PATS II)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'c0671824-dcb0-49e0-bbec-a0adf7566fb9' AND slug = 'grand-marquis'), 2003, 2011)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'c0671824-dcb0-49e0-bbec-a0adf7566fb9', 'Mercury Grand Marquis', 'H92', 'Texas Crypto 4D', '4D63 (80-bit)', '315 MHz', 'transponder', 'CWTWB1U793', '2011D-WB1U793', 'PATS II system with 80-bit 4D63 chip. H92 key blank (Ford 8-cut, new profile). Remote head key with integrated transponder and buttons. FCC: CWTWB1U793. OBD programmable with PATS PIN. Aftermarket: Autel IM608, VVDI2 Ford, Lonsdor K518. 2-key on-board programming still works. All keys lost: PATS PIN from dealer or EEPROM/PCM read. Last Panther platform. Mercury discontinued 2011.', true, true, 'H92', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'T-H-92', 2003, 2011);

-- Mercury Mountaineer (1997-2001 - First gen)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'c0671824-dcb0-49e0-bbec-a0adf7566fb9', 'Mountaineer', 'mountaineer')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1997, 2001)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'c0671824-dcb0-49e0-bbec-a0adf7566fb9', 'Mercury Mountaineer', 'H75', 'Texas Fixed 4C', '4C chip (Texas Glass)', '315 MHz', 'transponder', 'GQ43VT4T', '3513A-43VT4T', 'Rebadged Ford Explorer (first gen). H75 key blank with 4C transponder. PATS I system. 2-key on-board programming. OBD programmable with PATS PIN. Separate keyless entry remote. Aftermarket: Autel, VVDI, Zed-Full. All keys lost: PATS PIN from Ford or PCM EEPROM read. Mid-size SUV.', true, true, 'H75', 'CR2032', 'Lock, Unlock, Panic', 'T-H-75', 1997, 2001);

-- Mercury Mountaineer (2002-2010 - Second gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'c0671824-dcb0-49e0-bbec-a0adf7566fb9' AND slug = 'mountaineer'), 2002, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'c0671824-dcb0-49e0-bbec-a0adf7566fb9', 'Mercury Mountaineer', 'H92', 'Texas Crypto 4D', '4D63 (80-bit)', '315 MHz', 'transponder', 'CWTWB1U793', '2011D-WB1U793', 'Second-gen Mountaineer (Ford Explorer platform). H92 key blank with 80-bit 4D63 chip. PATS II system. Remote head key with integrated buttons. OBD programmable with PATS PIN. 2-key on-board programming. Aftermarket: Autel IM608, VVDI2 Ford, Lonsdor. All keys lost: PATS PIN from dealer or PCM read. V6 or V8 options.', true, true, 'H92', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'T-H-92', 2002, 2010);

-- Mercury Sable (1996-2005)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'c0671824-dcb0-49e0-bbec-a0adf7566fb9', 'Sable', 'sable')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1996, 2005)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'c0671824-dcb0-49e0-bbec-a0adf7566fb9', 'Mercury Sable', 'H75', 'Texas Fixed 4C', '4C chip (Texas Glass)', '315 MHz', 'transponder', 'GQ43VT4T', '3513A-43VT4T', 'Rebadged Ford Taurus. H75 key blank with 4C transponder. PATS I system (1996+). 2-key on-board programming. OBD add key with PATS PIN. Aftermarket tools: Autel, VVDI, Zed-Full. 4C chip cloneable. All keys lost: PATS PIN from Ford or PCM read. Available as sedan and wagon. Duratec V6.', true, true, 'H75', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'T-H-75', 1996, 2005);

-- Mercury Sable (2008-2009 - Final gen)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'c0671824-dcb0-49e0-bbec-a0adf7566fb9' AND slug = 'sable'), 2008, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'c0671824-dcb0-49e0-bbec-a0adf7566fb9', 'Mercury Sable', 'H92', 'Texas Crypto 4D', '4D63 (80-bit)', '315 MHz', 'transponder', 'CWTWB1U793', '2011D-WB1U793', 'Final-gen Sable (rebadged Ford Taurus/Five Hundred). H92 key blank with 80-bit 4D63 chip. PATS II system. Remote head key with integrated buttons. OBD programmable with PATS PIN. Aftermarket: Autel IM608, VVDI2. All keys lost: PIN from dealer or PCM read. Short production run before Mercury discontinuation.', true, true, 'H92', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'T-H-92', 2008, 2009);

-- Mercury Milan (2006-2011)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'c0671824-dcb0-49e0-bbec-a0adf7566fb9', 'Milan', 'milan')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2011)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'c0671824-dcb0-49e0-bbec-a0adf7566fb9', 'Mercury Milan', 'H92', 'Texas Crypto 4D', '4D63 (80-bit)', '315 MHz', 'transponder', 'CWTWB1U793', '2011D-WB1U793', 'Rebadged Ford Fusion (CD3 platform). H92 key blank with 80-bit 4D63 chip. PATS II system. Remote head key with 3+1 buttons. OBD programmable with PATS PIN. 2-key on-board programming available. Aftermarket: Autel IM608, VVDI2 Ford, Lonsdor K518. All keys lost: PATS PIN from Ford dealer or PCM EEPROM read. Milan Hybrid available (2010-2011). Mercury brand discontinued after 2011.', true, true, 'H92', 'CR2032', 'Lock, Unlock, Panic, Trunk', 'T-H-92', 2006, 2011);
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
  VALUES (gen_random_uuid(), 'aa4ca167-f020-4494-accb-2c04ea82f9a3', 'Alero', 'alero')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2004)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa4ca167-f020-4494-accb-2c04ea82f9a3', 'Oldsmobile Alero', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn procedure via OBD. Requires 2 working keys or GM Tech 2 for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2004);

-- Oldsmobile Intrigue (1998-2002)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'aa4ca167-f020-4494-accb-2c04ea82f9a3', 'Intrigue', 'intrigue')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1998, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa4ca167-f020-4494-accb-2c04ea82f9a3', 'Oldsmobile Intrigue', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn procedure via OBD. GM Tech 2 required for all-keys-lost situations.', false, true, 'B97', NULL, NULL, 'T-B97', 1998, 2002);

-- Oldsmobile Bravada (1999-2004) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'aa4ca167-f020-4494-accb-2c04ea82f9a3', 'Bravada', 'bravada')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2004)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa4ca167-f020-4494-accb-2c04ea82f9a3', 'Oldsmobile Bravada', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn via OBD. Requires 2 working keys or GM Tech 2 for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2004);

-- Oldsmobile Bravada (1996-1998) - VATS
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'aa4ca167-f020-4494-accb-2c04ea82f9a3' AND slug = 'bravada'), 1996, 1998)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa4ca167-f020-4494-accb-2c04ea82f9a3', 'Oldsmobile Bravada', 'B89', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard key with no transponder. Some models may have VATS resistor key - measure resistance value (1-15) if anti-theft present.', false, false, NULL, NULL, NULL, NULL, 1996, 1998);

-- Oldsmobile Aurora (2001-2003) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'aa4ca167-f020-4494-accb-2c04ea82f9a3', 'Aurora', 'aurora')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2001, 2003)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa4ca167-f020-4494-accb-2c04ea82f9a3', 'Oldsmobile Aurora', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn procedure via OBD. GM Tech 2 for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 2001, 2003);

-- Oldsmobile Aurora (1995-1999) - VATS
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'aa4ca167-f020-4494-accb-2c04ea82f9a3' AND slug = 'aurora'), 1995, 1999)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa4ca167-f020-4494-accb-2c04ea82f9a3', 'Oldsmobile Aurora', 'B89', 'VATS', 'Resistor', NULL, 'transponder', NULL, NULL, 'VATS (Vehicle Anti-Theft System) resistor key. Measure resistance pellet value (1 of 15 values). Replace with matching resistor key blank.', false, false, NULL, NULL, NULL, NULL, 1995, 1999);

-- Oldsmobile Silhouette (1999-2004)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'aa4ca167-f020-4494-accb-2c04ea82f9a3', 'Silhouette', 'silhouette')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2004)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa4ca167-f020-4494-accb-2c04ea82f9a3', 'Oldsmobile Silhouette', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn procedure via OBD. GM Tech 2 required for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2004);

-- Oldsmobile Silhouette (1997-1998) - standard
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'aa4ca167-f020-4494-accb-2c04ea82f9a3' AND slug = 'silhouette'), 1997, 1998)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'aa4ca167-f020-4494-accb-2c04ea82f9a3', 'Oldsmobile Silhouette', 'B89', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard mechanical key. No transponder or anti-theft system. Cut by code or duplicate from existing key.', false, false, NULL, NULL, NULL, NULL, 1997, 1998);

-- =============================================================================
-- PETERBILT (94fd4d3b-da9d-4226-a28f-16d2759ac41b)
-- =============================================================================

-- Peterbilt 579 (2013-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '94fd4d3b-da9d-4226-a28f-16d2759ac41b', '579', '579')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2013, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '94fd4d3b-da9d-4226-a28f-16d2759ac41b', 'Peterbilt 579', 'Y160', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard commercial truck key. Y160 keyway. No transponder. Key can be cut by code using key code from door lock or ignition. Some fleet vehicles may use SC1 keyway.', false, false, NULL, NULL, NULL, NULL, 2013, 2025);

-- Peterbilt 389 (2007-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '94fd4d3b-da9d-4226-a28f-16d2759ac41b', '389', '389')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '94fd4d3b-da9d-4226-a28f-16d2759ac41b', 'Peterbilt 389', 'Y160', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard commercial truck key. Y160 keyway. No transponder or immobilizer. Cut by code or duplicate existing key.', false, false, NULL, NULL, NULL, NULL, 2007, 2025);

-- Peterbilt 567 (2014-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '94fd4d3b-da9d-4226-a28f-16d2759ac41b', '567', '567')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2014, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '94fd4d3b-da9d-4226-a28f-16d2759ac41b', 'Peterbilt 567', 'Y160', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard commercial truck key. Y160 keyway. No transponder. Key cut by code from lock or ignition cylinder.', false, false, NULL, NULL, NULL, NULL, 2014, 2025);

-- =============================================================================
-- PLYMOUTH (1929610e-f799-45b5-b41e-3740e9b28661)
-- =============================================================================

-- Plymouth Prowler (1997-2002)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '1929610e-f799-45b5-b41e-3740e9b28661', 'Prowler', 'prowler')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1997, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '1929610e-f799-45b5-b41e-3740e9b28661', 'Plymouth Prowler', 'Y160-PT', 'Chrysler encrypted', 'Texas Crypto 4D64', '315 MHz', 'transponder', 'GQ43VT9T', '3521A-VT9T', 'Chrysler transponder system. Requires DRBIII or compatible tool (Autel, SmartPro) for programming. PIN code from dealer required for all-keys-lost.', true, true, 'Y160', NULL, NULL, 'T-Y160', 1997, 2002);

-- Plymouth Neon (2000-2001) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '1929610e-f799-45b5-b41e-3740e9b28661', 'Neon', 'neon')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2000, 2001)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '1929610e-f799-45b5-b41e-3740e9b28661', 'Plymouth Neon', 'Y160-PT', 'Chrysler encrypted', 'Texas Crypto 4D64', '315 MHz', 'transponder', 'GQ43VT7T', '3521A-VT7T', 'Chrysler SENTRY KEY transponder. Requires 2 working keys for on-board programming or DRBIII/Autel tool. PIN required for all-keys-lost.', true, true, 'Y160', NULL, NULL, 'T-Y160', 2000, 2001);

-- Plymouth Neon (1995-1999) - standard
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '1929610e-f799-45b5-b41e-3740e9b28661' AND slug = 'neon'), 1995, 1999)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '1929610e-f799-45b5-b41e-3740e9b28661', 'Plymouth Neon', 'Y159', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard mechanical key. No transponder or immobilizer. Cut by code or duplicate from existing key.', false, false, NULL, NULL, NULL, NULL, 1995, 1999);

-- Plymouth Breeze (1996-2000)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '1929610e-f799-45b5-b41e-3740e9b28661', 'Breeze', 'breeze')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1996, 2000)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '1929610e-f799-45b5-b41e-3740e9b28661', 'Plymouth Breeze', 'Y159', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard mechanical key. No transponder system. Cut by code or duplicate existing key.', false, false, NULL, NULL, NULL, NULL, 1996, 2000);

-- Plymouth Voyager (2000-2000) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '1929610e-f799-45b5-b41e-3740e9b28661', 'Voyager', 'voyager')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2000, 2000)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '1929610e-f799-45b5-b41e-3740e9b28661', 'Plymouth Voyager', 'Y160-PT', 'Chrysler encrypted', 'Texas Crypto 4D64', '315 MHz', 'transponder', 'GQ43VT18T', '3521A-VT18T', 'Chrysler SENTRY KEY transponder. Requires 2 working keys for on-board programming or DRBIII. PIN from dealer for all-keys-lost.', true, true, 'Y160', NULL, NULL, 'T-Y160', 2000, 2000);

-- Plymouth Voyager (1996-1999) - standard
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '1929610e-f799-45b5-b41e-3740e9b28661' AND slug = 'voyager'), 1996, 1999)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '1929610e-f799-45b5-b41e-3740e9b28661', 'Plymouth Voyager', 'Y159', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard mechanical key. No immobilizer. Cut by code or duplicate from existing key.', false, false, NULL, NULL, NULL, NULL, 1996, 1999);

-- =============================================================================
-- POLESTAR (2e44f1ef-fe8c-4df0-89e1-71b48333dc92)
-- =============================================================================

-- Polestar 2 (2021-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '2e44f1ef-fe8c-4df0-89e1-71b48333dc92', 'Polestar 2', 'polestar-2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2021, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '2e44f1ef-fe8c-4df0-89e1-71b48333dc92', 'Polestar Polestar 2', 'N/A', 'Polestar Digital Key', 'BLE/NFC', '433 MHz', 'smart_key', 'CXTM001', '4250A-TM001', 'Digital key card and phone key via Polestar app. BLE-based proximity. Dealer-only programming via Polestar VIDA. No traditional mechanical key. Emergency NFC card provided.', false, false, NULL, 'CR2032', '3', NULL, 2021, 2025);

-- Polestar 3 (2024-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '2e44f1ef-fe8c-4df0-89e1-71b48333dc92', 'Polestar 3', 'polestar-3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2024, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '2e44f1ef-fe8c-4df0-89e1-71b48333dc92', 'Polestar Polestar 3', 'N/A', 'Polestar Digital Key', 'BLE/NFC/UWB', '433 MHz', 'smart_key', 'CXTM002', '4250A-TM002', 'Digital key card and phone key via Polestar app. UWB-based proximity with BLE fallback. Dealer-only programming. No traditional blade key.', false, false, NULL, 'CR2032', '3', NULL, 2024, 2025);

-- =============================================================================
-- PONTIAC (93ee9460-9d23-4913-9ae7-bd05aeb38afa)
-- =============================================================================

-- Pontiac G6 (2005-2010) - PK3+/Megamos 46
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'G6', 'g6')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2005, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac G6', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'KOBGT04A', '3521A-GT04A', 'PK3+ transponder system. 10-minute key learn procedure via OBD. Requires 2 working keys or GM Tech 2 for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2005, 2010);

-- Pontiac Grand Prix (2004-2008) - PK3+/Megamos 46
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Grand Prix', 'grand-prix')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2004, 2008)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac Grand Prix', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'KOBGT04A', '3521A-GT04A', 'PK3+ transponder system. 10-minute OBD key learn. GM Tech 2 or Autel IM508 for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2004, 2008);

-- Pontiac Grand Prix (1999-2003) - PK3
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '93ee9460-9d23-4913-9ae7-bd05aeb38afa' AND slug = 'grand-prix'), 1999, 2003)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac Grand Prix', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn procedure via OBD. GM Tech 2 required for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2003);

-- Pontiac Vibe (2003-2010)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Vibe', 'vibe')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2009, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac Vibe', 'TOY44D-PT', 'Texas Crypto 4D67', '4D67 chip', '315 MHz', 'transponder', 'GQ43VT14T', '1470A-VT14T', 'Toyota-based platform (Matrix). Uses Toyota 4D67 transponder. Requires Toyota TIS or compatible tool for programming.', false, true, 'TOY44', NULL, NULL, 'T-TOY44', 2009, 2010);

-- Pontiac Vibe (2003-2008)
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '93ee9460-9d23-4913-9ae7-bd05aeb38afa' AND slug = 'vibe'), 2003, 2008)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac Vibe', 'TOY43-PT', 'Texas Crypto 4D67', '4D67 chip', '315 MHz', 'transponder', 'GQ43VT14T', '1470A-VT14T', 'Toyota-based platform (Matrix). Uses Toyota 4D67 transponder. Requires Toyota TIS or compatible tool. 2 working keys needed for on-board programming.', false, true, 'TOY43', NULL, NULL, 'T-TOY43', 2003, 2008);

-- Pontiac GTO (2004-2006)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'GTO', 'gto')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2004, 2006)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac GTO', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'QQY8V00GH40001', '3521A-GH40001', 'PK3+ transponder (Holden-based platform). 10-minute key learn via OBD. GM Tech 2 or compatible for all-keys-lost.', false, true, 'B111', NULL, NULL, 'T-B111', 2004, 2006);

-- Pontiac Solstice (2006-2009)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Solstice', 'solstice')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac Solstice', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'KOBGT04A', '3521A-GT04A', 'PK3+ transponder system. 10-minute key learn via OBD. GM Tech 2 or Autel IM508 for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2006, 2009);

-- Pontiac Torrent (2006-2009)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Torrent', 'torrent')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2006, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac Torrent', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'KOBGT04A', '3521A-GT04A', 'PK3+ transponder system. 10-minute key learn via OBD. GM Tech 2 or compatible aftermarket tool for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2006, 2009);

-- Pontiac Grand Am (1999-2005) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Grand Am', 'grand-am')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2005)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac Grand Am', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn via OBD. Requires 2 working keys or GM Tech 2 for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2005);

-- Pontiac Grand Am (1996-1998) - standard
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '93ee9460-9d23-4913-9ae7-bd05aeb38afa' AND slug = 'grand-am'), 1996, 1998)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac Grand Am', 'B89', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard mechanical key. No transponder. Cut by code or duplicate from existing key.', false, false, NULL, NULL, NULL, NULL, 1996, 1998);

-- Pontiac Firebird (1999-2002) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Firebird', 'firebird')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac Firebird', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn via OBD. GM Tech 2 for all-keys-lost situations.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2002);

-- Pontiac Firebird (1994-1998) - VATS
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '93ee9460-9d23-4913-9ae7-bd05aeb38afa' AND slug = 'firebird'), 1994, 1998)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac Firebird', 'B82-P', 'VATS', 'Resistor', NULL, 'transponder', NULL, NULL, 'VATS (Vehicle Anti-Theft System) resistor key. Measure resistance pellet value (1 of 15 values). Match with correct VATS key blank. Double-sided key.', false, false, NULL, NULL, NULL, NULL, 1994, 1998);

-- Pontiac Sunfire (1999-2005) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Sunfire', 'sunfire')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2005)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac Sunfire', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn procedure via OBD. GM Tech 2 or compatible tool for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2005);

-- Pontiac Sunfire (1995-1998) - standard
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '93ee9460-9d23-4913-9ae7-bd05aeb38afa' AND slug = 'sunfire'), 1995, 1998)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac Sunfire', 'B89', NULL, NULL, NULL, 'standard', NULL, NULL, 'Standard mechanical key. No transponder. Cut by code or duplicate from existing key.', false, false, NULL, NULL, NULL, NULL, 1995, 1998);

-- Pontiac Montana (1999-2009) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Montana', 'montana')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 1999, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '93ee9460-9d23-4913-9ae7-bd05aeb38afa', 'Pontiac Montana', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn via OBD. GM Tech 2 or compatible aftermarket tool for all-keys-lost.', false, true, 'B97', NULL, NULL, 'T-B97', 1999, 2009);

-- =============================================================================
-- RIVIAN (57f1ad02-2948-4fb8-81bc-e3623a430f52)
-- =============================================================================

-- Rivian R1T (2022-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '57f1ad02-2948-4fb8-81bc-e3623a430f52', 'R1T', 'r1t')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2022, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '57f1ad02-2948-4fb8-81bc-e3623a430f52', 'Rivian R1T', 'N/A', 'Rivian Digital Key', 'BLE/UWB', '315 MHz', 'proximity', 'TXERT1F22', '7922A-RT1F22', 'Phone key via Rivian app (BLE/UWB). Key card NFC backup. No traditional mechanical key or blade. Dealer-only programming through Rivian service center. OTA updates may affect key system.', false, false, NULL, 'CR2032', '5', NULL, 2022, 2025);

-- Rivian R1S (2022-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '57f1ad02-2948-4fb8-81bc-e3623a430f52', 'R1S', 'r1s')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2022, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '57f1ad02-2948-4fb8-81bc-e3623a430f52', 'Rivian R1S', 'N/A', 'Rivian Digital Key', 'BLE/UWB', '315 MHz', 'proximity', 'TXERT1F22', '7922A-RT1F22', 'Phone key via Rivian app (BLE/UWB). Key card NFC backup. No traditional mechanical key. Dealer-only programming through Rivian service center.', false, false, NULL, 'CR2032', '5', NULL, 2022, 2025);

-- Rivian R2 (2026-2026)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '57f1ad02-2948-4fb8-81bc-e3623a430f52', 'R2', 'r2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2026, 2026)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '57f1ad02-2948-4fb8-81bc-e3623a430f52', 'Rivian R2', 'N/A', 'Rivian Digital Key', 'BLE/UWB', '315 MHz', 'proximity', NULL, NULL, 'Phone key via Rivian app. NFC key card backup. No traditional blade key. Dealer-only service. Upcoming model - key details subject to change.', false, false, NULL, 'CR2032', '5', NULL, 2026, 2026);

-- =============================================================================
-- ROLLS-ROYCE (63ac183a-ae00-4cd2-964c-8c6611229229)
-- =============================================================================

-- Rolls-Royce Ghost (2021-2025) - BMW ISTA based
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '63ac183a-ae00-4cd2-964c-8c6611229229', 'Ghost', 'ghost')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2021, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '63ac183a-ae00-4cd2-964c-8c6611229229', 'Rolls-Royce Ghost', 'HU100R', 'BMW CAS4+/FEM', 'Hitag Pro', '433 MHz', 'smart_key', 'YGOHUF5767', '2694A-HUF5767', 'BMW-based platform. Smart key with push-button start. Requires BMW ISTA or Autel IM608 with BMW license. ISN code required from CAS/FEM module for all-keys-lost.', true, true, 'HU100R', 'CR2450', '4', 'T-HU100R', 2021, 2025);

-- Rolls-Royce Ghost (2010-2020) - first gen
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '63ac183a-ae00-4cd2-964c-8c6611229229' AND slug = 'ghost'), 2010, 2020)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '63ac183a-ae00-4cd2-964c-8c6611229229', 'Rolls-Royce Ghost', 'HU92R', 'BMW CAS3/CAS4', 'Hitag2 46', '433 MHz', 'smart_key', 'YGOHUF5662', '2694A-HUF5662', 'BMW-based platform (F-series). CAS3/CAS4 smart key system. Requires BMW ISTA or Autel IM608. ISN code from CAS module needed for all-keys-lost.', true, true, 'HU92', 'CR2450', '4', 'T-HU92R', 2010, 2020);

-- Rolls-Royce Wraith (2014-2023)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '63ac183a-ae00-4cd2-964c-8c6611229229', 'Wraith', 'wraith')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2014, 2023)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '63ac183a-ae00-4cd2-964c-8c6611229229', 'Rolls-Royce Wraith', 'HU92R', 'BMW CAS4', 'Hitag2 46', '433 MHz', 'smart_key', 'YGOHUF5662', '2694A-HUF5662', 'BMW-based platform. CAS4 smart key with comfort access. BMW ISTA or Autel IM608 required. ISN code from CAS module needed for all-keys-lost.', true, true, 'HU92', 'CR2450', '4', 'T-HU92R', 2014, 2023);

-- Rolls-Royce Phantom (2018-2025) - VIII gen
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '63ac183a-ae00-4cd2-964c-8c6611229229', 'Phantom', 'phantom')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2018, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '63ac183a-ae00-4cd2-964c-8c6611229229', 'Rolls-Royce Phantom', 'HU100R', 'BMW FEM/BDC', 'Hitag Pro', '433 MHz', 'smart_key', 'YGOHUF5767', '2694A-HUF5767', 'BMW-based platform (G-series architecture). FEM/BDC smart key system. Requires BMW ISTA or Autel IM608 with BMW license. ISN code required for all-keys-lost.', true, true, 'HU100R', 'CR2450', '4', 'T-HU100R', 2018, 2025);

-- Rolls-Royce Phantom (2003-2017) - VII gen
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '63ac183a-ae00-4cd2-964c-8c6611229229' AND slug = 'phantom'), 2003, 2017)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '63ac183a-ae00-4cd2-964c-8c6611229229', 'Rolls-Royce Phantom', 'HU92R', 'BMW CAS2/CAS3', 'Hitag2 46', '433 MHz', 'smart_key', 'LX8766S', '2694A-8766S', 'BMW-based platform. CAS2/CAS3 smart key system. BMW ISTA or compatible tool required. ISN code from CAS module for all-keys-lost.', true, true, 'HU92', 'CR2450', '4', 'T-HU92R', 2003, 2017);

-- Rolls-Royce Cullinan (2019-2025)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '63ac183a-ae00-4cd2-964c-8c6611229229', 'Cullinan', 'cullinan')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2019, 2025)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '63ac183a-ae00-4cd2-964c-8c6611229229', 'Rolls-Royce Cullinan', 'HU100R', 'BMW FEM/BDC', 'Hitag Pro', '433 MHz', 'smart_key', 'YGOHUF5767', '2694A-HUF5767', 'BMW-based platform (G-series). FEM/BDC smart key with comfort access. Requires BMW ISTA or Autel IM608 with BMW license. ISN code required.', true, true, 'HU100R', 'CR2450', '4', 'T-HU100R', 2019, 2025);

-- =============================================================================
-- SAAB (5bfa56d0-7d83-477e-bbcb-efd199e29aa9)
-- =============================================================================

-- Saab 9-3 (2008-2011) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '5bfa56d0-7d83-477e-bbcb-efd199e29aa9', '9-3', '9-3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2011)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '5bfa56d0-7d83-477e-bbcb-efd199e29aa9', 'Saab 9-3', 'NE66', 'Saab TWICE', 'T5 Hitag2', '433 MHz', 'smart_key', 'LTQSAAM433TX', '3412A-SAAM433TX', 'Saab TWICE (Theft Warning Integrated Central Electronics) system. Requires Saab Tech 2 or Autel IM608 for programming. PIN code from CIM module required.', true, true, 'NE66', 'CR2032', '4', 'T-NE66', 2008, 2011);

-- Saab 9-3 (2003-2007) - transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '5bfa56d0-7d83-477e-bbcb-efd199e29aa9' AND slug = '9-3'), 2003, 2007)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '5bfa56d0-7d83-477e-bbcb-efd199e29aa9', 'Saab 9-3', 'NE66-PT', 'Saab TWICE', 'T5 chip', '433 MHz', 'transponder', 'LTQSAAM433TX', '3412A-SAAM433TX', 'Saab TWICE transponder system. Requires Saab Tech 2 or compatible tool. PIN code from CIM (Column Integration Module) required for programming.', true, true, 'NE66', NULL, NULL, 'T-NE66', 2003, 2007);

-- Saab 9-3 (1999-2002) - old gen transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '5bfa56d0-7d83-477e-bbcb-efd199e29aa9' AND slug = '9-3'), 1999, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '5bfa56d0-7d83-477e-bbcb-efd199e29aa9', 'Saab 9-3', 'NE38-PT', 'Saab TWICE', 'T5 chip', '315 MHz', 'transponder', 'LTQSAAM315T', '3412A-SAAM315T', 'Saab TWICE transponder. Early system. Requires Saab Tech 2 for programming. PIN code from TWICE module needed.', true, true, 'NE38', NULL, NULL, 'T-NE38', 1999, 2002);

-- Saab 9-5 (2010-2011) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '5bfa56d0-7d83-477e-bbcb-efd199e29aa9', '9-5', '9-5')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2010, 2011)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '5bfa56d0-7d83-477e-bbcb-efd199e29aa9', 'Saab 9-5', 'HU100', 'Hitag2 Extended', 'Hitag2 46', '433 MHz', 'smart_key', 'NBG009768T', '3521A-009768T', 'New generation 9-5 (GM Epsilon II platform). Smart key with push-button start. Requires Saab Tech 2/MDI or Autel IM608 for programming.', true, true, 'HU100', 'CR2032', '4', 'T-HU100', 2010, 2011);

-- Saab 9-5 (2003-2009) - transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '5bfa56d0-7d83-477e-bbcb-efd199e29aa9' AND slug = '9-5'), 2003, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '5bfa56d0-7d83-477e-bbcb-efd199e29aa9', 'Saab 9-5', 'NE66-PT', 'Saab TWICE', 'T5 chip', '433 MHz', 'transponder', 'LTQSAAM433TX', '3412A-SAAM433TX', 'Saab TWICE transponder system. Requires Saab Tech 2 or compatible tool. PIN code from CIM module required.', true, true, 'NE66', NULL, NULL, 'T-NE66', 2003, 2009);

-- Saab 9-5 (1999-2002) - transponder early
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '5bfa56d0-7d83-477e-bbcb-efd199e29aa9' AND slug = '9-5'), 1999, 2002)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '5bfa56d0-7d83-477e-bbcb-efd199e29aa9', 'Saab 9-5', 'NE38-PT', 'Saab TWICE', 'T5 chip', '315 MHz', 'transponder', 'LTQSAAM315T', '3412A-SAAM315T', 'Saab TWICE transponder. Requires Saab Tech 2. PIN code from TWICE module needed for programming.', true, true, 'NE38', NULL, NULL, 'T-NE38', 1999, 2002);

-- Saab 9-2X (2005-2006) - Subaru-based
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '5bfa56d0-7d83-477e-bbcb-efd199e29aa9', '9-2X', '9-2x')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2005, 2006)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '5bfa56d0-7d83-477e-bbcb-efd199e29aa9', 'Saab 9-2X', 'NSN14-PT', 'Texas 4D62', '4D62 chip', '315 MHz', 'transponder', 'NHVWB1U711', '1788D-WB1U711', 'Subaru Impreza-based platform. Uses Subaru transponder system. Requires Subaru SSM or compatible tool. On-board programming with 2 working keys possible.', false, true, 'NSN14', NULL, NULL, 'T-NSN14', 2005, 2006);

-- =============================================================================
-- SATURN (b84089ae-17f6-4e0c-bf18-0da3409755b5)
-- =============================================================================

-- Saturn Vue (2008-2010) - PK3+/Megamos 46
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'b84089ae-17f6-4e0c-bf18-0da3409755b5', 'Vue', 'vue')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'b84089ae-17f6-4e0c-bf18-0da3409755b5', 'Saturn Vue', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', '3521A-01060512', 'PK3+ transponder system. 10-minute key learn via OBD. GM Tech 2 or Autel IM508 for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2008, 2010);

-- Saturn Vue (2002-2007) - PK3
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'b84089ae-17f6-4e0c-bf18-0da3409755b5' AND slug = 'vue'), 2002, 2007)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'b84089ae-17f6-4e0c-bf18-0da3409755b5', 'Saturn Vue', 'B97-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn via OBD. GM Tech 2 for all-keys-lost situations.', false, true, 'B97', NULL, NULL, 'T-B97', 2002, 2007);

-- Saturn Ion (2003-2007) - PK3
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'b84089ae-17f6-4e0c-bf18-0da3409755b5', 'Ion', 'ion')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2003, 2007)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'b84089ae-17f6-4e0c-bf18-0da3409755b5', 'Saturn Ion', 'B102-PT', 'PK3', 'Megamos 13', '315 MHz', 'transponder', 'KOBUT1BT', '3521A-UT1BT', 'PK3 transponder system. 10-minute key learn via OBD. Uses B102 sidebar keyway. GM Tech 2 or compatible tool for all-keys-lost.', false, true, 'B102', NULL, NULL, 'T-B102', 2003, 2007);

-- Saturn Outlook (2007-2010) - PK3+/Megamos 46
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'b84089ae-17f6-4e0c-bf18-0da3409755b5', 'Outlook', 'outlook')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'b84089ae-17f6-4e0c-bf18-0da3409755b5', 'Saturn Outlook', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', '3521A-01060512', 'PK3+ transponder system. 10-minute key learn via OBD. GM Tech 2 or Autel IM508/608 for all-keys-lost.', false, true, 'B111', NULL, NULL, 'T-B111', 2007, 2010);

-- Saturn Aura (2007-2009) - PK3+/Megamos 46
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'b84089ae-17f6-4e0c-bf18-0da3409755b5', 'Aura', 'aura')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'b84089ae-17f6-4e0c-bf18-0da3409755b5', 'Saturn Aura', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'KOBGT04A', '3521A-GT04A', 'PK3+ transponder system. 10-minute key learn via OBD. GM Tech 2 or Autel IM508 for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2007, 2009);

-- Saturn Sky (2007-2010) - PK3+/Megamos 46
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'b84089ae-17f6-4e0c-bf18-0da3409755b5', 'Sky', 'sky')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'b84089ae-17f6-4e0c-bf18-0da3409755b5', 'Saturn Sky', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'KOBGT04A', '3521A-GT04A', 'PK3+ transponder system (Kappa platform, shared with Pontiac Solstice). 10-minute key learn via OBD. GM Tech 2 for all-keys-lost.', false, true, 'B106', NULL, NULL, 'T-B106', 2007, 2010);

-- =============================================================================
-- SCION (d57863be-57d9-4c3f-a0c6-abd7e7e04829)
-- =============================================================================

-- Scion tC (2011-2016) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'tC', 'tc')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2011, 2016)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'Scion tC', 'TOY48-PT', 'Texas Crypto 128-bit AES', 'H chip (128-bit)', '315 MHz', 'smart_key', 'HYQ14FBA', '1551A-14FBA', 'Toyota H-chip smart key system. Requires Toyota TIS/Techstream or Autel IM608 for programming. All-keys-lost requires PIN from dealer or SEED calculation.', true, true, 'TOY48', 'CR2032', '4', 'T-TOY48', 2011, 2016);

-- Scion tC (2005-2010) - transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'd57863be-57d9-4c3f-a0c6-abd7e7e04829' AND slug = 'tc'), 2005, 2010)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'Scion tC', 'TOY44D-PT', 'Texas Crypto 4D67', '4D67 chip', '315 MHz', 'transponder', 'MOZB41TG', '1551A-B41TG', 'Toyota 4D67 transponder system. On-board programming with 1 working master key. Toyota TIS for all-keys-lost.', false, true, 'TOY44', NULL, NULL, 'T-TOY44', 2005, 2010);

-- Scion xB (2008-2015) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'xB', 'xb')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2015)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'Scion xB', 'TOY44G-PT', 'Texas Crypto G chip', 'G chip (80-bit)', '315 MHz', 'transponder', 'MOZB41TG', '1551A-B41TG', 'Toyota G-chip transponder. On-board programming possible with existing master key. Toyota TIS/Techstream or Autel IM608 for all-keys-lost.', false, true, 'TOY44', NULL, NULL, 'T-TOY44', 2008, 2015);

-- Scion xB (2004-2006) - transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = 'd57863be-57d9-4c3f-a0c6-abd7e7e04829' AND slug = 'xb'), 2004, 2006)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'Scion xB', 'TOY43-PT', 'Texas Crypto 4D67', '4D67 chip', '315 MHz', 'transponder', 'MOZB31TG', '1551A-B31TG', 'Toyota 4D67 transponder system. On-board programming with master key. Toyota TIS or compatible tool for all-keys-lost.', false, true, 'TOY43', NULL, NULL, 'T-TOY43', 2004, 2006);

-- Scion xD (2008-2014)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'xD', 'xd')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2008, 2014)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'Scion xD', 'TOY44G-PT', 'Texas Crypto G chip', 'G chip (80-bit)', '315 MHz', 'transponder', 'MOZB41TG', '1551A-B41TG', 'Toyota G-chip transponder. On-board programming with existing master key. Toyota TIS for all-keys-lost situations.', false, true, 'TOY44', NULL, NULL, 'T-TOY44', 2008, 2014);

-- Scion iA (2016-2016) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'iA', 'ia')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2016, 2016)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'Scion iA', 'TOY48-PT', 'Texas Crypto 128-bit AES', 'H chip (128-bit)', '315 MHz', 'smart_key', 'WAZSKE13D01', '1551A-SKE13D01', 'Mazda 2-based platform. Toyota H-chip smart key. Requires Toyota TIS/Techstream or Autel IM608 for programming. PIN required for all-keys-lost.', true, true, 'TOY48', 'CR2032', '3', 'T-TOY48', 2016, 2016);

-- Scion iM (2016-2016) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'iM', 'im')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2016, 2016)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'Scion iM', 'TOY48-PT', 'Texas Crypto 128-bit AES', 'H chip (128-bit)', '315 MHz', 'smart_key', 'HYQ14FBA', '1551A-14FBA', 'Toyota Corolla-based platform. H-chip smart key. Requires Toyota TIS/Techstream or Autel IM608. PIN required for all-keys-lost.', true, true, 'TOY48', 'CR2032', '4', 'T-TOY48', 2016, 2016);

-- Scion FR-S (2013-2016)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'FR-S', 'fr-s')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2013, 2016)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), 'd57863be-57d9-4c3f-a0c6-abd7e7e04829', 'Scion FR-S', 'TOY44G-PT', 'Texas Crypto G chip', 'G chip (80-bit)', '315 MHz', 'smart_key', 'HYQ14ACX', '1551A-14ACX', 'Subaru BRZ-based platform with Toyota key system. Smart key with push-button start. Toyota TIS or Autel IM608 for programming. PIN needed for all-keys-lost.', true, true, 'TOY44', 'CR2032', '4', 'T-TOY44', 2013, 2016);

-- =============================================================================
-- SMART (90c3220c-263d-402d-b654-7d16be5e93ab)
-- =============================================================================

-- Smart Fortwo (2016-2019) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '90c3220c-263d-402d-b654-7d16be5e93ab', 'Fortwo', 'fortwo')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2016, 2019)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '90c3220c-263d-402d-b654-7d16be5e93ab', 'Smart Fortwo', 'HU64', 'Mercedes IR/NEC', 'NEC chip', '315 MHz', 'smart_key', 'CWTWB1G767', '7812A-WB1G767', 'Mercedes-based platform (Renault-built). Uses Mercedes key system. Requires Mercedes Xentry/DAS or Autel IM608. IR-based key with chrome fob.', true, true, 'HU64', 'CR2025', '3', 'T-HU64', 2016, 2019);

-- Smart Fortwo (2008-2015) - transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '90c3220c-263d-402d-b654-7d16be5e93ab' AND slug = 'fortwo'), 2008, 2015)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '90c3220c-263d-402d-b654-7d16be5e93ab', 'Smart Fortwo', 'HU64-PT', 'Mercedes IR', 'NEC chip', '315 MHz', 'transponder', 'KR55WK45144', '7812A-WK45144', 'Mercedes-based key system. Chrome key fob with IR communication. Requires Mercedes Xentry/DAS or compatible tool. EIS (Electronic Ignition Switch) programming required.', true, true, 'HU64', 'CR2025', '3', 'T-HU64', 2008, 2015);

-- Smart Forfour (2016-2019) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '90c3220c-263d-402d-b654-7d16be5e93ab', 'Forfour', 'forfour')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2016, 2019)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '90c3220c-263d-402d-b654-7d16be5e93ab', 'Smart Forfour', 'HU64', 'Mercedes IR/NEC', 'NEC chip', '315 MHz', 'smart_key', 'CWTWB1G767', '7812A-WB1G767', 'Mercedes-based platform. Same key system as Fortwo. Requires Mercedes Xentry/DAS or Autel IM608. IR key with chrome fob design.', true, true, 'HU64', 'CR2025', '3', 'T-HU64', 2016, 2019);

-- =============================================================================
-- SUZUKI (7f478bc6-34fa-4989-be53-03ee1e0a6607)
-- =============================================================================

-- Suzuki Grand Vitara (2007-2013) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Grand Vitara', 'grand-vitara')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2013)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Suzuki Grand Vitara', 'SUZ17-PT', 'Hitag2 46', '46 chip', '315 MHz', 'transponder', 'KBRTS005', '1348-TS005', 'Hitag2 transponder system. OBD programmable with Suzuki SDT-II or Autel IM508. PIN code may be needed for all-keys-lost.', true, true, 'SUZ17', NULL, NULL, 'T-SUZ17', 2007, 2013);

-- Suzuki Grand Vitara (1999-2005) - transponder
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '7f478bc6-34fa-4989-be53-03ee1e0a6607' AND slug = 'grand-vitara'), 1999, 2005)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Suzuki Grand Vitara', 'SUZ17-PT', 'Texas Crypto 4D65', '4D65 chip', '315 MHz', 'transponder', 'KBRTS003', '1348-TS003', 'Texas Crypto 4D65 transponder. Requires Suzuki SDT or compatible tool. On-board registration with existing master key possible.', false, true, 'SUZ17', NULL, NULL, 'T-SUZ17', 1999, 2005);

-- Suzuki SX4 (2007-2013)
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'SX4', 'sx4')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2013)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Suzuki SX4', 'SUZ17-PT', 'Hitag2 46', '46 chip', '315 MHz', 'transponder', 'KBRTS005', '1348-TS005', 'Hitag2 transponder system. OBD programmable with Suzuki SDT-II or Autel IM508. PIN required for all-keys-lost.', true, true, 'SUZ17', NULL, NULL, 'T-SUZ17', 2007, 2013);

-- Suzuki Kizashi (2010-2013) - smart key
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Kizashi', 'kizashi')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2010, 2013)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Suzuki Kizashi', 'SUZ17', 'Hitag2 46', '46 chip', '315 MHz', 'smart_key', 'KBRTS009', '1348-TS009', 'Smart key with push-button start (select trims). Hitag2 transponder. Requires Suzuki SDT-II or Autel IM608 for programming. Emergency blade in fob.', true, true, 'SUZ17', 'CR2032', '4', 'T-SUZ17', 2010, 2013);

-- Suzuki XL-7 (2007-2009) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'XL-7', 'xl-7')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2007, 2009)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Suzuki XL-7', 'SUZ17-PT', 'Hitag2 46', '46 chip', '315 MHz', 'transponder', 'KBRTS005', '1348-TS005', 'Hitag2 transponder system. GM Saturn Vue-based platform for 2007+. OBD programmable with Suzuki SDT-II or compatible tool.', true, true, 'SUZ17', NULL, NULL, 'T-SUZ17', 2007, 2009);

-- Suzuki XL-7 (2002-2006) - transponder early
WITH new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM public.vehicle_models WHERE manufacturer_id = '7f478bc6-34fa-4989-be53-03ee1e0a6607' AND slug = 'xl-7'), 2002, 2006)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Suzuki XL-7', 'SUZ17-PT', 'Texas Crypto 4D65', '4D65 chip', '315 MHz', 'transponder', 'KBRTS003', '1348-TS003', 'Texas Crypto 4D65 transponder. Suzuki SDT or compatible tool. On-board registration with existing master key possible.', false, true, 'SUZ17', NULL, NULL, 'T-SUZ17', 2002, 2006);

-- Suzuki Forenza (2004-2008) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Forenza', 'forenza')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2004, 2008)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Suzuki Forenza', 'TOY43-PT', 'Megamos 13', '13 chip', '315 MHz', 'transponder', 'KBRTS004', '1348-TS004', 'Daewoo Lacetti-based platform. Megamos 13 transponder. OBD programmable. Suzuki SDT or compatible aftermarket tool.', false, true, 'TOY43', NULL, NULL, 'T-TOY43', 2004, 2008);

-- Suzuki Reno (2005-2008) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Reno', 'reno')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2005, 2008)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Suzuki Reno', 'TOY43-PT', 'Megamos 13', '13 chip', '315 MHz', 'transponder', 'KBRTS004', '1348-TS004', 'Daewoo-based platform (Lacetti hatchback). Megamos 13 transponder. OBD programmable with Suzuki SDT or compatible tool.', false, true, 'TOY43', NULL, NULL, 'T-TOY43', 2005, 2008);

-- Suzuki Aerio (2002-2007) - transponder
WITH new_model AS (
  INSERT INTO public.vehicle_models (id, manufacturer_id, name, slug)
  VALUES (gen_random_uuid(), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Aerio', 'aerio')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id
), new_year AS (
  INSERT INTO public.vehicle_years (id, model_id, year_start, year_end)
  VALUES (gen_random_uuid(), (SELECT id FROM new_model), 2002, 2007)
  RETURNING id
)
INSERT INTO public.automotive_keys (id, year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, ic_number, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, battery_type, buttons, test_key_blank, year_start, year_end)
VALUES (gen_random_uuid(), (SELECT id FROM new_year), '7f478bc6-34fa-4989-be53-03ee1e0a6607', 'Suzuki Aerio', 'SUZ17-PT', 'Texas Crypto 4D65', '4D65 chip', '315 MHz', 'transponder', 'KBRTS003', '1348-TS003', 'Texas Crypto 4D65 transponder. Suzuki SDT or compatible tool. On-board registration with master key possible on some models.', false, true, 'SUZ17', NULL, NULL, 'T-SUZ17', 2002, 2007);
