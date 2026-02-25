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

// ============================================================
// MANUFACTURER IDs
// ============================================================
const MFR = {
  ALFA_ROMEO:    'a47cca8e-8a09-450a-ba2c-eaa1de48f98d',
  ASTON_MARTIN:  '9edcbc85-e3d9-4494-9ea8-0e2f23765e47',
  BENTLEY:       '7351e210-8123-46d2-ae27-704a09cc6822',
  FERRARI:       '9692d293-e8f6-49d7-bbcf-0cc52c385834',
  LAMBORGHINI:   'ebd11f08-30ff-4dbc-9892-9fe025685c03',
  MASERATI:      '12aeb461-1486-45d5-a0e5-d5de9adf6d14',
  MCLAREN:       '3beedb96-fb19-4053-95e3-c661dabfea8c',
  ROLLS_ROYCE:   '0a7440b0-0227-494f-8f49-c28d9eb223b9',
  MAYBACH:       'eb57df4e-59e3-4f67-b462-5a49dcb6dfe7',
  LOTUS:         '60f601fd-4812-48ce-8be6-4869229a01c4',
  POLESTAR:      '43e465ae-c020-42bf-9b22-317a7b495c0e',
  RIVIAN:        '5088e78d-18f1-4da2-b34b-aa5deac9eabc',
  LUCID:         '9efa7273-0c99-4b33-8658-0e8a63d41120',
  TESLA:         'f61c5db8-9a34-4dce-bb19-8af04d405128',
  FREIGHTLINER:  'ba9cfcee-8d93-4939-8c12-40db361950af',
  KENWORTH:      '201ff78c-8300-428f-a094-d2066ee03149',
  PETERBILT:     '63730ed3-c1ed-41f2-8f47-cd2dfc8be843',
  MACK:          'a5dd20a0-a4db-4dfe-afdc-bd7415fd6a31',
  INTERNATIONAL: '655c3566-8f7c-4a2e-b6aa-69442fc2368b',
};

// ============================================================
// Existing model IDs (from vehicle_models table)
// ============================================================
const MODEL_IDS = {
  // Alfa Romeo
  'Giulia':           '3acffebd-a557-4a98-bd14-4bd633b32633',
  'Stelvio':          '13ded2ad-cd2c-43e4-8d72-b17f87f046a0',
  // Aston Martin
  'Rapide':           '294ebbf4-3b13-4cd0-a88f-34c71e217b37',
  'Vantage':          '58da992f-d1d9-4592-830b-3e92a9bc83ac',
  // Bentley
  'Bentayga':         'f43a03d0-c37c-43e0-ad93-637148a7cac9',
  'Continental GT':   '325803cb-f6d3-4f25-97ee-e8977e7ad3bb',
  'Flying Spur':      '3e5bff5c-395e-4ba7-b7ba-a4771cdd9101',
  // Ferrari
  '488':              '75fc5651-473f-4557-9d26-c8d91d125d9e',
  'Roma':             '43ce209a-c40c-4a9e-9623-6bfcd7a7232a',
  'SF90':             '784ef1cf-9d8e-4bb2-9d48-06c7bda7afa2',
  // Lamborghini
  'Aventador':        '8f0d0e9c-9166-466a-82b5-39409664facd',
  'Huracan':          'bb4dbc34-3867-4f43-ad70-f16418c98157',
  'Urus':             'ccf8a4f1-e124-4df4-acd1-9f9387000300',
  // Maserati
  'Ghibli':           'aec2f9a7-d0ac-4e76-94ec-c348b0e8e612',
  'GranTurismo':      '460ddd83-1611-47c1-8f9d-27c73790c897',
  'Levante':          '454d2a0a-f81f-4c73-ab25-5287e88c1b86',
  'Quattroporte':     '0ea77dbd-bc4e-4c0c-bbe0-ab036a13f2c6',
  // McLaren
  '720S':             'd152f3d1-7048-4f07-b4a7-d1e95eab6b6c',
  'Artura':           '9a42ebf6-9b84-487b-a5fb-afede0ce9c8e',
  'GT':               'c2231d62-e52e-4411-a611-261ee61e54da',
  // Rolls-Royce
  'Cullinan':         '4592bb30-1413-4b33-9d26-a504954fab23',
  'Ghost':            'ec9b5266-dbba-46a5-a987-4b37c60db9cc',
  'Phantom':          'e6266093-16da-4158-a8aa-dd3ce5e8a953',
  'Wraith':           '9f197412-543f-4ede-bc27-09630cae8010',
  // Maybach
  'S-Class':          '0015cd2d-1ea2-477f-b9fe-cbd3e4363158',
  // Lotus
  'Elise':            '3d254774-b3f4-4cd2-be27-286775020b47',
  'Emira':            '6a588d79-fa5f-4457-a5c1-b44f7682a6b5',
  'Evora':            '4e5ca44d-9009-47fc-8b16-d6e7f679c32a',
  // Polestar
  'Polestar 2':       '655c7f5e-f2d9-4c33-a60c-c5680c9e602c',
  // Rivian
  'R1S':              'cc0fb5ed-fff6-4ca0-9b82-a305698146fc',
  'R1T':              '4f4247cb-4bd3-4575-8221-1fbf0e6f5d87',
  // Lucid
  'Air':              '6c0f27a6-9188-47a1-a01d-64f5c64fbf5a',
  // Tesla
  'Model 3':          'f43f82fa-c5a4-4c43-be28-3773767749fa',
  'Model S':          '0f643184-eb36-42d6-8a6e-821bad34de7e',
  'Model X':          '67e97fd8-f50f-42a6-9a7f-a7e4f06b38d7',
  'Model Y':          '606da2f1-d2dc-4263-9c91-48798f7f2ea0',
  // Freightliner
  'Cascadia':         '809e1465-5d7b-457f-abbe-ae7644afea44',
  'M2':               '80c6c9a5-d2de-4f34-b66f-4ab3d8919475',
  // Kenworth
  'T680':             '09e1be90-7cc2-40fc-b6a4-3226c3132134',
  'T880':             'e56ece6a-16dd-4125-bc36-2a8098118f85',
  'W900':             '25bc135c-2c7c-4216-acdf-2916f6ce65df',
  // Peterbilt
  '579':              '43321792-1de2-462e-b3a1-a72b1627028a',
  '389':              'fc677108-e22c-4d67-85df-c6f58a5b526e',
  // Mack
  'Anthem':           '9857f862-2021-4719-b5fc-8c004d17deff',
  'Granite':          '1c0e48f8-737b-47d1-845a-7bcb7a4a5698',
  'Pinnacle':         'bf477d79-ad6a-4832-b14d-ab5eab75c17d',
  // International
  'LT':               'b9408a74-a4e9-4348-b860-cef9a4ec6ee7',
  'ProStar':          'cecb20f7-0ef6-4ebf-ba10-83ef5ebe434b',
};

// Existing year IDs (from vehicle_years table)
const YEAR_IDS = {
  // Alfa Romeo
  'Giulia_2017_2024':           '05999720-ea96-4276-95d2-27aee17e13b4',
  'Stelvio_2018_2024':          '8a160ae5-e154-41cb-b7e3-960027045fc0',
  // Aston Martin
  'Rapide_2010_2020':           'e08048d3-6bd9-4147-b5e4-1f94e866f87d',
  'Vantage_2006_2017':          '4a6b240d-7ac1-4b5e-889c-00174eae5907',
  'Vantage_2018_2025':          'b1aa88c7-123e-4d76-9af4-b3c2528e1ab4',
  // Bentley
  'Bentayga_2016_2020':         'e0a51768-ea33-41fc-be57-7a2850b181ad',
  'Bentayga_2021_2025':         '8c944728-52ea-40e9-8578-a19eb7a486c7',
  'ContinentalGT_2004_2017':    'c3860359-0225-461f-afeb-435f59015703',
  'ContinentalGT_2018_2025':    'cb03f1ea-8c48-41e7-a58c-107168c638de',
  'FlyingSpur_2006_2019':       '12ba2d1a-972f-41b0-bb7c-7bf4cfa4b699',
  'FlyingSpur_2020_2025':       'ce46d4c4-5dfd-420d-8d62-42b74ab05ac3',
  // Ferrari
  '488_2016_2019':              '3234cded-35ee-4b05-9509-f14e9eade1f3',
  'Roma_2021_2025':             '4c1e7689-75ae-4ce1-8f14-81850911104f',
  'SF90_2020_2025':             '4c2dcfcc-6edf-47e3-9e82-90db068d82da',
  // Lamborghini
  'Aventador_2012_2022':        '5b6625d9-3a41-4796-a700-d64f877ec4a7',
  'Huracan_2015_2025':          '5cadd14b-ccf3-466c-9fc1-b99d5f03b166',
  'Urus_2019_2025':             'd4d56fb5-c171-4e92-ae6b-1fc42d5e06dc',
  // Maserati
  'Ghibli_2014_2023':           '150dd3a9-0f7a-4bad-a7c4-02bfd06627d4',
  'GranTurismo_2008_2019':      '07b550b7-1600-4abd-a75a-1ab5de986ebe',
  'GranTurismo_2023_2025':      'a9f69da2-5292-4291-85b6-ec5b28445b63',
  'Levante_2017_2025':          'c17d94e9-0a81-49d3-abeb-de670b52b91e',
  'Quattroporte_2005_2012':     '7856e3f4-0768-45d2-a378-06d6b93055e5',
  'Quattroporte_2013_2025':     'e82ca3d3-b2fc-4698-9cd2-cdc8f0fb22d5',
  // McLaren
  '720S_2018_2024':             'ef83b3a1-0c0d-4f75-b631-d791f6de162d',
  'Artura_2022_2025':           '2e33cfa8-39f3-4929-877a-59b244d866b2',
  'GT_2020_2025':               '62576ada-c93f-49dd-b487-e92506161dc2',
  // Rolls-Royce
  'Cullinan_2019_2025':         '09b9305d-8d54-4dc0-82f2-023620ad9f1f',
  'Ghost_2010_2020':            'a38de86e-eed0-49f9-aab1-16fff8686496',
  'Ghost_2021_2025':            '164bf2b5-b075-41d4-9931-9b5a3d9a757b',
  'Phantom_2003_2017':          'c787ff3d-065a-4928-b81a-2a16f2601380',
  'Phantom_2018_2025':          '0e7c64d7-7f40-47d6-b18c-8d908d51b6e7',
  'Wraith_2014_2023':           'f0e193ff-f123-4b7b-8994-b97c2d81ba31',
  // Maybach
  'SClass_2015_2020':           'c3bd2d4b-5f2a-471d-953d-d36c818fc8c9',
  'SClass_2021_2025':           '6cff7268-d57c-4553-a04a-c3a7b57e25a4',
  // Lotus
  'Elise_2005_2011':            '2f3e2eac-7a62-4e06-8f17-9c99623c1fe6',
  'Emira_2022_2025':            '55e5357f-b7d0-496b-85dc-25c7d01da9e0',
  'Evora_2010_2021':            '691cca98-32eb-4e05-880c-a46ed00ffc3a',
  // Polestar
  'Polestar2_2021_2025':        '5600fecf-2eb9-4bad-a497-aa983d4b2d24',
  // Rivian
  'R1S_2022_2025':              '01c3a3a5-570d-4653-9d64-e19ee24c7c54',
  'R1T_2022_2025':              'dd8661b9-9e13-4921-a288-9b1e961a1646',
  // Lucid
  'Air_2022_2025':              '493ea19b-de3c-4cc3-8436-2a0ea5c1cff4',
  // Tesla
  'Model3_2018_2024':           'eb3e87c7-1ab6-47a5-bb7d-5f8b0df108c4',
  'ModelS_2012_2020':           '633b0f7e-08c9-4b01-8481-ab1524403b3e',
  'ModelS_2021_2024':           '2b7367f4-ed37-4db6-adfd-441c6364f8b5',
  'ModelX_2016_2020':           '5ae2cd61-aedb-46e7-b83b-87449b1dfdb3',
  'ModelX_2021_2024':           '4ade034e-425f-4ad6-bb14-74f531c4c106',
  'ModelY_2020_2024':           'f0f92188-3326-4fc6-b09b-3253bb67200e',
  // Freightliner
  'Cascadia_2008_2017':         'f9ac0a58-ddd8-438f-bbb6-212a699623b3',
  'Cascadia_2018_2025':         '797312fa-3721-4f8d-b049-8dbd391a43c8',
  'M2_2004_2025':               '3cef5226-9de6-4fcb-810b-bcf84d46cd3f',
  // Kenworth
  'T680_2013_2025':             '15e01166-1baf-4175-9f50-ae3eb4d47e85',
  'T880_2014_2025':             'edf7e366-2238-42f3-8726-3f995c2924e1',
  'W900_1990_2006':             '49131e19-fe04-42f8-90b3-97779cf3697b',
  'W900_2007_2025':             '7dd21f92-78fc-4bad-a42e-3b8fe74026c6',
  // Peterbilt
  '579_2013_2025':              '3250a4bb-51d3-4b6e-a27e-a862a4a84aa6',
  '389_2007_2025':              'dc363e11-a453-4e5f-a8e7-1fd5a870e7b7',
  // Mack
  'Anthem_2018_2025':           'afd2d1b9-f3ec-4692-bc71-35c2beff6701',
  'Granite_2002_2025':          'a1b0e324-08c7-4c30-af3b-1d3139aa59bc',
  'Pinnacle_2006_2019':         '2df497a9-3187-4ef9-84a8-6052722a7f48',
  // International
  'LT_2017_2025':               '706c13ac-3000-4193-aac6-80b4c3bd4f4c',
  'ProStar_2008_2017':          '68815893-6f3e-4e79-bce7-ec3d9edea8b3',
};

// Models that need to be CREATED (don't exist yet)
const MODELS_TO_CREATE = [
  // Alfa Romeo
  { mfr_id: MFR.ALFA_ROMEO,   name: '4C',      slug: '4c' },
  // Aston Martin
  { mfr_id: MFR.ASTON_MARTIN, name: 'DB9',     slug: 'db9' },
  { mfr_id: MFR.ASTON_MARTIN, name: 'DB11',    slug: 'db11' },
  { mfr_id: MFR.ASTON_MARTIN, name: 'DBS',     slug: 'dbs' },
  // Ferrari
  { mfr_id: MFR.FERRARI,      name: '458',     slug: '458' },
  { mfr_id: MFR.FERRARI,      name: 'F12',     slug: 'f12' },
  { mfr_id: MFR.FERRARI,      name: 'California', slug: 'california' },
  { mfr_id: MFR.FERRARI,      name: '296',     slug: '296' },
  { mfr_id: MFR.FERRARI,      name: '812',     slug: '812' },
  // Lamborghini
  { mfr_id: MFR.LAMBORGHINI,  name: 'Gallardo', slug: 'gallardo' },
  // McLaren
  { mfr_id: MFR.MCLAREN,      name: '570S',    slug: '570s' },
  { mfr_id: MFR.MCLAREN,      name: '600LT',   slug: '600lt' },
  { mfr_id: MFR.MCLAREN,      name: '620R',    slug: '620r' },
  // Rolls-Royce
  { mfr_id: MFR.ROLLS_ROYCE,  name: 'Dawn',    slug: 'dawn' },
  // Lotus
  // Elise already exists but year range needs extension
  // International
  { mfr_id: MFR.INTERNATIONAL, name: 'LoneStar', slug: 'lonestar' },
];

// ============================================================
// ALL KEY DATA - organized by manufacturer
// Each entry includes a yearKey to map to vehicle_years
// ============================================================

// ALFA ROMEO KEYS
const alfaRomeoKeys = [
  // 4C 2015-2020 - Smart Key (needs new model + year)
  {
    model_name: '4C', year_start: 2015, year_end: 2020,
    key_blank: 'SIP22', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-7393490', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Smart proximity key. 3 buttons: Lock, Unlock, Panic. Fiat/Chrysler platform. Requires dealer or advanced programmer (Autel IM608, OBDSTAR). PIN code from dealer required.',
    _modelSlug: '4c', _newModel: true,
  },
  // Giulia 2017-2024 - Smart Key 4 button
  {
    model_name: 'Giulia', year_start: 2017, year_end: 2024,
    yearKey: 'Giulia_2017_2024',
    key_blank: 'SIP22', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-7393490', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Trunk, Panic. Stellantis platform. Requires Autel IM608, OBDSTAR X300 DP Plus, or dealer. PIN code required. SIP22 emergency blade.',
  },
  // Giulia 2017-2024 - Smart Key 5 button (Remote Start)
  {
    model_name: 'Giulia', year_start: 2017, year_end: 2024,
    yearKey: 'Giulia_2017_2024',
    key_blank: 'SIP22', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-7393490', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Smart proximity key with Remote Start. 5 buttons: Lock, Unlock, Trunk, Remote Start, Panic. PIN code required. Stellantis platform.',
  },
  // Stelvio 2018-2024 - Smart Key 4 button
  {
    model_name: 'Stelvio', year_start: 2018, year_end: 2024,
    yearKey: 'Stelvio_2018_2024',
    key_blank: 'SIP22', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-7393490', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Smart proximity key. 4 buttons: Lock, Unlock, Liftgate, Panic. Same platform as Giulia. Requires Autel IM608 or dealer. PIN code required.',
  },
  // Stelvio 2018-2024 - Smart Key 5 button (Remote Start)
  {
    model_name: 'Stelvio', year_start: 2018, year_end: 2024,
    yearKey: 'Stelvio_2018_2024',
    key_blank: 'SIP22', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-7393490', ic_number: null,
    battery_type: 'CR2032', buttons: '5',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Smart proximity key with Remote Start. 5 buttons: Lock, Unlock, Liftgate, Remote Start, Panic. PIN code required. Stellantis platform.',
  },
];

// ASTON MARTIN KEYS
const astonMartinKeys = [
  // DB9 2004-2016 (needs new model + year)
  {
    model_name: 'DB9', year_start: 2004, year_end: 2016,
    key_blank: 'HU101', transponder_type: 'Hitag2', chip_type: 'ID46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101', image_url: null,
    programming_notes: 'Crystal key fob (Emotion Control Unit). 3 buttons: Lock, Unlock, Trunk. Volvo-based platform. Requires dealer or specialist programming. Glass key design with transponder.',
    _modelSlug: 'db9', _newModel: true,
  },
  // DBS 2008-2012 (needs new model + year)
  {
    model_name: 'DBS', year_start: 2008, year_end: 2012,
    key_blank: 'HU101', transponder_type: 'Hitag2', chip_type: 'ID46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101', image_url: null,
    programming_notes: 'Crystal key fob. Same Volvo-based system as DB9. 3 buttons: Lock, Unlock, Trunk. Dealer-only programming typically required. HU101 emergency blade.',
    _modelSlug: 'dbs', _newModel: true,
  },
  // Vantage 2006-2017 (V8/V12)
  {
    model_name: 'Vantage', year_start: 2006, year_end: 2017,
    yearKey: 'Vantage_2006_2017',
    key_blank: 'HU101', transponder_type: 'Hitag2', chip_type: 'ID46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101', image_url: null,
    programming_notes: 'Crystal key fob (Volvo-era platform). 3 buttons: Lock, Unlock, Trunk. Same system as DB9/DBS. HU101 emergency blade. Dealer or specialist only.',
  },
  // Rapide 2010-2020
  {
    model_name: 'Rapide', year_start: 2010, year_end: 2020,
    yearKey: 'Rapide_2010_2020',
    key_blank: 'HU101', transponder_type: 'Hitag2', chip_type: 'ID46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU101', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU101', image_url: null,
    programming_notes: '4-door grand tourer. Volvo-based platform. 3 buttons: Lock, Unlock, Trunk. HU101 emergency blade. Dealer or specialist programming.',
  },
  // DB11 2017-2024 (Mercedes-AMG platform, needs new model + year)
  {
    model_name: 'DB11', year_start: 2017, year_end: 2024,
    key_blank: 'HU64', transponder_type: 'Hitag Pro', chip_type: 'ID47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU64', image_url: null,
    programming_notes: 'Mercedes-AMG derived platform. Smart key: Lock, Unlock, Trunk. Uses Mercedes electronics. Requires dealer programming via Mercedes SDS or VVDI MB Tool. HU64 emergency key.',
    _modelSlug: 'db11', _newModel: true,
  },
  // DBS Superleggera 2019-2023 (Mercedes-AMG platform)
  {
    model_name: 'DBS', year_start: 2019, year_end: 2023,
    key_blank: 'HU64', transponder_type: 'Hitag Pro', chip_type: 'ID47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU64', image_url: null,
    programming_notes: 'DBS Superleggera. Mercedes-AMG platform. Smart key: Lock, Unlock, Trunk. Requires Mercedes SDS or VVDI MB Tool. HU64 emergency blade.',
    _modelSlug: 'dbs', _newModel: true,
  },
  // Vantage 2019-2024 (new gen, Mercedes-AMG platform)
  {
    model_name: 'Vantage', year_start: 2019, year_end: 2024,
    yearKey: 'Vantage_2018_2025',
    key_blank: 'HU64', transponder_type: 'Hitag Pro', chip_type: 'ID47',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU64', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU64', image_url: null,
    programming_notes: 'New generation Vantage on Mercedes-AMG platform. Smart key: Lock, Unlock, Trunk. Mercedes electronics. Requires Mercedes SDS or VVDI MB Tool. HU64 emergency blade.',
  },
];

// BENTLEY KEYS
const bentleyKeys = [
  // Continental GT 2004-2018 (1st/2nd gen)
  {
    model_name: 'Continental GT', year_start: 2004, year_end: 2018,
    yearKey: 'ContinentalGT_2004_2017',
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK45032', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66', image_url: null,
    programming_notes: 'VW/Audi platform (PQ/MLB). Smart key with 3 buttons: Lock, Unlock, Trunk. Uses Kessy system. Requires VVDI2 with Audi BCM2 adapter or dealer. ID48 (CAN) chip. PIN/CS required.',
  },
  // Continental GT 2019-2024 (3rd gen)
  {
    model_name: 'Continental GT', year_start: 2019, year_end: 2024,
    yearKey: 'ContinentalGT_2018_2025',
    key_blank: 'HU162', transponder_type: 'MQB', chip_type: 'Megamos AES (MQB)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: '5E0959904', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU162', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU162', image_url: null,
    programming_notes: 'MLB Evo platform. Smart key: Lock, Unlock, Trunk. MQB/Megamos AES system. Requires VVDI2 Audi, Autel IM608 with G-Box3, or dealer. HU162 emergency blade. IMMO 5 system.',
  },
  // Flying Spur 2006-2019 (1st/2nd gen)
  {
    model_name: 'Flying Spur', year_start: 2006, year_end: 2019,
    yearKey: 'FlyingSpur_2006_2019',
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'KR55WK45032', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66', image_url: null,
    programming_notes: 'VW/Audi platform. Smart key: Lock, Unlock, Trunk. Kessy system with ID48. Requires VVDI2 with Audi adapter or dealer. PIN/CS from dealer.',
  },
  // Flying Spur 2020-2024 (3rd gen)
  {
    model_name: 'Flying Spur', year_start: 2020, year_end: 2024,
    yearKey: 'FlyingSpur_2020_2025',
    key_blank: 'HU162', transponder_type: 'MQB', chip_type: 'Megamos AES (MQB)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: '5E0959904', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU162', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU162', image_url: null,
    programming_notes: 'MLB Evo platform. Smart key: Lock, Unlock, Trunk. Megamos AES / IMMO 5 system. Requires VVDI2, Autel IM608 with G-Box3, or dealer. HU162 emergency blade.',
  },
  // Bentayga 2016-2020
  {
    model_name: 'Bentayga', year_start: 2016, year_end: 2020,
    yearKey: 'Bentayga_2016_2020',
    key_blank: 'HU162', transponder_type: 'MQB', chip_type: 'Megamos AES (MQB)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: '3W0959754', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU162', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU162', image_url: null,
    programming_notes: 'MLB Evo platform. Smart key: Lock, Unlock, Trunk. Kessy system with Megamos AES. Requires VVDI2 Audi or Autel IM608 with G-Box3. HU162 emergency blade.',
  },
  // Bentayga 2021-2024 (facelift)
  {
    model_name: 'Bentayga', year_start: 2021, year_end: 2024,
    yearKey: 'Bentayga_2021_2025',
    key_blank: 'HU162', transponder_type: 'MQB', chip_type: 'Megamos AES (MQB)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: '3W0959754', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU162', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU162', image_url: null,
    programming_notes: 'Facelifted Bentayga. MLB Evo platform. Smart key: Lock, Unlock, Trunk. IMMO 5 / Megamos AES. Requires advanced programmer or dealer. HU162 emergency blade.',
  },
];

// FERRARI KEYS
const ferrariKeys = [
  // 458
  {
    model_name: '458', year_start: 2010, year_end: 2015,
    key_blank: 'SIP22', transponder_type: 'Hitag2', chip_type: 'ID46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Ferrari proprietary smart key. 3 buttons: Lock, Unlock, Trunk. Requires dealer (Ferrari SD3). SIP22 emergency blade. Dealer-only for all-keys-lost.',
    _modelSlug: '458', _newModel: true,
  },
  // 488
  {
    model_name: '488', year_start: 2016, year_end: 2019,
    yearKey: '488_2016_2019',
    key_blank: 'SIP22', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Smart proximity key. 3 buttons: Lock, Unlock, Trunk. ID49 chip. Requires Ferrari SD3 dealer tool. SIP22 emergency blade.',
  },
  // F12
  {
    model_name: 'F12', year_start: 2013, year_end: 2017,
    key_blank: 'SIP22', transponder_type: 'Hitag2', chip_type: 'ID46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Smart key: Lock, Unlock, Trunk. ID46 chip. Ferrari SD3 dealer tool required. SIP22 emergency blade.',
    _modelSlug: 'f12', _newModel: true,
  },
  // California
  {
    model_name: 'California', year_start: 2009, year_end: 2017,
    key_blank: 'SIP22', transponder_type: 'Hitag2', chip_type: 'ID46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Smart key. 3 buttons: Lock, Unlock, Trunk. Includes California T (2014-2017). Ferrari dealer tool (SD3) required. SIP22 emergency blade.',
    _modelSlug: 'california', _newModel: true,
  },
  // Roma
  {
    model_name: 'Roma', year_start: 2021, year_end: 2024,
    yearKey: 'Roma_2021_2025',
    key_blank: 'SIP22', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Smart proximity key. 3 buttons: Lock, Unlock, Trunk. ID49. Dealer-only via Ferrari SD4 tool. SIP22 emergency blade.',
  },
  // SF90
  {
    model_name: 'SF90', year_start: 2020, year_end: 2024,
    yearKey: 'SF90_2020_2025',
    key_blank: 'SIP22', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Plug-in hybrid supercar. Smart key: Lock, Unlock, Trunk. ID49. Dealer-only (Ferrari SD4). SIP22 emergency blade.',
  },
  // 296
  {
    model_name: '296', year_start: 2022, year_end: 2024,
    key_blank: 'SIP22', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Hybrid V6 supercar. Smart key: Lock, Unlock, Trunk. ID49. Dealer-only (Ferrari SD4). SIP22 emergency blade.',
    _modelSlug: '296', _newModel: true,
  },
  // 812
  {
    model_name: '812', year_start: 2018, year_end: 2024,
    key_blank: 'SIP22', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'V12 grand tourer. Includes 812 Superfast and 812 GTS. Smart key: Lock, Unlock, Trunk. ID49. Dealer-only (Ferrari SD4). SIP22 emergency blade.',
    _modelSlug: '812', _newModel: true,
  },
];

// LAMBORGHINI KEYS
const lamborghiniKeys = [
  // Gallardo (needs new model + year)
  {
    model_name: 'Gallardo', year_start: 2004, year_end: 2014,
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66', image_url: null,
    programming_notes: 'Audi-based platform. Smart key: Lock, Unlock, Trunk. ID48 (Megamos Crypto). Requires VVDI2 with Audi BCM adapter or dealer. HU66 emergency blade. PIN/CS from dealer.',
    _modelSlug: 'gallardo', _newModel: true,
  },
  // Aventador
  {
    model_name: 'Aventador', year_start: 2012, year_end: 2022,
    yearKey: 'Aventador_2012_2022',
    key_blank: 'HU66', transponder_type: 'Megamos Crypto 48', chip_type: 'ID48',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU66', image_url: null,
    programming_notes: 'Flagship V12 supercar. VW/Audi platform electronics. Smart key: Lock, Unlock, Trunk. ID48 Megamos Crypto. Requires VVDI2 or dealer. HU66 emergency blade.',
  },
  // Huracan
  {
    model_name: 'Huracan', year_start: 2015, year_end: 2024,
    yearKey: 'Huracan_2015_2025',
    key_blank: 'HU162', transponder_type: 'MQB', chip_type: 'Megamos AES (MQB)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU162', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU162', image_url: null,
    programming_notes: 'Shares platform with Audi R8. Smart key: Lock, Unlock, Trunk. MQB/Megamos AES. Requires VVDI2 Audi, Autel IM608 with G-Box3, or dealer. HU162 emergency blade. IMMO 5.',
  },
  // Urus
  {
    model_name: 'Urus', year_start: 2019, year_end: 2024,
    yearKey: 'Urus_2019_2025',
    key_blank: 'HU162', transponder_type: 'MQB', chip_type: 'Megamos AES (MQB)',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'HU162', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU162', image_url: null,
    programming_notes: 'Super SUV. MLB Evo platform (shared with Bentley Bentayga/Audi Q8). Smart key: Lock, Unlock, Trunk/Liftgate. Megamos AES / IMMO 5. Requires VVDI2 Audi or Autel IM608 with G-Box3. HU162 emergency blade.',
  },
];

// MASERATI KEYS
const maseratiKeys = [
  // GranTurismo 2008-2019
  {
    model_name: 'GranTurismo', year_start: 2008, year_end: 2019,
    yearKey: 'GranTurismo_2008_2019',
    key_blank: 'SIP22', transponder_type: 'Hitag2', chip_type: 'ID46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-7393490', ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Smart key. 3 buttons: Lock, Unlock, Trunk. ID46 chip. Ferrari/Maserati dealer tool or Autel IM608 for programming. SIP22 emergency blade.',
  },
  // GranTurismo 2023-2024 (new gen)
  {
    model_name: 'GranTurismo', year_start: 2023, year_end: 2024,
    yearKey: 'GranTurismo_2023_2025',
    key_blank: 'SIP22', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-7393490', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'New generation GranTurismo. Stellantis platform. Smart key: Lock, Unlock, Trunk, Panic. 4A chip. Requires dealer or Autel IM608 Pro. SIP22 emergency blade.',
  },
  // Quattroporte 2005-2012
  {
    model_name: 'Quattroporte', year_start: 2005, year_end: 2012,
    yearKey: 'Quattroporte_2005_2012',
    key_blank: 'SIP22', transponder_type: 'Hitag2', chip_type: 'ID46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Smart key. 3 buttons: Lock, Unlock, Trunk. ID46 chip. Dealer tool required. SIP22 emergency blade.',
  },
  // Quattroporte 2013-2024
  {
    model_name: 'Quattroporte', year_start: 2013, year_end: 2024,
    yearKey: 'Quattroporte_2013_2025',
    key_blank: 'SIP22', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-7393490', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Smart key. 4 buttons: Lock, Unlock, Trunk, Panic. Chrysler/Stellantis platform. Autel IM608 or dealer tool. PIN required. SIP22 emergency blade.',
  },
  // Ghibli 2014-2023
  {
    model_name: 'Ghibli', year_start: 2014, year_end: 2023,
    yearKey: 'Ghibli_2014_2023',
    key_blank: 'SIP22', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-7393490', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'Smart key. 4 buttons: Lock, Unlock, Trunk, Panic. Chrysler/Stellantis platform. Autel IM608 or dealer. PIN required. SIP22 emergency blade.',
  },
  // Levante 2017-2024
  {
    model_name: 'Levante', year_start: 2017, year_end: 2024,
    yearKey: 'Levante_2017_2025',
    key_blank: 'SIP22', transponder_type: 'Hitag AES', chip_type: '4A chip',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'M3N-7393490', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'SIP22', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi SIP22', image_url: null,
    programming_notes: 'SUV. Smart key. 4 buttons: Lock, Unlock, Liftgate, Panic. Chrysler/Stellantis platform. Autel IM608 or dealer. PIN required. SIP22 emergency blade.',
  },
];

// McLAREN KEYS
const mclarenKeys = [
  // 570S (needs new model + year)
  {
    model_name: '570S', year_start: 2016, year_end: 2021,
    key_blank: 'N/A', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null, image_url: null,
    programming_notes: 'McLaren proprietary smart key. 3 buttons: Lock, Unlock, Trunk. ID49 chip. Dealer-only (McLaren Diagnosis System). No aftermarket support. No mechanical key override on most models.',
    _modelSlug: '570s', _newModel: true,
  },
  // 600LT (needs new model + year)
  {
    model_name: '600LT', year_start: 2019, year_end: 2021,
    key_blank: 'N/A', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null, image_url: null,
    programming_notes: 'Track-focused variant. Same key system as 570S. Smart key: Lock, Unlock, Trunk. ID49. Dealer-only (McLaren Diagnosis System).',
    _modelSlug: '600lt', _newModel: true,
  },
  // 620R (needs new model + year)
  {
    model_name: '620R', year_start: 2021, year_end: 2021,
    key_blank: 'N/A', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null, image_url: null,
    programming_notes: 'Limited production track car. Same key system as 570S/600LT. Smart key: Lock, Unlock, Trunk. ID49. Dealer-only.',
    _modelSlug: '620r', _newModel: true,
  },
  // 720S
  {
    model_name: '720S', year_start: 2018, year_end: 2024,
    yearKey: '720S_2018_2024',
    key_blank: 'N/A', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null, image_url: null,
    programming_notes: 'Super Series. McLaren proprietary smart key. 3 buttons: Lock, Unlock, Trunk. ID49 chip. Dealer-only (McLaren Diagnosis System).',
  },
  // GT
  {
    model_name: 'GT', year_start: 2020, year_end: 2024,
    yearKey: 'GT_2020_2025',
    key_blank: 'N/A', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null, image_url: null,
    programming_notes: 'Grand Tourer. Smart key: Lock, Unlock, Trunk (front and rear storage). ID49 chip. Dealer-only programming via McLaren Diagnosis System.',
  },
  // Artura
  {
    model_name: 'Artura', year_start: 2023, year_end: 2024,
    yearKey: 'Artura_2022_2025',
    key_blank: 'N/A', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null, image_url: null,
    programming_notes: 'Hybrid supercar. New McLaren Carbon Lightweight Architecture (MCLA). Smart key: Lock, Unlock, Trunk. ID49. Dealer-only programming.',
  },
];

// ROLLS-ROYCE KEYS
const rollsRoyceKeys = [
  // Phantom 2003-2017 (VII)
  {
    model_name: 'Phantom', year_start: 2003, year_end: 2017,
    yearKey: 'Phantom_2003_2017',
    key_blank: 'HU92', transponder_type: 'Hitag2', chip_type: 'ID46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU92', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU92', image_url: null,
    programming_notes: 'BMW 7-Series based platform. Smart key: Lock, Unlock, Trunk, Panic. ID46 chip. Requires BMW ISTA/ICOM or VVDI2 BMW. HU92 emergency blade.',
  },
  // Phantom 2018-2024 (VIII)
  {
    model_name: 'Phantom', year_start: 2018, year_end: 2024,
    yearKey: 'Phantom_2018_2025',
    key_blank: 'HU100R', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5767', ic_number: null,
    battery_type: 'CR2450', buttons: '4',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU100R', image_url: null,
    programming_notes: 'New BMW architecture. Smart key: Lock, Unlock, Trunk, Panic. ID49 chip. Requires BMW ISTA+ or VVDI2 BMW with BDC adapter. HU100R emergency blade. Display key option available.',
  },
  // Ghost 2010-2020 (1st gen)
  {
    model_name: 'Ghost', year_start: 2010, year_end: 2020,
    yearKey: 'Ghost_2010_2020',
    key_blank: 'HU92', transponder_type: 'Hitag2', chip_type: 'ID46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU92', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU92', image_url: null,
    programming_notes: 'BMW 7-Series (F01) based. Smart key: Lock, Unlock, Trunk, Panic. ID46 chip. BMW ISTA/ICOM or VVDI2 BMW. HU92 emergency blade.',
  },
  // Ghost 2021-2024 (2nd gen)
  {
    model_name: 'Ghost', year_start: 2021, year_end: 2024,
    yearKey: 'Ghost_2021_2025',
    key_blank: 'HU100R', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5767', ic_number: null,
    battery_type: 'CR2450', buttons: '4',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU100R', image_url: null,
    programming_notes: 'New BMW architecture. Smart key: Lock, Unlock, Trunk, Panic. ID49 chip. Requires BMW ISTA+ with BDC adapter or VVDI2 BMW. HU100R emergency blade.',
  },
  // Wraith 2014-2023
  {
    model_name: 'Wraith', year_start: 2014, year_end: 2023,
    yearKey: 'Wraith_2014_2023',
    key_blank: 'HU92', transponder_type: 'Hitag2', chip_type: 'ID46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU92', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU92', image_url: null,
    programming_notes: 'Based on Ghost/BMW 7-Series. Coupe body. Smart key: Lock, Unlock, Trunk, Panic. ID46 chip. BMW ISTA or VVDI2 BMW. HU92 emergency blade.',
  },
  // Dawn 2016-2023 (needs new model + year)
  {
    model_name: 'Dawn', year_start: 2016, year_end: 2023,
    key_blank: 'HU92', transponder_type: 'Hitag2', chip_type: 'ID46',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5662', ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'HU92', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU92', image_url: null,
    programming_notes: 'Convertible based on Wraith/Ghost platform. Smart key: Lock, Unlock, Trunk, Panic. ID46 chip. BMW ISTA or VVDI2 BMW. HU92 emergency blade.',
    _modelSlug: 'dawn', _newModel: true,
  },
  // Cullinan 2019-2024
  {
    model_name: 'Cullinan', year_start: 2019, year_end: 2024,
    yearKey: 'Cullinan_2019_2025',
    key_blank: 'HU100R', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: 'YGOHUF5767', ic_number: null,
    battery_type: 'CR2450', buttons: '4',
    emergency_key_blank: 'HU100R', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU100R', image_url: null,
    programming_notes: 'Luxury SUV. Same Architecture of Luxury as Phantom VIII. Smart key: Lock, Unlock, Trunk, Panic. ID49 chip. BMW ISTA+ or VVDI2 BMW with BDC adapter. HU100R emergency blade.',
  },
];

// MAYBACH KEYS
const maybachKeys = [
  // Maybach S-Class 2015-2020 (X222)
  {
    model_name: 'S-Class', year_start: 2015, year_end: 2020,
    yearKey: 'SClass_2015_2020',
    key_blank: 'HU64', transponder_type: 'Hitag Pro', chip_type: 'ID47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC12K', ic_number: null,
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU64', image_url: null,
    programming_notes: 'Mercedes-Maybach S-Class (X222). Uses Mercedes-Benz key system. Smart key: Lock, Unlock, Trunk, Panic. ID47 chip (IR + FBS4). Requires Mercedes SDS, VVDI MB Tool, or Autel IM608. HU64 emergency blade.',
  },
  // Maybach S-Class 2021-2024 (Z223)
  {
    model_name: 'S-Class', year_start: 2021, year_end: 2024,
    yearKey: 'SClass_2021_2025',
    key_blank: 'HU64', transponder_type: 'Hitag Pro', chip_type: 'ID47',
    remote_frequency: '315 MHz', key_type: 'smart_key',
    fcc_id: 'IYZDC12K', ic_number: null,
    battery_type: 'CR2025', buttons: '4',
    emergency_key_blank: 'HU64', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi HU64', image_url: null,
    programming_notes: 'Mercedes-Maybach S-Class (Z223). Latest Mercedes key system. Smart key: Lock, Unlock, Trunk, Panic. ID47/FBS4. Requires Mercedes SDS (Xentry) or VVDI MB Tool. HU64 emergency blade.',
  },
];

// LOTUS KEYS
const lotusKeys = [
  // Elise 2005-2011
  {
    model_name: 'Elise', year_start: 2005, year_end: 2011,
    yearKey: 'Elise_2005_2011',
    key_blank: 'TOY43', transponder_type: 'Texas Crypto', chip_type: '4D-67',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: 'TOY43',
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi TOY43', image_url: null,
    programming_notes: 'Uses Toyota-based immobilizer. 4D-67 transponder chip. Toyota key blade TOY43. Requires Toyota TIS/Techstream or VVDI Key Tool. No remote functionality on most Elise models.',
  },
  // Evora 2010-2021
  {
    model_name: 'Evora', year_start: 2010, year_end: 2021,
    yearKey: 'Evora_2010_2021',
    key_blank: 'TOY43', transponder_type: 'Texas Crypto', chip_type: '4D-67',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: 'TOY43', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi TOY43', image_url: null,
    programming_notes: 'Smart key with push-button start. Toyota-based electronics. 3 buttons: Lock, Unlock, Trunk. 4D-67 chip. Requires Lotus dealer tool or Toyota Techstream. TOY43 emergency blade.',
  },
  // Emira 2022-2024
  {
    model_name: 'Emira', year_start: 2022, year_end: 2024,
    yearKey: 'Emira_2022_2025',
    key_blank: 'N/A', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: null, image_url: null,
    programming_notes: 'New Lotus platform (not Toyota-based). Smart key: Lock, Unlock, Trunk. ID49 chip. Requires Lotus dealer diagnostic tool. Limited aftermarket support.',
  },
];

// POLESTAR KEYS
const polestarKeys = [
  // Polestar 2 2021-2024 - Smart Key
  {
    model_name: 'Polestar 2', year_start: 2021, year_end: 2024,
    yearKey: 'Polestar2_2021_2025',
    key_blank: 'NE66', transponder_type: 'Hitag Pro', chip_type: 'ID49',
    remote_frequency: '433 MHz', key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: 'NE66', test_key_blank: null,
    obd_programmable: false, pin_code_required: true,
    lishi_tool: 'Lishi NE66', image_url: null,
    programming_notes: 'Volvo CMA platform electric vehicle. Smart key: Lock, Unlock, Trunk, Panic. ID49 chip. Also supports phone-as-key via Bluetooth. Requires Volvo VIDA/TechTool or dealer. NE66 emergency blade.',
  },
  // Polestar 2 2021-2024 - Digital Key
  {
    model_name: 'Polestar 2', year_start: 2021, year_end: 2024,
    yearKey: 'Polestar2_2021_2025',
    key_blank: 'N/A', transponder_type: 'BLE (Bluetooth Low Energy)', chip_type: 'BLE',
    remote_frequency: null, key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Activity Key (phone key). BLE-based digital key. Paired via Polestar app. Used as backup or primary digital key. Dealer programming for replacement.',
  },
];

// RIVIAN KEYS
const rivianKeys = [
  // R1T - Smart Key Fob
  {
    model_name: 'R1T', year_start: 2022, year_end: 2024,
    yearKey: 'R1T_2022_2025',
    key_blank: 'N/A', transponder_type: 'BLE / UWB', chip_type: 'BLE/UWB',
    remote_frequency: null, key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Electric pickup truck. Smart key fob: Lock, Unlock, Frunk, Panic. BLE/UWB technology. Phone-as-key via Rivian app. NFC key card backup. Dealer-only programming.',
  },
  // R1T - Key Card
  {
    model_name: 'R1T', year_start: 2022, year_end: 2024,
    yearKey: 'R1T_2022_2025',
    key_blank: 'N/A', transponder_type: 'NFC', chip_type: 'NFC',
    remote_frequency: null, key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'NFC key card. Tap on B-pillar to unlock/lock. Paired via Rivian app or dealer. No battery required.',
  },
  // R1S - Smart Key Fob
  {
    model_name: 'R1S', year_start: 2022, year_end: 2024,
    yearKey: 'R1S_2022_2025',
    key_blank: 'N/A', transponder_type: 'BLE / UWB', chip_type: 'BLE/UWB',
    remote_frequency: null, key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Electric SUV. Same key system as R1T. Smart key fob: Lock, Unlock, Frunk, Panic. BLE/UWB. Phone-as-key via Rivian app. Dealer-only.',
  },
  // R1S - Key Card
  {
    model_name: 'R1S', year_start: 2022, year_end: 2024,
    yearKey: 'R1S_2022_2025',
    key_blank: 'N/A', transponder_type: 'NFC', chip_type: 'NFC',
    remote_frequency: null, key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'NFC key card. Same system as R1T. Tap on B-pillar to unlock/lock. Paired via Rivian app or dealer.',
  },
];

// LUCID KEYS
const lucidKeys = [
  // Air - Smart Key Fob
  {
    model_name: 'Air', year_start: 2022, year_end: 2024,
    yearKey: 'Air_2022_2025',
    key_blank: 'N/A', transponder_type: 'BLE / UWB', chip_type: 'BLE/UWB',
    remote_frequency: null, key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '4',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Luxury EV sedan. Smart key fob: Lock, Unlock, Frunk, Panic. BLE/UWB technology. Phone-as-key primary method via Lucid app. Dealer-only for fob programming.',
  },
  // Air - Key Card
  {
    model_name: 'Air', year_start: 2022, year_end: 2024,
    yearKey: 'Air_2022_2025',
    key_blank: 'N/A', transponder_type: 'NFC', chip_type: 'NFC',
    remote_frequency: null, key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'NFC key card. Hold near driver door handle or center console to unlock. Paired through Lucid app or dealer.',
  },
];

// TESLA KEYS
const teslaKeys = [
  // Model S 2012-2020 - Key Fob
  {
    model_name: 'Model S', year_start: 2012, year_end: 2020,
    yearKey: 'ModelS_2012_2020',
    key_blank: 'N/A', transponder_type: 'BLE', chip_type: 'BLE',
    remote_frequency: null, key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Tesla key fob (car-shaped). 3 functions: Front Trunk, Lock/Unlock, Rear Trunk. Passive entry via BLE. Phone key via Tesla app (2017+). Paired via touchscreen. No traditional key blade.',
  },
  // Model S 2021-2024 - Key Card / Phone
  {
    model_name: 'Model S', year_start: 2021, year_end: 2024,
    yearKey: 'ModelS_2021_2024',
    key_blank: 'N/A', transponder_type: 'NFC / BLE', chip_type: 'NFC/BLE',
    remote_frequency: null, key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Phone key primary (Tesla app BLE). NFC key card included (tap on B-pillar). Optional key fob sold separately. Paired via touchscreen. No traditional locksmith service. Tesla service for all-keys-lost.',
  },
  // Model X 2016-2020 - Key Fob
  {
    model_name: 'Model X', year_start: 2016, year_end: 2020,
    yearKey: 'ModelX_2016_2020',
    key_blank: 'N/A', transponder_type: 'BLE', chip_type: 'BLE',
    remote_frequency: null, key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: 'CR2032', buttons: '3',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Tesla key fob (car-shaped with falcon wing design). 3 functions: Front Trunk, Lock/Unlock, Rear. BLE passive entry. Phone key (2017+). Paired via touchscreen.',
  },
  // Model X 2021-2024 - Key Card / Phone
  {
    model_name: 'Model X', year_start: 2021, year_end: 2024,
    yearKey: 'ModelX_2021_2024',
    key_blank: 'N/A', transponder_type: 'NFC / BLE', chip_type: 'NFC/BLE',
    remote_frequency: null, key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Phone key primary (Tesla app BLE). NFC key card included. Optional key fob. Paired via touchscreen. Tesla service for all-keys-lost.',
  },
  // Model 3 2018-2024
  {
    model_name: 'Model 3', year_start: 2018, year_end: 2024,
    yearKey: 'Model3_2018_2024',
    key_blank: 'N/A', transponder_type: 'NFC / BLE', chip_type: 'NFC/BLE',
    remote_frequency: null, key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'NFC key card primary physical key (tap on B-pillar/center console). Phone key via Tesla app (BLE). Optional key fob ($150). Two key cards included. Paired via touchscreen. No traditional locksmith service.',
  },
  // Model Y 2020-2024
  {
    model_name: 'Model Y', year_start: 2020, year_end: 2024,
    yearKey: 'ModelY_2020_2024',
    key_blank: 'N/A', transponder_type: 'NFC / BLE', chip_type: 'NFC/BLE',
    remote_frequency: null, key_type: 'smart_key',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Same key system as Model 3. NFC key card primary. Phone key via Tesla app (BLE). Optional key fob. Paired via touchscreen. No traditional locksmith service.',
  },
];

// FREIGHTLINER KEYS
const freightlinerKeys = [
  // Cascadia 2008-2017
  {
    model_name: 'Cascadia', year_start: 2008, year_end: 2017,
    yearKey: 'Cascadia_2008_2017',
    key_blank: 'Y157', transponder_type: 'Texas Crypto 4D', chip_type: '4D-64',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: 'Y157',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Class 8 semi truck. Transponder key with 4D-64 chip. Y157 key blank (Mercedes commercial). OBD programmable with Autel or VVDI. Daimler platform.',
  },
  // Cascadia 2018-2024
  {
    model_name: 'Cascadia', year_start: 2018, year_end: 2024,
    yearKey: 'Cascadia_2018_2025',
    key_blank: 'Y157', transponder_type: 'Texas Crypto 4D', chip_type: '4D-64',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: 'Y157',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'New Cascadia. 4D-64 transponder chip. Y157 key blank. OBD programmable. Daimler/Mercedes commercial platform.',
  },
  // M2 2004-2024
  {
    model_name: 'M2', year_start: 2004, year_end: 2024,
    yearKey: 'M2_2004_2025',
    key_blank: 'Y157', transponder_type: 'Texas Crypto 4D', chip_type: '4D-64',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: 'Y157',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Medium-duty truck. 4D-64 transponder chip. Y157 key blank. OBD programmable. Daimler platform. Common in box trucks and vocational applications.',
  },
];

// KENWORTH KEYS
const kenworthKeys = [
  // T680
  {
    model_name: 'T680', year_start: 2013, year_end: 2024,
    yearKey: 'T680_2013_2025',
    key_blank: 'X214', transponder_type: 'No transponder', chip_type: 'None',
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Class 8 semi truck. Non-transponder ignition key. X214 key blank (PACCAR). Cut to code only. No immobilizer chip.',
  },
  // T880
  {
    model_name: 'T880', year_start: 2014, year_end: 2024,
    yearKey: 'T880_2014_2025',
    key_blank: 'X214', transponder_type: 'No transponder', chip_type: 'None',
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Vocational/heavy-haul class 8 truck. Non-transponder X214 key blank (PACCAR). Cut to code.',
  },
  // W900
  {
    model_name: 'W900', year_start: 1990, year_end: 2024,
    yearKey: 'W900_1990_2006',
    key_blank: 'X214', transponder_type: 'No transponder', chip_type: 'None',
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Iconic long-nose class 8 truck. Non-transponder ignition. X214 key blank (PACCAR). Cut by code. Traditional mechanical key.',
  },
];

// PETERBILT KEYS
const peterbiltKeys = [
  // 579
  {
    model_name: '579', year_start: 2013, year_end: 2024,
    yearKey: '579_2013_2025',
    key_blank: 'X214', transponder_type: 'No transponder', chip_type: 'None',
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Aerodynamic class 8 semi truck. Non-transponder key. X214 key blank (PACCAR). Cut to code only. PACCAR platform (sister to Kenworth T680).',
  },
  // 389
  {
    model_name: '389', year_start: 2007, year_end: 2024,
    yearKey: '389_2007_2025',
    key_blank: 'X214', transponder_type: 'No transponder', chip_type: 'None',
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Long-nose class 8 truck. Non-transponder key. X214 key blank (PACCAR). Cut by code. Traditional mechanical ignition key.',
  },
];

// MACK KEYS
const mackKeys = [
  // Anthem
  {
    model_name: 'Anthem', year_start: 2018, year_end: 2024,
    yearKey: 'Anthem_2018_2025',
    key_blank: 'VO15R', transponder_type: 'No transponder', chip_type: 'None',
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Class 8 highway truck. Volvo Group platform. VO15R key blank. Non-transponder mechanical key. Cut to code.',
  },
  // Granite 2002-2024
  {
    model_name: 'Granite', year_start: 2002, year_end: 2024,
    yearKey: 'Granite_2002_2025',
    key_blank: 'VO15R', transponder_type: 'No transponder', chip_type: 'None',
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Vocational/construction class 8 truck. Non-transponder key. VO15R key blank. Cut to code. Mechanical ignition.',
  },
  // Pinnacle 2006-2019
  {
    model_name: 'Pinnacle', year_start: 2006, year_end: 2019,
    yearKey: 'Pinnacle_2006_2019',
    key_blank: 'VO15R', transponder_type: 'No transponder', chip_type: 'None',
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Highway class 8 truck. Non-transponder mechanical key. VO15R key blank. Cut to code. Replaced by Anthem in 2018.',
  },
];

// INTERNATIONAL KEYS
const internationalKeys = [
  // LT
  {
    model_name: 'LT', year_start: 2018, year_end: 2024,
    yearKey: 'LT_2017_2025',
    key_blank: 'SC1', transponder_type: 'Texas Crypto 4D', chip_type: '4D',
    remote_frequency: null, key_type: 'transponder',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: 'SC1',
    obd_programmable: true, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Class 8 highway truck (replaced ProStar). 4D transponder chip. SC1 key blank (International/Navistar). OBD programmable with Navistar ServiceMaxx or compatible tool.',
  },
  // ProStar 2008-2017
  {
    model_name: 'ProStar', year_start: 2008, year_end: 2017,
    yearKey: 'ProStar_2008_2017',
    key_blank: 'SC1', transponder_type: 'No transponder', chip_type: 'None',
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Class 8 highway truck. Non-transponder mechanical key. SC1 key blank (International/Navistar). Cut to code.',
  },
  // LoneStar (needs new model + year)
  {
    model_name: 'LoneStar', year_start: 2010, year_end: 2017,
    key_blank: 'SC1', transponder_type: 'No transponder', chip_type: 'None',
    remote_frequency: null, key_type: 'standard',
    fcc_id: null, ic_number: null,
    battery_type: null, buttons: 'N/A',
    emergency_key_blank: null, test_key_blank: null,
    obd_programmable: false, pin_code_required: false,
    lishi_tool: null, image_url: null,
    programming_notes: 'Premium class 8 truck (long-nose ProStar variant). Non-transponder key. SC1 key blank. Cut to code. Mechanical ignition. Model discontinued, replaced by LT.',
    _modelSlug: 'lonestar', _newModel: true,
  },
];

// ============================================================
// Combine all data
// ============================================================
const allData = [
  { id: MFR.ALFA_ROMEO,    name: 'Alfa Romeo',    keys: alfaRomeoKeys },
  { id: MFR.ASTON_MARTIN,  name: 'Aston Martin',  keys: astonMartinKeys },
  { id: MFR.BENTLEY,       name: 'Bentley',        keys: bentleyKeys },
  { id: MFR.FERRARI,       name: 'Ferrari',        keys: ferrariKeys },
  { id: MFR.LAMBORGHINI,   name: 'Lamborghini',    keys: lamborghiniKeys },
  { id: MFR.MASERATI,      name: 'Maserati',       keys: maseratiKeys },
  { id: MFR.MCLAREN,       name: 'McLaren',        keys: mclarenKeys },
  { id: MFR.ROLLS_ROYCE,   name: 'Rolls-Royce',    keys: rollsRoyceKeys },
  { id: MFR.MAYBACH,       name: 'Maybach',         keys: maybachKeys },
  { id: MFR.LOTUS,         name: 'Lotus',           keys: lotusKeys },
  { id: MFR.POLESTAR,      name: 'Polestar',        keys: polestarKeys },
  { id: MFR.RIVIAN,        name: 'Rivian',           keys: rivianKeys },
  { id: MFR.LUCID,         name: 'Lucid',            keys: lucidKeys },
  { id: MFR.TESLA,         name: 'Tesla',            keys: teslaKeys },
  { id: MFR.FREIGHTLINER,  name: 'Freightliner',    keys: freightlinerKeys },
  { id: MFR.KENWORTH,      name: 'Kenworth',         keys: kenworthKeys },
  { id: MFR.PETERBILT,     name: 'Peterbilt',        keys: peterbiltKeys },
  { id: MFR.MACK,          name: 'Mack',             keys: mackKeys },
  { id: MFR.INTERNATIONAL, name: 'International',    keys: internationalKeys },
];

// ============================================================
// MAIN EXECUTION
// ============================================================
async function main() {
  await client.connect();
  console.log('Connected to database.');

  try {
    await client.query('BEGIN');

    // Step 1: Delete all existing automotive_keys rows for these manufacturers
    let totalDeleted = 0;
    for (const mfr of allData) {
      const del = await client.query(
        'DELETE FROM automotive_keys WHERE manufacturer_id = $1',
        [mfr.id]
      );
      console.log(`Deleted ${del.rowCount} existing ${mfr.name} rows.`);
      totalDeleted += del.rowCount;
    }
    console.log(`\nTotal deleted: ${totalDeleted} rows.\n`);

    // Step 2: Create missing vehicle_models and vehicle_years
    // Collect all keys that need new models
    const newModelMap = {}; // slug -> { model_id, mfr_id, name }
    for (const mfr of allData) {
      for (const k of mfr.keys) {
        if (k._newModel) {
          const slug = k._modelSlug;
          if (!newModelMap[`${mfr.id}_${slug}`]) {
            // Check if it already exists
            const existing = await client.query(
              'SELECT id FROM vehicle_models WHERE manufacturer_id = $1 AND slug = $2',
              [mfr.id, slug]
            );
            if (existing.rows.length > 0) {
              newModelMap[`${mfr.id}_${slug}`] = { model_id: existing.rows[0].id };
              console.log(`Model ${mfr.name} ${k.model_name} already exists (${existing.rows[0].id})`);
            } else {
              const ins = await client.query(
                'INSERT INTO vehicle_models (manufacturer_id, name, slug) VALUES ($1, $2, $3) RETURNING id',
                [mfr.id, k.model_name, slug]
              );
              newModelMap[`${mfr.id}_${slug}`] = { model_id: ins.rows[0].id };
              console.log(`Created model: ${mfr.name} ${k.model_name} (${ins.rows[0].id})`);
            }
          }
        }
      }
    }

    // Step 3: Create vehicle_years for new models, and for any key entries that need them
    const yearIdCache = { ...YEAR_IDS }; // start with known year IDs

    for (const mfr of allData) {
      for (const k of mfr.keys) {
        if (k.yearKey && yearIdCache[k.yearKey]) {
          // Already have a year_id for this
          continue;
        }

        // Need to find or create a vehicle_year entry
        let modelId;
        if (k._newModel) {
          modelId = newModelMap[`${mfr.id}_${k._modelSlug}`].model_id;
        } else {
          modelId = MODEL_IDS[k.model_name];
        }

        if (!modelId) {
          throw new Error(`No model_id found for ${mfr.name} ${k.model_name}`);
        }

        // Check if a vehicle_year already exists for this model + year range
        const existingYear = await client.query(
          'SELECT id FROM vehicle_years WHERE model_id = $1 AND year_start = $2 AND year_end = $3',
          [modelId, k.year_start, k.year_end]
        );

        let yearId;
        if (existingYear.rows.length > 0) {
          yearId = existingYear.rows[0].id;
          console.log(`Year range ${k.year_start}-${k.year_end} for ${k.model_name} already exists (${yearId})`);
        } else {
          // Check if there's an overlapping year range we can use
          const overlapping = await client.query(
            'SELECT id, year_start, year_end FROM vehicle_years WHERE model_id = $1 AND year_start <= $2 AND year_end >= $3',
            [modelId, k.year_start, k.year_end]
          );
          if (overlapping.rows.length > 0) {
            yearId = overlapping.rows[0].id;
            console.log(`Using overlapping year range ${overlapping.rows[0].year_start}-${overlapping.rows[0].year_end} for ${k.model_name} ${k.year_start}-${k.year_end} (${yearId})`);
          } else {
            // Create new
            const ins = await client.query(
              'INSERT INTO vehicle_years (model_id, year_start, year_end) VALUES ($1, $2, $3) RETURNING id',
              [modelId, k.year_start, k.year_end]
            );
            yearId = ins.rows[0].id;
            console.log(`Created year range: ${k.model_name} ${k.year_start}-${k.year_end} (${yearId})`);
          }
        }

        // Cache it
        const cacheKey = k.yearKey || `${k.model_name}_${k.year_start}_${k.year_end}`;
        yearIdCache[cacheKey] = yearId;
        if (!k.yearKey) {
          k.yearKey = cacheKey;
        }
      }
    }

    // Step 4: Insert all key entries
    let totalInserted = 0;
    for (const mfr of allData) {
      let count = 0;
      for (const k of mfr.keys) {
        const yearId = yearIdCache[k.yearKey];
        if (!yearId) {
          throw new Error(`No year_id for ${mfr.name} ${k.model_name} (yearKey: ${k.yearKey})`);
        }

        await client.query(
          `INSERT INTO automotive_keys (
            manufacturer_id, year_id, model_name, year_start, year_end,
            key_blank, transponder_type, chip_type,
            remote_frequency, key_type, fcc_id, ic_number,
            battery_type, buttons,
            emergency_key_blank, test_key_blank,
            obd_programmable, pin_code_required,
            lishi_tool, image_url, programming_notes
          ) VALUES (
            $1, $2, $3, $4, $5,
            $6, $7, $8,
            $9, $10, $11, $12,
            $13, $14,
            $15, $16,
            $17, $18,
            $19, $20, $21
          )`,
          [
            mfr.id, yearId, k.model_name, k.year_start, k.year_end,
            k.key_blank, k.transponder_type, k.chip_type,
            k.remote_frequency, k.key_type, k.fcc_id, k.ic_number,
            k.battery_type, k.buttons,
            k.emergency_key_blank, k.test_key_blank,
            k.obd_programmable, k.pin_code_required,
            k.lishi_tool, k.image_url, k.programming_notes
          ]
        );
        count++;
      }
      console.log(`Inserted ${count} ${mfr.name} key(s).`);
      totalInserted += count;
    }
    console.log(`\nTotal inserted: ${totalInserted} rows.`);

    await client.query('COMMIT');
    console.log('Transaction committed successfully.\n');

    // Step 5: Verify counts
    console.log('========== VERIFICATION ==========');
    let grandTotal = 0;
    for (const mfr of allData) {
      const verify = await client.query(
        'SELECT COUNT(*) as cnt FROM automotive_keys WHERE manufacturer_id = $1',
        [mfr.id]
      );
      const cnt = parseInt(verify.rows[0].cnt);
      grandTotal += cnt;
      console.log(`${mfr.name}: ${cnt} rows`);
    }
    console.log(`\nGRAND TOTAL: ${grandTotal} rows across all ${allData.length} manufacturers.`);

    // Breakdown by model
    console.log('\n========== BREAKDOWN BY MODEL ==========');
    for (const mfr of allData) {
      console.log(`\n--- ${mfr.name.toUpperCase()} ---`);
      const models = await client.query(
        `SELECT model_name, COUNT(*) as cnt,
                MIN(year_start) as min_year, MAX(year_end) as max_year
         FROM automotive_keys
         WHERE manufacturer_id = $1
         GROUP BY model_name
         ORDER BY model_name`,
        [mfr.id]
      );
      for (const row of models.rows) {
        console.log(`  ${row.model_name}: ${row.cnt} variant(s) [${row.min_year}-${row.max_year}]`);
      }
    }

  } catch (err) {
    await client.query('ROLLBACK');
    console.error('Error - transaction rolled back:', err.message);
    throw err;
  } finally {
    await client.end();
    console.log('\nDatabase connection closed.');
  }
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
