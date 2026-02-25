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

// Manufacturer IDs
const GMC_ID = 'c8982dc7-95fc-4b3a-820f-d0a616ae769a';
const CHRYSLER_ID = '346d79c0-f83d-402b-8c86-66a650b6817f';
const RAM_ID = '3f050066-07ac-428b-a8e5-774fedda674e';
const ACURA_ID = '5d934439-3901-4ea8-a641-03ef2184e6ad';
const INFINITI_ID = 'd421b97b-6e64-4d86-abf3-a859ce80fb8b';
const MAZDA_ID = 'f1e4802d-31b4-48e6-a273-49b3f770cdd6';
const AUDI_ID = '5faa9e99-1b32-4d73-8946-c5d454b2cd08';
const VOLVO_ID = 'deeb46ee-c72f-4300-b7c3-d6c7037ee767';
const LINCOLN_ID = '8ca10434-0c88-44cb-b8f4-b5cadb0ae162';

const ALL_MFR_IDS = [GMC_ID, CHRYSLER_ID, RAM_ID, ACURA_ID, INFINITI_ID, MAZDA_ID, AUDI_ID, VOLVO_ID, LINCOLN_ID];

// =================================================================
// IMAGE URL MAPPINGS
// Keys: { fcc_id, key_blank, manufacturer_id } => image_url
// For keys with FCC IDs, we match by fcc_id + manufacturer_id
// For transponder-only keys (no FCC ID), we match by key_blank + manufacturer_id
// =================================================================

const imageMap = [
  // ========================== GMC ==========================
  // B97-PT transponder (no FCC ID)
  { fcc_id: null, key_blank: 'B97-PT', manufacturer_id: GMC_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/tk-buick-02lot10__1_large.jpg?v=1684980262' },
  // B99-PT transponder (no FCC ID)
  { fcc_id: null, key_blank: 'B99-PT', manufacturer_id: GMC_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/TK-CHEVR-02-ILC__1_large.jpg?v=1759441431' },
  // B111-PT transponder (no FCC ID)
  { fcc_id: null, key_blank: 'B111-PT', manufacturer_id: GMC_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/TK-CHREVR-05LOT25__1_c5943026-1907-4ab9-9d38-7af968996e48_large.jpg?v=1759783616' },
  // OHT01060512 - GMC Terrain flip key / remote head key
  { fcc_id: 'OHT01060512', key_blank: null, manufacturer_id: GMC_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-gmc-02-str__1_large.jpg?v=1754517634' },
  // M3N-32337100 - GMC Sierra/Canyon flip key
  { fcc_id: 'M3N-32337100', key_blank: null, manufacturer_id: GMC_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chevr-56__1_large.jpg?v=1754517208' },
  // HYQ1EA - GMC Acadia/Terrain smart key
  { fcc_id: 'HYQ1EA', key_blank: null, manufacturer_id: GMC_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-gmc-16__1_large.jpg?v=1754517230' },
  // HYQ1AA - GMC Yukon smart key
  { fcc_id: 'HYQ1AA', key_blank: null, manufacturer_id: GMC_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-gmc-07__1_large.jpg?v=1754517380' },
  // HYQ4AA - GMC smart key (shared with Chevy)
  { fcc_id: 'HYQ4AA', key_blank: null, manufacturer_id: GMC_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chevr-112__1_large.jpg?v=1754517080' },
  // YG0G21TB2 - GMC Sierra/Canyon/Yukon smart key (2022+)
  { fcc_id: 'YG0G21TB2', key_blank: null, manufacturer_id: GMC_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/RC-CHEVR-149__1_67c134e3-69ed-437e-8ba2-5efa7f3ced6f_large.jpg?v=1754516728' },

  // ========================== CHRYSLER ==========================
  // Y160-PT transponder (no FCC ID)
  { fcc_id: null, key_blank: 'Y160-PT', manufacturer_id: CHRYSLER_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/tk-chrys-06__1_large.jpg?v=1755892094' },
  // HU64 transponder (Chrysler Crossfire) (no FCC ID)
  { fcc_id: null, key_blank: 'HU64', manufacturer_id: CHRYSLER_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/TK-BENZ-02__1_b35173d9-8c70-4345-901d-183675e08521_large.jpg?v=1768932440' },
  // OHT692427AA - Chrysler fobik key
  { fcc_id: 'OHT692427AA', key_blank: null, manufacturer_id: CHRYSLER_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chrys-16__1_large.jpg?v=1756402721' },
  // IYZ-C01C - Chrysler Town & Country smart fobik
  { fcc_id: 'IYZ-C01C', key_blank: null, manufacturer_id: CHRYSLER_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chrys-02__1_large.jpg?v=1756402575' },
  // M3N5WY783X - Chrysler fobik
  { fcc_id: 'M3N5WY783X', key_blank: null, manufacturer_id: CHRYSLER_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chrys-02__1_large.jpg?v=1756402575' },
  // M3N-40821302 - Chrysler 300 smart key
  { fcc_id: 'M3N-40821302', key_blank: null, manufacturer_id: CHRYSLER_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/products/RS-CHRYS-23__1_large.jpg?v=1756402723' },
  // M3N-97395900 - Chrysler Pacifica smart key
  { fcc_id: 'M3N-97395900', key_blank: null, manufacturer_id: CHRYSLER_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chrys-35__1_large.jpg?v=1754517418' },

  // ========================== RAM ==========================
  // Y160-PT transponder (no FCC ID)
  { fcc_id: null, key_blank: 'Y160-PT', manufacturer_id: RAM_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/tk-chrys-06__1_large.jpg?v=1755892094' },
  // SIP22 transponder (no FCC ID) - Ram ProMaster
  { fcc_id: null, key_blank: 'SIP22', manufacturer_id: RAM_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/tk-fiat-01__1_large.jpg?v=1755891920' },
  // GQ4-54T - Ram smart key
  { fcc_id: 'GQ4-54T', key_blank: null, manufacturer_id: RAM_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-dodge-38__1_large.jpg?v=1754517699' },
  // IYZ-C01C - Ram fobik (shared with Chrysler)
  { fcc_id: 'IYZ-C01C', key_blank: null, manufacturer_id: RAM_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chrys-02__1_large.jpg?v=1756402575' },
  // OHT692427AA - Ram fobik
  { fcc_id: 'OHT692427AA', key_blank: null, manufacturer_id: RAM_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-chrys-16__1_large.jpg?v=1756402721' },
  // OHT-4882056 - Ram 1500 smart key (2019+)
  { fcc_id: 'OHT-4882056', key_blank: null, manufacturer_id: RAM_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-dodge-51__1_large.jpg?v=1754517114' },
  // LTQF12AM433TX - Ram ProMaster City flip key
  { fcc_id: 'LTQF12AM433TX', key_blank: null, manufacturer_id: RAM_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-dodge-55__1_large.jpg?v=1756402465' },

  // ========================== ACURA ==========================
  // HD103 standard key (no FCC ID)
  { fcc_id: null, key_blank: 'HD103', manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/tk-honda-04__1_large.jpg?v=1755892090' },
  // HD106 transponder (no FCC ID)
  { fcc_id: null, key_blank: 'HD106', manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/tk-honda-04__1_large.jpg?v=1755892090' },
  // HO03 transponder (no FCC ID)
  { fcc_id: null, key_blank: 'HO03', manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/tk-honda-04__1_large.jpg?v=1755892090' },
  // ACJ8D8E24A04 - Acura RL smart key
  { fcc_id: 'ACJ8D8E24A04', key_blank: null, manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-acura-10clot02__1_large.jpg?v=1743191326' },
  // ACJ932HK1210A - Acura ILX smart key
  { fcc_id: 'ACJ932HK1210A', key_blank: null, manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-acura-10clot02__1_large.jpg?v=1743191326' },
  // E4EG8D-444H-A - Acura MDX remote head key
  { fcc_id: 'E4EG8D-444H-A', key_blank: null, manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/skurc-acura-21__1_large.jpg?v=1754517336' },
  // KR5T44 - Acura RDX smart key
  { fcc_id: 'KR5T44', key_blank: null, manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-acura-13c__1_8d13ebab-d81e-4e0a-b22b-08f0ffdafffd_large.jpg?v=1754516992' },
  // KR5TP-4 - Acura Integra/MDX/TLX smart key (2022+)
  { fcc_id: 'KR5TP-4', key_blank: null, manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-honda-55__1_large.jpg?v=1754516983' },
  // KR5V1X - Acura ILX/TLX/MDX/RDX/RLX/NSX smart key
  { fcc_id: 'KR5V1X', key_blank: null, manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/skurc-acura-13__1_ed61abb5-8a63-4def-9ca6-c143a89d9991_large.jpg?v=1757099199' },
  // KR5V2X - Acura MDX/RDX smart key (5 button)
  { fcc_id: 'KR5V2X', key_blank: null, manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-acura-13c__1_8d13ebab-d81e-4e0a-b22b-08f0ffdafffd_large.jpg?v=1754516992' },
  // M3N5WY8145 - Acura TL/ZDX/MDX smart key
  { fcc_id: 'M3N5WY8145', key_blank: null, manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-acura-10clot02__1_large.jpg?v=1743191326' },
  // MLBHLIK-1T - Acura TSX remote head key
  { fcc_id: 'MLBHLIK-1T', key_blank: null, manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/skurc-acura-21__1_large.jpg?v=1754517336' },
  // MLBHLIK6-1T - Acura ILX remote head key
  { fcc_id: 'MLBHLIK6-1T', key_blank: null, manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/skurc-acura-21__1_large.jpg?v=1754517336' },
  // N5F0602A1A - Acura MDX/RDX remote head key
  { fcc_id: 'N5F0602A1A', key_blank: null, manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/skurc-acura-21__1_large.jpg?v=1754517336' },
  // OUCG8D-355H-A - Acura RSX remote head key
  { fcc_id: 'OUCG8D-355H-A', key_blank: null, manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/skurc-acura-21__1_large.jpg?v=1754517336' },
  // OUCG8D-439H-A - Acura TL/TSX remote head key
  { fcc_id: 'OUCG8D-439H-A', key_blank: null, manufacturer_id: ACURA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/skurc-acura-21__1_large.jpg?v=1754517336' },

  // ========================== INFINITI ==========================
  // NI02 transponder (no FCC ID)
  { fcc_id: null, key_blank: 'NI02', manufacturer_id: INFINITI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/tk-nissan-10__1_large.jpg?v=1755892067' },
  // NI04 transponder (no FCC ID)
  { fcc_id: null, key_blank: 'NI04', manufacturer_id: INFINITI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/tk-nissan-10__1_large.jpg?v=1755892067' },
  // CWTWB1U758 - Infiniti remote head key
  { fcc_id: 'CWTWB1U758', key_blank: null, manufacturer_id: INFINITI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-infiniti-02__1_large.jpg?v=1754517494' },
  // CWTWB1U787 - Infiniti M37/Q70/QX56 smart key
  { fcc_id: 'CWTWB1U787', key_blank: null, manufacturer_id: INFINITI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-infiniti-18__1_large.jpg?v=1754517490' },
  // IYZDC11 - Infiniti QX30 smart key
  { fcc_id: 'IYZDC11', key_blank: null, manufacturer_id: INFINITI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-infiniti-02__1_large.jpg?v=1754517494' },
  // KBRASTU15 - Infiniti G35 remote head key
  { fcc_id: 'KBRASTU15', key_blank: null, manufacturer_id: INFINITI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-infiniti-02__1_large.jpg?v=1754517494' },
  // KBRTN001 - Infiniti FX35/FX45 smart key
  { fcc_id: 'KBRTN001', key_blank: null, manufacturer_id: INFINITI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-infiniti-02__1_large.jpg?v=1754517494' },
  // KR55WK48903 - Infiniti G37/EX/FX/M smart key
  { fcc_id: 'KR55WK48903', key_blank: null, manufacturer_id: INFINITI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-infiniti-02__1_large.jpg?v=1754517494' },
  // KR5S180144014 - Infiniti QX60/Q50/Q60 smart key
  { fcc_id: 'KR5S180144014', key_blank: null, manufacturer_id: INFINITI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-infiniti-11__1_large.jpg?v=1754517487' },
  // KR5TXN1 - Infiniti QX50/QX55/QX60 smart key (2019+)
  { fcc_id: 'KR5TXN1', key_blank: null, manufacturer_id: INFINITI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-infiniti-29__1_large.jpg?v=1754517127' },
  // KR5TXN7 - Infiniti Q50/Q60 smart key (2020+)
  { fcc_id: 'KR5TXN7', key_blank: null, manufacturer_id: INFINITI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-infiniti-31__1_large.jpg?v=1754517003' },
  // KR5TXPZ3 - Infiniti smart key
  { fcc_id: 'KR5TXPZ3', key_blank: null, manufacturer_id: INFINITI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-infiniti-29__1_large.jpg?v=1754517127' },
  // KR5TXPZ4 - Infiniti smart key
  { fcc_id: 'KR5TXPZ4', key_blank: null, manufacturer_id: INFINITI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-infiniti-29__1_large.jpg?v=1754517127' },

  // ========================== MAZDA ==========================
  // MAZ24R transponder (no FCC ID)
  { fcc_id: null, key_blank: 'MAZ24R', manufacturer_id: MAZDA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/TK-MAZDA-02-ILC__1_large.jpg?v=1759441437' },
  // KPU41846 - Mazda 3/6 remote (separate remote, not remote head)
  { fcc_id: 'KPU41846', key_blank: null, manufacturer_id: MAZDA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-mazda-20c__1_large.jpg?v=1754517229' },
  // CWTWB1U793 - Mazda remote head key
  { fcc_id: 'CWTWB1U793', key_blank: null, manufacturer_id: MAZDA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-mazda-20c__1_large.jpg?v=1754517229' },
  // WAZSKE11D01 - Mazda smart key (2019+ CX-30, CX-50, Mazda 3)
  { fcc_id: 'WAZSKE11D01', key_blank: null, manufacturer_id: MAZDA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/RC-MAZDA-44C__1_large.jpg?v=1754516462' },
  // WAZSKE13D01 - Mazda smart key (2012-2020 CX-5, CX-3, CX-9, Mazda 3/6)
  { fcc_id: 'WAZSKE13D01', key_blank: null, manufacturer_id: MAZDA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-mazda-10__1_large.jpg?v=1754517212' },
  // WAZSKE13D02 - Mazda smart key (same style as WAZSKE13D01)
  { fcc_id: 'WAZSKE13D02', key_blank: null, manufacturer_id: MAZDA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-mazda-10__1_large.jpg?v=1754517212' },
  // WAZX1T768SKE11A03 - Mazda 3 smart key (2010-2013)
  { fcc_id: 'WAZX1T768SKE11A03', key_blank: null, manufacturer_id: MAZDA_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-mazda-13__1_large.jpg?v=1754517227' },

  // ========================== AUDI ==========================
  // IYZFBSB802 - Audi smart key (A4, A5, A6, A7, A8, Q5, Q7, R8)
  { fcc_id: 'IYZFBSB802', key_blank: null, manufacturer_id: AUDI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-audi-05__1_large.jpg?v=1754517775' },
  // MYT4073A - Audi A4 flip key (2006-2008)
  { fcc_id: 'MYT4073A', key_blank: null, manufacturer_id: AUDI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-audi-08__1_large.jpg?v=1754516966' },
  // MYT8Z0837231 - Audi flip key (old style 1997-2006)
  { fcc_id: 'MYT8Z0837231', key_blank: null, manufacturer_id: AUDI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/RC-AUDI-12C__1_49e1d949-8f9c-4860-ab41-64e4ed8a2de9_large.jpg?v=1754516736' },
  // NBG009272T - Audi A3/TT flip key (2006-2014)
  { fcc_id: 'NBG009272T', key_blank: null, manufacturer_id: AUDI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-audi-08__1_large.jpg?v=1754516966' },
  // NBG010206T - Audi Q3 flip key (shared platform with VW)
  { fcc_id: 'NBG010206T', key_blank: null, manufacturer_id: AUDI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-vw-46c__1_large.jpg?v=1754516988' },
  // NBGFS14P71 - Audi MQB smart key (2014+ A3, A4, A5, A6, A7, A8, Q3, Q5, Q7, Q8, e-tron, R8, TT)
  { fcc_id: 'NBGFS14P71', key_blank: null, manufacturer_id: AUDI_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-audi-11__1_large.jpg?v=1754516846' },

  // ========================== VOLVO ==========================
  // KR55WK49264 - Volvo smart key without PCC (2007-2017)
  { fcc_id: 'KR55WK49264', key_blank: null, manufacturer_id: VOLVO_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-volvo-01__1_large.jpg?v=1757099107' },
  // KR55WK49266 - Volvo smart key with PCC (2007-2018)
  { fcc_id: 'KR55WK49266', key_blank: null, manufacturer_id: VOLVO_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-volvo-04__1_large.jpg?v=1754516947' },
  // KR5V21 - Volvo smart key (2018+ XC40, XC60, XC90, S60, V60, V90)
  { fcc_id: 'KR5V21', key_blank: null, manufacturer_id: VOLVO_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-volvo-03n__1_large.jpg?v=1754516997' },
  // LQNP2T-APU - Volvo flip key (2004-2015)
  { fcc_id: 'LQNP2T-APU', key_blank: null, manufacturer_id: VOLVO_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-volvo-06__1_f9da6cc9-27da-44b5-ae8a-10a4fba42d59_large.jpg?v=1754516836' },

  // ========================== LINCOLN ==========================
  // H72 transponder (no FCC ID)
  { fcc_id: null, key_blank: 'H72', manufacturer_id: LINCOLN_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/tk-ford-21__1_large.jpg?v=1755892060' },
  // H84 transponder (no FCC ID)
  { fcc_id: null, key_blank: 'H84', manufacturer_id: LINCOLN_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/tk-ford-30lot02__1_large.jpg?v=1684982847' },
  // CWTWB1U793 - Lincoln remote head key
  { fcc_id: 'CWTWB1U793', key_blank: null, manufacturer_id: LINCOLN_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-lincoln-07__1_large.jpg?v=1754517165' },
  // M3N-A2C31243300 - Lincoln MKZ/MKC/MKX smart key (Gen 4)
  { fcc_id: 'M3N-A2C31243300', key_blank: null, manufacturer_id: LINCOLN_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-lincoln-06__1_large.jpg?v=1754517150' },
  // M3N-A2C94078000 - Lincoln smart key (Gen 5, 2017+)
  { fcc_id: 'M3N-A2C94078000', key_blank: null, manufacturer_id: LINCOLN_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-lincoln-12-str__1_large.jpg?v=1757099108' },
  // M3N-A3C054339 - Lincoln Navigator/Nautilus smart key (2022+)
  { fcc_id: 'M3N-A3C054339', key_blank: null, manufacturer_id: LINCOLN_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/RC-LINCOLN-17__1_c7c9560c-46f4-4151-b685-d055992249af_large.jpg?v=1754516668' },
  // M3N5WY8406 - Lincoln MKS/MKT smart key (2009-2012)
  { fcc_id: 'M3N5WY8406', key_blank: null, manufacturer_id: LINCOLN_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-lincoln-05-str__1_large.jpg?v=1754517154' },
  // M3N5WY8609 - Lincoln MKX/MKS/MKT/Navigator smart key
  { fcc_id: 'M3N5WY8609', key_blank: null, manufacturer_id: LINCOLN_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-ford-54c__1_a5fb5fa3-c652-47ad-a76b-6cf0273332f3_large.jpg?v=1754517156' },
  // OUCD6000022 - Lincoln remote head key
  { fcc_id: 'OUCD6000022', key_blank: null, manufacturer_id: LINCOLN_ID,
    image_url: 'https://www.locksmithkeyless.com/cdn/shop/files/rc-lincoln-07__1_large.jpg?v=1754517165' },
];

// =================================================================
// MAIN EXECUTION
// =================================================================

async function main() {
  await client.connect();
  console.log('Connected to database.\n');

  // Step 1: Get all rows that need images
  const { rows: missingRows } = await client.query(`
    SELECT ak.id, ak.fcc_id, ak.key_blank, ak.key_type, ak.model_name, m.name as manufacturer, ak.manufacturer_id
    FROM automotive_keys ak
    JOIN manufacturers m ON ak.manufacturer_id = m.id
    WHERE (ak.image_url IS NULL OR ak.image_url = '')
    AND ak.manufacturer_id = ANY($1)
    ORDER BY m.name, ak.fcc_id NULLS FIRST, ak.model_name
  `, [ALL_MFR_IDS]);

  console.log(`Found ${missingRows.length} rows missing images.\n`);

  let updatedCount = 0;
  let skippedCount = 0;
  const skipped = [];

  for (const row of missingRows) {
    // Try to find matching image URL
    let imageUrl = null;

    // First try: match by FCC ID + manufacturer
    if (row.fcc_id) {
      const match = imageMap.find(m =>
        m.fcc_id === row.fcc_id && m.manufacturer_id === row.manufacturer_id
      );
      if (match) imageUrl = match.image_url;
    }

    // Second try: match by key_blank + manufacturer (for transponder-only keys)
    if (!imageUrl && !row.fcc_id) {
      const match = imageMap.find(m =>
        m.fcc_id === null && m.key_blank === row.key_blank && m.manufacturer_id === row.manufacturer_id
      );
      if (match) imageUrl = match.image_url;
    }

    // Third try: match by FCC ID only (cross-manufacturer)
    if (!imageUrl && row.fcc_id) {
      const match = imageMap.find(m => m.fcc_id === row.fcc_id);
      if (match) imageUrl = match.image_url;
    }

    if (imageUrl) {
      // Ensure URL starts with https://
      if (imageUrl.startsWith('//')) {
        imageUrl = 'https:' + imageUrl;
      }

      await client.query(
        'UPDATE automotive_keys SET image_url = $1 WHERE id = $2',
        [imageUrl, row.id]
      );
      updatedCount++;
    } else {
      skippedCount++;
      const key = `${row.manufacturer}|fcc:${row.fcc_id || 'NULL'}|blank:${row.key_blank}`;
      if (!skipped.includes(key)) skipped.push(key);
    }
  }

  console.log(`\n========== RESULTS ==========`);
  console.log(`Updated: ${updatedCount} rows`);
  console.log(`Skipped: ${skippedCount} rows`);

  if (skipped.length > 0) {
    console.log(`\nSkipped groups (no image found):`);
    for (const s of skipped) {
      console.log(`  ${s}`);
    }
  }

  // Verify: count remaining nulls
  const { rows: remaining } = await client.query(`
    SELECT m.name as manufacturer, COUNT(*)::int as cnt
    FROM automotive_keys ak
    JOIN manufacturers m ON ak.manufacturer_id = m.id
    WHERE (ak.image_url IS NULL OR ak.image_url = '')
    AND ak.manufacturer_id = ANY($1)
    GROUP BY m.name
    ORDER BY m.name
  `, [ALL_MFR_IDS]);

  if (remaining.length === 0) {
    console.log('\nAll keys for these manufacturers now have images!');
  } else {
    console.log('\nRemaining keys without images:');
    for (const r of remaining) {
      console.log(`  ${r.manufacturer}: ${r.cnt} keys`);
    }
  }

  await client.end();
  console.log('\nDone.');
}

main().catch(err => {
  console.error('Error:', err);
  process.exit(1);
});
