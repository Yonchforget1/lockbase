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
