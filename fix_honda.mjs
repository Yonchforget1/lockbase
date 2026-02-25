import pg from 'pg';
const { Client } = pg;

const client = new Client({
  host: 'db.eptnkprttskodgnfeasg.supabase.co',
  port: 5432,
  database: 'postgres',
  user: 'postgres',
  password: 'Yonchforget1!',
  ssl: { rejectUnauthorized: false }
});

// Honda manufacturer_id
const HONDA_MFR_ID = 'b68edab6-f74a-4e2d-8ac9-22654e2e2fe6';

// Honda model IDs from vehicle_models table
const MODEL_IDS = {
  'Civic':      '96b80464-086f-431b-bf64-799688dd354c',
  'Accord':     'fcf8050a-d851-4d61-9156-c5f4df872e36',
  'CR-V':       'b3b917fe-2766-46a8-9ecc-1d8c83fa89a6',
  'Pilot':      '5821743b-c067-4401-aaf7-01b30067c68a',
  'HR-V':       'c4b2fa47-f013-4358-9a00-10342c782033',
  'Odyssey':    '7a64da5c-07a1-4545-80f2-64d196603eca',
  'Ridgeline':  'a888bc47-fd14-438c-8964-4923de3f7928',
  'Passport':   'ac3a7c9e-0439-41ee-af19-dcb7f354a86f',
  'Fit':        'c45f225c-8862-4dae-8473-283b3afcdb66',
  'Element':    '7976c0ee-16f4-4b16-b7f9-21f4d53cc61b',
  'S2000':      '242e8539-594b-4a0b-b6fd-200f4e64cc77',
  'Insight':    '0fa6a3e7-4cb0-4467-8196-e84b20a9e876',
  'Crosstour':  '4db5755b-31de-49dd-9412-68f9603a8b08',
  'Prelude':    '37325514-3fbf-4489-b5d9-683ae0c409d4',
  'CR-Z':       'e43a2b28-cded-402f-9730-5a86ce863c1a',
  'Prologue':   '5ee9f662-6998-46d5-a8fc-20ed9e26e1d5',
};

// ============================================================
// ACCURATE HONDA KEY DATA - Sourced from UHS Hardware
// Each row represents a unique key configuration per model/year range
// ============================================================
const hondaKeys = [
  // ===== HONDA ACCORD =====
  // 2003-2007 Accord - Remote Head Key (transponder + remote combo)
  {
    model: 'Accord', year_start: 2003, year_end: 2007,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: '314 MHz', key_type: 'transponder',
    fcc_id: 'OUCG8D-380H-A', ic_number: '850G-G8D380HA',
    battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-HON-401_93059007-3c1b-40bc-b74a-39cfa4b1f064.jpg',
    programming_notes: 'Remote head key with Philips ID 46 chip. Remote portion supports on-board programming. Transponder requires Honda HDS or aftermarket tool. Compatible with Accord Sedan only (not Coupe).',
  },
  // 2003-2012 Accord - Transponder only key (no remote, base models)
  {
    model: 'Accord', year_start: 2003, year_end: 2012,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO03.jpg',
    programming_notes: 'Transponder-only key with Philips ID 46 chip. Fits Accord base models and some trims. OBD programmable via Honda HDS or aftermarket tool.',
  },
  // 2008-2012 Accord - Remote Head Key (8th gen, EX trims)
  {
    model: 'Accord', year_start: 2008, year_end: 2012,
    key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: '314 MHz', key_type: 'transponder',
    fcc_id: 'KR55WK49308', ic_number: '267T-5WK49308',
    battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RHK-HON-ACC2.jpg',
    programming_notes: '8th gen Accord EX. Remote head key with Philips ID 46. Remote requires separate on-board programming. Sedan only, excludes Coupe.',
  },
  // 2013-2015 Accord - Remote Head Key (9th gen)
  {
    model: 'Accord', year_start: 2013, year_end: 2015,
    key_blank: 'HO01', transponder_type: 'Philips 47 Honda G', chip_type: 'ID 47 (G Chip)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MLBHLIK6-1T', ic_number: '2500A-HLIK61T',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-HON-35118.jpg',
    programming_notes: '9th gen Accord. Remote head key with Philips ID 47 Honda G chip. 315 MHz frequency. OBD programmable via Honda HDS or aftermarket tool.',
  },
  // 2016-2017 Accord LX/Sport - Remote Head Key (433 MHz variant)
  {
    model: 'Accord', year_start: 2016, year_end: 2017,
    key_blank: 'HO01', transponder_type: 'Philips 47 Honda G', chip_type: 'ID 47 (G Chip)',
    remote_frequency: '433 MHz', key_type: 'transponder',
    fcc_id: 'MLBHLIK6-1TA', ic_number: '2500A-HLIK61TA',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-HON-1TA-4.jpg',
    programming_notes: '2016-2017 Accord LX/Sport trims. Remote head key with Philips ID 47 G chip. NOTE: 433 MHz (not 315). OBD programmable.',
  },
  // 2016-2017 Accord EX and above - Smart Key
  {
    model: 'Accord', year_start: 2016, year_end: 2017,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'ACJ932HK1310A', ic_number: '216J-HK1310A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Remote Start',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-T2GA41.jpg',
    programming_notes: '2016-2017 Accord EX and above trims. 5-button smart proximity key. 433 MHz. Emergency key blank HO01. Honda HDS or aftermarket tool required.',
  },
  // 2018-2022 Accord - Smart Key (5-button, EX/EX-L/Tour)
  {
    model: 'Accord', year_start: 2018, year_end: 2022,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWB1G0090', ic_number: '1788F-FWB1G0090',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Remote Start',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/KFZ1.png',
    programming_notes: '10th gen Accord. 5-button smart key for EX, EX-L, 2.0 Sport, Touring trims. 433 MHz. CWTWB1G0090. Honda HDS or aftermarket programmer.',
  },
  // 2018-2022 Accord Sport - Smart Key (4-button, no remote start)
  {
    model: 'Accord', year_start: 2018, year_end: 2022,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWB1G0090', ic_number: '1788F-FWB1G0090',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/KFZ1.png',
    programming_notes: '10th gen Accord Sport trim. 4-button smart key (no remote start). 433 MHz. Same FCC ID CWTWB1G0090 as 5-button but no memory/remote start.',
  },
  // 2022-2024 Accord - Smart Key KR5TP-4
  {
    model: 'Accord', year_start: 2022, year_end: 2024,
    key_blank: 'LXP90', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TP-4', ic_number: '7812D-TP4',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Remote Start',
    emergency_key_blank: 'LXP90', test_key_blank: 'LXP90',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON77',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-HON-30A11_8a13138a-816a-42a3-94b2-8cdcb89c77c2.jpg',
    programming_notes: '11th gen Accord (2023-2024) and late 2022. 5-button smart key with HITAG-AES 4A chip. 433 MHz. New emergency key profile LXP90. Honda HDS or Autel IM608 required.',
  },

  // ===== HONDA CIVIC =====
  // 2006-2013 Civic - Remote Head Key (N5F-S0084A)
  {
    model: 'Civic', year_start: 2006, year_end: 2013,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: '314 MHz', key_type: 'transponder',
    fcc_id: 'N5F-S0084A', ic_number: '3248A-S0084A',
    battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-HON-CIV-4.jpg',
    programming_notes: '8th/9th gen Civic. 4-button remote head key with Philips ID 46 chip. 314 MHz. Excludes DX models without keyless system. On-board programming not available.',
  },
  // 2006-2013 Civic - Transponder only (base/DX)
  {
    model: 'Civic', year_start: 2006, year_end: 2013,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO03.jpg',
    programming_notes: 'Civic base/DX trim transponder-only key. Philips ID 46 chip. No remote function. OBD programmable via Honda HDS or aftermarket.',
  },
  // 2014-2015 Civic - Remote Head Key (MLBHLIK6-1T)
  {
    model: 'Civic', year_start: 2014, year_end: 2015,
    key_blank: 'HO01', transponder_type: 'Philips 47 Honda G', chip_type: 'ID 47 (G Chip)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MLBHLIK6-1T', ic_number: '2500A-HLIK61T',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-HON-35118.jpg',
    programming_notes: '9th gen Civic. Remote head key with Philips ID 47 Honda G chip. 315 MHz. OBD programmable.',
  },
  // 2014-2020 Civic - Transponder only (LX base, G chip)
  {
    model: 'Civic', year_start: 2014, year_end: 2020,
    key_blank: 'HO05', transponder_type: 'Philips 47 Honda G', chip_type: 'ID 47 (G Chip)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO05_7af7b180-30c6-4269-b981-06ef76ffd061.jpg',
    programming_notes: 'Civic LX transponder-only key. HO05 blank with Philips ID 47 Honda G chip. No remote. OBD programmable.',
  },
  // 2016-2020 Civic LX - Remote Head Key (MLBHLIK6-1TA, 433 MHz)
  {
    model: 'Civic', year_start: 2016, year_end: 2020,
    key_blank: 'HO01', transponder_type: 'Philips 47 Honda G', chip_type: 'ID 47 (G Chip)',
    remote_frequency: '433 MHz', key_type: 'transponder',
    fcc_id: 'MLBHLIK6-1TA', ic_number: '2500A-HLIK61TA',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-HON-1TA-4.jpg',
    programming_notes: '10th gen Civic LX trim. Remote head key with G chip. NOTE: 433 MHz (not 315). OBD programmable.',
  },
  // 2016-2021 Civic EX/Touring - Smart Key (KR5V2X, 5-button)
  {
    model: 'Civic', year_start: 2016, year_end: 2021,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'KR5V2X', ic_number: '7812D-V2X',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Remote Start',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-CIV-5.jpg',
    programming_notes: '10th gen Civic EX/Touring. 5-button smart proximity key. 434 MHz. KR5V2X. Emergency key HO01. Honda HDS or aftermarket tool.',
  },
  // 2022-2024 Civic - Smart Key (KR5TP-4, 4-button hatch variant)
  {
    model: 'Civic', year_start: 2022, year_end: 2025,
    key_blank: 'LXP90', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TP-4', ic_number: '7812D-TP4',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: 'LXP90', test_key_blank: 'LXP90',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON77',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-HON-CIA01.jpg',
    programming_notes: '11th gen Civic. 4-button smart key with HITAG-AES 4A chip. 433 MHz. New LXP90 emergency blade. Includes 2022-2024 Civic and 2023-2024 Type R. Honda HDS or Autel IM608.',
  },
  // 2022-2024 Civic EX/Touring - Smart Key (KR5TP-4, 5-button with remote start)
  {
    model: 'Civic', year_start: 2022, year_end: 2025,
    key_blank: 'LXP90', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TP-4', ic_number: '7812D-TP4',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Remote Start',
    emergency_key_blank: 'LXP90', test_key_blank: 'LXP90',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON77',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-HON-30A11_8a13138a-816a-42a3-94b2-8cdcb89c77c2.jpg',
    programming_notes: '11th gen Civic EX/Touring. 5-button smart key with remote start. HITAG-AES 4A chip. 433 MHz. KR5TP-4. PN 72147-T20-A11.',
  },

  // ===== HONDA CR-V =====
  // 2005-2006 CR-V - Transponder only (HO03, 46 chip)
  {
    model: 'CR-V', year_start: 2005, year_end: 2006,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO03.jpg',
    programming_notes: '2nd gen CR-V. Transponder only key with Philips ID 46. OBD programmable via Honda HDS or aftermarket.',
  },
  // 2007-2013 CR-V - Transponder only (HO03, 46 chip)
  {
    model: 'CR-V', year_start: 2007, year_end: 2013,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO03.jpg',
    programming_notes: '3rd/4th gen CR-V. Transponder only key with Philips ID 46 chip. Separate keyless entry remote. OBD programmable.',
  },
  // 2014-2016 CR-V LX - Remote Head Key (MLBHLIK6-1T, G chip)
  {
    model: 'CR-V', year_start: 2014, year_end: 2016,
    key_blank: 'HO01', transponder_type: 'Philips 47 Honda G', chip_type: 'ID 47 (G Chip)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MLBHLIK6-1T', ic_number: '2500A-HLIK61T',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: null, test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-HON-35118.jpg',
    programming_notes: '4th gen CR-V LX. Remote head key with Honda G chip. 315 MHz. OBD programmable.',
  },
  // 2014-2020 CR-V - Transponder only (HO05, G chip)
  {
    model: 'CR-V', year_start: 2014, year_end: 2020,
    key_blank: 'HO05', transponder_type: 'Philips 47 Honda G', chip_type: 'ID 47 (G Chip)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO05_7af7b180-30c6-4269-b981-06ef76ffd061.jpg',
    programming_notes: 'CR-V base model transponder-only key. HO05 blank with Honda G chip. No remote. OBD programmable.',
  },
  // 2015-2016 CR-V EX - Smart Key (ACJ932HK1210A)
  {
    model: 'CR-V', year_start: 2015, year_end: 2016,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '314 MHz', key_type: 'smart_key',
    fcc_id: 'ACJ932HK1210A', ic_number: '216J-HK1210A',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-T0AA21.jpg',
    programming_notes: '4th gen CR-V EX. 4-button smart key. 314 MHz. ACJ932HK1210A. Honda HDS or aftermarket tool.',
  },
  // 2017-2022 CR-V EX and above - Smart Key (KR5V2X V44, 5-button)
  {
    model: 'CR-V', year_start: 2017, year_end: 2022,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'KR5V2X', ic_number: '7812D-V2X',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-CRV-5.jpg',
    programming_notes: '5th gen CR-V EX and above. 5-button smart key. 434 MHz (433.92). KR5V2X V44. Honda HDS or aftermarket.',
  },
  // 2023-2025 CR-V - Smart Key (KR5TP-4, 5-button)
  {
    model: 'CR-V', year_start: 2023, year_end: 2025,
    key_blank: 'LXP90', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TP-4', ic_number: '7812D-TP4',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'LXP90', test_key_blank: 'LXP90',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON77',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-HON-T90A21.jpg',
    programming_notes: '6th gen CR-V. 5-button smart key with HITAG-AES 4A chip. 433 MHz. KR5TP-4. New LXP90 emergency blade. Honda HDS or Autel IM608.',
  },

  // ===== HONDA PILOT =====
  // 2005-2008 Pilot - Remote Head Key (CWTWB1U545)
  {
    model: 'Pilot', year_start: 2005, year_end: 2008,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: '433 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U545', ic_number: '188A-FWB1U545',
    battery_type: 'CR1616', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-HON-545.jpg',
    programming_notes: '1st gen Pilot. 3-button remote head key with Philips ID 46 chip. 433 MHz. OBD programmable.',
  },
  // 2005-2015 Pilot - Transponder only (HO03, 46 chip)
  {
    model: 'Pilot', year_start: 2005, year_end: 2015,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO03.jpg',
    programming_notes: 'Pilot transponder-only key. Philips ID 46 chip. Separate keyless entry remote. OBD programmable via Honda HDS.',
  },
  // 2009-2015 Pilot - Remote Head Key (KR55WK49308)
  {
    model: 'Pilot', year_start: 2009, year_end: 2015,
    key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: '314 MHz', key_type: 'transponder',
    fcc_id: 'KR55WK49308', ic_number: '267T-5WK49308',
    battery_type: 'CR1616', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: null, test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RHK-HON-ACC2.jpg',
    programming_notes: '2nd gen Pilot EX/EX-L/Touring. Remote head key, Philips ID 46. 314 MHz. KR55WK49308. Remote requires on-board programming.',
  },
  // 2016-2018 Pilot EX-L/Touring - Smart Key (KR5V2X V44)
  {
    model: 'Pilot', year_start: 2016, year_end: 2018,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'KR5V2X', ic_number: '7812D-V2X',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-CRV-5.jpg',
    programming_notes: '3rd gen Pilot EX-L/Elite/Touring. 5-button smart key. 434 MHz. KR5V2X V44. Honda HDS or aftermarket.',
  },
  // 2019-2021 Pilot/Passport - Smart Key (KR5V44/KR5T44)
  {
    model: 'Pilot', year_start: 2019, year_end: 2022,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5V44', ic_number: '7812D-V44',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-7A61.jpg',
    programming_notes: '3rd gen Pilot (2019-2022). 5-button smart key. 433 MHz. KR5V44/KR5T44. Honda HDS or aftermarket.',
  },
  // 2023-2025 Pilot - Smart Key (KR5TP-4)
  {
    model: 'Pilot', year_start: 2023, year_end: 2025,
    key_blank: 'LXP90', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TP-4', ic_number: '7812D-TP4',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'LXP90', test_key_blank: 'LXP90',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON77',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-HON-T90A21.jpg',
    programming_notes: '4th gen Pilot. 5-button smart key with HITAG-AES 4A chip. 433 MHz. KR5TP-4. New LXP90 blade. Honda HDS or Autel IM608.',
  },

  // ===== HONDA HR-V =====
  // 2016-2019 HR-V LX - Remote Head Key (MLBHLIK6-1T, G chip)
  {
    model: 'HR-V', year_start: 2016, year_end: 2021,
    key_blank: 'HO01', transponder_type: 'Philips 47 Honda G', chip_type: 'ID 47 (G Chip)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MLBHLIK6-1T', ic_number: '2500A-HLIK61T',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Hatch, Panic',
    emergency_key_blank: null, test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-HON-35118.jpg',
    programming_notes: '1st gen HR-V LX. Remote head key with Honda G chip. 315 MHz (314). OBD programmable.',
  },
  // 2016-2020 HR-V LX - Transponder only (HO05, G chip)
  {
    model: 'HR-V', year_start: 2016, year_end: 2020,
    key_blank: 'HO05', transponder_type: 'Philips 47 Honda G', chip_type: 'ID 47 (G Chip)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO05_7af7b180-30c6-4269-b981-06ef76ffd061.jpg',
    programming_notes: 'HR-V LX base transponder-only key. HO05 blank with Honda G chip. OBD programmable.',
  },
  // 2016-2022 HR-V EX - Smart Key (KR5V1X, 4-button)
  {
    model: 'HR-V', year_start: 2016, year_end: 2022,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '314 MHz', key_type: 'smart_key',
    fcc_id: 'KR5V1X', ic_number: '7812D-V1X',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-V1X.jpg',
    programming_notes: '1st gen HR-V EX and above. 4-button smart key. 314 MHz. KR5V1X. Honda HDS or aftermarket.',
  },
  // 2023-2024 HR-V - Smart Key (KR5TP-4, 5-button)
  {
    model: 'HR-V', year_start: 2023, year_end: 2025,
    key_blank: 'LXP90', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TP-4', ic_number: '7812D-TP4',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start',
    emergency_key_blank: 'LXP90', test_key_blank: 'LXP90',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON77',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-HON-CIA01.jpg',
    programming_notes: '2nd gen HR-V. 5-button smart key with HITAG-AES 4A chip. 433 MHz. KR5TP-4. New LXP90 blade. Honda HDS or Autel IM608.',
  },

  // ===== HONDA ODYSSEY =====
  // 2005-2010 Odyssey - Transponder key + separate remote (HO03, 46 chip)
  {
    model: 'Odyssey', year_start: 2005, year_end: 2010,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO03.jpg',
    programming_notes: '3rd gen Odyssey. Transponder-only key with Philips ID 46. Separate 6-button keyless remote (OUCG8D-399H-A, 315 MHz). OBD programmable.',
  },
  // 2005-2010 Odyssey - Keyless Entry Remote (separate from transponder key)
  {
    model: 'Odyssey', year_start: 2005, year_end: 2010,
    key_blank: 'N/A', transponder_type: null, chip_type: null,
    remote_frequency: '315 MHz', key_type: 'standard',
    fcc_id: 'OUCG8D-399H-A', ic_number: '850G-G8D399HA',
    battery_type: 'CR2025', buttons: 'Lock, Unlock, Left Door, Right Door, Hatch, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/OR-HON011.jpg',
    programming_notes: '3rd gen Odyssey. 6-button standalone keyless remote. 315 MHz. On-board programmable (remote only). Does NOT contain transponder chip.',
  },
  // 2011-2013 Odyssey - Remote Head Key (N5F-A04TAA)
  {
    model: 'Odyssey', year_start: 2011, year_end: 2013,
    key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: '314 MHz', key_type: 'transponder',
    fcc_id: 'N5F-A04TAA', ic_number: '3248A-A04TAA',
    battery_type: 'CR2025', buttons: 'Lock, Unlock, Panic, Left Door, Right Door, Hatch',
    emergency_key_blank: null, test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RHK-HON024.jpg',
    programming_notes: '4th gen Odyssey. 6-button remote head key with Philips ID 46. 314 MHz. N5F-A04TAA. OBD programmable.',
  },
  // 2014-2017 Odyssey EXL - Smart Key (KR5V1X, 6-button)
  {
    model: 'Odyssey', year_start: 2014, year_end: 2017,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR5V1X', ic_number: '7812D-V1X',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Left Door, Right Door, Hatch, Panic',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-ODY-6.jpg',
    programming_notes: '4th gen Odyssey EXL. 6-button smart key. 315 MHz. KR5V1X. Honda HDS or aftermarket tool.',
  },
  // 2014-2017 Odyssey Touring - Smart Key (KR5V1X, 5-button)
  {
    model: 'Odyssey', year_start: 2014, year_end: 2017,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR5V1X', ic_number: '7812D-V1X',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Left Door, Right Door, Panic',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-ODY-6.jpg',
    programming_notes: '4th gen Odyssey Touring/Elite. 5-button smart key. 315 MHz. KR5V1X. Honda HDS or aftermarket.',
  },
  // 2018-2020 Odyssey EX - Smart Key (KR5V2X V41, 7-button)
  {
    model: 'Odyssey', year_start: 2018, year_end: 2020,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5V2X', ic_number: '7812D-V2X',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Left Door, Right Door, Hatch, Remote Start, Panic',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/ILCO-AX00018190_1.jpg',
    programming_notes: '5th gen Odyssey EX. 7-button smart key. 433 MHz. KR5V2X (V41 variant). Honda HDS or aftermarket.',
  },
  // 2021-2022 Odyssey EXL/Touring/Elite - Smart Key (KR5T4X, 7-button)
  {
    model: 'Odyssey', year_start: 2021, year_end: 2022,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5T4X', ic_number: '7812D-T4X',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Left Door, Right Door, Hatch, Remote Start',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-RA61.jpg',
    programming_notes: '5th gen Odyssey (2021-2022). 7-button smart key. 433 MHz. KR5T4X. EXL/Touring/Elite trims. Honda HDS or aftermarket.',
  },
  // 2025-2026 Odyssey - Smart Key (KR5TP-4, 7-button)
  {
    model: 'Odyssey', year_start: 2025, year_end: 2026,
    key_blank: 'LXP90', transponder_type: 'HITAG-AES', chip_type: '4A',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5TP-4', ic_number: '7812D-TP4',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Left Door, Right Door, Hatch, Remote Start',
    emergency_key_blank: 'LXP90', test_key_blank: 'LXP90',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON77',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-HON-THR-AB1_1.jpg',
    programming_notes: '2025-2026 Odyssey. 7-button smart key with HITAG-AES 4A chip. 433 MHz. KR5TP-4. New LXP90 blade.',
  },

  // ===== HONDA RIDGELINE =====
  // 2006-2014 Ridgeline - Transponder key (HO03, 46 chip)
  {
    model: 'Ridgeline', year_start: 2006, year_end: 2014,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO03.jpg',
    programming_notes: '1st gen Ridgeline. Transponder-only key with Philips ID 46. Separate keyless entry remote. OBD programmable.',
  },
  // 2006-2014 Ridgeline - Remote Head Key (OUCG8D-380H-A)
  {
    model: 'Ridgeline', year_start: 2006, year_end: 2014,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: '314 MHz', key_type: 'transponder',
    fcc_id: 'OUCG8D-380H-A', ic_number: '850G-G8D380HA',
    battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-HON-401_93059007-3c1b-40bc-b74a-39cfa4b1f064.jpg',
    programming_notes: '1st gen Ridgeline. Remote head key with Philips ID 46. 314 MHz. Remote supports on-board programming.',
  },
  // 2017-2019 Ridgeline - Smart Key (A2C97488400, 4-button)
  {
    model: 'Ridgeline', year_start: 2017, year_end: 2019,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'A2C97488400', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/2017-2019-honda-ridgeline-4-button-smart-key-pn-72147-t6z-a11-a2c97488400-no-memory-oem-595.jpg',
    programming_notes: '2nd gen Ridgeline (2017-2019). 4-button smart key. 434 MHz (433.92). A2C97488400. Honda HDS or aftermarket.',
  },
  // 2020-2024 Ridgeline - Smart Key (KR5T41, 4-button)
  {
    model: 'Ridgeline', year_start: 2020, year_end: 2024,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'KR5T41', ic_number: '7812D-T41',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-ZA51.jpg',
    programming_notes: '2nd gen Ridgeline (2020-2024). 4-button smart key. 434 MHz. KR5T41. Honda HDS or aftermarket.',
  },

  // ===== HONDA PASSPORT =====
  // 2019-2024 Passport - Smart Key (KR5V44/KR5T44, 5-button)
  {
    model: 'Passport', year_start: 2019, year_end: 2025,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'KR5V44', ic_number: '7812D-V44',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-7A61.jpg',
    programming_notes: 'Honda Passport. 5-button smart key. 433 MHz. KR5V44/KR5T44. All trims use smart key. Honda HDS or aftermarket.',
  },

  // ===== HONDA FIT =====
  // 2007-2008 Fit - Transponder only (HD113, 8E chip)
  {
    model: 'Fit', year_start: 2007, year_end: 2008,
    key_blank: 'HD113', transponder_type: 'Megamos 8E', chip_type: 'ID 8E',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HD113_A.jpg',
    programming_notes: '1st gen Fit (US). Transponder-only key with Megamos ID 8E chip. HD113 blank. OBD programmable.',
  },
  // 2009-2014 Fit - Transponder only (HO03, 46 chip)
  {
    model: 'Fit', year_start: 2009, year_end: 2014,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO03.jpg',
    programming_notes: '2nd gen Fit. Transponder-only key with Philips ID 46 chip. OBD programmable.',
  },
  // 2015-2020 Fit LX - Transponder only (HO05, G chip)
  {
    model: 'Fit', year_start: 2015, year_end: 2020,
    key_blank: 'HO05', transponder_type: 'Philips 47 Honda G', chip_type: 'ID 47 (G Chip)',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO05_7af7b180-30c6-4269-b981-06ef76ffd061.jpg',
    programming_notes: '3rd gen Fit LX. Transponder-only key. HO05 blank with Honda G chip. OBD programmable.',
  },
  // 2015-2017 Fit EX - Smart Key (KR5V1X, 3-button)
  {
    model: 'Fit', year_start: 2015, year_end: 2017,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR5V1X', ic_number: '7812D-V1X',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-V1X.jpg',
    programming_notes: '3rd gen Fit EX/EX-L. 3-button smart key. 315 MHz. KR5V1X. Honda HDS or aftermarket.',
  },
  // 2018-2020 Fit EX - Smart Key (KR5V1X, 4-button)
  {
    model: 'Fit', year_start: 2018, year_end: 2020,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '314 MHz', key_type: 'smart_key',
    fcc_id: 'KR5V1X', ic_number: '7812D-V1X',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RSK-HON-V1X.jpg',
    programming_notes: '3rd gen Fit EX/EX-L (2018-2020). 4-button smart key. 314 MHz. KR5V1X. Honda HDS or aftermarket.',
  },

  // ===== HONDA ELEMENT =====
  // 2003-2005 Element - Transponder only (HO03, 46 chip)
  {
    model: 'Element', year_start: 2003, year_end: 2011,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO03.jpg',
    programming_notes: 'Honda Element. Transponder-only key with Philips ID 46 chip. Separate keyless remote. OBD programmable.',
  },
  // 2003-2010 Element - Remote Head Key (OUCG8D-380H-A)
  {
    model: 'Element', year_start: 2003, year_end: 2011,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: '314 MHz', key_type: 'transponder',
    fcc_id: 'OUCG8D-380H-A', ic_number: '850G-G8D380HA',
    battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-HON-401_93059007-3c1b-40bc-b74a-39cfa4b1f064.jpg',
    programming_notes: 'Honda Element. Remote head key with Philips ID 46 chip. 314 MHz. OUCG8D-380H-A.',
  },

  // ===== HONDA S2000 =====
  // 2000-2007 S2000 - Transponder only (HD113, 8E chip)
  {
    model: 'S2000', year_start: 2000, year_end: 2007,
    key_blank: 'HD113', transponder_type: 'Megamos 8E', chip_type: 'ID 8E',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HD113_A.jpg',
    programming_notes: 'S2000 (AP1/AP2). Transponder-only key with Megamos ID 8E chip. HD113 blank. OBD programmable.',
  },
  // 2008-2009 S2000 - Transponder only (HO03, 46 chip)
  {
    model: 'S2000', year_start: 2008, year_end: 2009,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO03.jpg',
    programming_notes: 'S2000 CR (2008-2009). Transponder-only key with Philips ID 46 chip. HO03 blank. OBD programmable.',
  },

  // ===== HONDA INSIGHT =====
  // 2010-2014 Insight - Transponder (HO03, 46 chip)
  {
    model: 'Insight', year_start: 2010, year_end: 2014,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO03.jpg',
    programming_notes: '2nd gen Insight hybrid. Transponder-only key with Philips ID 46 chip. OBD programmable.',
  },
  // 2019-2022 Insight - Smart Key (CWTWB1G0090, same as Accord)
  {
    model: 'Insight', year_start: 2019, year_end: 2022,
    key_blank: 'HO01', transponder_type: 'Hitag 3', chip_type: 'ID 47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'CWTWB1G0090', ic_number: '1788F-FWB1G0090',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Trunk, Panic, Remote Start',
    emergency_key_blank: 'HO01', test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/KFZ1.png',
    programming_notes: '3rd gen Insight hybrid. 5-button smart key. 433 MHz. CWTWB1G0090 (same as Accord). Honda HDS or aftermarket.',
  },

  // ===== HONDA CROSSTOUR =====
  // 2010-2012 Crosstour - Remote Head Key (KR55WK49308)
  {
    model: 'Crosstour', year_start: 2010, year_end: 2012,
    key_blank: 'HO01', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: '314 MHz', key_type: 'transponder',
    fcc_id: 'KR55WK49308', ic_number: '267T-5WK49308',
    battery_type: 'CR1616', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RHK-HON-ACC2.jpg',
    programming_notes: 'Accord Crosstour. Remote head key, Philips ID 46. 314 MHz. KR55WK49308. Same as 2008-2012 Accord.',
  },
  // 2010-2014 Crosstour - Transponder (HO03, 46 chip)
  {
    model: 'Crosstour', year_start: 2010, year_end: 2015,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO03.jpg',
    programming_notes: 'Crosstour. Transponder-only key with Philips ID 46. OBD programmable.',
  },
  // 2013-2015 Crosstour - Remote Head Key (MLBHLIK6-1T, G chip)
  {
    model: 'Crosstour', year_start: 2013, year_end: 2015,
    key_blank: 'HO01', transponder_type: 'Philips 47 Honda G', chip_type: 'ID 47 (G Chip)',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'MLBHLIK6-1T', ic_number: '2500A-HLIK61T',
    battery_type: 'CR1620', buttons: 'Lock, Unlock, Trunk, Panic',
    emergency_key_blank: null, test_key_blank: 'HO01',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/RK-HON-35118.jpg',
    programming_notes: 'Crosstour (2013-2015). Remote head key with Philips ID 47 Honda G chip. 315 MHz. MLBHLIK6-1T.',
  },

  // ===== HONDA PRELUDE =====
  // 1997-2001 Prelude - Transponder (HD113, 8E chip)
  {
    model: 'Prelude', year_start: 1997, year_end: 2001,
    key_blank: 'HD113', transponder_type: 'Megamos 8E', chip_type: 'ID 8E',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HD113_A.jpg',
    programming_notes: '5th gen Prelude. Transponder key with Megamos ID 8E chip. HD113 blank. Requires Honda HDS or aftermarket tool. Not self-learnable.',
  },

  // ===== HONDA CR-Z =====
  // 2011-2015 CR-Z - Transponder (HO03, 46 chip)
  {
    model: 'CR-Z', year_start: 2011, year_end: 2016,
    key_blank: 'HO03', transponder_type: 'Philips 46', chip_type: 'ID 46',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HON66',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/products/K-HO03.jpg',
    programming_notes: 'CR-Z hybrid coupe. Transponder-only key with Philips ID 46. OBD programmable.',
  },

  // ===== HONDA PROLOGUE =====
  // 2024-2025 Prologue - Smart Key (YG0G21TB2, GM platform)
  {
    model: 'Prologue', year_start: 2024, year_end: 2025,
    key_blank: 'HU100', transponder_type: 'NXP HITAG-PRO ID49', chip_type: 'ID 49 (128 Bit)',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'YG0G21TB2', ic_number: '4008C-G21TB2',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Hatch, Panic, Remote Start',
    emergency_key_blank: 'HU100', test_key_blank: 'HU100',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU100',
    image_url: 'https://cdn.shopify.com/s/files/1/0052/5395/5651/files/RSK-HON-24679.jpg',
    programming_notes: 'Honda Prologue EV on GM Ultium platform. Uses GM key system - NOT standard Honda. 5-button smart key. 434 MHz. YG0G21TB2. GM SPS/TIS2Web or Autel IM608. Emergency key is HU100 (GM style), not Honda HON66.',
  },
];


async function main() {
  await client.connect();
  console.log('Connected to database.\n');

  try {
    // 1. Show current Honda keys count
    const currentRes = await client.query(
      "SELECT COUNT(*) as count FROM automotive_keys WHERE model_name ILIKE '%Honda%'"
    );
    console.log(`Current Honda key rows: ${currentRes.rows[0].count}`);

    // 2. Delete ALL existing Honda keys
    console.log('\nDeleting all existing Honda key rows...');
    const deleteRes = await client.query(
      "DELETE FROM automotive_keys WHERE model_name ILIKE '%Honda%'"
    );
    console.log(`Deleted ${deleteRes.rowCount} rows.`);

    // 3. Delete existing Honda vehicle_years entries (we'll recreate them)
    const hondaModelIds = Object.values(MODEL_IDS);
    console.log('\nDeleting existing Honda vehicle_years...');
    const deleteYearsRes = await client.query(
      `DELETE FROM vehicle_years WHERE model_id = ANY($1::uuid[])`,
      [hondaModelIds]
    );
    console.log(`Deleted ${deleteYearsRes.rowCount} vehicle_years rows.`);

    // 4. Insert new accurate Honda keys
    console.log('\nInserting new accurate Honda key data from UHS Hardware...\n');

    let insertedCount = 0;

    for (const key of hondaKeys) {
      const modelId = MODEL_IDS[key.model];
      if (!modelId) {
        console.error(`ERROR: No model ID found for model: ${key.model}`);
        continue;
      }

      // Create or reuse vehicle_year entry (unique on model_id + year_start + year_end)
      const yearRes = await client.query(
        `INSERT INTO vehicle_years (id, model_id, year_start, year_end)
         VALUES (gen_random_uuid(), $1, $2, $3)
         ON CONFLICT (model_id, year_start, year_end) DO UPDATE SET year_start = EXCLUDED.year_start
         RETURNING id`,
        [modelId, key.year_start, key.year_end]
      );
      const yearId = yearRes.rows[0].id;

      // Insert the automotive_keys entry
      await client.query(
        `INSERT INTO automotive_keys (
          id, year_id, manufacturer_id, model_name,
          key_blank, transponder_type, chip_type, remote_frequency,
          key_type, fcc_id, ic_number, programming_notes,
          pin_code_required, obd_programmable, emergency_key_blank,
          year_start, year_end, battery_type, buttons,
          test_key_blank, image_url, lishi_tool
        ) VALUES (
          gen_random_uuid(), $1, $2, $3,
          $4, $5, $6, $7,
          $8, $9, $10, $11,
          $12, $13, $14,
          $15, $16, $17, $18,
          $19, $20, $21
        )`,
        [
          yearId,
          HONDA_MFR_ID,
          `Honda ${key.model}`,
          key.key_blank,
          key.transponder_type,
          key.chip_type,
          key.remote_frequency,
          key.key_type,
          key.fcc_id,
          key.ic_number,
          key.programming_notes,
          key.pin_code_required,
          key.obd_programmable,
          key.emergency_key_blank,
          key.year_start,
          key.year_end,
          key.battery_type,
          key.buttons,
          key.test_key_blank,
          key.image_url,
          key.lishi_tool,
        ]
      );

      insertedCount++;
      console.log(`  [${insertedCount}] Honda ${key.model} ${key.year_start}-${key.year_end} | ${key.key_type} | FCC: ${key.fcc_id || 'N/A'} | ${key.remote_frequency || 'N/A'} | ${key.chip_type}`);
    }

    console.log(`\nInserted ${insertedCount} new Honda key rows.`);

    // 5. Verify by selecting all Honda keys
    console.log('\n' + '='.repeat(80));
    console.log('VERIFICATION - All Honda keys now in database:');
    console.log('='.repeat(80) + '\n');

    const verifyRes = await client.query(
      `SELECT model_name, year_start, year_end, key_type, key_blank,
              chip_type, fcc_id, remote_frequency, battery_type, buttons,
              ic_number, emergency_key_blank, lishi_tool
       FROM automotive_keys
       WHERE model_name ILIKE '%Honda%'
       ORDER BY model_name, year_start, key_type`
    );

    for (const row of verifyRes.rows) {
      console.log(`${row.model_name} (${row.year_start}-${row.year_end})`);
      console.log(`  Type: ${row.key_type} | Blank: ${row.key_blank} | Chip: ${row.chip_type || 'N/A'}`);
      console.log(`  FCC: ${row.fcc_id || 'N/A'} | IC: ${row.ic_number || 'N/A'} | Freq: ${row.remote_frequency || 'N/A'}`);
      console.log(`  Battery: ${row.battery_type || 'N/A'} | Buttons: ${row.buttons || 'N/A'}`);
      console.log(`  Emergency: ${row.emergency_key_blank || 'N/A'} | Lishi: ${row.lishi_tool || 'N/A'}`);
      console.log('');
    }

    console.log(`\nTotal Honda key rows: ${verifyRes.rows.length}`);

  } catch (err) {
    console.error('ERROR:', err.message);
    console.error(err.stack);
  } finally {
    await client.end();
    console.log('\nDatabase connection closed.');
  }
}

main();
