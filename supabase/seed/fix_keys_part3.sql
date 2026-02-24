-- =====================================================
-- fix_keys_part3.sql
-- Fill in NULL locksmith data for manufacturers I through N
-- (Infiniti, Jaguar, Jeep, Kia, Land Rover, Lexus,
--  Lincoln, Mazda, Mercedes-Benz, Mini, Mitsubishi, Nissan)
-- Only updates fields that are currently NULL.
-- =====================================================

-- =====================================================
-- INFINITI
-- All Infiniti keys have: fcc_id present, ic_number NULL, emergency_key_blank present, test_key_blank NULL
-- IC numbers derived from FCC IDs; emergency blades = NSN14; test key = T-NSN-14
-- =====================================================

-- Infiniti Q50 (2019-2024) - FCC: KR5TXN7
UPDATE public.automotive_keys SET ic_number = '7812D-TXN7', test_key_blank = 'T-NSN-14' WHERE id = 'da0c2671-5ad6-42ae-8e33-915be21f621c';

-- Infiniti Q50 (2014-2018) - FCC: KR5S180144014
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', test_key_blank = 'T-NSN-14' WHERE id = '28e21feb-326b-494d-a00b-f1b5b3e59306';

-- Infiniti Q60 (2019-2024) - FCC: KR5TXN7
UPDATE public.automotive_keys SET ic_number = '7812D-TXN7', test_key_blank = 'T-NSN-14' WHERE id = 'b9a169db-6bc9-41db-a449-ba2a3d413f15';

-- Infiniti Q60 (2017-2018) - FCC: KR5S180144014
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', test_key_blank = 'T-NSN-14' WHERE id = 'd9c1bc8c-4adc-4ec5-8f43-d36339c8acb3';

-- Infiniti QX50 (2014-2018) - FCC: KR5S180144014
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', test_key_blank = 'T-NSN-14' WHERE id = 'd41c71d3-0ac8-4803-a51a-8dee24c1a7ed';

-- Infiniti QX50 (2008-2013) - FCC: KR55WK49622
UPDATE public.automotive_keys SET ic_number = '7812D-WK49622', test_key_blank = 'T-NSN-14' WHERE id = 'a135861a-6ee1-4b4b-84c2-65fb10cec891';

-- Infiniti QX50 (2019-2024) - FCC: KR5TXN7
UPDATE public.automotive_keys SET ic_number = '7812D-TXN7', test_key_blank = 'T-NSN-14' WHERE id = '6f5bb03b-d38e-4718-8376-0515035bd202';

-- Infiniti QX60 (2022-2024) - FCC: KR5TXN7
UPDATE public.automotive_keys SET ic_number = '7812D-TXN7', test_key_blank = 'T-NSN-14' WHERE id = '2117d45a-5462-4318-8377-b479beb30f60';

-- Infiniti QX60 (2014-2021) - FCC: KR5S180144014
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', test_key_blank = 'T-NSN-14' WHERE id = 'dee6695e-756f-4868-9053-dd02b64b7a79';

-- Infiniti QX80 (2004-2010) - FCC: CWTWB1U415 (transponder)
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U415', test_key_blank = 'T-NSN-14' WHERE id = 'c6774063-fa28-4f31-94c6-5d98bc0588f9';

-- Infiniti QX80 (2011-2013) - FCC: CWTWB1G744
UPDATE public.automotive_keys SET ic_number = '7812D-WB1G744', test_key_blank = 'T-NSN-14' WHERE id = '9dc63887-f318-45d3-b5f2-1a6c4591b2e2';

-- Infiniti QX80 (2014-2018) - FCC: S180144014
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', test_key_blank = 'T-NSN-14' WHERE id = 'a1de808b-51ed-484d-9da9-e649ac45453a';

-- Infiniti QX80 (2019-2024) - FCC: KR5TXN7
UPDATE public.automotive_keys SET ic_number = '7812D-TXN7', test_key_blank = 'T-NSN-14' WHERE id = 'defceddd-19a3-4acb-b999-cbded5618d81';

-- =====================================================
-- JAGUAR
-- All Jaguar keys have: fcc_id present (KOBJTF10A), ic_number NULL, emergency_key_blank present (HU101), test_key_blank NULL
-- =====================================================

-- Jaguar E-Pace (X540) (2018-2024)
UPDATE public.automotive_keys SET ic_number = '2011DJ5765', test_key_blank = 'T-HU-101' WHERE id = 'eee4fb81-6582-41fb-bb6a-f336d8ff47bc';

-- Jaguar F-Pace (X761) (2017-2024)
UPDATE public.automotive_keys SET ic_number = '2011DJ5765', test_key_blank = 'T-HU-101' WHERE id = '1ee3dd5b-6b38-46f1-8fac-884ec8a6a2c4';

-- Jaguar F-Type (X152) (2014-2024)
UPDATE public.automotive_keys SET ic_number = '2011DJ5765', test_key_blank = 'T-HU-101' WHERE id = '2f66f32d-b546-4b66-9d19-2d8259a7330e';

-- Jaguar I-Pace (X590) (2019-2024)
UPDATE public.automotive_keys SET ic_number = '2011DJ5765', test_key_blank = 'T-HU-101' WHERE id = 'af8a6b4c-d64a-4349-b857-21012635be11';

-- Jaguar XE (X760) (2017-2024)
UPDATE public.automotive_keys SET ic_number = '2011DJ5765', test_key_blank = 'T-HU-101' WHERE id = '6dd32453-d404-42b5-8e50-70ed53637d5f';

-- Jaguar XF (X250) (2009-2015)
UPDATE public.automotive_keys SET ic_number = '2011DJ5765', test_key_blank = 'T-HU-101' WHERE id = '81e1d3cb-141a-4cec-bb07-b9dd4ce14103';

-- Jaguar XF (X260) (2016-2024)
UPDATE public.automotive_keys SET ic_number = '2011DJ5765', test_key_blank = 'T-HU-101' WHERE id = '7488deac-831f-4a09-bbb2-2d4e4b3d96be';

-- =====================================================
-- JEEP
-- All Jeep keys have: ic_number NULL, test_key_blank NULL
-- Some have fcc_id NULL, some have emergency_key_blank present
-- =====================================================

-- Jeep Cherokee KL (2014-2024) - FCC: GQ4-54T, emergency: Y164-PT
UPDATE public.automotive_keys SET ic_number = '1470A-54T', test_key_blank = 'T-Y164' WHERE id = 'f0fdcc42-0fec-4649-ab03-7778144b2d7d';

-- Jeep Cherokee XJ (1997-2001) - FCC: NULL, emergency: Y157, transponder
-- No FCC ID for this era; set test_key_blank only
UPDATE public.automotive_keys SET test_key_blank = 'T-Y157' WHERE id = '96edff74-276a-4d91-b0c7-5045d32a826b';

-- Jeep Commander XK (2006-2010) - FCC: IYZ-C01C, emergency: Y164
UPDATE public.automotive_keys SET ic_number = '2701A-C01C', test_key_blank = 'T-Y164' WHERE id = 'c955a6bf-be13-46ed-9e35-015d252fe3e0';

-- Jeep Commander XK (2006-2010) duplicate
UPDATE public.automotive_keys SET ic_number = '2701A-C01C', test_key_blank = 'T-Y164' WHERE id = 'ace92632-88d0-49f0-991b-bfd2e98a5a40';

-- Jeep Commander XK (2006-2010) duplicate
UPDATE public.automotive_keys SET ic_number = '2701A-C01C', test_key_blank = 'T-Y164' WHERE id = 'adcc221f-9e93-4f4e-a2ea-427f41b15003';

-- Jeep Compass (2007-2016) - FCC: OHT692713AA, emergency: Y159, transponder
UPDATE public.automotive_keys SET ic_number = '3521A-692713AA', test_key_blank = 'T-Y159' WHERE id = 'a0af5d92-e665-4a84-b20d-72b065645c39';

-- Jeep Compass MP (2017-2024) - FCC: M3N-40821302, emergency: Y170
UPDATE public.automotive_keys SET ic_number = '7812A-40821302', test_key_blank = 'T-Y170' WHERE id = 'ef85ebe7-3193-4357-ad09-2c1436da0012';

-- Jeep Gladiator JT (2020-2024) - FCC: OHT1130261, emergency: Y170
UPDATE public.automotive_keys SET ic_number = '1470A-1130261', test_key_blank = 'T-Y170' WHERE id = '3c8d475b-d22c-40e6-9037-2ebf1bee073c';

-- Jeep Grand Cherokee WJ (1999-2004) - FCC: GQ43VT9T, emergency: Y159, transponder
UPDATE public.automotive_keys SET ic_number = '1470A-43VT9T', test_key_blank = 'T-Y159' WHERE id = 'abe8a2a1-7250-4483-a92b-fdffc0fea8e3';

-- Jeep Grand Cherokee WK (2005-2013) - FCC: IYZ-C01C, emergency: Y164
UPDATE public.automotive_keys SET ic_number = '2701A-C01C', test_key_blank = 'T-Y164' WHERE id = 'f12fe600-ced8-49fc-8c31-ccf96f73f49e';

-- Jeep Grand Cherokee WK2 (2014-2021) - FCC: M3N-40821302, emergency: Y164-PT
UPDATE public.automotive_keys SET ic_number = '7812A-40821302', test_key_blank = 'T-Y164' WHERE id = '0480e60d-9349-456b-938b-b0ddecfee625';

-- Jeep Grand Cherokee WL (2022-2024) - FCC: M3N-5WY783X, emergency: Y170
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-Y170' WHERE id = 'c91d5d19-68a3-444a-9269-59d5ee930a49';

-- Jeep Grand Wagoneer (2022-2024) - FCC: M3N-5WY783X, emergency: Y170
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-Y170' WHERE id = '2ab4ca3c-ee7f-4e2c-aac4-816a2719cfdf';

-- Jeep Grand Wagoneer (2022-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-Y170' WHERE id = '3f1d2b13-f7da-4208-8776-a898660d74e8';

-- Jeep Grand Wagoneer (2022-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-Y170' WHERE id = '5fdda7d9-65b6-441f-84a0-c1b37790a4a8';

-- Jeep Liberty KJ (2002-2007) - FCC: KOBDT04A, emergency: Y159, transponder
UPDATE public.automotive_keys SET ic_number = '1470A-DT04A', test_key_blank = 'T-Y159' WHERE id = 'd7b00044-5190-443f-bde8-e98afa6fdea8';

-- Jeep Liberty KJ (2002-2007) duplicate
UPDATE public.automotive_keys SET ic_number = '1470A-DT04A', test_key_blank = 'T-Y159' WHERE id = 'bff00d40-911d-4390-a837-7c4b1780c2ff';

-- Jeep Liberty KJ (2002-2007) duplicate
UPDATE public.automotive_keys SET ic_number = '1470A-DT04A', test_key_blank = 'T-Y159' WHERE id = '2fda7cf2-6b81-48aa-9362-00070f7e22ca';

-- Jeep Liberty KK (2008-2012) - FCC: IYZ-C01C, emergency: Y164
UPDATE public.automotive_keys SET ic_number = '2701A-C01C', test_key_blank = 'T-Y164' WHERE id = 'a1aa7b48-076e-40c4-a353-bb9e91ca2b25';

-- Jeep Liberty KK (2008-2012) duplicate
UPDATE public.automotive_keys SET ic_number = '2701A-C01C', test_key_blank = 'T-Y164' WHERE id = 'c1160127-71df-4669-a00a-28bbca76640d';

-- Jeep Liberty KK (2008-2012) duplicate
UPDATE public.automotive_keys SET ic_number = '2701A-C01C', test_key_blank = 'T-Y164' WHERE id = '981c97ed-30df-4dd9-90ad-2a3e728f50f8';

-- Jeep Patriot MK (2007-2017) - FCC: OHT692713AA, emergency: Y159
UPDATE public.automotive_keys SET ic_number = '3521A-692713AA', test_key_blank = 'T-Y159' WHERE id = '07c407a1-8d4e-4d17-8791-12305d22636a';

-- Jeep Patriot MK (2007-2017) duplicate
UPDATE public.automotive_keys SET ic_number = '3521A-692713AA', test_key_blank = 'T-Y159' WHERE id = '4b68e81b-3ca6-4751-9058-f388dceb347b';

-- Jeep Patriot MK (2007-2017) duplicate
UPDATE public.automotive_keys SET ic_number = '3521A-692713AA', test_key_blank = 'T-Y159' WHERE id = '8b72c592-8049-4661-9bae-a947623f59a8';

-- Jeep Renegade BU (2015-2024) - FCC: M3N-40821302, emergency: SIP22
UPDATE public.automotive_keys SET ic_number = '7812A-40821302', test_key_blank = 'T-SIP22' WHERE id = '8be9f622-0edd-4444-b1a9-a068e98f8988';

-- Jeep Wagoneer (2022-2024) - FCC: M3N-5WY783X, emergency: Y170
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-Y170' WHERE id = '6b3c347d-bea8-427f-8839-2001b4a6a895';

-- Jeep Wagoneer (2022-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-Y170' WHERE id = '705724b9-e4c6-431a-9f8f-0f241ee6568a';

-- Jeep Wagoneer (2022-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-Y170' WHERE id = '6efd94a4-7965-4e53-b992-ba038b4df4aa';

-- Jeep Wrangler JK (2007-2017) - FCC: OHT692427AA, emergency: Y164
UPDATE public.automotive_keys SET ic_number = '3521A-692427AA', test_key_blank = 'T-Y164' WHERE id = '3685f92e-9c9d-4602-a328-3bef0701f6b7';

-- Jeep Wrangler JL (2018-2024) - FCC: OHT1130261, emergency: Y170
UPDATE public.automotive_keys SET ic_number = '1470A-1130261', test_key_blank = 'T-Y170' WHERE id = 'da44645c-02ec-4406-aead-f193006f2bbb';

-- Jeep Wrangler TJ (1997-2006) - FCC: GQ43VT9T, emergency: Y159, transponder
UPDATE public.automotive_keys SET ic_number = '1470A-43VT9T', test_key_blank = 'T-Y159' WHERE id = '8fd105da-c855-4e95-86ff-c3ec8b95e1c7';

-- =====================================================
-- KIA
-- All Kia keys have: ic_number NULL, test_key_blank NULL
-- Some older models have fcc_id NULL
-- =====================================================

-- Kia Amanti (2004-2009) - FCC: OSLOKA-310T, emergency: KK7
UPDATE public.automotive_keys SET ic_number = '0SLO-KA-310T', test_key_blank = 'T-KK7' WHERE id = '1864d781-52ca-4a0e-83b9-05b655b48bef';

-- Kia Amanti (2004-2009) duplicate
UPDATE public.automotive_keys SET ic_number = '0SLO-KA-310T', test_key_blank = 'T-KK7' WHERE id = 'd487ab44-21e4-4d41-a3c4-c32fcf03df38';

-- Kia Amanti (2004-2009) duplicate
UPDATE public.automotive_keys SET ic_number = '0SLO-KA-310T', test_key_blank = 'T-KK7' WHERE id = 'c72291dd-77ad-439f-80f3-11f5bc7e9747';

-- Kia Cadenza (2014-2020) - FCC: SY5IGFGE04, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '8325A-IGFGE04', test_key_blank = 'T-KK12' WHERE id = 'cfe99217-66e3-4c7a-a7ce-8460eb93a13a';

-- Kia Cadenza (2014-2020) duplicate
UPDATE public.automotive_keys SET ic_number = '8325A-IGFGE04', test_key_blank = 'T-KK12' WHERE id = '2c0596d7-2a28-47f7-bce4-ae82d35c6410';

-- Kia Cadenza (2014-2020) duplicate
UPDATE public.automotive_keys SET ic_number = '8325A-IGFGE04', test_key_blank = 'T-KK12' WHERE id = '4118af92-e72a-4891-b227-d484aeec4157';

-- Kia Carnival (2022-2024) - FCC: SY5MQ4FGE05, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '8325A-MQ4FGE05', test_key_blank = 'T-KK12' WHERE id = '843d6f88-dea7-4ece-bcec-725ce7e539b8';

-- Kia Carnival (2022-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '8325A-MQ4FGE05', test_key_blank = 'T-KK12' WHERE id = '1b38f1a5-fc4d-4277-9c2a-66ccebd23f5b';

-- Kia Carnival (2022-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '8325A-MQ4FGE05', test_key_blank = 'T-KK12' WHERE id = 'b843f700-f95f-44d7-84ab-27db62e83086';

-- Kia EV6 (2022-2024) - FCC: TQ8-FOB-4F24, emergency: HY22
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F24', test_key_blank = 'T-HY22' WHERE id = 'f3cefe70-2a8d-4613-a777-988fc0bfaf5f';

-- Kia EV6 (2022-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F24', test_key_blank = 'T-HY22' WHERE id = '1a0f07df-80f1-4bf3-b1b8-926b78e8425f';

-- Kia EV6 (2022-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F24', test_key_blank = 'T-HY22' WHERE id = '9b2398e7-ae80-460d-9745-009506f313d3';

-- Kia Forte (2014-2018) - FCC: CQOFD00120, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '5765A-FD00120', test_key_blank = 'T-KK12' WHERE id = 'd843cf75-170c-484d-a8f3-5bc56bd0e112';

-- Kia Forte (2019-2024) - FCC: TQ8-FOB-4F11, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F11', test_key_blank = 'T-KK12' WHERE id = '396d96d2-8f4d-4960-9f22-68d1b54e54d7';

-- Kia Forte (2010-2013) - FCC: PINHA-T008, emergency: KK10, transponder
UPDATE public.automotive_keys SET ic_number = '0SLO-HA-T008', test_key_blank = 'T-KK10' WHERE id = 'e1f9fb2f-ff70-4093-b8b7-4ecd7ee98be5';

-- Kia K5 (2021-2024) - FCC: TQ8-FOB-4F27, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F27', test_key_blank = 'T-KK12' WHERE id = '0b8115f8-c558-4179-ac59-abc0034c3715';

-- Kia Optima (2001-2006) - FCC: NULL, emergency: KK7, standard key
-- No FCC ID for standard key
UPDATE public.automotive_keys SET test_key_blank = 'T-KK7' WHERE id = '6bebe03f-af6d-4778-9b8b-dc1ea21cc3ad';

-- Kia Optima (2016-2020) - FCC: TQ8-FOB-4F10, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F10', test_key_blank = 'T-KK12' WHERE id = '7987067e-c0db-4678-afcb-9655029197f2';

-- Kia Optima (2011-2015) - FCC: SY5HMFNA04, emergency: KK12, transponder
UPDATE public.automotive_keys SET ic_number = '8325A-HMFNA04', test_key_blank = 'T-KK12' WHERE id = '56994733-246f-43ca-b397-c414827328ca';

-- Kia Optima (2007-2010) - FCC: NULL, emergency: KK10, transponder
-- No FCC ID for this era
UPDATE public.automotive_keys SET test_key_blank = 'T-KK10' WHERE id = 'd7b506b3-98db-46a4-82fe-b3721f8438ad';

-- Kia Rio (2006-2011) - FCC: PLNHM-T011, emergency: KK7, transponder
UPDATE public.automotive_keys SET ic_number = '0SLO-HM-T011', test_key_blank = 'T-KK7' WHERE id = '593f6e1f-a97d-425e-84f8-41c16bdfefa6';

-- Kia Rio (2006-2011) duplicate
UPDATE public.automotive_keys SET ic_number = '0SLO-HM-T011', test_key_blank = 'T-KK7' WHERE id = '42f460f9-8438-4d1a-bb0f-b220a9092430';

-- Kia Rio (2006-2011) duplicate
UPDATE public.automotive_keys SET ic_number = '0SLO-HM-T011', test_key_blank = 'T-KK7' WHERE id = 'ddf1f9c9-63e2-4818-b293-4972cc900b26';

-- Kia Rio (2012-2017) - FCC: TQ8-RKE-4F17, emergency: KK10, transponder
UPDATE public.automotive_keys SET ic_number = '5765A-RKE-4F17', test_key_blank = 'T-KK10' WHERE id = '43a2562d-ae21-47e6-b820-8606a50ef55d';

-- Kia Rio (2012-2017) duplicate
UPDATE public.automotive_keys SET ic_number = '5765A-RKE-4F17', test_key_blank = 'T-KK10' WHERE id = 'ac53deab-fa4e-40a4-8eac-8854128bca09';

-- Kia Rio (2012-2017) duplicate
UPDATE public.automotive_keys SET ic_number = '5765A-RKE-4F17', test_key_blank = 'T-KK10' WHERE id = '34869557-ade3-45c3-9bcd-a3bc1cf08eb2';

-- Kia Rio (2018-2024) - FCC: TQ8-FOB-4F11, emergency: KK12, smart_key
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F11', test_key_blank = 'T-KK12' WHERE id = '8edd9e2b-192a-4948-b132-0021451ab6eb';

-- Kia Rio (2018-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F11', test_key_blank = 'T-KK12' WHERE id = '0fa19f7d-d1ef-45e6-8861-3a75f8c36c2c';

-- Kia Rio (2018-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F11', test_key_blank = 'T-KK12' WHERE id = 'd837e497-6624-40ca-8377-cabc2f714eb1';

-- Kia Sedona (2006-2014) - FCC: SV3-100060234, emergency: KK7, transponder
UPDATE public.automotive_keys SET ic_number = '0SLO-100060234', test_key_blank = 'T-KK7' WHERE id = '3b73e32a-ff9b-42f9-b408-ece40b00438a';

-- Kia Sedona (2006-2014) duplicate
UPDATE public.automotive_keys SET ic_number = '0SLO-100060234', test_key_blank = 'T-KK7' WHERE id = 'c6066e9e-317b-4899-9a6a-6e00fd216e8f';

-- Kia Sedona (2006-2014) duplicate
UPDATE public.automotive_keys SET ic_number = '0SLO-100060234', test_key_blank = 'T-KK7' WHERE id = '3d0de4c2-e94c-4b55-9f92-0003cf17b34f';

-- Kia Sedona (2015-2021) - FCC: SY5YPFGE06, emergency: KK12, smart_key
UPDATE public.automotive_keys SET ic_number = '8325A-YPFGE06', test_key_blank = 'T-KK12' WHERE id = '05a051f0-9b49-4b38-a7ca-91bdd9582808';

-- Kia Sedona (2015-2021) duplicate
UPDATE public.automotive_keys SET ic_number = '8325A-YPFGE06', test_key_blank = 'T-KK12' WHERE id = 'a8f0e34c-5101-41af-a729-6ad210a844ec';

-- Kia Sedona (2015-2021) duplicate
UPDATE public.automotive_keys SET ic_number = '8325A-YPFGE06', test_key_blank = 'T-KK12' WHERE id = 'fa5522f8-5f84-47cd-ad81-fb1b3e9bd8b5';

-- Kia Seltos (2021-2024) - FCC: TQ8-FOB-4F24, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F24', test_key_blank = 'T-KK12' WHERE id = '6f43c932-1dbd-45a0-839c-2427cfcce378';

-- Kia Sorento (2016-2020) - FCC: TQ8-FOB-4F06, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F06', test_key_blank = 'T-KK12' WHERE id = '2fc14d5c-b1bf-4542-98f1-6e139799751f';

-- Kia Sorento (2003-2009) - FCC: OSLOKA-310T, emergency: KK7, transponder
UPDATE public.automotive_keys SET ic_number = '0SLO-KA-310T', test_key_blank = 'T-KK7' WHERE id = 'abec0354-c58a-4f3c-9e17-a6b7f856d513';

-- Kia Sorento (2010-2015) - FCC: TQ8-RKE-3F05, emergency: KK10, transponder
UPDATE public.automotive_keys SET ic_number = '5765A-RKE-3F05', test_key_blank = 'T-KK10' WHERE id = 'aadfe642-15c2-4f9b-8f52-7aa6a008e586';

-- Kia Sorento (2021-2024) - FCC: TQ8-FOB-4F24, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F24', test_key_blank = 'T-KK12' WHERE id = '20efcc57-44b1-4661-abab-aa1aee612e41';

-- Kia Soul (2014-2019) - FCC: CQOFD00120, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '5765A-FD00120', test_key_blank = 'T-KK12' WHERE id = '479d435c-00b4-442f-b422-e291c39b9332';

-- Kia Soul (2010-2013) - FCC: NY0SEKSAM11ATX, emergency: KK10, transponder
UPDATE public.automotive_keys SET ic_number = '8325A-EKSAM11ATX', test_key_blank = 'T-KK10' WHERE id = 'a4cb0ad2-6447-4ac1-94d4-33a3236f00cf';

-- Kia Soul (2020-2024) - FCC: TQ8-FOB-4F24, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F24', test_key_blank = 'T-KK12' WHERE id = '864fad01-636a-4bfb-a24e-74462f27b58f';

-- Kia Spectra (2004-2009) - FCC: OSLOKA-310T, emergency: KK7, transponder
UPDATE public.automotive_keys SET ic_number = '0SLO-KA-310T', test_key_blank = 'T-KK7' WHERE id = '2ae97e27-043b-4b47-b4f7-4ad2ef231423';

-- Kia Spectra (2004-2009) duplicate
UPDATE public.automotive_keys SET ic_number = '0SLO-KA-310T', test_key_blank = 'T-KK7' WHERE id = '8bf9e795-4c24-4f8e-bbd5-b5962aad042e';

-- Kia Spectra (2004-2009) duplicate
UPDATE public.automotive_keys SET ic_number = '0SLO-KA-310T', test_key_blank = 'T-KK7' WHERE id = '76dac66d-9b7c-48c7-a19c-60628c4a9b16';

-- Kia Sportage (2017-2022) - FCC: TQ8-FOB-4F08, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F08', test_key_blank = 'T-KK12' WHERE id = 'cdb796d0-ef92-4382-9fab-c9b7f5a6a526';

-- Kia Sportage (2005-2010) - FCC: OSLOKA-310T, emergency: KK7, transponder
UPDATE public.automotive_keys SET ic_number = '0SLO-KA-310T', test_key_blank = 'T-KK7' WHERE id = '0e0a6156-2249-45ba-8453-ae523f93828a';

-- Kia Sportage (2011-2016) - FCC: TQ8-RKE-3F05, emergency: KK10, transponder
UPDATE public.automotive_keys SET ic_number = '5765A-RKE-3F05', test_key_blank = 'T-KK10' WHERE id = 'f1596f74-aeab-4e8f-9f09-5aa6cbb22796';

-- Kia Sportage (2023-2024) - FCC: TQ8-FOB-4F24, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F24', test_key_blank = 'T-KK12' WHERE id = '81f08dce-4cbe-46c9-8a78-fb123a443d77';

-- Kia Stinger (2018-2023) - FCC: TQ8-FOB-4F15, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F15', test_key_blank = 'T-KK12' WHERE id = '142cf944-2604-45da-9a95-59c2a8bb83e3';

-- Kia Stinger (2018-2023) duplicate
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F15', test_key_blank = 'T-KK12' WHERE id = 'b68a3764-22cb-498f-b8a7-dcb41903c89b';

-- Kia Stinger (2018-2023) duplicate
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F15', test_key_blank = 'T-KK12' WHERE id = 'fe6e505b-33bd-47d4-8b1a-c4d3f11318ad';

-- Kia Telluride (2020-2024) - FCC: TQ8-FOB-4F24, emergency: KK12
UPDATE public.automotive_keys SET ic_number = '5765A-FOB-4F24', test_key_blank = 'T-KK12' WHERE id = '30706984-3116-455f-8067-0ffcee947276';

-- =====================================================
-- LAND ROVER
-- All Land Rover keys have: ic_number NULL, test_key_blank NULL
-- emergency_key_blank = HU101 (all present)
-- =====================================================

-- Land Rover Defender (L663) (2020-2024) - FCC: KOBJXF18A
UPDATE public.automotive_keys SET ic_number = '2011DJ7830', test_key_blank = 'T-HU-101' WHERE id = '6af49e28-1bb6-4e1f-bbcf-96d70960a4a2';

-- Land Rover Discovery 5 (L462) (2017-2024) - FCC: KOBJXF18A
UPDATE public.automotive_keys SET ic_number = '2011DJ7830', test_key_blank = 'T-HU-101' WHERE id = '6cd1b9f1-5687-4b27-a645-7106e0824db9';

-- Land Rover Discovery Sport (L550) (2015-2024) - FCC: KOBJXF10A
UPDATE public.automotive_keys SET ic_number = '2011DJ5765', test_key_blank = 'T-HU-101' WHERE id = 'aa2b1a11-5f52-4061-9d3d-280b97acd2ff';

-- Land Rover Range Rover (L405) (2013-2021) - FCC: KOBJTF10A
UPDATE public.automotive_keys SET ic_number = '2011DJ5765', test_key_blank = 'T-HU-101' WHERE id = '7d91afe8-ab38-4df9-9632-cd47bc8f5679';

-- Land Rover Range Rover (L460) (2022-2024) - FCC: KOBJXF18A
UPDATE public.automotive_keys SET ic_number = '2011DJ7830', test_key_blank = 'T-HU-101' WHERE id = '29c9b519-9863-430c-ad36-1c4c0233e0f5';

-- Land Rover Range Rover Evoque (L538) (2012-2019) - FCC: KOBJTF10A
UPDATE public.automotive_keys SET ic_number = '2011DJ5765', test_key_blank = 'T-HU-101' WHERE id = '7aa8cce9-70e6-40fd-b430-fcc4cd7de7b3';

-- Land Rover Range Rover Evoque (L551) (2020-2024) - FCC: KOBJXF18A
UPDATE public.automotive_keys SET ic_number = '2011DJ7830', test_key_blank = 'T-HU-101' WHERE id = '2f23fe74-dd8f-46da-a0e5-82c8a9a01603';

-- Land Rover Range Rover Sport (L461) (2023-2024) - FCC: KOBJXF18A
UPDATE public.automotive_keys SET ic_number = '2011DJ7830', test_key_blank = 'T-HU-101' WHERE id = '20030b95-a52f-4c26-bf3e-0624a00a45ee';

-- Land Rover Range Rover Sport (L494) (2014-2022) - FCC: KOBJTF10A
UPDATE public.automotive_keys SET ic_number = '2011DJ5765', test_key_blank = 'T-HU-101' WHERE id = '1b83bad9-7e98-4798-a053-2c67cb1ecc7e';

-- =====================================================
-- LEXUS
-- Lexus keys have: ic_number NULL, test_key_blank NULL
-- Some older models have fcc_id NULL and emergency_key_blank varies
-- =====================================================

-- Lexus ES (1997-2003) - FCC: NULL, emergency: TOY43, transponder - no smart key, no FCC
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '48ee3bbf-6403-4b64-8f2d-da74e53280d9';

-- Lexus ES (2007-2012) - FCC: HYQ14AAB, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14AAB', test_key_blank = 'T-TOY-40' WHERE id = '3dab05f7-e537-4893-8487-f1ff4fc54203';

-- Lexus ES (2004-2006) - FCC: NULL, emergency: TOY44D-PT, transponder - no FCC for this era
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44' WHERE id = '1fe169b4-7937-445c-afa7-9869335506a9';

-- Lexus ES350 (2019-2024) - FCC: HYQ14FBN, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14FBN', test_key_blank = 'T-TOY-40' WHERE id = 'e7a8d9da-9513-4830-9773-71b65029b86d';

-- Lexus ES350 (2013-2018) - FCC: HYQ14FBA, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14FBA', test_key_blank = 'T-TOY-40' WHERE id = '41ebce88-6cd1-4ae3-995d-ab85bc630e96';

-- Lexus GX (2003-2009) - FCC: NULL, emergency: TOY44D-PT, transponder
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44' WHERE id = '2763c693-1272-405a-884c-a3ba0fffec89';

-- Lexus GX460 (2010-2023) - FCC: HYQ14ACX, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14ACX', test_key_blank = 'T-TOY-40' WHERE id = '5fc3d563-f581-42b3-8cde-ffa7712d78bc';

-- Lexus GX550 (2024) - FCC: HYQ14FBX, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-40' WHERE id = '7c5ddc0a-6e1c-4863-b278-25a19d9ace56';

-- Lexus IS (2014-2020) - FCC: HYQ14FBA, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14FBA', test_key_blank = 'T-TOY-40' WHERE id = '786a03a9-0a60-4081-bb7a-fb0b5ae5c392';

-- Lexus IS (2006-2013) - FCC: HYQ14AAB, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14AAB', test_key_blank = 'T-TOY-40' WHERE id = '520e2446-3450-4830-b1cd-fc2c76a10c11';

-- Lexus IS (2001-2005) - FCC: NULL, emergency: TOY44D-PT, transponder
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44' WHERE id = 'f7c85e37-f8e6-4afb-b448-4cd2c9e46fa9';

-- Lexus IS (2021-2024) - FCC: HYQ14FBN, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14FBN', test_key_blank = 'T-TOY-40' WHERE id = 'd9431a0b-d0a0-4855-825f-78179d22d8c7';

-- Lexus LC (2018-2024) - FCC: HYQ14FBF, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14FBF', test_key_blank = 'T-TOY-40' WHERE id = '227e5f84-d025-4962-a13b-5343247b34d0';

-- Lexus LX (2008-2015) - FCC: HYQ14ACX, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14ACX', test_key_blank = 'T-TOY-40' WHERE id = '91afec05-76a0-4c13-ad3d-1edeb698d0d4';

-- Lexus LX (1998-2007) - FCC: NULL, emergency: TOY44D-PT, transponder
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44' WHERE id = 'dc00f82b-ec45-446e-9edb-f762398445a6';

-- Lexus LX (2016-2021) - FCC: HYQ14FBA, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14FBA', test_key_blank = 'T-TOY-40' WHERE id = '77cb67b4-83c1-4f2e-94dc-eec80fda5272';

-- Lexus LX600 (2022-2024) - FCC: HYQ14FBX, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-40' WHERE id = 'd379a13f-5633-46f7-b3e2-62215ec469ca';

-- Lexus NX (2015-2021) - FCC: HYQ14FBA, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14FBA', test_key_blank = 'T-TOY-40' WHERE id = '5b8ea82d-8422-4c6b-ad85-a0c4c5261141';

-- Lexus NX (2022-2024) - FCC: HYQ14FBX, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-40' WHERE id = '822fe9ac-0dc0-49fe-82e7-4a34abafe4d4';

-- Lexus RX (2004-2009) - FCC: HYQ14AAB, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14AAB', test_key_blank = 'T-TOY-40' WHERE id = '10d302f1-e2f6-42a8-a050-19130fe51b26';

-- Lexus RX (1999-2003) - FCC: NULL, emergency: TOY43, transponder
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = 'c0af7564-d537-4bd8-8f42-ca7b6bf96858';

-- Lexus RX350 (2010-2015) - FCC: HYQ14ACX, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14ACX', test_key_blank = 'T-TOY-40' WHERE id = '87c365c8-975b-4dd0-b0cd-7aeb58ca9229';

-- Lexus RX350 (2016-2022) - FCC: HYQ14FBA, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14FBA', test_key_blank = 'T-TOY-40' WHERE id = '5b3966a0-dfa4-4bf9-8d2e-fcac5b17a823';

-- Lexus RX500h (2023-2024) - FCC: HYQ14FBX, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-40' WHERE id = '71870fc4-4376-475a-97bb-72c4d21837cd';

-- Lexus UX (2019-2024) - FCC: HYQ14FBN, emergency: TOY40
UPDATE public.automotive_keys SET ic_number = '1551A-14FBN', test_key_blank = 'T-TOY-40' WHERE id = 'b67e8828-e6d8-444a-b8bd-01cbf41a0f3d';

-- =====================================================
-- LINCOLN
-- All Lincoln keys have: ic_number NULL, test_key_blank NULL
-- emergency_key_blank = H75 (all present)
-- =====================================================

-- Lincoln Aviator (2020-2024) - FCC: M3N-A2C931426, emergency: H75
UPDATE public.automotive_keys SET ic_number = '7812A-A2C931426', test_key_blank = 'T-H75' WHERE id = '1e407aaf-1a7c-4b72-9ee8-c8f4f4253c8c';

-- Lincoln Continental (2017-2020) - FCC: M3N-A2C94078000, emergency: H75
UPDATE public.automotive_keys SET ic_number = '7812A-A2C94078000', test_key_blank = 'T-H75' WHERE id = '88a36250-3258-42d1-b9be-85137ca1eccd';

-- Lincoln Corsair (2020-2024) - FCC: M3N-A2C931426, emergency: H75
UPDATE public.automotive_keys SET ic_number = '7812A-A2C931426', test_key_blank = 'T-H75' WHERE id = '022fd558-64de-4d7b-a7e3-719978c9f781';

-- Lincoln MKC (2015-2019) - FCC: M3N-A2C31243300, emergency: H75
UPDATE public.automotive_keys SET ic_number = '7812A-A2C31243300', test_key_blank = 'T-H75' WHERE id = 'e3499634-f054-4f04-96f9-c84efda1fbfd';

-- Lincoln MKZ (2013-2016) - FCC: M3N-A2C31243300, emergency: H75
UPDATE public.automotive_keys SET ic_number = '7812A-A2C31243300', test_key_blank = 'T-H75' WHERE id = 'f5f4ce5b-84f7-439d-8a66-aa2adb68e9a3';

-- Lincoln MKZ (2017-2020) - FCC: M3N-A2C94078000, emergency: H75
UPDATE public.automotive_keys SET ic_number = '7812A-A2C94078000', test_key_blank = 'T-H75' WHERE id = '59f7e23f-d2ac-4bff-b87b-d56c8af81149';

-- Lincoln Nautilus (2019-2024) - FCC: M3N-A2C931426, emergency: H75
UPDATE public.automotive_keys SET ic_number = '7812A-A2C931426', test_key_blank = 'T-H75' WHERE id = '9e590269-9091-4def-8ad7-713ee8bb647b';

-- Lincoln Navigator (2018-2024) - FCC: M3N-A2C93142600, emergency: H75
UPDATE public.automotive_keys SET ic_number = '7812A-A2C93142600', test_key_blank = 'T-H75' WHERE id = '9dbf7e08-84d0-4b6a-b40b-e7cf157c11c7';

-- Lincoln Navigator (2007-2017) - FCC: M3N5WY8609, emergency: H75, transponder
UPDATE public.automotive_keys SET ic_number = '7812A-5WY8609', test_key_blank = 'T-H75' WHERE id = '9f61f9f7-a807-47c8-9703-65a230494cab';

-- =====================================================
-- MAZDA
-- All Mazda keys have: ic_number NULL, test_key_blank NULL
-- emergency_key_blank = MAZ24R (all present)
-- Some older Miata have fcc_id NULL
-- =====================================================

-- Mazda CX-30 (2020-2024) - FCC: WAZSKE11D01, emergency: MAZ24R
UPDATE public.automotive_keys SET ic_number = '1977-SKE11D01', test_key_blank = 'T-MAZ-24' WHERE id = 'd36f4781-ec01-473a-8028-db1aaddbdef8';

-- Mazda CX-5 (2013-2016) - FCC: WAZSKE13D01, emergency: MAZ24R
UPDATE public.automotive_keys SET ic_number = '1977-SKE13D01', test_key_blank = 'T-MAZ-24' WHERE id = '7577f5ca-8256-4e26-89f0-627b4afb53eb';

-- Mazda CX-5 (2017-2024) - FCC: WAZSKE13D02, emergency: MAZ24R
UPDATE public.automotive_keys SET ic_number = '1977-SKE13D02', test_key_blank = 'T-MAZ-24' WHERE id = 'b1fd8fbb-e2b2-49c6-a844-c3f8ae0c7c05';

-- Mazda CX-50 (2023-2024) - FCC: WAZSKE11D01, emergency: MAZ24R
UPDATE public.automotive_keys SET ic_number = '1977-SKE11D01', test_key_blank = 'T-MAZ-24' WHERE id = '48549a14-d1c6-4cad-a0f9-2659c94aa0db';

-- Mazda CX-9 (2007-2015) - FCC: WAZX1T763SKE11A04, emergency: MAZ24R, transponder
UPDATE public.automotive_keys SET ic_number = '1977-X1T763SKE11A04', test_key_blank = 'T-MAZ-24' WHERE id = 'e245ec23-73f9-4241-b6d5-3a2643ff9605';

-- Mazda CX-9 (2016-2024) - FCC: WAZSKE13D01, emergency: MAZ24R
UPDATE public.automotive_keys SET ic_number = '1977-SKE13D01', test_key_blank = 'T-MAZ-24' WHERE id = '12122f49-23b6-41e0-acb9-73635ec1b8af';

-- Mazda Mazda3 (2019-2024) - FCC: WAZSKE11D01, emergency: MAZ24R
UPDATE public.automotive_keys SET ic_number = '1977-SKE11D01', test_key_blank = 'T-MAZ-24' WHERE id = 'cd6a42a1-9d0f-4a78-8a3c-1a6e37c2372f';

-- Mazda Mazda3 (2014-2018) - FCC: WAZSKE13D01, emergency: MAZ24R
UPDATE public.automotive_keys SET ic_number = '1977-SKE13D01', test_key_blank = 'T-MAZ-24' WHERE id = '49ff698f-5597-40d9-95ac-754690dab125';

-- Mazda Mazda6 (2014-2021) - FCC: WAZSKE13D01, emergency: MAZ24R
UPDATE public.automotive_keys SET ic_number = '1977-SKE13D01', test_key_blank = 'T-MAZ-24' WHERE id = '66576ffc-d4ba-4d99-9225-464fb5c49317';

-- Mazda MX-5 Miata (2016-2024) - FCC: WAZSKE13D01, emergency: MAZ24R
UPDATE public.automotive_keys SET ic_number = '1977-SKE13D01', test_key_blank = 'T-MAZ-24' WHERE id = '9eec8dc5-2c84-45bf-8f91-9194bb8b3edc';

-- Mazda MX-5 Miata (1999-2005) - FCC: NULL, emergency: MAZ24R, transponder
-- No FCC ID for this era
UPDATE public.automotive_keys SET test_key_blank = 'T-MAZ-24' WHERE id = '05db5db4-b9e5-4e66-9daa-9980da99422b';

-- Mazda MX-5 Miata (2006-2015) - FCC: NULL, emergency: MAZ24R, transponder
-- No FCC ID for this era
UPDATE public.automotive_keys SET test_key_blank = 'T-MAZ-24' WHERE id = '443067ab-b463-4b07-bee1-6c15c877c9c0';

-- =====================================================
-- MERCEDES-BENZ
-- Mercedes keys have: ic_number NULL, test_key_blank NULL
-- Some older models have fcc_id NULL
-- emergency_key_blank = HU64 (all present)
-- =====================================================

-- Mercedes-Benz A-Class (W177) (2019-2024) - FCC: IYZDC12K, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-DC12K', test_key_blank = 'T-HU-64' WHERE id = '0740a037-954c-439f-a0a2-fee08d5b9eaa';

-- Mercedes-Benz C-Class (1996-2000) - FCC: NULL, emergency: HU64, standard key
-- No FCC ID for standard key
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-64' WHERE id = 'de575e32-bb4e-443a-b07b-6f35e6c6b268';

-- Mercedes-Benz C-Class (2001-2007) - FCC: IYZ-3312, emergency: HU64-PT, transponder
UPDATE public.automotive_keys SET ic_number = '2701A-3312', test_key_blank = 'T-HU-64' WHERE id = 'd5d4aa12-f0bd-4277-9d8d-aeee4e474ddd';

-- Mercedes-Benz C-Class (2008-2014) - FCC: IYZ-3312, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-3312', test_key_blank = 'T-HU-64' WHERE id = '6c8e6b07-6089-4b0e-a516-ec2ab9016e5e';

-- Mercedes-Benz C-Class (W205) (2015-2021) - FCC: IYZDC11, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-DC11', test_key_blank = 'T-HU-64' WHERE id = 'fe6fde80-0da4-4787-8f86-2c9dd2ee4a61';

-- Mercedes-Benz C-Class (W206) (2022-2024) - FCC: IYZDC12K, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-DC12K', test_key_blank = 'T-HU-64' WHERE id = '6277d406-eb6a-4665-9081-a69bf9a41f06';

-- Mercedes-Benz E-Class (1996-2002) - FCC: NULL, emergency: HU64, standard key
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-64' WHERE id = '5d1a445a-dfeb-4d4a-8099-a8342c7b0a71';

-- Mercedes-Benz E-Class (2003-2009) - FCC: IYZ-3312, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-3312', test_key_blank = 'T-HU-64' WHERE id = '6e4b1f10-5ad9-4293-9127-c84103fe2c07';

-- Mercedes-Benz E-Class (W212) (2010-2016) - FCC: IYZDC07, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-DC07', test_key_blank = 'T-HU-64' WHERE id = '9f978b59-6dc5-4001-ab83-6e9ee7d4a674';

-- Mercedes-Benz E-Class (W213) (2017-2024) - FCC: IYZDC11, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-DC11', test_key_blank = 'T-HU-64' WHERE id = '22ef6a15-35a8-4475-830c-27453ef241b1';

-- Mercedes-Benz GLA (H247) (2021-2024) - FCC: IYZDC12K, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-DC12K', test_key_blank = 'T-HU-64' WHERE id = '6869758a-0392-410c-894f-bd5f44449882';

-- Mercedes-Benz GLB (X247) (2020-2024) - FCC: IYZDC12K, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-DC12K', test_key_blank = 'T-HU-64' WHERE id = 'dd798dec-16ed-44d6-930e-1db172f2db7b';

-- Mercedes-Benz GLC (X253/X254) (2016-2024) - FCC: IYZDC11, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-DC11', test_key_blank = 'T-HU-64' WHERE id = 'dcea4477-1c2b-4e4c-a8b7-42874ccfb6f8';

-- Mercedes-Benz GLE (V167) (2020-2024) - FCC: IYZDC12K, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-DC12K', test_key_blank = 'T-HU-64' WHERE id = 'ce314bb8-a90e-41f0-8185-4ebaf0d2c78e';

-- Mercedes-Benz GLE (W166) (2016-2019) - FCC: IYZDC11, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-DC11', test_key_blank = 'T-HU-64' WHERE id = '3aa6d031-cf6f-43e6-bf00-ddc7659973f5';

-- Mercedes-Benz S-Class (2006-2013) - FCC: IYZ-3312, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-3312', test_key_blank = 'T-HU-64' WHERE id = '181e716d-2413-4c1c-afce-635c0d237272';

-- Mercedes-Benz S-Class (1999-2005) - FCC: NULL, emergency: HU64, transponder
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-64' WHERE id = '44cbfdda-fe2b-4aa2-b329-ce06f8c3fabe';

-- Mercedes-Benz S-Class (W222) (2014-2020) - FCC: IYZDC07, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-DC07', test_key_blank = 'T-HU-64' WHERE id = 'dd7686e1-a9c3-42ac-ad47-3da928e5afac';

-- Mercedes-Benz S-Class (W223) (2021-2024) - FCC: IYZDC12K, emergency: HU64
UPDATE public.automotive_keys SET ic_number = '2701A-DC12K', test_key_blank = 'T-HU-64' WHERE id = 'd9999ecb-a90f-41f8-8aff-381da2d5ff1d';

-- =====================================================
-- MINI
-- All Mini keys have: ic_number NULL, test_key_blank NULL
-- emergency_key_blank present (HU92R or HU100R)
-- =====================================================

-- Mini Clubman (F54) (2016-2024) - FCC: NBGIDGNG1, emergency: HU92R
UPDATE public.automotive_keys SET ic_number = '2694A-IDGNG1', test_key_blank = 'T-HU-92' WHERE id = '55771334-c92e-4c43-80d8-ac63e4e37e50';

-- Mini Cooper (F56 LCI/F56 LCI2) (2019-2024) - FCC: NBGIDGNG1, emergency: HU100R
UPDATE public.automotive_keys SET ic_number = '2694A-IDGNG1', test_key_blank = 'T-HU-100' WHERE id = 'e5cba527-5f2e-459e-82e1-3127f58ee430';

-- Mini Cooper (F56) (2014-2018) - FCC: KR55WK49333, emergency: HU92R
UPDATE public.automotive_keys SET ic_number = '2694A-WK49333', test_key_blank = 'T-HU-92' WHERE id = '24ab82c7-2fed-479f-a66e-39f83728aa0a';

-- Mini Countryman (F60) (2017-2024) - FCC: NBGIDGNG1, emergency: HU100R
UPDATE public.automotive_keys SET ic_number = '2694A-IDGNG1', test_key_blank = 'T-HU-100' WHERE id = '24626f2f-8920-42d3-9149-8113d194a3cd';

-- Mini Countryman (R60) (2011-2016) - FCC: KR55WK49333, emergency: HU92R
UPDATE public.automotive_keys SET ic_number = '2694A-WK49333', test_key_blank = 'T-HU-92' WHERE id = '92f844a4-4e2b-487c-8399-5ff00c729801';

-- =====================================================
-- MITSUBISHI
-- All Mitsubishi keys have: ic_number NULL, test_key_blank NULL
-- emergency_key_blank present (MIT11R, MIT11, MIT8)
-- =====================================================

-- Mitsubishi Eclipse Cross (2018-2024) - FCC: OUCJ166N, emergency: MIT11R
UPDATE public.automotive_keys SET ic_number = '1545A-J166N', test_key_blank = 'T-MIT-11' WHERE id = 'd00f77d8-54ad-412b-8268-337d7722a62f';

-- Mitsubishi Lancer (2008-2017) - FCC: OUCJ166N, emergency: MIT11, transponder
UPDATE public.automotive_keys SET ic_number = '1545A-J166N', test_key_blank = 'T-MIT-11' WHERE id = '1226547c-9449-4472-acdb-fceba47340d4';

-- Mitsubishi Lancer (2002-2007) - FCC: OUCG8D-620M-A, emergency: MIT8, transponder
UPDATE public.automotive_keys SET ic_number = '1545A-G8D-620M-A', test_key_blank = 'T-MIT-8' WHERE id = '20a0111a-8828-4fd3-92ce-133819155fba';

-- Mitsubishi Mirage (2014-2024) - FCC: OUCJ166N, emergency: MIT11, transponder
UPDATE public.automotive_keys SET ic_number = '1545A-J166N', test_key_blank = 'T-MIT-11' WHERE id = '960d9358-d83d-40b6-a4af-df05c1737c81';

-- Mitsubishi Outlander (2014-2021) - FCC: OUCJ166N, emergency: MIT11R
UPDATE public.automotive_keys SET ic_number = '1545A-J166N', test_key_blank = 'T-MIT-11' WHERE id = 'ed82700d-d499-472e-a2bc-3c74f014fc2b';

-- Mitsubishi Outlander (2007-2013) - FCC: OUCG8D-625M-A, emergency: MIT11, transponder
UPDATE public.automotive_keys SET ic_number = '1545A-G8D-625M-A', test_key_blank = 'T-MIT-11' WHERE id = '88a23eab-8c15-426b-9ccb-b105420fbbc4';

-- Mitsubishi Outlander (2022-2024) - FCC: OUCJ166N, emergency: MIT11R
UPDATE public.automotive_keys SET ic_number = '1545A-J166N', test_key_blank = 'T-MIT-11' WHERE id = '49bf8661-122f-463a-85de-cc9f42146e8a';

-- Mitsubishi Outlander Sport (2011-2017) - FCC: OUCJ166N, emergency: MIT11
UPDATE public.automotive_keys SET ic_number = '1545A-J166N', test_key_blank = 'T-MIT-11' WHERE id = '450fca36-3b75-4cf3-b33e-bf7e5e3a93a5';

-- Mitsubishi Outlander Sport (2018-2024) - FCC: OUCJ166N, emergency: MIT11R
UPDATE public.automotive_keys SET ic_number = '1545A-J166N', test_key_blank = 'T-MIT-11' WHERE id = '02da777d-00cd-4b66-ab35-09454f1bd2c3';

-- =====================================================
-- NISSAN
-- Nissan keys have: ic_number NULL, test_key_blank NULL
-- Many have emergency_key_blank NULL (needs to be filled)
-- Some older models have fcc_id NULL
-- =====================================================

-- Nissan 350Z (2003-2008) - FCC: NULL, emergency: NULL, transponder
-- Older transponder key, no FCC. Emergency blade = NSN14
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'fb64deee-1353-4097-9c98-b1ffcbeaa143';

-- Nissan 350Z (2003-2008) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'e2739065-ea24-4b0f-b8dd-1ce7b1d1cbca';

-- Nissan 350Z (2003-2008) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '3aaddc54-ea2f-4d84-94c5-31e481aa8c1d';

-- Nissan 370Z (2009-2020) - FCC: KR55WK49622, emergency: NULL
-- Smart key with NSN14 emergency blade
UPDATE public.automotive_keys SET ic_number = '7812D-WK49622', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'b0d1920b-e1ce-4ff4-a146-b5e89d73a5a0';

-- Nissan 370Z (2009-2020) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WK49622', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'd0c9f046-104e-4718-a457-a47aec60b6f1';

-- Nissan 370Z (2009-2020) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WK49622', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '8c2e1952-5a74-44d6-9303-9133e334f41d';

-- Nissan Altima (1998-2001) - FCC: NULL, emergency: NSN11, standard key
-- No FCC for standard key
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-11' WHERE id = 'efa2f689-989c-4121-bff9-98490f0b5929';

-- Nissan Altima (2019-2024) - FCC: KR5TXN4, emergency: NSN14
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = '36ae1342-8a05-4358-8ab0-a9c4d88d32ef';

-- Nissan Altima (2013-2018) - FCC: KR5S180144014, emergency: NSN14
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', test_key_blank = 'T-NSN-14' WHERE id = 'fa1c99a0-741a-4291-9e3b-fcab9fb45fe3';

-- Nissan Altima (2002-2006) - FCC: NULL, emergency: NSN14, transponder
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '7c407578-aaf7-422e-9a46-df4b04b85972';

-- Nissan Altima (2007-2012) - FCC: KR55WK48903, emergency: NSN14, transponder
UPDATE public.automotive_keys SET ic_number = '7812D-WK48903', test_key_blank = 'T-NSN-14' WHERE id = 'e26a9f95-da2c-4790-a66e-570eb34c0486';

-- Nissan Armada (2017-2024) - FCC: KR5S180144014, emergency: NULL
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '739a2ad0-507e-4bf2-8f60-4f85edb765d9';

-- Nissan Armada (2005-2015) - FCC: CWTWB1U758, emergency: NULL
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U758', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'ade394d0-78f2-4745-b4ec-a855bbcf3247';

-- Nissan Armada (2005-2015) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U758', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'ecd4848a-2835-43a7-9dc7-d09f529ecf6b';

-- Nissan Armada (2017-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'f69fbe0a-95fa-4550-ad16-2ce292f34b0e';

-- Nissan Armada (2005-2015) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U758', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'ddba197a-73d4-4d50-a5da-4502ab586cc8';

-- Nissan Armada (2017-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '11b844a3-7b71-4a6c-9cd1-675d71ac5724';

-- Nissan Frontier (2022-2024) - FCC: KR5TXN4, emergency: NSN14
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = 'd3296d48-4126-4f85-a5b0-fe4c39a7a653';

-- Nissan Frontier (2005-2021) - FCC: NULL, emergency: NULL, transponder
-- Transponder key, no smart system. Emergency = NSN14
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '800c8ca9-d857-4b5f-979d-af640c57e4f2';

-- Nissan Frontier (2005-2021) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '2c8df433-93b8-4e6d-a2ae-b1fedcbbd5ba';

-- Nissan Frontier (1998-2004) - FCC: NULL, emergency: NSN11
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-11' WHERE id = 'c3ad0556-35d6-4a18-9e29-e274658231e9';

-- Nissan Frontier (2022-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = '40caa281-e93e-40e0-a43a-610bf8208a27';

-- Nissan Frontier (2005-2021) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'c52a9b47-80e5-41b6-a856-85590a9c7e8f';

-- Nissan Frontier (1998-2004) duplicate
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-11' WHERE id = 'a962a1ce-5809-4c7b-af66-d72b6394e288';

-- Nissan Frontier (1998-2004) duplicate
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-11' WHERE id = '957d1808-0efc-4daf-ba97-6f3ec298b524';

-- Nissan Frontier (2022-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = 'a896efd7-2501-4c80-a9dd-0569c4256a7c';

-- Nissan Juke (2011-2017) - FCC: CWTWB1U840, emergency: NSN14
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U840', test_key_blank = 'T-NSN-14' WHERE id = 'e46b4260-e147-4cd9-91a2-2ea229ff346e';

-- Nissan Juke (2011-2017) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U840', test_key_blank = 'T-NSN-14' WHERE id = '53c780d8-f4d9-478e-844d-bd750717bc87';

-- Nissan Juke (2011-2017) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U840', test_key_blank = 'T-NSN-14' WHERE id = 'f1469c85-518a-4e32-9079-73130765dbee';

-- Nissan Kicks (2018-2024) - FCC: KR5TXN7, emergency: NULL
UPDATE public.automotive_keys SET ic_number = '7812D-TXN7', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'a08fdc7c-442d-4335-9aed-cfe04197f7b9';

-- Nissan Kicks (2018-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-TXN7', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '24b280ed-efee-4923-a274-7fb767529bdf';

-- Nissan Kicks (2018-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-TXN7', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '83efbecf-c134-4919-85cd-1c9d5bcab192';

-- Nissan Leaf (2011-2017) - FCC: CWTWB1U840, emergency: NSN14
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U840', test_key_blank = 'T-NSN-14' WHERE id = 'b43235b5-4307-490f-9f47-b66efd886c63';

-- Nissan Leaf (2018-2024) - FCC: KR5TXN4, emergency: NSN14
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = 'a06d5acb-4ebf-49e8-8edb-2d376e4eb64d';

-- Nissan Leaf (2018-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = 'ecf2a47c-0cbd-431b-b912-020e28e8224c';

-- Nissan Leaf (2011-2017) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U840', test_key_blank = 'T-NSN-14' WHERE id = 'a29d5bd7-3645-4e58-bc5c-ae9658236d24';

-- Nissan Leaf (2011-2017) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U840', test_key_blank = 'T-NSN-14' WHERE id = 'f7679d4b-2e40-4889-b57f-0ece25ba1341';

-- Nissan Leaf (2018-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = 'c50b4298-496b-4c91-a91e-b64bbdcf4370';

-- Nissan Maxima (2004-2008) - FCC: KBRASTU15, emergency: NULL
UPDATE public.automotive_keys SET ic_number = '7812D-ASTU15', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '1710248f-c560-4ca3-9497-1169b90bd199';

-- Nissan Maxima (1995-2003) - FCC: NULL, emergency: NULL, transponder
-- Old transponder key, DA34 blade
UPDATE public.automotive_keys SET emergency_key_blank = 'DA34', test_key_blank = 'T-DA-34' WHERE id = '65762aba-17ce-4812-a04e-0866bcaf6f2d';

-- Nissan Maxima (2004-2008) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-ASTU15', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '891f6447-dcb8-4f5e-9202-6bfdf302b580';

-- Nissan Maxima (2009-2015) - FCC: KR55WK48903, emergency: NULL
UPDATE public.automotive_keys SET ic_number = '7812D-WK48903', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '778a543d-ad99-442c-8637-d186cfb860ad';

-- Nissan Maxima (2016-2023) - FCC: KR5S180144014, emergency: NULL
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'c0886170-2fd1-46c4-a2dd-a04f7219fd83';

-- Nissan Maxima (1995-2003) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'DA34', test_key_blank = 'T-DA-34' WHERE id = '0af4a88f-59ad-4ae6-b2b3-337e566a973a';

-- Nissan Maxima (1995-2003) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'DA34', test_key_blank = 'T-DA-34' WHERE id = '7246f65e-bd84-4177-bbb5-1647dec06798';

-- Nissan Maxima (2016-2023) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '5ebea4b7-433f-4049-b000-1c2a967f4915';

-- Nissan Maxima (2009-2015) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WK48903', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'a583a3ae-beb4-4168-a2f7-32e178024c8f';

-- Nissan Maxima (2004-2008) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-ASTU15', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '0ea6cb10-2bfd-4068-bcc9-260fb969b0de';

-- Nissan Maxima (2016-2023) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '44ea9c79-9a89-4d5b-89b7-969b88f5ec5c';

-- Nissan Maxima (2009-2015) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WK48903', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '8fac9656-c6e6-4142-8899-e775444da40a';

-- Nissan Murano (2015-2024) - FCC: KR5S180144014, emergency: NULL
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '9b8ff026-3dfe-4cff-b1cb-cb9c5a81a236';

-- Nissan Murano (2003-2008) - FCC: KBRASTU15, emergency: NULL
UPDATE public.automotive_keys SET ic_number = '7812D-ASTU15', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'b52d5af0-4fc1-4a32-815d-1dcc86e98e6a';

-- Nissan Murano (2015-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '9d85c25e-7e94-4efe-b478-dd2e573f619b';

-- Nissan Murano (2015-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '14185276-84c4-4e58-9446-923ef4a9cada';

-- Nissan Murano (2009-2014) - FCC: KR55WK48903, emergency: NULL
UPDATE public.automotive_keys SET ic_number = '7812D-WK48903', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'c914b856-387b-4781-bb28-f2366333e72c';

-- Nissan Murano (2003-2008) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-ASTU15', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '5c29484e-78a8-427b-b132-c269de7cdc6f';

-- Nissan Murano (2003-2008) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-ASTU15', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '4b56db0e-af53-4179-90e1-48eb8571291c';

-- Nissan Murano (2009-2014) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WK48903', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '0ec9d7a6-cae6-4550-8fcd-93726ac4beb9';

-- Nissan Murano (2009-2014) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WK48903', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'af1e7480-cd6f-41a3-98fb-5e72c02fefbd';

-- Nissan Pathfinder (1996-2004) - FCC: NULL, emergency: NULL, transponder
-- DA34 blade for older Pathfinder
UPDATE public.automotive_keys SET emergency_key_blank = 'DA34', test_key_blank = 'T-DA-34' WHERE id = 'cdd4baa7-f85d-464c-b364-4faf5371a08d';

-- Nissan Pathfinder (1996-2004) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'DA34', test_key_blank = 'T-DA-34' WHERE id = '641fab0c-2659-45eb-b804-933e53cb68fd';

-- Nissan Pathfinder (2005-2012) - FCC: NULL, emergency: NULL, transponder
-- NSN14 blade for mid-gen Pathfinder
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'c149d2ec-9daf-4a13-bd89-94862eea57c6';

-- Nissan Pathfinder (2013-2020) - FCC: KR5S180144014, emergency: NULL
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '504fa57d-df42-404a-a90f-38918fa9ed9d';

-- Nissan Pathfinder (1996-2004) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'DA34', test_key_blank = 'T-DA-34' WHERE id = '497b83c0-94b9-47e3-8224-8d4d37e5012c';

-- Nissan Pathfinder (2005-2012) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'ab8f0e4f-0247-4e60-9dc8-50efd92b4c40';

-- Nissan Pathfinder (2013-2020) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '85ca1012-8afe-4813-899c-f4b0f5c5edc5';

-- Nissan Pathfinder (2005-2012) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '1d9e9878-ac7f-42ba-95d1-233d477693b2';

-- Nissan Pathfinder (2013-2020) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '2c6f1cce-052a-4c43-a0f3-51887a09c711';

-- Nissan Pathfinder (2022-2024) - FCC: KR5TXN4, emergency: NSN14
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = '59e01dea-a7da-452d-adf7-dcec45146bb6';

-- Nissan Pathfinder (2022-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = 'e53efd4f-9f7e-493b-a7fb-476197449934';

-- Nissan Pathfinder (2022-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = '3689b5dd-c349-4a2b-8945-679bbba44df5';

-- Nissan Quest (2011-2017) - FCC: CWTWB1U787, emergency: NULL
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U787', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'af23a6b7-145a-4464-8d8f-f8a3358bbef3';

-- Nissan Quest (2004-2009) - FCC: CWTWB1U751, emergency: NSN14, transponder
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U751', test_key_blank = 'T-NSN-14' WHERE id = '074c8a4f-7934-486c-ae87-cd0b8d0cca43';

-- Nissan Quest (2004-2009) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U751', test_key_blank = 'T-NSN-14' WHERE id = '2d1e8064-46c4-465b-bcbd-51563c800646';

-- Nissan Quest (2004-2009) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U751', test_key_blank = 'T-NSN-14' WHERE id = '7bcb3935-808a-4cb9-8092-6b53e3300313';

-- Nissan Quest (2011-2017) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U787', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '5c305183-62d9-4512-8ac8-ada38c106ed9';

-- Nissan Quest (2011-2017) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U787', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '3ff03d98-0cea-43d6-b022-03365448a8c1';

-- Nissan Rogue (2014-2020) - FCC: KR5S180144106, emergency: NSN14
UPDATE public.automotive_keys SET ic_number = '7812D-S180144106', test_key_blank = 'T-NSN-14' WHERE id = '11e93e4b-7066-400b-9f94-c4df515c6d96';

-- Nissan Rogue (2021-2024) - FCC: KR5TXN4, emergency: NSN14
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = '6dbb1d03-6a4a-4643-9be7-197d6162ecd2';

-- Nissan Rogue (2008-2013) - FCC: CWTWBU729, emergency: NSN14, transponder
UPDATE public.automotive_keys SET ic_number = '7812D-WBU729', test_key_blank = 'T-NSN-14' WHERE id = 'abe68cca-5a31-4335-9bd8-5a61c999487e';

-- Nissan Sentra (2007-2012) - FCC: CWTWB1U751, emergency: NSN14, transponder
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U751', test_key_blank = 'T-NSN-14' WHERE id = '7283da10-42dd-41fd-b151-37d57627a305';

-- Nissan Sentra (2013-2019) - FCC: CWTWB1U815, emergency: NSN14, transponder
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U815', test_key_blank = 'T-NSN-14' WHERE id = 'c30c1b57-a706-4809-99f0-410999f7e824';

-- Nissan Sentra (2000-2006) - FCC: NULL, emergency: NSN11, transponder
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-11' WHERE id = '39155d46-1a2f-4acb-acaa-114b86432a4f';

-- Nissan Sentra (2020-2024) - FCC: KR5TXN4, emergency: NSN14
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = 'e06f85fd-b114-4431-87e6-9cbf2ad00927';

-- Nissan Titan (2016-2024) - FCC: KR5S180144014, emergency: NULL
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '609db354-03df-4840-8143-a444e0f517a1';

-- Nissan Titan (2016-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'ef84cb70-a2d2-4d07-8b17-ef78faf14520';

-- Nissan Titan (2004-2015) - FCC: NULL, emergency: NULL, transponder
-- NSN14 blade
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '26ead22b-d5d9-4ec4-a0bb-3a4653db9cc0';

-- Nissan Titan (2004-2015) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'cd0da5c2-8ac3-4c4d-a07d-fef2567b3647';

-- Nissan Titan (2004-2015) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'e3fa9f77-8573-4e15-b6a4-f879e7b1f897';

-- Nissan Titan (2016-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-S180144014', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'd001c3a5-9f3b-4310-989d-7e0760a2dc7e';

-- Nissan Versa (2007-2011) - FCC: CWTWB1U751, emergency: NSN14, transponder
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U751', test_key_blank = 'T-NSN-14' WHERE id = '44060aba-fce9-4085-afc0-6ced0772900a';

-- Nissan Versa (2020-2024) - FCC: KR5TXN4, emergency: NSN14
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = '03a1391f-c6b4-44d7-bb9a-bab693606137';

-- Nissan Versa (2020-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = 'eae0fed6-5229-4e30-b2bd-a7b08c50f062';

-- Nissan Versa (2020-2024) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-TXN4', test_key_blank = 'T-NSN-14' WHERE id = '6835f716-e800-40c0-8628-8ad10dd9e6a3';

-- Nissan Versa (2012-2019) - FCC: CWTWB1U751, emergency: NULL, transponder
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U751', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '2ce6d043-11b9-486d-8147-25809041633e';

-- Nissan Versa (2012-2019) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U751', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '95e84813-b45c-4a94-942f-4b98742572d6';

-- Nissan Versa (2012-2019) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U751', emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'fb61edeb-5f42-4a7e-8ede-3219c4c87b5f';

-- Nissan Versa (2007-2011) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U751', test_key_blank = 'T-NSN-14' WHERE id = 'ed259c01-e57d-4414-b23a-c31e461ab23d';

-- Nissan Versa (2007-2011) duplicate
UPDATE public.automotive_keys SET ic_number = '7812D-WB1U751', test_key_blank = 'T-NSN-14' WHERE id = '2326b230-7df2-41e5-9c46-bfb0ca4932a6';

-- Nissan Xterra (2000-2004) - FCC: NULL, emergency: NSN11
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-11' WHERE id = '3bf2487b-39cc-4121-9241-a8618244c846';

-- Nissan Xterra (2005-2015) - FCC: NULL, emergency: NULL, transponder
-- NSN14 blade
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '482f9874-036b-4555-8e89-e57731b22aff';

-- Nissan Xterra (2005-2015) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = 'b6718ab3-c8df-4b62-ad01-e035ff285276';

-- Nissan Xterra (2005-2015) duplicate
UPDATE public.automotive_keys SET emergency_key_blank = 'NSN14', test_key_blank = 'T-NSN-14' WHERE id = '7e101b04-1db1-4d16-b10d-be296cab6324';

-- Nissan Xterra (2000-2004) duplicate
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-11' WHERE id = '3ed3afb6-e7c1-4077-bf4d-5a8800a31104';

-- Nissan Xterra (2000-2004) duplicate
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-11' WHERE id = '14ec621e-d057-41c5-90a8-1600725bcb16';
