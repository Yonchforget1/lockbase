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

// Ford manufacturer_id
const FORD_MFR_ID = '77d79363-9036-4db2-9958-8a32439e6a92';

// UHS Hardware Shopify CDN base
const UHS_CDN = 'https://cdn.shopify.com/s/files/1/0525/3955/6651/products';

// Image URLs sourced from UHS Hardware product pages
const IMG = {
  h72_transponder:     `${UHS_CDN}/Ford-Lincoln-Mercury-Mazda-H72-Transponder-Key-4C-AFTERMARKET.jpg`,
  h84_40bit:           `${UHS_CDN}/H84-Ford-Transponder-Key-40-Bit-AFTERMARKET_1024x1024.jpg`,
  h92_80bit:           `${UHS_CDN}/2000-2017-Ford-H92-H84-Transponder-Key-4D63-80-Bit-Chip-AFTERMARKET_5e7add35-40f4-4c0a-8ba3-3bbb6ef1e1a0.jpg`,
  h86_transponder:     `${UHS_CDN}/Ford-Lincoln-Mercury-Mazda-H72-Transponder-Key-4C-AFTERMARKET.jpg`,
  // Remote head keys
  rhk_cwtwb1u793:      `${UHS_CDN}/ford-4-button-remote-head-key-cwtwb1u793-ouc6000022.jpg`,
  rhk_oucd6000022:     `${UHS_CDN}/ford-4-button-remote-head-key-oucd6000022-164-r8046.jpg`,
  // Flip keys
  flip_n5f_a08taa_3b:  `${UHS_CDN}/2015-2022-Ford-3-Button-Flip-Key-PN-164-R8130-N5F-A08TAA-AFTERMARKET.jpg`,
  flip_n5f_a08taa_4b:  `${UHS_CDN}/2013-2016-Ford-Fusion-4-Button-Flip-Key-PN-164-R7986-N5F-A08TAA.jpg`,
  flip_transit_4b:     `${UHS_CDN}/2019-2020-Ford-Transit-4-Button-Flip-Key-PN-164-R8236-N5F-A08TAA.jpg`,
  // Smart keys
  smart_m3n_a2c31243300: `${UHS_CDN}/2013-2017-Ford-5-Button-PEPS-Smart-Key-PN-164-R7989-M3N-A2C31243300-OEM.jpg`,
  smart_m3n_a2c31243800: `${UHS_CDN}/2015-2017-Ford-Mustang-4-Button-Smart-Key-PN-164-R8120-M3N-A2C31243800.jpg`,
  smart_m3n_a2c93142600_5b: `${UHS_CDN}/2017-2024-ford-f-series-5-button-smart-key-pn-164-r8166-m3n-a2c93142600-oem-recase_900x.jpg`,
  smart_m3n_a2c93142600_hatch: `${UHS_CDN}/2017-2022-Ford-5-Button-Smart-Key-PN-164-R8149-M3N-A2C93142600.jpg`,
  smart_m3n_a2c93142300: `${UHS_CDN}/2017-2024-Ford-Smart-Key-3B-PN-164-R8163-M3N-A2C93142300.jpg`,
  smart_m3n_a2c931426:  `${UHS_CDN}/2018-2023-Ford-5-Button-Smart-Key-PN-164-R8198-M3N-A2C931426-AFTERMARKET.jpg`,
  smart_m3n_a3c054339:  `${UHS_CDN}/2017-2022-Ford-Super-Duty-Smart-Key-M3N-A3C054339.jpg`,
  smart_m3n_a3c108397:  `${UHS_CDN}/2023-2024-Ford-F-Series-5-Button-Smart-Key-PN-164-R8330-M3N-A3C108397.jpg`,
  // Transit remote head
  transit_rhk:         `${UHS_CDN}/2015-2020-Ford-Transit-Remote-Head-Key-OUCD6000022-164-R8126.jpg`,
};

// ============================================================
// ACCURATE FORD KEY DATA
// Sourced from: UHS Hardware, Locksmith Charley, Transpondery.com,
// BestKeySolution, LocksmithKeyless, American Key Supply
// ============================================================
const fordKeys = [

  // =====================================================
  // FORD F-150
  // =====================================================

  // 1999-2003 F-150 - Transponder Key (4C chip, PATS)
  {
    model: 'Ford F-150', year_start: 1999, year_end: 2003,
    key_blank: 'H72-PT', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h72_transponder,
    programming_notes: 'PATS system with Texas 4C transponder chip. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost. H72 key blade profile.',
  },
  // 2004 F-150 Heritage - still 4C
  {
    model: 'Ford F-150', year_start: 2004, year_end: 2004,
    key_blank: 'H72-PT', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h72_transponder,
    programming_notes: 'F-150 Heritage model still uses PATS 4C transponder. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.',
  },
  // 2004-2010 F-150 (new body) - Transponder Key 4D63 (PATS 3/4/5 CAN)
  {
    model: 'Ford F-150', year_start: 2004, year_end: 2010,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'PATS system with 4D63 transponder. 2004-2008 use PATS 3 CAN, 2009-2010 use PATS 5 CAN. Remote head key with 4 buttons. On-board programming with 2 working keys or Ford IDS with PIN code.',
  },
  // 2011-2014 F-150 - 80-bit upgrade
  {
    model: 'Ford F-150', year_start: 2011, year_end: 2014,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 80-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h92_80bit,
    programming_notes: '80-bit PATS system. Remote head key. On-board programming with 2 working keys. Ford IDS/FDRS with security code for all-keys-lost. 80-bit keys NOT backward compatible with 40-bit systems.',
  },
  // 2015-2017 F-150 - Flip Key (HITAG PRO 128-bit, N5F-A08TAA)
  {
    model: 'Ford F-150', year_start: 2015, year_end: 2017,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'N5F-A08TAA', ic_number: '3248A-A08TAA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.flip_n5f_a08taa_3b,
    programming_notes: 'Remote flip key with HU101 high-security blade. HITAG PRO ID49 128-bit chip. Requires Ford IDS/FDRS or compatible aftermarket tool (Autel IM608, SmartPro). PIN code often required for all-keys-lost.',
  },
  // 2015-2017 F-150 - Smart Key (M3N-A2C31243800 at 315 MHz) - higher trims
  {
    model: 'Ford F-150', year_start: 2015, year_end: 2017,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C31243800', ic_number: '7812A-A2C31243800',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c31243800,
    programming_notes: 'Intelligent Access smart key (push-button start) on Lariat, King Ranch, Platinum trims. 315 MHz. Ford IDS/FDRS or compatible aftermarket tool required. Must have admin key or security code.',
  },
  // 2017-2022 F-150 - Smart Key (M3N-A2C93142600 at 902 MHz) - 5-button with Tailgate
  {
    model: 'Ford F-150', year_start: 2017, year_end: 2022,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '902 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C93142600', ic_number: '7812A-A2C93142600',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c93142600_5b,
    programming_notes: 'Intelligent Access 5-button smart key with tailgate release. 902 MHz. PN: 164-R8166. Ford IDS/FDRS or Autel IM608/SmartPro. 2017 models may overlap with 315 MHz version.',
  },
  // 2018-2022 F-150 - Flip Key option (N5F-A08TAA)
  {
    model: 'Ford F-150', year_start: 2018, year_end: 2022,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'N5F-A08TAA', ic_number: '3248A-A08TAA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.flip_n5f_a08taa_3b,
    programming_notes: 'Remote flip key option for XL/XLT trims without push-button start. PN: 164-R8269. HU101 blade. Ford IDS/FDRS or aftermarket tool required.',
  },
  // 2023-2025 F-150 - New generation smart key (M3N-A3C108397)
  {
    model: 'Ford F-150', year_start: 2023, year_end: 2025,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A3C108397', ic_number: '7812-A3C108397',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a3c108397,
    programming_notes: 'New generation 14th gen F-150 smart key. PN: 164-R8330/164-R8365/164-R8370. 434 MHz frequency (changed from 902 MHz). Requires Ford FDRS or latest generation aftermarket tools.',
  },

  // =====================================================
  // FORD F-250 / F-350 SUPER DUTY
  // =====================================================

  // 1999-2007 Super Duty - NO TRANSPONDER (non-PATS)
  {
    model: 'Ford F-250/F-350 Super Duty', year_start: 1999, year_end: 2007,
    key_blank: 'H75', transponder_type: null, chip_type: null,
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: 'Lishi FO38',
    image_url: `${UHS_CDN}/Ford-H75-Non-Transponder-Key-Blank.jpg`,
    programming_notes: 'No transponder/PATS on 1999-2007 Super Duty trucks. Standard mechanical key only. H75 key blank, 8-cut Ford keyway.',
  },
  // 2008-2010 Super Duty - 4D63 transponder (PATS 4/5 CAN)
  {
    model: 'Ford F-250/F-350 Super Duty', year_start: 2008, year_end: 2010,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'First Super Duty generation with PATS transponder. 4D63 chip. Remote head key. On-board programming with 2 working keys. Ford IDS with PIN for all-keys-lost.',
  },
  // 2011-2016 Super Duty - 80-bit
  {
    model: 'Ford F-250/F-350 Super Duty', year_start: 2011, year_end: 2016,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 80-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h92_80bit,
    programming_notes: '80-bit PATS. Remote head key. On-board with 2 working keys. Ford IDS with security code for all-keys-lost.',
  },
  // 2017-2022 Super Duty - Flip Key (N5F-A08TAA)
  {
    model: 'Ford F-250/F-350 Super Duty', year_start: 2017, year_end: 2022,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'N5F-A08TAA', ic_number: '3248A-A08TAA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.flip_n5f_a08taa_3b,
    programming_notes: 'Remote flip key with HU101 blade. HITAG PRO ID49 128-bit. PN: 164-R8130. Ford IDS/FDRS or compatible aftermarket tool.',
  },
  // 2017-2022 Super Duty - Smart Key option (M3N-A3C054339)
  {
    model: 'Ford F-250/F-350 Super Duty', year_start: 2017, year_end: 2022,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '902 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A3C054339', ic_number: '7812A-A3C054339',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a3c054339,
    programming_notes: 'Intelligent Access smart key on Lariat and above trims. 902 MHz. Ford IDS/FDRS or compatible tool required.',
  },
  // 2023-2025 Super Duty - New gen smart key
  {
    model: 'Ford F-250/F-350 Super Duty', year_start: 2023, year_end: 2025,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A3C108397', ic_number: '7812-A3C108397',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a3c108397,
    programming_notes: 'New generation Super Duty smart key. PN: 164-R8330. 434 MHz. Requires Ford FDRS or latest aftermarket tools.',
  },

  // =====================================================
  // FORD EXPLORER
  // =====================================================

  // 1998-2001 Explorer - 4C
  {
    model: 'Ford Explorer', year_start: 1998, year_end: 2001,
    key_blank: 'H72-PT', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h72_transponder,
    programming_notes: '3rd gen Explorer. PATS 2 with 4C transponder. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.',
  },
  // 2001-2005 Explorer - 4D63
  {
    model: 'Ford Explorer', year_start: 2002, year_end: 2005,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U345', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'PATS 3 with 4D63 transponder. Remote head key. On-board with 2 working keys. Ford IDS with PIN for all-keys-lost.',
  },
  // 2006-2010 Explorer - 4D63 (PATS 4 CAN / Ford 2010 CAN)
  {
    model: 'Ford Explorer', year_start: 2006, year_end: 2010,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '4th gen Explorer. 4D63 transponder. PATS 4 CAN (2006-2009), Ford 2010 CAN (2010). On-board with 2 keys or Ford IDS with PIN.',
  },
  // 2011-2015 Explorer - 80-bit (remote head key)
  {
    model: 'Ford Explorer', year_start: 2011, year_end: 2015,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 80-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h92_80bit,
    programming_notes: '5th gen Explorer. 80-bit PATS. Remote head key option for base/XLT trims. On-board with 2 keys or Ford IDS with security code.',
  },
  // 2013-2017 Explorer - Smart Key (M3N-A2C31243300, 902 MHz)
  {
    model: 'Ford Explorer', year_start: 2013, year_end: 2017,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '902 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C31243300', ic_number: '7812A-A2C31243300',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c31243300,
    programming_notes: '5th gen Explorer smart key on Limited/Sport trims. PN: 164-R7989. Push-button start. Ford IDS/FDRS or aftermarket tool required.',
  },
  // 2016-2017 Explorer - Smart Key (M3N-A2C31243800, 315 MHz)
  {
    model: 'Ford Explorer', year_start: 2016, year_end: 2017,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C31243800', ic_number: '7812A-A2C31243800',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c31243800,
    programming_notes: '5th gen Explorer smart key. PN: 164-R8109. 315 MHz variant. Ford IDS/FDRS or compatible tool.',
  },
  // 2018-2019 Explorer - Smart Key (M3N-A2C93142600, 902 MHz)
  {
    model: 'Ford Explorer', year_start: 2018, year_end: 2019,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '902 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C93142600', ic_number: '7812A-A2C93142600',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c93142600_hatch,
    programming_notes: '5th gen Explorer facelift. PN: 164-R8149. 902 MHz smart key. Ford IDS/FDRS or Autel/SmartPro.',
  },
  // 2020-2024 Explorer - Smart Key (M3N-A2C93142600, 902 MHz, new gen)
  {
    model: 'Ford Explorer', year_start: 2020, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '902 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C93142600', ic_number: '7812A-A2C93142600',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c93142600_hatch,
    programming_notes: '6th gen Explorer. Smart key standard on all trims. PN: 164-R8244/164-R8278. Ford IDS/FDRS or Autel IM608/SmartPro required.',
  },

  // =====================================================
  // FORD ESCAPE
  // =====================================================

  // 2001-2004 Escape - 4D60
  {
    model: 'Ford Escape', year_start: 2001, year_end: 2004,
    key_blank: 'H86-PT', transponder_type: 'Texas Crypto 4D60', chip_type: '4D60',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h86_transponder,
    programming_notes: '1st gen Escape. 4D60 transponder (not 4C, not 4D63). On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.',
  },
  // 2005-2007 Escape - 4D63
  {
    model: 'Ford Escape', year_start: 2005, year_end: 2007,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '1st gen Escape facelift. PATS 3 with 4D63 chip. On-board with 2 working keys. Ford IDS with PIN for all-keys-lost.',
  },
  // 2008-2012 Escape - 4D63 (PATS 4/5)
  {
    model: 'Ford Escape', year_start: 2008, year_end: 2012,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '2nd gen Escape. PATS 4 CAN (2008), PATS 5 CAN (2009-2012). Remote head key. On-board with 2 keys or Ford IDS with PIN.',
  },
  // 2013-2016 Escape - 80-bit (remote head key option)
  {
    model: 'Ford Escape', year_start: 2013, year_end: 2016,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 80-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h92_80bit,
    programming_notes: '3rd gen Escape. 80-bit PATS transponder. Remote head key on S/SE trims. On-board with 2 keys or Ford IDS with security code.',
  },
  // 2013-2019 Escape - Smart Key (higher trims, M3N-A2C31243300)
  {
    model: 'Ford Escape', year_start: 2013, year_end: 2019,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '902 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C31243300', ic_number: '7812A-A2C31243300',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c31243300,
    programming_notes: '3rd gen Escape smart key on Titanium trim. PN: 164-R7989. Push-button start. Ford IDS/FDRS or compatible aftermarket tool.',
  },
  // 2020-2024 Escape - Smart Key (M3N-A2C93142300, 315 MHz)
  {
    model: 'Ford Escape', year_start: 2020, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C93142300', ic_number: '7812A-A2C93142300',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c93142300,
    programming_notes: '4th gen Escape. Smart key standard. PN: 164-R8197. 315 MHz. Ford IDS/FDRS or Autel IM608/SmartPro required.',
  },

  // =====================================================
  // FORD EDGE
  // =====================================================

  // 2007-2010 Edge - 4D63
  {
    model: 'Ford Edge', year_start: 2007, year_end: 2010,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '1st gen Edge. PATS 4 CAN (2007-2009), Ford 2010 CAN (2010). 4D63 transponder. On-board with 2 keys or Ford IDS.',
  },
  // 2011-2014 Edge - 80-bit
  {
    model: 'Ford Edge', year_start: 2011, year_end: 2014,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 80-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h92_80bit,
    programming_notes: '1st gen Edge facelift. 80-bit PATS. Remote head key. On-board with 2 keys or Ford IDS with security code.',
  },
  // 2015-2018 Edge - Smart Key (M3N-A2C31243300)
  {
    model: 'Ford Edge', year_start: 2015, year_end: 2018,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '902 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C31243300', ic_number: '7812A-A2C31243300',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c31243300,
    programming_notes: '2nd gen Edge. Smart key with push-button start standard. PN: 164-R7989. Ford IDS/FDRS or aftermarket tool.',
  },
  // 2019-2024 Edge - Smart Key (M3N-A2C93142600, 902 MHz)
  {
    model: 'Ford Edge', year_start: 2019, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '902 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C93142600', ic_number: '7812A-A2C93142600',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c93142600_hatch,
    programming_notes: '2nd gen Edge facelift. PN: 164-R8149/164-R8182. 902 MHz. Ford IDS/FDRS or Autel IM608/SmartPro.',
  },

  // =====================================================
  // FORD EXPEDITION
  // =====================================================

  // 1997-2002 Expedition - 4C
  {
    model: 'Ford Expedition', year_start: 1997, year_end: 2002,
    key_blank: 'H72-PT', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h72_transponder,
    programming_notes: '1st gen Expedition. PATS with 4C transponder. On-board with 2 working keys (OBP/HEC system). Ford IDS for all-keys-lost.',
  },
  // 2003-2006 Expedition - 4D60/4D63
  {
    model: 'Ford Expedition', year_start: 2003, year_end: 2006,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '2nd gen Expedition. 4D63 transponder. PATS 3 CAN. On-board with 2 keys or Ford IDS with security code.',
  },
  // 2007-2010 Expedition - 4D63 (PATS 4/5)
  {
    model: 'Ford Expedition', year_start: 2007, year_end: 2010,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '3rd gen Expedition. PATS 4 CAN. Remote head key. On-board with 2 keys or Ford IDS with PIN.',
  },
  // 2011-2017 Expedition - 80-bit
  {
    model: 'Ford Expedition', year_start: 2011, year_end: 2017,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 80-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h92_80bit,
    programming_notes: '3rd gen Expedition. 80-bit PATS. On-board with 2 keys or Ford IDS with security code for all-keys-lost.',
  },
  // 2018-2024 Expedition - Smart Key (M3N-A2C93142300, 315 MHz)
  {
    model: 'Ford Expedition', year_start: 2018, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C93142300', ic_number: '7812A-A2C93142300',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c93142300,
    programming_notes: '4th gen Expedition. Smart key standard. PN: 164-R8197. HITAG PRO 128-bit. Ford IDS/FDRS or Autel IM608/SmartPro.',
  },

  // =====================================================
  // FORD RANGER
  // =====================================================

  // 1999-2000 Ranger - 4C
  {
    model: 'Ford Ranger', year_start: 1999, year_end: 2000,
    key_blank: 'H72-PT', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h72_transponder,
    programming_notes: 'PATS 2 with 4C transponder. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.',
  },
  // 2001-2005 Ranger - 4D63
  {
    model: 'Ford Ranger', year_start: 2001, year_end: 2005,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'PATS with 4D63 chip. Transponder key only (no remote). On-board with 2 keys or Ford IDS.',
  },
  // 2006-2011 Ranger - 4D63 (PATS 4 CAN)
  {
    model: 'Ford Ranger', year_start: 2006, year_end: 2011,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'Ranger with 4D63 chip. Remote head key option. PATS 4 CAN (2007-2010), 80-bit CAN (2011). On-board with 2 keys or Ford IDS.',
  },
  // 2019-2023 Ranger - Smart Key (M3N-A2C93142300)
  {
    model: 'Ford Ranger', year_start: 2019, year_end: 2023,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C93142300', ic_number: '7812A-A2C93142300',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c93142300,
    programming_notes: 'Reintroduced Ranger (mid-size truck). Smart key. PN: 164-R8163. Ford IDS/FDRS or Autel/SmartPro.',
  },
  // 2019-2023 Ranger - Flip Key option (N5F-A08TAA)
  {
    model: 'Ford Ranger', year_start: 2019, year_end: 2023,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'N5F-A08TAA', ic_number: '3248A-A08TAA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.flip_n5f_a08taa_3b,
    programming_notes: 'Ranger flip key on XL/XLT trims without push-button start. PN: 164-R8130. HU101 blade. Ford IDS/FDRS or aftermarket tool.',
  },
  // 2024-2025 Ranger - New gen
  {
    model: 'Ford Ranger', year_start: 2024, year_end: 2025,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A3C108397', ic_number: '7812-A3C108397',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Tailgate, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a3c108397,
    programming_notes: 'New generation Ranger (2024+). 434 MHz smart key. Requires Ford FDRS or latest aftermarket tools.',
  },

  // =====================================================
  // FORD BRONCO (6th gen, 2021+)
  // =====================================================

  // 2021-2024 Bronco - Smart Key (M3N-A2C93142600, 902 MHz)
  {
    model: 'Ford Bronco', year_start: 2021, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '902 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C931426', ic_number: '7812A-A2C931426',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Rear Window',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c931426,
    programming_notes: '6th gen Bronco. Smart key with push-button start. PN: 164-R8182/164-R8297. Ford IDS/FDRS or Autel IM608/SmartPro.',
  },
  // 2021-2024 Bronco - Flip Key option (N5F-A08TAA)
  {
    model: 'Ford Bronco', year_start: 2021, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'N5F-A08TAA', ic_number: '3248A-A08TAA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.flip_n5f_a08taa_3b,
    programming_notes: 'Bronco flip key on base/Big Bend trims. PN: 164-R8283. HU101 blade. Ford IDS/FDRS or aftermarket tool.',
  },

  // =====================================================
  // FORD BRONCO SPORT (2021+)
  // =====================================================

  // 2021-2024 Bronco Sport - Smart Key (M3N-A2C93142300)
  {
    model: 'Ford Bronco Sport', year_start: 2021, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C93142300', ic_number: '7812A-A2C93142300',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c93142300,
    programming_notes: 'Bronco Sport (Escape platform). Smart key standard. PN: 164-R8163. Ford IDS/FDRS or Autel/SmartPro.',
  },
  // 2021-2024 Bronco Sport - Flip Key option (N5F-A08TAA)
  {
    model: 'Ford Bronco Sport', year_start: 2021, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'N5F-A08TAA', ic_number: '3248A-A08TAA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.flip_n5f_a08taa_3b,
    programming_notes: 'Bronco Sport flip key for base trims. HU101 blade. Ford IDS/FDRS or aftermarket tool.',
  },

  // =====================================================
  // FORD MAVERICK (2022+)
  // =====================================================

  // 2022-2024 Maverick - Smart Key (M3N-A2C93142300)
  {
    model: 'Ford Maverick', year_start: 2022, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C93142300', ic_number: '7812A-A2C93142300',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Tailgate',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c93142300,
    programming_notes: 'Compact truck. Smart key on Lariat and above. PN: 164-R8163. Ford IDS/FDRS or Autel/SmartPro.',
  },
  // 2022-2024 Maverick - Flip Key option (N5F-A08TAA)
  {
    model: 'Ford Maverick', year_start: 2022, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'N5F-A08TAA', ic_number: '3248A-A08TAA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.flip_n5f_a08taa_3b,
    programming_notes: 'Maverick flip key for XL/XLT trims. PN: 164-R8269. HU101 blade. Ford IDS/FDRS or aftermarket tool.',
  },

  // =====================================================
  // FORD MUSTANG
  // =====================================================

  // 1996-2004 Mustang - 4C
  {
    model: 'Ford Mustang', year_start: 1996, year_end: 2004,
    key_blank: 'H72-PT', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h72_transponder,
    programming_notes: '4th gen Mustang (SN95/New Edge). PATS 4C transponder. On-board programming (OBP) with 2 working keys. Ford IDS with security code for all-keys-lost.',
  },
  // 2005-2009 Mustang - 4D63 (S197)
  {
    model: 'Ford Mustang', year_start: 2005, year_end: 2009,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '5th gen Mustang (S197). PATS 3 CAN. 4D63 transponder. Remote head key. On-board with 2 keys or Ford IDS.',
  },
  // 2010-2014 Mustang - 80-bit
  {
    model: 'Ford Mustang', year_start: 2010, year_end: 2014,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 80-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h92_80bit,
    programming_notes: '5th gen Mustang facelift (S197). 80-bit PATS. Remote head key. On-board with 2 keys or Ford IDS with security code.',
  },
  // 2015-2017 Mustang - Smart Key (M3N-A2C31243800, 315 MHz, 4-button w/ Trunk)
  {
    model: 'Ford Mustang', year_start: 2015, year_end: 2017,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C31243800', ic_number: '7812A-A2C31243800',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c31243800,
    programming_notes: '6th gen Mustang (S550). Smart key with push-button start. PN: 164-R8120. Ford IDS/FDRS or aftermarket tool. Manual transmission uses different FCC ID.',
  },
  // 2018-2022 Mustang - Smart Key (M3N-A2C93142300, 315 MHz)
  {
    model: 'Ford Mustang', year_start: 2018, year_end: 2022,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C93142300', ic_number: '7812A-A2C93142300',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c93142300,
    programming_notes: '6th gen Mustang (S550 facelift). PN: 164-R8159. Smart key. Ford IDS/FDRS or Autel/SmartPro.',
  },
  // 2024-2025 Mustang (S650 - 7th gen)
  {
    model: 'Ford Mustang', year_start: 2024, year_end: 2025,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '434 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A3C108397', ic_number: '7812-A3C108397',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a3c108397,
    programming_notes: '7th gen Mustang (S650). New smart key at 434 MHz. Ford FDRS or latest aftermarket tools required.',
  },

  // =====================================================
  // FORD FUSION
  // =====================================================

  // 2006-2009 Fusion - 4D63 (PATS 4 CAN)
  {
    model: 'Ford Fusion', year_start: 2006, year_end: 2009,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '1st gen Fusion. PATS 4 CAN. 4D63 transponder. Remote head key. On-board with 2 keys or Ford IDS with PIN.',
  },
  // 2010-2012 Fusion - 4D63 (Ford 2010 CAN)
  {
    model: 'Ford Fusion', year_start: 2010, year_end: 2012,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '1st gen Fusion facelift. Ford 2010 CAN system. 4D63 transponder. On-board with 2 keys or Ford IDS with PIN.',
  },
  // 2013-2016 Fusion - Flip Key (N5F-A08TAA, 4-button w/ Trunk)
  {
    model: 'Ford Fusion', year_start: 2013, year_end: 2016,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'N5F-A08TAA', ic_number: '3248A-A08TAA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.flip_n5f_a08taa_4b,
    programming_notes: '2nd gen Fusion. Remote flip key. PN: 164-R7986. HU101 blade. HITAG PRO 128-bit. Ford IDS/FDRS or aftermarket tool.',
  },
  // 2013-2017 Fusion - Smart Key (M3N-A2C31243300)
  {
    model: 'Ford Fusion', year_start: 2013, year_end: 2017,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '902 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C31243300', ic_number: '7812A-A2C31243300',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c31243300,
    programming_notes: '2nd gen Fusion smart key on Titanium and higher trims. PN: 164-R7989. Push-button start. Ford IDS/FDRS or aftermarket tool.',
  },
  // 2017-2020 Fusion - Smart Key (M3N-A2C93142300, 315 MHz)
  {
    model: 'Ford Fusion', year_start: 2017, year_end: 2020,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C93142300', ic_number: '7812A-A2C93142300',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c93142300,
    programming_notes: '2nd gen Fusion facelift. Smart key. PN: 164-R8149. Ford IDS/FDRS or Autel/SmartPro.',
  },

  // =====================================================
  // FORD FOCUS
  // =====================================================

  // 2000-2004 Focus - 4D60
  {
    model: 'Ford Focus', year_start: 2000, year_end: 2004,
    key_blank: 'H86-PT', transponder_type: 'Texas Crypto 4D60', chip_type: '4D60',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h86_transponder,
    programming_notes: '1st gen Focus. Texas 4D60 transponder (NOT 4C or 4D63). PCM-based PATS. On-board with 2 working keys. Ford IDS for all-keys-lost.',
  },
  // 2005-2007 Focus - 4D63
  {
    model: 'Ford Focus', year_start: 2005, year_end: 2007,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '1st gen Focus facelift. PATS 3 CAN with 4D63. On-board with 2 keys or Ford IDS with PIN.',
  },
  // 2008-2011 Focus - 4D63 (PATS 5 CAN)
  {
    model: 'Ford Focus', year_start: 2008, year_end: 2011,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '2nd gen Focus (US). PATS 5 CAN. 4D63 transponder. Remote head key. On-board with 2 keys or Ford IDS with PIN.',
  },
  // 2012-2018 Focus - 80-bit (remote head key)
  {
    model: 'Ford Focus', year_start: 2012, year_end: 2018,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 80-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.h92_80bit,
    programming_notes: '3rd gen Focus. 80-bit PATS. Remote head key (base trims) or flip key with HITAG PRO (higher trims). On-board with 2 keys or Ford IDS.',
  },
  // 2012-2018 Focus - Smart Key option (Titanium trim)
  {
    model: 'Ford Focus', year_start: 2012, year_end: 2018,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C31243300', ic_number: '7812A-A2C31243300',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c31243300,
    programming_notes: '3rd gen Focus smart key on Titanium trim with push-button start. HITAG PRO 128-bit. Ford IDS/FDRS or aftermarket tool.',
  },

  // =====================================================
  // FORD TAURUS
  // =====================================================

  // 1996-1999 Taurus - 4C
  {
    model: 'Ford Taurus', year_start: 1996, year_end: 1999,
    key_blank: 'H72-PT', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h72_transponder,
    programming_notes: '3rd gen Taurus. PATS 2 with 4C transponder. On-board with 2 working keys. Ford IDS for all-keys-lost.',
  },
  // 2000-2003 Taurus - 4D60
  {
    model: 'Ford Taurus', year_start: 2000, year_end: 2003,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D60', chip_type: '4D60',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '4th gen Taurus. 4D60 transponder. PCM-based PATS. On-board with 2 keys or Ford IDS.',
  },
  // 2004-2007 Taurus - 4D63
  {
    model: 'Ford Taurus', year_start: 2004, year_end: 2007,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '5th gen Taurus. PATS 3 CAN. 4D63 transponder. On-board with 2 keys or Ford IDS.',
  },
  // 2008-2009 Taurus (reborn as full-size) - 4D63
  {
    model: 'Ford Taurus', year_start: 2008, year_end: 2009,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: '6th gen Taurus. PATS 4/5 CAN. 4D63 transponder. On-board with 2 keys or Ford IDS with PIN.',
  },
  // 2010-2012 Taurus - 80-bit
  {
    model: 'Ford Taurus', year_start: 2010, year_end: 2012,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 80-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'M3N5WY8609', ic_number: null,
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h92_80bit,
    programming_notes: '6th gen Taurus. 80-bit PATS. Some trims have smart key. On-board with 2 keys or Ford IDS.',
  },
  // 2013-2019 Taurus - Smart Key (M3N5WY8609 / HITAG PRO)
  {
    model: 'Ford Taurus', year_start: 2013, year_end: 2019,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C31243300', ic_number: '7812A-A2C31243300',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c31243300,
    programming_notes: '6th gen Taurus. Smart key with push-button start. HITAG PRO 128-bit. Ford IDS/FDRS or aftermarket tool. Discontinued after 2019.',
  },

  // =====================================================
  // FORD TRANSIT (Full-size van, US 2015+)
  // =====================================================

  // 2015-2019 Transit - Remote Head Key (OUCD6000022)
  {
    model: 'Ford Transit', year_start: 2015, year_end: 2019,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Sliding Door',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.transit_rhk,
    programming_notes: 'Full-size Transit van (US). Remote head key. PN: 164-R8126. HU101 blade with HITAG PRO chip. Ford IDS/FDRS required. PIN code often needed.',
  },
  // 2020-2024 Transit - Flip Key (N5F-A08TAA, 4-button)
  {
    model: 'Ford Transit', year_start: 2020, year_end: 2024,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'N5F-A08TAA', ic_number: '3248A-A08TAA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Sliding Door',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.flip_transit_4b,
    programming_notes: 'Full-size Transit. Remote flip key. PN: 164-R8236. HU101 blade. Ford IDS/FDRS or aftermarket tool.',
  },

  // =====================================================
  // FORD TRANSIT CONNECT
  // =====================================================

  // 2010-2013 Transit Connect - 80-bit
  {
    model: 'Ford Transit Connect', year_start: 2010, year_end: 2013,
    key_blank: 'H91-PT', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 80-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.h92_80bit,
    programming_notes: '1st gen Transit Connect (US). 80-bit PATS. FO21 keyway (H91). Ford IDS with security code.',
  },
  // 2014-2018 Transit Connect - HITAG PRO flip key
  {
    model: 'Ford Transit Connect', year_start: 2014, year_end: 2018,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Sliding Door',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.transit_rhk,
    programming_notes: '2nd gen Transit Connect. HU101 blade. HITAG PRO 128-bit. Ford IDS/FDRS required.',
  },
  // 2019-2023 Transit Connect - Smart Key (M3N-A2C931423)
  {
    model: 'Ford Transit Connect', year_start: 2019, year_end: 2023,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C931423', ic_number: '7812A-A2C931423',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Sliding Door',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c93142300,
    programming_notes: '2nd gen Transit Connect facelift. Smart key. PN: 164-R8234. Ford IDS/FDRS or aftermarket tool.',
  },

  // =====================================================
  // FORD E-SERIES (Econoline)
  // =====================================================

  // 2008-2010 E-Series - 4D63
  {
    model: 'Ford E-Series', year_start: 2008, year_end: 2010,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'E-Series van. PATS 4 CAN. 4D63 transponder. Remote head key. On-board with 2 keys or Ford IDS.',
  },
  // 2011-2014 E-Series - 80-bit
  {
    model: 'Ford E-Series', year_start: 2011, year_end: 2014,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 80-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h92_80bit,
    programming_notes: 'E-Series van. 80-bit PATS. On-board with 2 keys or Ford IDS. E-Series became E-Series Cutaway only after 2014.',
  },

  // =====================================================
  // FORD ECOSPORT
  // =====================================================

  // 2018-2022 EcoSport - Flip Key (N5F-A08TAA)
  {
    model: 'Ford EcoSport', year_start: 2018, year_end: 2022,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'N5F-A08TAA', ic_number: '3248A-A08TAA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.flip_n5f_a08taa_3b,
    programming_notes: 'EcoSport (US market). Remote flip key. PN: 164-R8130. HU101 blade. HITAG PRO 128-bit. Ford IDS/FDRS or aftermarket tool.',
  },
  // 2018-2022 EcoSport - Smart Key option (M3N-A2C93142300)
  {
    model: 'Ford EcoSport', year_start: 2018, year_end: 2022,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C93142300', ic_number: '7812A-A2C93142300',
    battery_type: 'CR2450', buttons: 'Lock, Unlock, Panic, Hatch',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: false,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c93142300,
    programming_notes: 'EcoSport smart key on SES/Titanium trims. PN: 164-R8163. Ford IDS/FDRS or aftermarket tool.',
  },

  // =====================================================
  // FORD FLEX
  // =====================================================

  // 2009-2012 Flex - 4D63
  {
    model: 'Ford Flex', year_start: 2009, year_end: 2012,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'Flex. PATS 4/5 CAN with 4D63 transponder. Remote head key. On-board with 2 keys or Ford IDS.',
  },
  // 2013-2019 Flex - Smart Key (HITAG PRO)
  {
    model: 'Ford Flex', year_start: 2013, year_end: 2019,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '902 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C31243300', ic_number: '7812A-A2C31243300',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c31243300,
    programming_notes: 'Flex smart key. Push-button start on SEL and Limited trims. PN: 164-R7989. Ford IDS/FDRS or aftermarket tool.',
  },

  // =====================================================
  // FORD CROWN VICTORIA
  // =====================================================

  // 1998-2002 Crown Victoria - 4C
  {
    model: 'Ford Crown Victoria', year_start: 1998, year_end: 2002,
    key_blank: 'H72-PT', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h72_transponder,
    programming_notes: 'Crown Victoria. PATS 2 with 4C transponder. On-board with 2 working keys. Ford IDS for all-keys-lost. Common police interceptor.',
  },
  // 2003-2004 Crown Victoria - 4D63 (PCM)
  {
    model: 'Ford Crown Victoria', year_start: 2003, year_end: 2004,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'Crown Victoria. 4D63 transponder. PCM-based PATS. On-board with 2 keys or Ford IDS.',
  },
  // 2005-2011 Crown Victoria - 4D63 (PATS 3 CAN)
  {
    model: 'Ford Crown Victoria', year_start: 2005, year_end: 2011,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'Crown Victoria. PATS 3 CAN. 4D63 transponder. Very common police/fleet vehicle. On-board with 2 keys or Ford IDS.',
  },

  // =====================================================
  // FORD EXCURSION
  // =====================================================

  // 2000-2005 Excursion - 4C
  {
    model: 'Ford Excursion', year_start: 2000, year_end: 2005,
    key_blank: 'H72-PT', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h72_transponder,
    programming_notes: 'Excursion. PATS 2 with 4C transponder. On-board with 2 working keys. Ford IDS for all-keys-lost. Full-size SUV.',
  },

  // =====================================================
  // FORD FIVE HUNDRED
  // =====================================================

  // 2005-2007 Five Hundred - 4D63
  {
    model: 'Ford Five Hundred', year_start: 2005, year_end: 2007,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'Five Hundred. PATS 3 CAN. 4D63 transponder. Remote head key. Became Taurus in 2008. On-board with 2 keys or Ford IDS.',
  },

  // =====================================================
  // FORD FREESTYLE
  // =====================================================

  // 2005-2007 Freestyle - 4D63
  {
    model: 'Ford Freestyle', year_start: 2005, year_end: 2007,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'Freestyle. PATS 3 CAN. 4D63 transponder. Became Taurus X in 2008. On-board with 2 keys or Ford IDS.',
  },

  // =====================================================
  // FORD FIESTA (US)
  // =====================================================

  // 2011-2013 Fiesta - 80-bit
  {
    model: 'Ford Fiesta', year_start: 2011, year_end: 2013,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 80-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.h92_80bit,
    programming_notes: 'Fiesta (US market). 80-bit PATS. Remote head key. On-board with 2 keys or Ford IDS.',
  },
  // 2014-2019 Fiesta - HITAG PRO flip key
  {
    model: 'Ford Fiesta', year_start: 2014, year_end: 2019,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'N5F-A08TAA', ic_number: '3248A-A08TAA',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.flip_n5f_a08taa_4b,
    programming_notes: 'Fiesta (US market). Remote flip key with HITAG PRO. PN: 164-R8046. HU101 blade. Ford IDS/FDRS or aftermarket tool.',
  },

  // =====================================================
  // FORD C-MAX
  // =====================================================

  // 2013-2018 C-Max - Remote Head Key (80-bit)
  {
    model: 'Ford C-Max', year_start: 2013, year_end: 2018,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63 80-bit', chip_type: '4D63 80-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'OUCD6000022', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic, Trunk',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.h92_80bit,
    programming_notes: 'C-Max hybrid/Energi. 80-bit PATS. Remote head key for base trims. On-board with 2 keys or Ford IDS.',
  },
  // 2013-2018 C-Max - Smart Key option
  {
    model: 'Ford C-Max', year_start: 2013, year_end: 2018,
    key_blank: 'HU101', transponder_type: 'NXP HITAG PRO', chip_type: 'ID49 128-bit',
    remote_frequency: '902 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-A2C31243300', ic_number: '7812A-A2C31243300',
    battery_type: 'CR2032', buttons: 'Lock, Unlock, Panic, Hatch, Remote Start',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi HU101',
    image_url: IMG.smart_m3n_a2c31243300,
    programming_notes: 'C-Max smart key on Energi/Titanium trims with push-button start. Ford IDS/FDRS or aftermarket tool.',
  },

  // =====================================================
  // FORD WINDSTAR
  // =====================================================

  // 1999-2000 Windstar - 4C
  {
    model: 'Ford Windstar', year_start: 1999, year_end: 2000,
    key_blank: 'H72-PT', transponder_type: 'Texas Fixed Code 4C', chip_type: '4C chip',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h72_transponder,
    programming_notes: 'Windstar minivan. PATS with 4C transponder. On-board with 2 working keys.',
  },
  // 2001-2003 Windstar - 4D63
  {
    model: 'Ford Windstar', year_start: 2001, year_end: 2003,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'Windstar minivan. 4D63 transponder. PCM-based. On-board with 2 keys or Ford IDS.',
  },

  // =====================================================
  // FORD FREESTAR
  // =====================================================

  // 2004-2007 Freestar - 4D63
  {
    model: 'Ford Freestar', year_start: 2004, year_end: 2007,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: '315 MHz', key_type: 'transponder',
    fcc_id: 'CWTWB1U793', ic_number: null,
    battery_type: null, buttons: 'Lock, Unlock, Panic',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'Freestar minivan. PATS 3 CAN. 4D63 transponder. Replaced Windstar. On-board with 2 keys or Ford IDS.',
  },

  // =====================================================
  // FORD THUNDERBIRD (retro)
  // =====================================================

  // 2002-2005 Thunderbird - 4D60/4D63
  {
    model: 'Ford Thunderbird', year_start: 2002, year_end: 2005,
    key_blank: 'H84-PT', transponder_type: 'Texas Crypto 4D63', chip_type: '4D63 40-bit',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: null,
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: true, pin_code_required: true,
    lishi_tool: 'Lishi FO38',
    image_url: IMG.h84_40bit,
    programming_notes: 'Retro Thunderbird. 2002 uses 4D60, 2003-2005 uses 4D63. HEC PATS system. Ford IDS for all-keys-lost.',
  },
];

// ============================================================
// MAIN EXECUTION
// ============================================================

async function main() {
  await client.connect();
  console.log('Connected to Supabase.');

  // Get a valid year_id for Ford
  const yearRes = await client.query(
    `SELECT vy.id FROM vehicle_years vy
     JOIN vehicle_models vm ON vy.model_id = vm.id
     JOIN manufacturers m ON vm.manufacturer_id = m.id
     WHERE m.slug = 'ford' LIMIT 1;`
  );
  const yearId = yearRes.rows[0].id;
  console.log(`Using year_id: ${yearId}`);

  // Count existing Ford keys
  const countBefore = await client.query(
    "SELECT COUNT(*) FROM automotive_keys WHERE manufacturer_id = $1",
    [FORD_MFR_ID]
  );
  console.log(`\nExisting Ford keys: ${countBefore.rows[0].count}`);

  // Delete old Ford keys
  const delRes = await client.query(
    "DELETE FROM automotive_keys WHERE manufacturer_id = $1",
    [FORD_MFR_ID]
  );
  console.log(`Deleted ${delRes.rowCount} old Ford key rows.`);

  // Insert new accurate Ford keys
  let inserted = 0;
  for (const key of fordKeys) {
    await client.query(
      `INSERT INTO automotive_keys (
        year_id, manufacturer_id, model_name, key_blank, transponder_type,
        chip_type, remote_frequency, key_type, fcc_id, ic_number,
        battery_type, buttons, emergency_key_blank, test_key_blank,
        obd_programmable, pin_code_required, lishi_tool, image_url,
        programming_notes, year_start, year_end
      ) VALUES (
        $1, $2, $3, $4, $5,
        $6, $7, $8, $9, $10,
        $11, $12, $13, $14,
        $15, $16, $17, $18,
        $19, $20, $21
      )`,
      [
        yearId, FORD_MFR_ID, key.model, key.key_blank, key.transponder_type,
        key.chip_type, key.remote_frequency, key.key_type, key.fcc_id, key.ic_number,
        key.battery_type, key.buttons, key.emergency_key_blank, key.test_key_blank,
        key.obd_programmable, key.pin_code_required, key.lishi_tool, key.image_url,
        key.programming_notes, key.year_start, key.year_end
      ]
    );
    inserted++;
  }
  console.log(`\nInserted ${inserted} new Ford key rows.`);

  // Verify results
  const verifyRes = await client.query(
    `SELECT model_name, year_start, year_end, key_blank, chip_type, key_type, fcc_id, lishi_tool
     FROM automotive_keys
     WHERE manufacturer_id = $1
     ORDER BY model_name, year_start;`,
    [FORD_MFR_ID]
  );

  console.log('\n============================================');
  console.log('VERIFICATION - All Ford Keys:');
  console.log('============================================');

  let currentModel = '';
  for (const row of verifyRes.rows) {
    if (row.model_name !== currentModel) {
      currentModel = row.model_name;
      console.log(`\n--- ${currentModel} ---`);
    }
    console.log(`  ${row.year_start}-${row.year_end} | ${row.key_blank} | ${row.chip_type || 'N/A'} | ${row.key_type} | FCC: ${row.fcc_id || 'N/A'} | ${row.lishi_tool}`);
  }

  // Summary by model
  const summaryRes = await client.query(
    `SELECT model_name, COUNT(*) as key_count
     FROM automotive_keys
     WHERE manufacturer_id = $1
     GROUP BY model_name
     ORDER BY model_name;`,
    [FORD_MFR_ID]
  );

  console.log('\n============================================');
  console.log('SUMMARY BY MODEL:');
  console.log('============================================');
  let totalKeys = 0;
  for (const row of summaryRes.rows) {
    console.log(`  ${row.model_name}: ${row.key_count} key rows`);
    totalKeys += parseInt(row.key_count);
  }
  console.log(`\n  TOTAL: ${totalKeys} Ford key rows across ${summaryRes.rows.length} models`);

  // Check for any missing image_url
  const missingImg = await client.query(
    `SELECT model_name, year_start, year_end FROM automotive_keys
     WHERE manufacturer_id = $1 AND (image_url IS NULL OR image_url = '')
     ORDER BY model_name;`,
    [FORD_MFR_ID]
  );
  if (missingImg.rows.length > 0) {
    console.log('\nWARNING - Missing image_url:');
    missingImg.rows.forEach(r => console.log(`  ${r.model_name} ${r.year_start}-${r.year_end}`));
  } else {
    console.log('\nAll rows have image_url set.');
  }

  await client.end();
  console.log('\nDone!');
}

main().catch(err => {
  console.error('Error:', err);
  process.exit(1);
});
