-- MASTER SEED PART4 of 4
-- Gap fixes + Lishi tool mappings
-- Run in order: PART1 -> PART2 -> PART3 -> PART4

-- ============================================================
-- STEP 9: Fix remaining key gaps
-- ============================================================
UPDATE public.automotive_keys SET test_key_blank = 'T-HD-106' WHERE id = 'c4d622a1-234e-40b3-bcfa-ebc2ffd6646e';
UPDATE public.automotive_keys SET test_key_blank = 'T-HD-106' WHERE id = '7ef3bc2e-d971-41eb-8a33-eb52f10d256b';
UPDATE public.automotive_keys SET test_key_blank = 'T-SIP-22' WHERE id = 'eee1aa6d-3429-4edc-a0c9-51921a7492cd';
UPDATE public.automotive_keys SET test_key_blank = 'T-SIP-22' WHERE id = '5c72c852-1408-4675-b99c-bc7c352e9f28';
UPDATE public.automotive_keys SET test_key_blank = 'T-SIP-22' WHERE id = '07f21200-4c85-43b9-98bd-36cf718058cd';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = 'abf70bbc-7fdd-4774-954f-6c0778d17cd1';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = '5cb85e5c-132a-4487-9bbe-24dd8ab30f5d';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = '9355ad8b-bed6-4af5-adc7-df17481de09e';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = 'c29fc795-6396-435b-b75a-902a9b408dde';
UPDATE public.automotive_keys SET ic_number = '2694A-0959754', test_key_blank = 'T-HU-66' WHERE id = '2a4ac94f-d2a0-4a3f-a3a6-3ed9ffb5b46b';
UPDATE public.automotive_keys SET ic_number = '2694A-0959754', test_key_blank = 'T-HU-66' WHERE id = '947345e7-f271-4e65-8203-88e3ed7e4f28';
UPDATE public.automotive_keys SET ic_number = '2694A-0959754', test_key_blank = 'T-HU-66' WHERE id = 'ff77e05b-fa65-4636-8460-69969952beb4';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = 'c77eb31d-3763-4b3c-a8c9-12ee16abfee0';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = '806cba26-05b0-4911-a52d-71a5bf57721c';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = '7e5bc8bb-9e97-422b-ae97-8f0582d375b7';
UPDATE public.automotive_keys SET ic_number = '2694A-010206T', test_key_blank = 'T-HU-66' WHERE id = '9bd74fd7-204c-4b90-9f05-85cba3da0831';
UPDATE public.automotive_keys SET ic_number = '2694A-0959754', test_key_blank = 'T-HU-66' WHERE id = '42afe107-cafb-40ee-a69a-197036a76d53';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92R' WHERE id = 'c8ecbae6-4174-4ea4-8782-0a8bf9595b01';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92R' WHERE id = '00e1672b-8cc5-4af4-965f-6bc192c12c83';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92R' WHERE id = 'a80b46bd-aa13-4e66-894f-6374dce30158';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '0e817c06-8d45-4520-a456-62b4eb80f333';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '8b5407f0-98bf-4b54-b0d4-baf3b9b09a13';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = 'af77a974-d162-4957-b2a6-d8753c335539';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92' WHERE id = '9b90b063-05ba-411e-902d-388e5b806e4d';
UPDATE public.automotive_keys SET ic_number = '2694A-8FZV', test_key_blank = 'T-HU-58' WHERE id = '45dbfafa-2056-455a-9285-9e8d58088062';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92R' WHERE id = '465f9fe6-bf51-4019-b9a7-214ff69a00a4';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '0926b789-563f-4f87-a6dc-9cc9e27fc0d8';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '3ee556c7-23fa-4677-8d93-8221e8bd1626';
UPDATE public.automotive_keys SET ic_number = '2694A-8FZV', test_key_blank = 'T-HU-58' WHERE id = '8bc227d2-abe8-4b3b-a2be-666e166be241';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92' WHERE id = '20c4125e-c967-4b34-a4c3-86d5c3fe2c71';
UPDATE public.automotive_keys SET ic_number = '2694A-HUF5767', test_key_blank = 'T-HU-92R' WHERE id = '23b0e98e-b762-4984-9c84-e3041b2246cf';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '4611d1aa-39c7-4502-a957-57d63dac2ceb';
UPDATE public.automotive_keys SET ic_number = '2694A-HUF5767', test_key_blank = 'T-HU-92R' WHERE id = '0383ee2d-1940-44fb-9b03-73c189ca563f';
UPDATE public.automotive_keys SET ic_number = '2694A-HUF5767', test_key_blank = 'T-HU-92R' WHERE id = '33cbe5b6-53f8-492c-afde-cfef3036c9e0';
UPDATE public.automotive_keys SET ic_number = '2694A-HUF5767', test_key_blank = 'T-HU-92R' WHERE id = 'ec5404b4-738e-4e26-984f-c5eae6c018db';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '581148c0-1e0b-44c7-9cf4-e04af9fd9312';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '7760dbae-f68e-424e-bec9-248ad7882838';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '8884e407-d6e5-4444-b2d4-a8bf47d75afe';
UPDATE public.automotive_keys SET ic_number = '2694A-8FZV', test_key_blank = 'T-HU-92' WHERE id = '325ce5c8-de4e-484d-8296-d878a85a89c9';
UPDATE public.automotive_keys SET ic_number = '2694A-HUF5767', test_key_blank = 'T-HU-92' WHERE id = 'a9ef5fa8-553b-4ea4-8a70-2bcd29fb42c3';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '8b92e5b4-22a2-4245-a08e-800702b0dea9';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '9dfc0961-bbc1-40e3-8ba8-0dc6eb1aada3';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '853a5cea-8422-4491-8b11-847aee153f47';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '74253158-92b2-463b-a837-1c90c4f5fce2';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '1be864c1-2b51-4e1a-ab68-8074652a4808';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '643b347c-75f8-430f-80c5-092d10814508';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = 'd5353ef4-2f04-4947-8b07-63ea966cc4c8';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = 'c76abdc9-19b8-4423-b69f-e46424d0fc00';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '84031687-807a-4e1d-b21e-dc7ac59e2274';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = 'da26a6bd-31af-40a4-9c2a-48b8829febcb';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92' WHERE id = '640ce9bf-5f91-4a70-b5ce-e0c5bd882ef4';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '5aaa0df3-56cb-4055-8a2e-21b0bfc236d9';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '2107c641-a71f-4ec5-9056-8f16cac1745a';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = 'bf0548b3-0aba-49fd-a80b-c8bd0e35661e';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '3f236816-d50e-419c-9609-86769a2583ae';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92' WHERE id = '33781813-34a4-40db-846d-4fde25637561';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92R' WHERE id = '155d3b9e-fb3b-4828-9fa3-5dee619ff7cb';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '2544bfdd-2bcd-4b55-af4f-82cff299d3d5';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92R' WHERE id = '047512dc-12c6-4399-b260-fd8450b93bba';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92R' WHERE id = '2fec7f9e-610b-4b62-9d4e-21b6c5e72b59';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92R' WHERE id = '213fd813-ab4a-4623-a7e3-765c4e11a662';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '009ecfc1-68bc-46ef-899f-8a32904e1b70';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '388eb0e5-beaf-4df2-ab0a-4436d390c2f6';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '403f3079-c826-4172-8ae2-aa55a7507f7c';
UPDATE public.automotive_keys SET ic_number = '2694A-HUF5767', test_key_blank = 'T-HU-92' WHERE id = '881e5245-b715-4818-82cd-e7906b1c8f3b';
UPDATE public.automotive_keys SET ic_number = '2694A-8FZV', test_key_blank = 'T-HU-58' WHERE id = '1da3e61b-a983-42cc-8f68-00b6e5f2c6cc';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-92R' WHERE id = '0fbc598e-aa1e-4989-acf0-2171a5b7da6b';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '139dc8f6-f4c9-43fc-b52c-2aa5e3addec8';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-92R' WHERE id = 'e1b60c56-9793-4641-a1b2-e012e3b57f63';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-92R' WHERE id = '9bd14456-3e38-4eb5-a849-8d9f191543ce';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-92R' WHERE id = 'ca1a4c2f-9ecf-4bde-a3b1-d97af698d791';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '72d44a1a-26bd-4c02-8a34-37b1e24f97ac';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '7d2948e5-b4cb-48d7-a034-7dc37db7d78c';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '92459e56-39e5-48f1-b0fd-ac2c58e39b07';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = 'c38b179f-6f25-4011-bfaf-3f75a6d36047';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = 'f50c1ac8-f5dd-402a-a404-4b24150faf19';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '58582edc-6ec1-42cd-95a0-71117f442b9e';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '1cfda87c-52ce-427d-8b97-28390cf40367';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = '4db991b9-9e21-453c-92d1-5c262a63a7fb';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '1a7ea2c8-65c0-4c4a-844e-c2d0d740f4ad';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = '5c436d6b-d138-460c-bbe2-0407160765e7';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '5cd6a870-3975-4338-8f05-da6f617678dd';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'b8755863-d2c8-4db7-9634-dec3e105a5fb';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '797ce446-e9ac-4b04-8880-6afea179af41';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = '7e82ef45-a5f0-4537-b53a-93bf314c3187';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '8de19cf7-5572-4c88-bc9d-3f311e6e42dd';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = '0a2029b6-f094-403a-8812-c1f48c857aa6';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '5a1549c2-b679-43a6-a54d-53929e08bb0d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '6fbbbe33-b939-48ff-b2e7-a926096b2959';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '8574049d-bcb0-4672-a191-166eaab6a04b';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '84babb2b-86d0-4772-91bf-73c27526c3b5';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'b7e30b36-4843-4420-a81e-f1e9d07cd2b8';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '2b318a22-3b4d-4f7e-816b-4362bd43a6a5';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = 'c92ac1a2-f99a-4315-b8f0-c308dcfb84be';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '5986c66a-4294-4c48-95e3-1f8976000a0b';
UPDATE public.automotive_keys SET ic_number = '3521A-UT1BT', test_key_blank = 'T-B97' WHERE id = 'ce128a73-a81f-4793-87c6-ce16b95ae430';
UPDATE public.automotive_keys SET ic_number = '3521A-UT1BT', test_key_blank = 'T-B97' WHERE id = 'b3c90b79-c097-4455-88c6-104f0ab238eb';
UPDATE public.automotive_keys SET ic_number = '3521A-UT1BT', test_key_blank = 'T-B97' WHERE id = '935603ab-6d62-4052-906a-e2514cf5eaa3';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = 'f514d8b9-8882-4b84-a0ab-c12105c82b28';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = '6b1df513-adac-4140-aeed-7b1f0acd241b';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = '4501d669-465b-4888-90ed-0950d455b514';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '05d3288f-c896-4e6f-a8b1-2b52cd2d7587';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '8b67a634-da73-4bd9-a716-572690a05cbe';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = '937586ef-032d-49fe-bb53-166c4b280745';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '6b928c54-d65b-431c-97a1-b04c8e9f3b4b';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '9ba74d64-d235-4ab6-8c7a-0791c11c6f20';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = 'e89ec81c-5681-4465-8ba1-f0f596136645';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = '6e7ea6f1-9155-44b9-b386-862806ae9e4d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = '969742eb-b145-40be-a298-31473c34a8e7';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'a11ebcc5-aaae-4c15-8875-c1d25512bfd1';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '61e57011-8222-4d9a-a38a-baa9754112f7';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '967508fa-495c-440c-bcbb-aea539ee19a9';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '686bcdc9-49f8-4f2e-99c3-c8e38967b90a';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '345438e8-a395-4380-837f-bfee2a05f213';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'b72c02ac-3dfc-490a-a558-2e87af25004a';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '11dcef65-2229-490e-8b54-ceef51135918';
UPDATE public.automotive_keys SET ic_number = '3521A-009768T', test_key_blank = 'T-B111' WHERE id = 'a30eec77-30ac-491c-a34d-9f15526150cc';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = '7d8712c0-bfa0-492a-9b83-80a766918319';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = 'c594daca-ccac-4318-9a6d-812a21efe32d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = '84a692c7-73cc-4348-9bc7-4c50536ecabe';
UPDATE public.automotive_keys SET ic_number = '3521A-009768T', test_key_blank = 'T-B111' WHERE id = 'bbc5c145-d1d3-4f3f-b18a-72e724996989';
UPDATE public.automotive_keys SET ic_number = '3521A-009768T', test_key_blank = 'T-B111' WHERE id = '743815a4-30a0-42fa-9866-d31cb9a613fc';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = '976725cb-9139-4eca-aab7-f3dc22e52465';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = 'a7d2de6c-db6a-4e66-bec8-61af0ae327f5';
UPDATE public.automotive_keys SET test_key_blank = 'T-B106' WHERE id = '803bd7de-659e-469c-a127-a8745c797417';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '493dc75a-b4b3-41c8-a23e-baa9e27fe1e8';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '36bf1d27-fa7f-4ca1-b1ce-6ed128769541';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'f7a7f309-4835-41f4-badb-345df019d006';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '9e8db4ad-360a-44d4-9cb3-398155bbac11';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = 'ebaab85b-c308-4148-b28e-048db5a20c6b';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '1b8cc410-964a-4eb1-97ea-d3c2b9dda980';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = '704379be-b77a-4413-a0b9-236723506c98';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = 'f172b7e9-da1e-49a5-add7-58a3f0b0903d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = '56bebb56-b8ea-4cfc-a605-f5ba5f863910';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '7b19aadd-50a8-4232-a129-b8707bac4c85';
UPDATE public.automotive_keys SET ic_number = '3521A-UT1BT', emergency_key_blank = 'B89', test_key_blank = 'T-B89' WHERE id = 'cbf6206f-e136-44c2-a912-988488bbc42a';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'bf5949da-9dfc-46a3-a8cf-4feefcc475f0';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '371de3b6-beb8-4725-8923-b266c6544e9d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'e51b01d1-2340-45fb-bb24-1fcf069d82f5';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = '027270be-5299-4ef6-b097-25cd50af4b73';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'c4bf4236-fb73-43fc-a6b3-772dacedd593';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '6e7f05c7-096a-4862-b33e-c2cbfa36d7f3';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '94767f8a-7693-4d6a-aaf6-b93eb90a32b1';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '04f3376c-b1e3-478f-9497-55288bbb78c2';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'b3a41285-f477-4268-b826-158182079abc';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'b4f753da-3dcb-4b35-a064-50f7a126c044';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = '80a936ad-1e6d-462a-90e9-244cfc606072';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = '10a49a94-8f41-4ab0-9108-820f4ffa24e6';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = 'b167b1c2-6e8a-4059-abfc-7070b90e9a81';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '15c06b5a-d287-4fad-a32b-2d5de3da5582';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '2148cf93-3efe-474e-8087-9a11cfa42d38';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '4da244b3-d9a3-4374-844f-45292758b7fa';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = 'b71edc9e-f880-4907-8fe2-291fae19987c';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '728a6bd9-85c1-4013-b072-6d3cfb317b57';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '825bb70e-ca0d-4c40-bff0-c25d35b7d713';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'b65cae33-0940-442a-85c8-2cf85137fd81';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '473118c8-6e3b-4449-8b7d-4b7d7810801b';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '2777517e-489c-4641-b2b7-02e54a70cdf9';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '72d38671-a9f0-4c78-9959-b549f3e249c4';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '4f41b935-e943-4ee0-b364-acbf666b48b1';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '42f96b43-af00-47fb-9079-ef199761162f';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '52255483-86ac-47af-9744-79b5afc1585d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '2428f3d3-7625-4bf2-9d08-c31c3d3cca13';
UPDATE public.automotive_keys SET ic_number = '3521A-GT04A', emergency_key_blank = 'B102', test_key_blank = 'T-B102' WHERE id = '8c0b6c47-619c-435d-9a89-c179ea88efa8';
UPDATE public.automotive_keys SET ic_number = '3521A-T01060512', emergency_key_blank = 'B111', test_key_blank = 'T-B111' WHERE id = 'f8b0c1c2-adf0-4e36-bd07-386bab346784';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'fa4bb2aa-8d7d-43e3-926f-fcbcd060761c';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = 'b0eeb40e-ff77-47b9-a247-3ced4a9add4f';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = 'f77d9ab8-25c6-402b-89c1-bfd8ac51154c';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = '087ba59d-95e9-471a-8989-8aa9da688820';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '9b193b67-7b59-4f45-98b7-657cb4246cf3';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = 'd75c55d0-54be-4b50-b267-2d779abd5453';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = 'cfa27445-f3f1-4e23-9b9d-66fecfa49c62';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = 'd07d3fc5-71a0-4ba8-b59b-53275bd42a2f';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '5ac3b0cc-b835-4cf2-a762-9cb2e1a1adcd';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '59a1c3e9-5b8f-4163-89c3-e88dfc006eae';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = '8daccdc8-214b-4191-a020-0ba3fff6493e';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '1f094607-b346-4f17-a6c1-5805ef409228';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '51a8d449-1f2e-4163-8dac-7234d7062a67';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '3abd995f-4a51-4461-a49b-e02608b9fbca';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = '3e286aed-e990-4593-bc50-6571f2ba08a1';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '68866170-3add-4a15-8d99-d0c59478ecc7';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '342a0b4f-d7db-409c-82bd-a7143c1e120e';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = '5bb7cd9a-a360-47a5-8b1f-407ea5e3ce99';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '8ce4285c-6d86-4e58-bac0-d3874c3ec2ba';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'c71d4ab0-c410-4dbb-819c-23c8b1da3d75';
UPDATE public.automotive_keys SET ic_number = '3521A-UT1BT', emergency_key_blank = 'B97', test_key_blank = 'T-B97' WHERE id = 'eca3b964-6326-46cd-ad77-8b7461346f80';
UPDATE public.automotive_keys SET emergency_key_blank = 'B97', test_key_blank = 'T-B97' WHERE id = 'c42d8c04-4fdc-4969-b13c-0fb223c2de15';
UPDATE public.automotive_keys SET ic_number = '3521A-T01060512', emergency_key_blank = 'B111', test_key_blank = 'T-B111' WHERE id = '1fdbb35b-7100-4037-a028-6ed57780551c';
UPDATE public.automotive_keys SET emergency_key_blank = 'B111', test_key_blank = 'T-B111' WHERE id = '7edbec3e-8954-4da0-93b8-90c7b533189e';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = 'c9d04725-fba1-4a01-bcd7-248dee3396cc';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = '47860dc2-dd50-47cf-9327-6bfb77ee5fad';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = '82f7560d-a745-49b8-84ce-4acf8fb027f6';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = 'cb6e97b4-3775-4b5b-952c-f8efd48e04aa';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = 'a4d19df5-9e93-4c4a-87d4-990789ca7c26';
UPDATE public.automotive_keys SET test_key_blank = 'T-B97' WHERE id = '6723a1a6-5feb-4b42-87a6-dcd1aa2b44fd';
UPDATE public.automotive_keys SET ic_number = '3521A-T01060512', emergency_key_blank = 'B111', test_key_blank = 'T-B111' WHERE id = 'c3e654e8-a982-472d-b394-ffc8c6e8f0ae';
UPDATE public.automotive_keys SET ic_number = '3521A-LEAR1XT', emergency_key_blank = 'B102', test_key_blank = 'T-B102' WHERE id = '972daee8-4a52-46c7-813e-2db7c288fb67';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '8924c5a5-4c97-4921-acd8-39ee86b1925d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'a58196c7-5fcc-422c-b3ac-2fb0a870c647';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'fe0f2846-9abe-4b61-b1af-a4096439d5e1';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'e9359712-fb80-415a-aa1a-f37b1fb0d7ed';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '604a4a03-3b00-4514-ab2c-6756edc17cf1';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '4bc816de-107c-4dcd-a9c9-3eb8144199bb';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'd122c858-71ff-45d6-94ef-dce454e99d80';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'b80b643b-43f2-4baf-9bb3-0880e6411b2f';
UPDATE public.automotive_keys SET ic_number = '3521A-LEAR1XT', emergency_key_blank = 'B102', test_key_blank = 'T-B102' WHERE id = '4791dfef-18c6-47f5-8e76-f9c47204a0c7';
UPDATE public.automotive_keys SET emergency_key_blank = 'B89', test_key_blank = 'T-B89' WHERE id = 'e9924003-0ccc-44d7-8179-ae306883ed24';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '0da7ecd6-4118-4d61-96f6-b2070745b34f';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '4c277ed3-6cce-486c-9a9c-93b16bafb812';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '25ba2b73-97ff-4322-a4e9-78f0e2694a1b';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'f50f4724-e93b-4d9e-ae4d-b7196d236333';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '889eb4c7-bba1-4135-9625-850a69f360fc';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '64918987-1b76-4ddc-b94c-c98f7d5d0d58';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '95c70259-6f6c-43ba-a9a0-f707acc11610';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = 'd2af5ba6-f7ef-4394-9860-093e4b22b8a6';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = 'a3bb5c0a-bfe1-4e3c-b2bd-8e8844a032ba';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '4e064383-b1d6-4bbf-b395-b78bf1ec8566';
UPDATE public.automotive_keys SET ic_number = '3521A-LEAR1XT', emergency_key_blank = 'B102', test_key_blank = 'T-B102' WHERE id = 'aff1ef3d-df27-44ad-8da3-8e177b460800';
UPDATE public.automotive_keys SET emergency_key_blank = 'B89', test_key_blank = 'T-B89' WHERE id = 'ce30c201-413c-4c84-8e51-1d6535fa0c1f';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '7f05eaaa-2932-4a56-bf45-35d96cd6216d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'a8f0758d-6b5d-4be1-95de-cb767129ea6d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '208daab2-820a-4480-afe8-4ba775a48fd0';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'fb280a4d-a947-4db3-a847-bf5ac018a502';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '2a30ee93-5428-4a6b-a755-d5051d9fee41';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = 'b094f528-0bd5-474b-aedc-094059c2b748';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '6c4fed5a-e89f-4685-a686-658eef8fc16f';
UPDATE public.automotive_keys SET test_key_blank = 'T-B102' WHERE id = '632a05ab-52ff-4b59-8ebb-a59116beddf5';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'f5c64acd-e723-4d9c-ad61-981fb8ddb1f1';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '724beddd-0136-42bb-8ff2-3988bf148b99';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '5b24e3e2-f74f-4b6c-a5ba-9e19a85d1737';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '0c17e26f-e8c4-44f2-bb44-4ec375609fa0';
UPDATE public.automotive_keys SET ic_number = '3521A-T01060512', emergency_key_blank = 'B111', test_key_blank = 'T-B111' WHERE id = '4d508c00-fe47-439d-8f1e-7441be82c6b9';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '1e126bf2-7393-47e4-9edc-72997bf31b60';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '40effe61-a968-4cd7-8129-a9823bb25737';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '187119de-f393-4cc4-b302-d56414a1e42f';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = 'dfc10a37-2d4a-4f0c-b45c-619815fbd184';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '296aea04-87fe-428a-b311-9fccd99ee24e';
UPDATE public.automotive_keys SET test_key_blank = 'T-B111' WHERE id = '518821a5-080f-464e-91a1-3f226b0c3b1e';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = '689a6fd0-cf4d-4618-abf5-a15ffec360ec';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y159' WHERE id = '6c668230-f054-4426-970e-d06d2e3fb097';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y159' WHERE id = '669ee9e6-b3f1-4dd5-9605-9f8e2422a5a5';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = '6af2e251-c8d8-4505-91b2-dab6ea9d5652';
UPDATE public.automotive_keys SET ic_number = '5765A-692427AA', test_key_blank = 'T-Y160' WHERE id = 'c6d83347-278a-455c-84a0-0e8b4419622a';
UPDATE public.automotive_keys SET ic_number = '5765A-692427AA', test_key_blank = 'T-Y160' WHERE id = '2c63a34c-5dda-4964-85b8-ea28643ba188';
UPDATE public.automotive_keys SET ic_number = '5765A-692427AA', test_key_blank = 'T-Y160' WHERE id = '121eb3ed-fbb4-438a-9bd8-1f5a6e0bb840';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = 'c67a1ecf-d3ef-4551-9170-092b7b007d73';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = '07fef767-de32-401d-833d-96075d771d63';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = '1b390002-2ca6-4ba0-801b-34b79e1728b1';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-64' WHERE id = '8081bd74-05e0-46fa-ae1b-401b876bc007';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-64' WHERE id = '224ce0dc-d579-4570-8f98-6bd33c91db55';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-64' WHERE id = '422dbb4b-07b0-4d14-a9d9-1fa5b6c97f7e';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = '80242ff8-452b-49c4-9c67-38dd56a4445e';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = '9fd2dcf6-740a-4e12-a532-44899109347e';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = '090adbd7-83b8-438b-acfe-f6c0ceaacc06';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y159' WHERE id = '1f6500a2-79f1-491f-8ac7-5e959bd59bd4';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = 'cba7ce8e-5d9e-4064-ab94-5f461287c31a';
UPDATE public.automotive_keys SET ic_number = '5765A-692427AA', test_key_blank = 'T-Y160' WHERE id = 'b38ea591-e7ae-40ff-8e78-3681fd888976';
UPDATE public.automotive_keys SET ic_number = '5765A-692427AA', test_key_blank = 'T-Y160' WHERE id = '82db7666-f7d9-409a-87b7-385c9c4c5ff0';
UPDATE public.automotive_keys SET ic_number = '5765A-692427AA', test_key_blank = 'T-Y160' WHERE id = '3b2a4965-ad91-42cf-bab6-584de4d9b431';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = '04da8850-478a-461b-a725-bcbfac528af6';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = '2bb31209-75d2-4ba9-9a9c-aac44cca2dba';
UPDATE public.automotive_keys SET ic_number = '5765A-692427AA', test_key_blank = 'T-Y160' WHERE id = '614a17c1-8a78-4382-b4da-df4b12c6dc93';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = '0c0aa001-3b6c-43b8-b1f5-a2826ac4b589';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = '7439c111-aae9-4223-a93c-6e648c0aed94';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = 'e695bfa7-ed5a-4894-8d0e-402f53674d82';
UPDATE public.automotive_keys SET ic_number = '5765A-692427AA', test_key_blank = 'T-Y160' WHERE id = '72042178-e3cb-4729-9381-ff356e363b42';
UPDATE public.automotive_keys SET ic_number = '5765A-692427AA', test_key_blank = 'T-Y160' WHERE id = '1582e6b3-10dd-4bd0-af76-a364f1875f39';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y160' WHERE id = '8765b7e8-793d-4044-87eb-e1e4d2dce699';
-- Fix NULL fields for automotive keys: Manufacturers D through H
-- Generated for: Dodge, Fiat, Ford, Genesis, GMC, Honda, Hyundai
-- Only updates fields that are currently NULL

-- Dodge Avenger (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-Y160' WHERE id = '5ed7f4fc-55cc-4205-9819-80dad9e79fbf';
-- Dodge Avenger (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-Y160' WHERE id = '4e5fe4a6-741c-4a41-ae13-3d35927b7e3f';
-- Dodge Avenger (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-Y160' WHERE id = '439ec610-502e-4614-b616-4d46840aa769';
-- Dodge Caliber (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '3521A-692427AA', test_key_blank = 'T-Y160' WHERE id = '0da04291-02c6-48e1-9cf5-af45b20ed4e8';
-- Dodge Caliber (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '3521A-692427AA', test_key_blank = 'T-Y160' WHERE id = 'c662c019-88f3-466d-aab0-9c50f351560d';
-- Dodge Caliber (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '3521A-692427AA', test_key_blank = 'T-Y160' WHERE id = '54735e52-cb17-48bd-95a6-754962d3b8b9';
-- Dodge Challenger (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '1470A-C01C', test_key_blank = 'T-Y160' WHERE id = '6242a3b7-b8aa-4fd6-b7e7-72328095e5f4';
-- Dodge Challenger (smart_key, Y159-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-40821302', test_key_blank = 'T-Y159' WHERE id = 'ce05a50e-d72c-4c9d-b54b-e4218dac8ec2';
-- Dodge Charger (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-40821302', test_key_blank = 'T-Y160' WHERE id = 'c7e059c5-aa82-4d06-b2d4-03777ae08156';
-- Dodge Charger (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY72XX', test_key_blank = 'T-Y160' WHERE id = 'dcb9b2ee-2734-4ae2-9d8a-e7d79cce5c22';
-- Dodge Charger (smart_key, Y159-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-40821302', test_key_blank = 'T-Y159' WHERE id = 'c11f58d0-9f3b-48cd-a0c7-e89262aa95e1';
-- Dodge Dakota (transponder, Y160)
UPDATE public.automotive_keys SET emergency_key_blank = 'Y160', test_key_blank = 'T-Y160' WHERE id = 'f9f0e541-ed21-4cf3-b67f-1f932c0b815a';
-- Dodge Dakota (transponder, Y160)
UPDATE public.automotive_keys SET emergency_key_blank = 'Y160', test_key_blank = 'T-Y160' WHERE id = '443a93ea-3100-41b8-a4e3-15e46b31c297';
-- Dodge Dakota (transponder, Y160)
UPDATE public.automotive_keys SET emergency_key_blank = 'Y160', test_key_blank = 'T-Y160' WHERE id = '0505ba03-072e-4bbf-a22f-6a132d9ab535';
-- Dodge Dakota (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '2270A-DT04A', test_key_blank = 'T-Y160' WHERE id = '35b25856-377e-47c8-b25d-d5413d2a5882';
-- Dodge Dakota (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '2270A-DT04A', test_key_blank = 'T-Y160' WHERE id = '63508771-f997-41e9-a70b-e8150d4e7f7f';
-- Dodge Dakota (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '2270A-DT04A', test_key_blank = 'T-Y160' WHERE id = '3b1ea0a5-ae97-4d0e-98d0-84bec0220cf5';
-- Dodge Dart (smart_key, SIP22)
UPDATE public.automotive_keys SET ic_number = '7812A-40821302', test_key_blank = 'T-SIP22' WHERE id = 'eb5692a6-c30e-4c80-8ef9-5e46582dafad';
-- Dodge Dart (smart_key, SIP22)
UPDATE public.automotive_keys SET ic_number = '7812A-40821302', test_key_blank = 'T-SIP22' WHERE id = 'acbab12e-d1a6-433f-811a-9a2b87095a2d';
-- Dodge Dart (smart_key, SIP22)
UPDATE public.automotive_keys SET ic_number = '7812A-40821302', test_key_blank = 'T-SIP22' WHERE id = '972a3e44-8c9f-4ea3-96f7-734e07b4fa23';
-- Dodge Durango (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '1470A-C01C', test_key_blank = 'T-Y160' WHERE id = '7c2066eb-32a2-4986-884e-4c0ac3ad5492';
-- Dodge Durango (smart_key, Y159-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-Y159' WHERE id = '3491bef5-beaa-43fd-a681-0925820cc3e4';
-- Dodge Durango (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '1470A-54T', test_key_blank = 'T-Y160' WHERE id = '6400ff68-38a1-4632-8190-49e21a744eb0';
-- Dodge Durango (standard, Y159)
UPDATE public.automotive_keys SET ic_number = '1470A-VT9T', emergency_key_blank = 'Y159', test_key_blank = 'T-Y159' WHERE id = 'b7de9fed-cc19-41e5-b280-a19c8b391112';
-- Dodge Durango (transponder, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '2270A-DT04A', test_key_blank = 'T-Y160' WHERE id = '2f96b37c-11ba-4944-8d22-94826659589f';
-- Dodge Grand Caravan (standard, Y157)
UPDATE public.automotive_keys SET emergency_key_blank = 'Y157', test_key_blank = 'T-Y157' WHERE id = '74e11612-ec0c-4bb9-8442-58673f7ebd64';
-- Dodge Grand Caravan (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-Y160' WHERE id = '66b37a77-c5eb-452f-a42d-1f7d0f869394';
-- Dodge Grand Caravan (transponder, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY72XX', test_key_blank = 'T-Y160' WHERE id = '70df5e0f-eff8-4c12-aac8-416e30d0a002';
-- Dodge Journey (transponder, Y160)
UPDATE public.automotive_keys SET ic_number = '3521A-692713AA', test_key_blank = 'T-Y160' WHERE id = 'd6246c5a-7917-4e55-8bff-b50ac86b3a85';
-- Dodge Journey (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '1470A-C01C', test_key_blank = 'T-Y160' WHERE id = '1a0600f0-0d1e-4a57-b59f-5e9b214c9f15';
-- Dodge Magnum (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY72XX', test_key_blank = 'T-Y160' WHERE id = 'd7d883a7-61e8-4537-b3b8-93f7e790d3fd';
-- Dodge Magnum (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY72XX', test_key_blank = 'T-Y160' WHERE id = '2b982681-bb7b-4d77-8a6a-1912284fe990';
-- Dodge Magnum (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY72XX', test_key_blank = 'T-Y160' WHERE id = 'd9b0b196-a6f8-49f3-8367-e69de9fa520b';
-- Dodge Neon (transponder, Y160)
UPDATE public.automotive_keys SET emergency_key_blank = 'Y160', test_key_blank = 'T-Y160' WHERE id = '9329e2bc-24d6-49d0-8f9a-d9a496892105';
-- Dodge Neon (transponder, Y160)
UPDATE public.automotive_keys SET emergency_key_blank = 'Y160', test_key_blank = 'T-Y160' WHERE id = '316cb544-b308-4976-aab7-5a27e44a6e37';
-- Dodge Neon (transponder, Y160)
UPDATE public.automotive_keys SET emergency_key_blank = 'Y160', test_key_blank = 'T-Y160' WHERE id = '70eaf55f-6640-4b76-988d-ad62183595e5';
-- Dodge Nitro (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '2270A-DT04A', test_key_blank = 'T-Y160' WHERE id = '57a9797e-9cb2-4f86-9c44-39555624e663';
-- Dodge Nitro (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '2270A-DT04A', test_key_blank = 'T-Y160' WHERE id = '787333ae-d8b1-41d5-ba3f-ca496ee68faa';
-- Dodge Nitro (smart_key, Y160-PT)
UPDATE public.automotive_keys SET ic_number = '2270A-DT04A', test_key_blank = 'T-Y160' WHERE id = 'f7267785-c674-4851-8bd9-28718e43b704';
-- Dodge Ram Van (standard, Y170)
UPDATE public.automotive_keys SET emergency_key_blank = 'Y170', test_key_blank = 'T-Y170' WHERE id = '654e34b2-00e7-4f66-8e74-95bf6a42aaa6';
-- Dodge Ram Van (standard, Y170)
UPDATE public.automotive_keys SET emergency_key_blank = 'Y170', test_key_blank = 'T-Y170' WHERE id = '6ae200a1-5edf-4fa3-8291-540dd6039e3f';
-- Dodge Ram Van (standard, Y170)
UPDATE public.automotive_keys SET emergency_key_blank = 'Y170', test_key_blank = 'T-Y170' WHERE id = '4fe62399-bee2-4e06-bec3-ae0953346ca9';
-- Fiat 500 (transponder, SIP22)
UPDATE public.automotive_keys SET ic_number = '900T-F12AM433TX', test_key_blank = 'T-SIP22' WHERE id = '6f336243-dd37-48d1-b57b-eade0177aa1a';
-- Fiat 500L (transponder, SIP22)
UPDATE public.automotive_keys SET ic_number = '900T-F12AM433TX', test_key_blank = 'T-SIP22' WHERE id = 'a88ab926-0fc1-4af8-9a46-c7b75ff05cc8';
-- Fiat 500X (smart_key, SIP22)
UPDATE public.automotive_keys SET ic_number = '7812A-40821302', test_key_blank = 'T-SIP22' WHERE id = 'df283e14-6589-463f-9237-6586e1d37472';
-- Fiat 500X (Facelift) (smart_key, SIP22)
UPDATE public.automotive_keys SET ic_number = '7812A-40821302', test_key_blank = 'T-SIP22' WHERE id = 'e3ec0428-5f5e-4759-82ce-ce20a7c78a63';
-- Ford Bronco (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C93142600', test_key_blank = 'T-H92' WHERE id = 'ae3ef004-e14a-4384-950b-b4e5e852569d';
-- Ford Bronco Sport (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C93142600', test_key_blank = 'T-H92' WHERE id = '34197392-3df3-44dd-b8fb-d30e9ee49e0a';
-- Ford Crown Victoria (transponder, H74)
UPDATE public.automotive_keys SET emergency_key_blank = 'H74', test_key_blank = 'T-H74' WHERE id = '03d6cbc3-a4d0-4210-9a74-4cd8c62d3db9';
-- Ford Crown Victoria (transponder, H74)
UPDATE public.automotive_keys SET emergency_key_blank = 'H74', test_key_blank = 'T-H74' WHERE id = 'bfe2d9a2-ed6f-4c45-8d78-310865d044d7';
-- Ford Crown Victoria (transponder, H74)
UPDATE public.automotive_keys SET emergency_key_blank = 'H74', test_key_blank = 'T-H74' WHERE id = 'eae9748e-e58b-4c23-aeee-84eb5ec4a0de';
-- Ford Crown Victoria (transponder, H84-PT)
UPDATE public.automotive_keys SET emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = 'a45bd4d6-9088-4d56-adb2-9676870987b7';
-- Ford Crown Victoria (transponder, H84-PT)
UPDATE public.automotive_keys SET emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '30899388-73e2-4c83-9f8c-0f690fdca046';
-- Ford Crown Victoria (transponder, H84-PT)
UPDATE public.automotive_keys SET emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '2570e42d-5acc-472c-ac15-242371cba6a1';
-- Ford Edge (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '2521A-R8040', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '17524ea6-e51a-4257-8ddc-31a83ae3d344';
-- Ford Edge (transponder, H128-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY8609', test_key_blank = 'T-H128' WHERE id = 'd141a98f-761f-47f6-aa4a-7ba8acd43933';
-- Ford Edge (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C31243300', test_key_blank = 'T-H92' WHERE id = 'f8ef1bc1-fdfa-49bd-99fd-d61c0d9bfca6';
-- Ford Escape (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C93142600', test_key_blank = 'T-H92' WHERE id = '3eb1ed80-313c-4e71-a2bc-bf0dfb9da6e8';
-- Ford Escape (transponder, H75)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U345', emergency_key_blank = 'H75', test_key_blank = 'T-H75' WHERE id = '955ddcad-9f59-4454-a9f2-42d288984d16';
-- Ford Escape (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '6a15caa8-ffcc-4cad-a8ff-1925502aebd4';
-- Ford Escape (smart_key, H128-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C31243300', test_key_blank = 'T-H128' WHERE id = 'cf230d6c-9cf6-4852-a098-30508572028f';
-- Ford Excursion (transponder, H84-PT)
UPDATE public.automotive_keys SET emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = 'a99e7874-6606-40a1-afba-0169609a0c82';
-- Ford Excursion (transponder, H84-PT)
UPDATE public.automotive_keys SET emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '8f7c027a-9fbd-4ce7-8e33-f8e31dfae7ef';
-- Ford Excursion (transponder, H84-PT)
UPDATE public.automotive_keys SET emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '4f10f4ac-012c-4c7a-8bd8-25b128ce1af2';
-- Ford Expedition (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C93142600', test_key_blank = 'T-H92' WHERE id = 'e829087b-5c33-4122-ae1e-00c1998ec13d';
-- Ford Expedition (transponder, H75)
UPDATE public.automotive_keys SET emergency_key_blank = 'H75', test_key_blank = 'T-H75' WHERE id = 'cf38dbae-ccb4-47e3-a280-dc199edea5b3';
-- Ford Expedition (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = 'e020c4a4-2e0f-45b4-be67-6f3281df203d';
-- Ford Expedition (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C93142600', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = 'abd86ce9-970d-41c9-8722-7e193d819d95';
-- Ford Explorer (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C93142600', test_key_blank = 'T-H92' WHERE id = '0c387ec8-70c4-438c-a3f2-fc0ac8b44de9';
-- Ford Explorer (transponder, H75)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U345', emergency_key_blank = 'H75', test_key_blank = 'T-H75' WHERE id = '8ce00897-3f58-4c44-9ec5-194186147951';
-- Ford Explorer (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = 'dec7f282-9f85-4adf-8cbf-17c89ff93e01';
-- Ford Explorer (smart_key, H128-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY8609', test_key_blank = 'T-H128' WHERE id = 'b1178c2c-4d63-4560-9cb4-92fa56b130fb';
-- Ford F-150 (transponder, H75)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U345', emergency_key_blank = 'H75', test_key_blank = 'T-H75' WHERE id = 'd4daeddc-322f-4efe-9c36-b5c31bf46786';
-- Ford F-150 (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '285c96f8-6df0-4c40-9e1f-05e6139db1fc';
-- Ford F-150 (transponder, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C93142300', test_key_blank = 'T-H92' WHERE id = '479aafe4-3ebf-4160-97f2-9a16f7703c9b';
-- Ford F-150 (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C93142600', test_key_blank = 'T-H92' WHERE id = '4db68c11-c91a-48cd-8988-5dce4378b93f';
-- Ford F-250/F-350 Super Duty (transponder, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C93142600', emergency_key_blank = 'H92', test_key_blank = 'T-H92' WHERE id = 'b661fcbc-08ac-4214-b920-96de765453a6';
-- Ford F-250/F-350 Super Duty (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = 'a728bdae-9c82-4442-9464-655aaf6d20a8';
-- Ford F-250/F-350 Super Duty (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A3C054339', test_key_blank = 'T-H92' WHERE id = '18f9b3c7-ad08-4a35-83de-921dfd4c51c0';
-- Ford F-350/F-450 Chassis Cab (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '003b4abd-37e2-4e7d-a015-88f70d937298';
-- Ford F-350/F-450 Chassis Cab (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A3C054339', test_key_blank = 'T-H92' WHERE id = 'f9070b77-4cec-4715-852c-8b3d5333058c';
-- Ford F-350/F-450 Chassis Cab (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A3C054339', test_key_blank = 'T-H92' WHERE id = 'ed33e86e-f7fc-4198-936b-deae538fa3cb';
-- Ford F-350/F-450 Chassis Cab (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A3C054339', test_key_blank = 'T-H92' WHERE id = 'df3fd328-6a9a-4476-b7ee-0c45b210d4f9';
-- Ford F-350/F-450 Chassis Cab (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '9c5f6616-41be-4780-b98a-ec0e7eadefe7';
-- Ford F-350/F-450 Chassis Cab (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '01a6e0f2-5a88-4c7f-9181-3611d2e13e24';
-- Ford Fiesta (transponder, H92-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H92', test_key_blank = 'T-H92' WHERE id = 'fcdd0e7b-0449-4b65-9dd4-3cf8449693d6';
-- Ford Fiesta (transponder, H92-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H92', test_key_blank = 'T-H92' WHERE id = '0810ecad-574c-4ec4-bb3f-900139d1303b';
-- Ford Fiesta (transponder, H92-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H92', test_key_blank = 'T-H92' WHERE id = 'f855db11-691c-4b21-a5f7-d123934ad00e';
-- Ford Five Hundred (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = 'edf4a1e9-0093-4a5e-bbfc-7167727d5119';
-- Ford Five Hundred (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '37a8df8f-c431-4c6f-a5c2-ac7ec54285b2';
-- Ford Five Hundred (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '79188dbf-a406-44c0-a732-36ccc7525a0f';
-- Ford Flex (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = 'a3d7f0c0-0260-4720-b3a2-b964b3ee4e72';
-- Ford Flex (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = 'e246658e-e6e2-4241-8445-391bf287d051';
-- Ford Flex (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '2e18e19c-e86c-45c8-8815-0439fd643cf9';
-- Ford Flex (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY8609', test_key_blank = 'T-H92' WHERE id = '0c073f8c-42b0-46a6-83d3-35ea16955182';
-- Ford Flex (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY8609', test_key_blank = 'T-H92' WHERE id = 'ec57bf9a-f59f-47ee-a6df-b4f9f34a8f24';
-- Ford Flex (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY8609', test_key_blank = 'T-H92' WHERE id = 'dc819c80-57c6-4a2a-87e5-96780bdb6ce3';
-- Ford Focus (transponder, H92-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-D6000022', emergency_key_blank = 'H92', test_key_blank = 'T-H92' WHERE id = '426da47e-35c6-44fb-aecf-e5b7c7e6d228';
-- Ford Focus (transponder, H84-PT)
UPDATE public.automotive_keys SET emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '9b7c752b-ed5f-4546-83d8-9432acf08028';
-- Ford Focus (transponder, H72-PT)
UPDATE public.automotive_keys SET emergency_key_blank = 'H72', test_key_blank = 'T-H72' WHERE id = 'efd8b287-c16b-436a-891a-df31581930c3';
-- Ford Focus (transponder, H75)
UPDATE public.automotive_keys SET emergency_key_blank = 'H75', test_key_blank = 'T-H75' WHERE id = 'eb0c145b-9c59-429b-a443-08a5e083f3a7';
-- Ford Freestyle (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '91e42b2e-4661-434f-bbaf-775bafca9e7a';
-- Ford Freestyle (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = 'be5e56a5-60aa-42c3-8641-c07dd95c9076';
-- Ford Freestyle (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '675fcf0a-c51a-49bb-98e7-64f2b6c9e34f';
-- Ford Fusion (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C31243300', test_key_blank = 'T-H92' WHERE id = 'a537cba9-00c5-42c6-982f-a5269e2b2b89';
-- Ford Fusion (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '98e9bb33-f0f6-44fd-8276-a82b7fc5a88e';
-- Ford Fusion (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '03b3a7f0-65e2-4c3e-b722-60611f5a3381';
-- Ford Maverick (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C93142600', test_key_blank = 'T-H92' WHERE id = 'ceee1090-3657-47d4-aa2f-f40dc40b3c79';
-- Ford Mustang (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '2521A-R8087', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '3a6cd80e-2d69-4688-b7ca-e891639611bf';
-- Ford Mustang (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = 'd3bd2fcd-48b4-4961-859b-0e44ec1a4d94';
-- Ford Mustang (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C31243800', test_key_blank = 'T-H92' WHERE id = '0dd2d5ae-79f0-43a9-afab-f72e823ee1b8';
-- Ford Mustang (transponder, H72)
UPDATE public.automotive_keys SET emergency_key_blank = 'H72', test_key_blank = 'T-H72' WHERE id = '836138ae-f269-40d2-8348-8e919b5aef41';
-- Ford Ranger (transponder, H75)
UPDATE public.automotive_keys SET emergency_key_blank = 'H75', test_key_blank = 'T-H75' WHERE id = '5e12c975-27da-47b6-9a61-429007e5ddde';
-- Ford Ranger (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-A2C93142300', test_key_blank = 'T-H92' WHERE id = '1a8e96c2-118a-436f-9203-d7be48cc1693';
-- Ford Ranger (transponder, H84-PT)
UPDATE public.automotive_keys SET ic_number = '1788D-FWB1U793', emergency_key_blank = 'H84', test_key_blank = 'T-H84' WHERE id = '9f84a52e-8f6c-4eda-8a39-7feccfa1b82e';
-- Ford Taurus (transponder, H72)
UPDATE public.automotive_keys SET emergency_key_blank = 'H72', test_key_blank = 'T-H72' WHERE id = 'a3fe168d-2ce0-456d-a914-c5bd9102f832';
-- Ford Taurus (smart_key, H92-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-5WY8609', test_key_blank = 'T-H92' WHERE id = '0ede2721-2a8f-4583-8622-213be5c9f5bf';
-- Ford Taurus (transponder, H72-PT)
UPDATE public.automotive_keys SET emergency_key_blank = 'H72', test_key_blank = 'T-H72' WHERE id = 'ccbae40a-4e26-4580-aff8-0e48d5dce20e';
-- Ford Transit (transponder, H92-PT)
UPDATE public.automotive_keys SET ic_number = '2521A-R8128', emergency_key_blank = 'H92', test_key_blank = 'T-H92' WHERE id = '5761e850-a980-4634-96c3-cd9322191371';
-- Ford Windstar (transponder, H74)
UPDATE public.automotive_keys SET emergency_key_blank = 'H74', test_key_blank = 'T-H74' WHERE id = 'f21418f8-aa0a-464c-a2e9-3fb21eee066c';
-- Ford Windstar (transponder, H74)
UPDATE public.automotive_keys SET emergency_key_blank = 'H74', test_key_blank = 'T-H74' WHERE id = 'd0b9bec5-e85f-4f31-a5cc-48aa83a7b9c9';
-- Ford Windstar (transponder, H74)
UPDATE public.automotive_keys SET emergency_key_blank = 'H74', test_key_blank = 'T-H74' WHERE id = '82f798df-ba22-4f47-a366-78344b2e386c';
-- Genesis G70 (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F36', test_key_blank = 'T-HY-22' WHERE id = 'cdd69666-1d5d-4528-820a-1cf86b2c4416';
-- Genesis G80 (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-IGFGE04', test_key_blank = 'T-HY-18R' WHERE id = '937abd7a-e6bd-47f2-83bb-b7437004a7b8';
-- Genesis G80 (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F35', test_key_blank = 'T-HY-22' WHERE id = '0e12124b-7215-4d58-b981-d8e93bb10371';
-- Genesis GV70 (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F35', test_key_blank = 'T-HY-22' WHERE id = 'b6165a8c-6eb4-4936-966e-503f56ceaa50';
-- Genesis GV80 (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F35', test_key_blank = 'T-HY-22' WHERE id = '73d71ad5-55c0-4322-a1d5-a21ae1c7807e';
-- GMC Acadia (transponder, B102-PT)
UPDATE public.automotive_keys SET ic_number = '3521A-01060512', emergency_key_blank = 'B102', test_key_blank = 'T-B102' WHERE id = '47525b44-209d-467b-8655-fb23d0163932';
-- GMC Acadia (proximity, B111-PT)
UPDATE public.automotive_keys SET ic_number = '1551A-4EA', test_key_blank = 'T-B111' WHERE id = '8e9a8765-977e-4369-b054-9578249d031e';
-- GMC Canyon (transponder, B111-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-32337100', emergency_key_blank = 'B111', test_key_blank = 'T-B111' WHERE id = 'afed52fa-dc18-4218-9220-5dd20da55dfa';
-- GMC Envoy (transponder, B97)
UPDATE public.automotive_keys SET ic_number = '3521A-0007T', emergency_key_blank = 'B97', test_key_blank = 'T-B97' WHERE id = '802b7044-7fff-427b-9884-5568f9f23659';
-- GMC Envoy (transponder, B97)
UPDATE public.automotive_keys SET ic_number = '3521A-0007T', emergency_key_blank = 'B97', test_key_blank = 'T-B97' WHERE id = 'fa2dcdac-40b8-4c84-8e5c-5b4a675ea9b9';
-- GMC Envoy (transponder, B97)
UPDATE public.automotive_keys SET ic_number = '3521A-0007T', emergency_key_blank = 'B97', test_key_blank = 'T-B97' WHERE id = '98b8187a-e59f-4bf6-ab7a-bad1acf81844';
-- GMC Jimmy (transponder, B97)
UPDATE public.automotive_keys SET emergency_key_blank = 'B97', test_key_blank = 'T-B97' WHERE id = '3a82f8e2-13dc-4e8e-9613-3a9e55ac7973';
-- GMC Jimmy (transponder, B97)
UPDATE public.automotive_keys SET emergency_key_blank = 'B97', test_key_blank = 'T-B97' WHERE id = '4561d358-647d-4125-9844-714aa9d59793';
-- GMC Jimmy (transponder, B97)
UPDATE public.automotive_keys SET emergency_key_blank = 'B97', test_key_blank = 'T-B97' WHERE id = '19edd39e-0284-4a48-9d26-43cb11afabb6';
-- GMC Savana (transponder, B97)
UPDATE public.automotive_keys SET emergency_key_blank = 'B97', test_key_blank = 'T-B97' WHERE id = '025acf08-68b5-4525-8801-0cc33aca3ab9';
-- GMC Savana (transponder, B97)
UPDATE public.automotive_keys SET emergency_key_blank = 'B97', test_key_blank = 'T-B97' WHERE id = '44679612-3dc2-4923-86a1-ee8914fcd83f';
-- GMC Savana (transponder, B102-PT)
UPDATE public.automotive_keys SET ic_number = '3521A-01060512', emergency_key_blank = 'B102', test_key_blank = 'T-B102' WHERE id = '5e29ba53-ad03-4db3-8ee4-03d889e78bc0';
-- GMC Savana (transponder, B102-PT)
UPDATE public.automotive_keys SET ic_number = '3521A-01060512', emergency_key_blank = 'B102', test_key_blank = 'T-B102' WHERE id = 'a8b3b754-1742-4089-9be8-990cb2c597fb';
-- GMC Savana (transponder, B102-PT)
UPDATE public.automotive_keys SET ic_number = '3521A-01060512', emergency_key_blank = 'B102', test_key_blank = 'T-B102' WHERE id = 'fd5e2059-8a09-4d13-b668-01a66faefb4a';
-- GMC Savana (transponder, B97)
UPDATE public.automotive_keys SET emergency_key_blank = 'B97', test_key_blank = 'T-B97' WHERE id = '4e87248f-3912-497b-860f-a06698e991c3';
-- GMC Sierra 1500 (transponder, B102-PT)
UPDATE public.automotive_keys SET ic_number = '3521A-01060512', emergency_key_blank = 'B102', test_key_blank = 'T-B102' WHERE id = '13ceb2cd-ad37-44c2-a271-d4902fef4914';
-- GMC Sierra 1500 (transponder, B111-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-32337100', emergency_key_blank = 'B111', test_key_blank = 'T-B111' WHERE id = 'cbc03be9-2612-4c25-bb84-1614930f2c0c';
-- GMC Sierra 1500 (proximity, B111-PT)
UPDATE public.automotive_keys SET ic_number = '1551A-1EA', test_key_blank = 'T-B111' WHERE id = '32f1de12-9e70-493b-aac6-f9d752a280e2';
-- GMC Sierra 2500/3500 HD (proximity, B111-PT)
UPDATE public.automotive_keys SET ic_number = '1551A-1EA', test_key_blank = 'T-B111' WHERE id = '58fde2f6-c95b-4967-82e1-73dd8c08fc95';
-- GMC Sierra 2500/3500 HD (transponder, B102-PT)
UPDATE public.automotive_keys SET ic_number = '3521A-01060512', emergency_key_blank = 'B102', test_key_blank = 'T-B102' WHERE id = '71a6ee51-f9d3-4835-9acd-0254b1c29ce7';
-- GMC Sierra 2500/3500 HD (transponder, B111-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-32337100', emergency_key_blank = 'B111', test_key_blank = 'T-B111' WHERE id = '47bc8625-d2cd-4588-883b-26c751ecec93';
-- GMC Sierra 2500/3500 HD (proximity, B111-PT)
UPDATE public.automotive_keys SET ic_number = '1551A-1EA', test_key_blank = 'T-B111' WHERE id = 'd0a270c3-2e50-464a-88b3-5448d3cb1725';
-- GMC Sierra 2500/3500 HD (proximity, B111-PT)
UPDATE public.automotive_keys SET ic_number = '1551A-1EA', test_key_blank = 'T-B111' WHERE id = '058b74ad-e4c4-46ef-89ca-b7b4d79f57f6';
-- GMC Sierra 2500/3500 HD (transponder, B102-PT)
UPDATE public.automotive_keys SET ic_number = '3521A-01060512', emergency_key_blank = 'B102', test_key_blank = 'T-B102' WHERE id = '09da8527-d6b4-4db3-b23f-bc3a2b7c786b';
-- GMC Sierra 2500/3500 HD (transponder, B102-PT)
UPDATE public.automotive_keys SET ic_number = '3521A-01060512', emergency_key_blank = 'B102', test_key_blank = 'T-B102' WHERE id = '159f5176-3f7c-4daa-90b0-369b34354368';
-- GMC Sierra 2500/3500 HD (transponder, B111-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-32337100', emergency_key_blank = 'B111', test_key_blank = 'T-B111' WHERE id = 'dc35c0a5-3ef0-4962-b7c8-697e8dc45141';
-- GMC Sierra 2500/3500 HD (transponder, B111-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-32337100', emergency_key_blank = 'B111', test_key_blank = 'T-B111' WHERE id = 'f66dca8e-c1d9-499e-a489-9231a2b8b916';
-- GMC Terrain (proximity, B111-PT)
UPDATE public.automotive_keys SET ic_number = '1551A-1AA', test_key_blank = 'T-B111' WHERE id = '77f1d98a-6758-4e6e-a849-c8de516dae4f';
-- GMC Terrain (transponder, B102-PT)
UPDATE public.automotive_keys SET ic_number = '3521A-01060512', emergency_key_blank = 'B102', test_key_blank = 'T-B102' WHERE id = '44d11d60-d37a-4e84-8f0b-41ccd623631a';
-- GMC Yukon (proximity, B111-PT)
UPDATE public.automotive_keys SET ic_number = '1551A-1EA', test_key_blank = 'T-B111' WHERE id = 'ed628deb-52b3-4b01-b697-4c471fa5ef16';
-- GMC Yukon (transponder, B111-PT)
UPDATE public.automotive_keys SET ic_number = '7812A-32337100', emergency_key_blank = 'B111', test_key_blank = 'T-B111' WHERE id = 'dedc617b-ee25-4d65-b385-ee0baaf835c2';
-- Honda Accord (transponder, HD103)
UPDATE public.automotive_keys SET emergency_key_blank = 'HD103', test_key_blank = 'T-HD103' WHERE id = '817f4440-5091-4ad7-bdbe-4a21dab82918';
-- Honda Accord (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '1788D-WB1G0090', test_key_blank = 'T-HON-66' WHERE id = '5bf13dab-087b-40be-8c30-da590ea92b88';
-- Honda Accord (transponder, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = '63f5996a-6ec4-4872-ac99-a9b46187afaa';
-- Honda Accord (transponder, HD106)
UPDATE public.automotive_keys SET emergency_key_blank = 'HD106', test_key_blank = 'T-HD106' WHERE id = 'edae125e-07fc-441b-876e-21d9d526474f';
-- Honda Civic (transponder, HD103)
UPDATE public.automotive_keys SET emergency_key_blank = 'HD103', test_key_blank = 'T-HD103' WHERE id = '79b8bc80-a567-4353-a622-9f9a7e6e22d1';
-- Honda Civic (transponder, HD106)
UPDATE public.automotive_keys SET emergency_key_blank = 'HD106', test_key_blank = 'T-HD106' WHERE id = '886c4439-a248-4b4c-8b91-a9d70df59512';
-- Honda Civic (transponder, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = '0f1a9e40-caf5-49ae-a05e-0bf6c201772d';
-- Honda Civic (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '7812D-V2X', test_key_blank = 'T-HON-66' WHERE id = 'c80a651a-0769-4505-bb1a-103d804e9794';
-- Honda Civic (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '7812D-TP4', test_key_blank = 'T-HON-66' WHERE id = '4665befe-2e3e-45cb-9884-9de1a8eecefd';
-- Honda CR-V (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1310A', test_key_blank = 'T-HON-66' WHERE id = '14253a35-f7ac-458d-9f3c-822d02f8b748';
-- Honda CR-V (transponder, HD103)
UPDATE public.automotive_keys SET emergency_key_blank = 'HD103', test_key_blank = 'T-HD103' WHERE id = 'f6a07c59-41c4-4cba-ac5a-6f12d36833d1';
-- Honda CR-V (transponder, HD106)
UPDATE public.automotive_keys SET emergency_key_blank = 'HD106', test_key_blank = 'T-HD106' WHERE id = 'a4cb3011-8343-41dd-b98d-6435a72a3ddf';
-- Honda CR-V (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = '53cafa1e-b49d-4c57-939c-836745831f4a';
-- Honda CR-V (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = '63f3d8c3-2282-48e5-9828-f57c770986d1';
-- Honda CR-Z (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = '3f1ed155-226a-4b63-9ebf-c48e05e9ec28';
-- Honda CR-Z (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = 'dffe8fc9-922c-4753-b75d-6ceec5dae6bb';
-- Honda CR-Z (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = '25114a8b-58c6-423f-bfc2-92657f094bb7';
-- Honda Crosstour (transponder, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = 'de3d3d79-a47d-4c67-9a4b-7bb734ab92f0';
-- Honda Crosstour (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = '450731fa-bada-4f06-a692-8a5160dd0099';
-- Honda Crosstour (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = '868db1dc-7ac0-47a8-8ed1-de1ce8b1758f';
-- Honda Crosstour (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = '9753f327-b00d-4383-b843-e0fd3020eb61';
-- Honda Crosstour (transponder, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = '2172e0f0-363b-4620-bb57-661cc9aaa294';
-- Honda Crosstour (transponder, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = 'ff9469cc-2a73-4217-a796-9cd9d7e9472b';
-- Honda Element (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = 'b7954c63-f368-4e55-a07f-f1fdd3407e4d';
-- Honda Element (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = '9881db80-cfc3-4fa9-97cf-5d1bee09e376';
-- Honda Element (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = 'b73039c8-f7d6-4675-84bc-522351c3d943';
-- Honda Element (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = '04e309c3-08e2-419c-a31f-525f80ae59aa';
-- Honda Element (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = '8ded11fe-da45-46e7-b221-6bbab22dd583';
-- Honda Element (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = '081a69af-183f-4692-a7ff-111c76f9800e';
-- Honda Fit (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = '336dfa46-bc64-43a3-837a-0e731b37f5cd';
-- Honda Fit (transponder, HD106)
UPDATE public.automotive_keys SET emergency_key_blank = 'HD106', test_key_blank = 'T-HD106' WHERE id = '46d4a203-7d12-4620-af3e-2ba62b86e6a1';
-- Honda Fit (transponder, HON66)
UPDATE public.automotive_keys SET ic_number = '3248A-HLIK61TA', test_key_blank = 'T-HON-66' WHERE id = '64dfc09e-4c47-4c35-a240-278af17534f9';
-- Honda HR-V (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '7812D-V1X', test_key_blank = 'T-HON-66' WHERE id = 'd0d3e97e-15be-49e4-8d7f-b8c7e034027f';
-- Honda HR-V (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '7812D-TP4', test_key_blank = 'T-HON-66' WHERE id = 'c538f347-6d27-497b-8a3f-b07ce2825f27';
-- Honda Insight (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '7812D-V2X', test_key_blank = 'T-HON-66' WHERE id = '1219b5ed-137d-4648-aa84-dcdbba54c120';
-- Honda Insight (standard, HD103)
UPDATE public.automotive_keys SET emergency_key_blank = 'HD103', test_key_blank = 'T-HD103' WHERE id = 'a27bf8c9-9921-489a-b75d-d3c2f91814ca';
-- Honda Insight (transponder, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = '319a7e2f-85f3-4d59-8d12-c890940dc16c';
-- Honda Insight (transponder, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = '1bba96c4-fcda-4dd0-8681-e3ef85ab79b8';
-- Honda Insight (transponder, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1210A', test_key_blank = 'T-HON-66' WHERE id = 'eedbcecc-a9bc-4e0d-a2d4-fb5003b9dbf0';
-- Honda Insight (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '7812D-V2X', test_key_blank = 'T-HON-66' WHERE id = 'b52dc68e-268f-4a49-8423-3f9e85da4ed8';
-- Honda Insight (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '7812D-V2X', test_key_blank = 'T-HON-66' WHERE id = '9a11093f-485a-4dd0-8aec-4bfd1016cd1e';
-- Honda Odyssey (transponder, HD103)
UPDATE public.automotive_keys SET emergency_key_blank = 'HD103', test_key_blank = 'T-HD103' WHERE id = 'e105f89f-3370-4155-ab51-86a6dcde7de4';
-- Honda Odyssey (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '7812D-V2X', test_key_blank = 'T-HON-66' WHERE id = '3218a48d-8497-472e-b5f3-18e7affae08d';
-- Honda Odyssey (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '3109A-CJ932HK1310A', test_key_blank = 'T-HON-66' WHERE id = '595a8a43-6a18-43b7-8abb-4fb4472e41db';
-- Honda Odyssey (transponder, HD106)
UPDATE public.automotive_keys SET emergency_key_blank = 'HD106', test_key_blank = 'T-HD106' WHERE id = 'cf7cf90a-01d3-4a35-9713-2fe109911315';
-- Honda Passport (transponder, HD103)
UPDATE public.automotive_keys SET emergency_key_blank = 'HD103', test_key_blank = 'T-HD103' WHERE id = 'e545c0bd-7289-4fed-927b-dac0694a1309';
-- Honda Passport (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '7812D-V2X', test_key_blank = 'T-HON-66' WHERE id = '51b18550-6bb2-4cab-8985-7cc493270ed5';
-- Honda Pilot (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '7812D-V2X', test_key_blank = 'T-HON-66' WHERE id = '9d5598fc-c2b5-4c04-acd2-97c97cf72765';
-- Honda Pilot (transponder, HD106)
UPDATE public.automotive_keys SET emergency_key_blank = 'HD106', test_key_blank = 'T-HD106' WHERE id = '3030d2f8-b947-409e-8710-6bedec9d5316';
-- Honda Pilot (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = '7b588515-042e-4677-9899-3be3770e9876';
-- Honda Prelude (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = 'e4bfd010-afc6-4d56-a164-3ea31575378b';
-- Honda Prelude (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = '29387ea6-eaeb-4017-9202-d9bb080bcd0b';
-- Honda Prelude (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = 'd2485323-6a0f-43d7-9a61-e8a24e54dd5b';
-- Honda Prologue (proximity, B111-PT)
UPDATE public.automotive_keys SET ic_number = '1551A-1EA', test_key_blank = 'T-B111' WHERE id = '8019578c-1f47-4764-a7c1-df730ba79cb6';
-- Honda Prologue (proximity, B111-PT)
UPDATE public.automotive_keys SET ic_number = '1551A-1EA', test_key_blank = 'T-B111' WHERE id = 'f2d1ac5f-d13d-4b1a-b3cd-9916ed2e5a66';
-- Honda Prologue (proximity, B111-PT)
UPDATE public.automotive_keys SET ic_number = '1551A-1EA', test_key_blank = 'T-B111' WHERE id = '2c2c70d2-fba4-47b2-9508-772a758fa61e';
-- Honda Ridgeline (smart_key, HON66)
UPDATE public.automotive_keys SET ic_number = '7812D-V1X', test_key_blank = 'T-HON-66' WHERE id = '18c237a3-41d1-45d0-be49-3b7775dd69c9';
-- Honda Ridgeline (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = '35fb7c38-e261-4e4c-880d-d76c27c9dbde';
-- Honda S2000 (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = 'b1b3201f-0f30-4e8a-b123-8febc2ce3412';
-- Honda S2000 (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = '210b0cb8-1d38-4e01-a5ad-6d905a3a1298';
-- Honda S2000 (transponder, HON66)
UPDATE public.automotive_keys SET emergency_key_blank = 'HON66', test_key_blank = 'T-HON-66' WHERE id = '7d9a8526-7fc0-4043-bb7a-b8df71eb1396';
-- Hyundai Accent (standard, HY14)
UPDATE public.automotive_keys SET emergency_key_blank = 'HY14', test_key_blank = 'T-HY-14' WHERE id = '09772bb2-4331-4b2b-8ebe-83a66616b7d7';
-- Hyundai Accent (standard, HY14)
UPDATE public.automotive_keys SET emergency_key_blank = 'HY14', test_key_blank = 'T-HY-14' WHERE id = 'd7ff9f79-d981-4d40-a0ce-9cf2d6e6ee13';
-- Hyundai Accent (transponder, HY18)
UPDATE public.automotive_keys SET ic_number = '2022A-RKE4F17', test_key_blank = 'T-HY-18' WHERE id = 'fc904771-9157-4b64-a984-203d7a422501';
-- Hyundai Accent (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F11', test_key_blank = 'T-HY-18R' WHERE id = 'f3a15e7c-ad42-4fde-92f4-943a512949e7';
-- Hyundai Azera (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-HMFNA04', test_key_blank = 'T-HY-18R' WHERE id = 'c453a0d9-85cc-4506-bf25-6a9357b51107';
-- Hyundai Azera (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-HMFNA04', test_key_blank = 'T-HY-18R' WHERE id = '27994e12-d8e7-4f85-a5cf-540f9321bc12';
-- Hyundai Azera (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-HMFNA04', test_key_blank = 'T-HY-18R' WHERE id = 'b21b0405-bcbc-4cba-a180-ea0059bc5455';
-- Hyundai Azera (transponder, HY15)
UPDATE public.automotive_keys SET emergency_key_blank = 'HY15', test_key_blank = 'T-HY-15' WHERE id = '0f2bb732-0361-42a9-879d-933b2a2a0259';
-- Hyundai Azera (transponder, HY15)
UPDATE public.automotive_keys SET emergency_key_blank = 'HY15', test_key_blank = 'T-HY-15' WHERE id = 'e51136b6-4015-44b6-9728-faf56462749f';
-- Hyundai Azera (transponder, HY15)
UPDATE public.automotive_keys SET emergency_key_blank = 'HY15', test_key_blank = 'T-HY-15' WHERE id = 'cba1f20d-9592-43ec-89e1-4eb389ebe03e';
-- Hyundai Elantra (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '1551A-FD00120', test_key_blank = 'T-HY-18R' WHERE id = '79bbac94-7812-404a-ae4c-4f316f5a442c';
-- Hyundai Elantra (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F27', test_key_blank = 'T-HY-22' WHERE id = '8978226b-4cf2-4680-9659-4490b5c31f25';
-- Hyundai Elantra (standard, HY14)
UPDATE public.automotive_keys SET emergency_key_blank = 'HY14', test_key_blank = 'T-HY-14' WHERE id = 'b7470527-766c-4d29-8a61-b6a6d59d3a42';
-- Hyundai Elantra (transponder, HY15)
UPDATE public.automotive_keys SET emergency_key_blank = 'HY15', test_key_blank = 'T-HY-15' WHERE id = '9176b203-e507-4657-ac9d-9b53057d9672';
-- Hyundai Elantra (transponder, HY15)
UPDATE public.automotive_keys SET ic_number = '8325A-HMFNA04', test_key_blank = 'T-HY-15' WHERE id = '93070ea3-ffc4-4bd3-9c02-60dc48d8ebdb';
-- Hyundai Genesis Coupe (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-HMFNA04', test_key_blank = 'T-HY-18R' WHERE id = '68a4e74a-f536-4a9c-8eb0-9d34d732fb5a';
-- Hyundai Genesis Coupe (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-HMFNA04', test_key_blank = 'T-HY-18R' WHERE id = '863e76bc-ba5a-425b-907a-5dadbea7f140';
-- Hyundai Genesis Coupe (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-HMFNA04', test_key_blank = 'T-HY-18R' WHERE id = 'b089184b-90b5-4832-b57f-6c3edc4b10ad';
-- Hyundai Ioniq (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F11', test_key_blank = 'T-HY-22' WHERE id = 'cacdc13c-4d84-4794-b451-116fada9b572';
-- Hyundai Ioniq (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F11', test_key_blank = 'T-HY-22' WHERE id = 'e6f1d5d3-4ddb-4b1c-b040-a7a1b6ea8873';
-- Hyundai Ioniq (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F11', test_key_blank = 'T-HY-22' WHERE id = '00d8841d-b2b4-4cb0-8ce9-e9d4d32cf3cf';
-- Hyundai Ioniq 5 (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F45', test_key_blank = 'T-HY-22' WHERE id = '5118086c-dc20-4848-8338-cf337f7d2a80';
-- Hyundai Ioniq 5 (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F45', test_key_blank = 'T-HY-22' WHERE id = 'c6e86961-9e80-487c-a007-88f3f74a7196';
-- Hyundai Ioniq 5 (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F45', test_key_blank = 'T-HY-22' WHERE id = 'b16c2681-1915-4834-83e5-7a0e4c8f3e15';
-- Hyundai Kona (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F11', test_key_blank = 'T-HY-22' WHERE id = 'b0d517b5-df42-437d-aedf-bf193f95b293';
-- Hyundai Palisade (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F19', test_key_blank = 'T-HY-22' WHERE id = '13092daa-51e8-4206-9350-edd51ff2a3eb';
-- Hyundai Santa Cruz (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F27', test_key_blank = 'T-HY-22' WHERE id = '9fc39328-216b-4da7-8d3a-b91634c710d3';
-- Hyundai Santa Cruz (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F27', test_key_blank = 'T-HY-22' WHERE id = '8a8b0cc6-2227-41c2-82eb-ba5aabf2c223';
-- Hyundai Santa Cruz (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F27', test_key_blank = 'T-HY-22' WHERE id = 'd74346ca-94b7-418a-bff7-c2231109a755';
-- Hyundai Santa Fe (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-DMFNA433', test_key_blank = 'T-HY-18R' WHERE id = '7fe72f5e-8d2f-416d-a466-b76d1c824b3d';
-- Hyundai Santa Fe (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F19', test_key_blank = 'T-HY-22' WHERE id = 'c7514706-e447-463e-907b-f9fca85ab503';
-- Hyundai Santa Fe (transponder, HY18)
UPDATE public.automotive_keys SET ic_number = '8325A-KA310T', emergency_key_blank = 'HY18', test_key_blank = 'T-HY-18' WHERE id = 'cfe7f988-3e14-4e4e-b450-bbe814d45acc';
-- Hyundai Santa Fe (transponder, HY14)
UPDATE public.automotive_keys SET ic_number = '8325A-KA221T', emergency_key_blank = 'HY14', test_key_blank = 'T-HY-14' WHERE id = 'a06986da-d811-4623-aca5-3b0b192249ae';
-- Hyundai Sonata (standard, HY14)
UPDATE public.automotive_keys SET emergency_key_blank = 'HY14', test_key_blank = 'T-HY-14' WHERE id = 'b5ff0224-78de-4621-a48d-3e8ddea1adfd';
-- Hyundai Sonata (transponder, HY15)
UPDATE public.automotive_keys SET ic_number = '8325A-HMFNA04', test_key_blank = 'T-HY-15' WHERE id = '0ba3d9f8-ed68-4688-a793-bef3ced0327b';
-- Hyundai Sonata (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '1551A-FD00120', test_key_blank = 'T-HY-18R' WHERE id = '7651c8ef-3b60-472b-af01-3628224511d3';
-- Hyundai Sonata (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F11', test_key_blank = 'T-HY-22' WHERE id = 'f6e099b2-9c00-4396-87cd-5d8fd3cdc3f6';
-- Hyundai Sonata (transponder, HY18)
UPDATE public.automotive_keys SET ic_number = '8325A-KA310T', emergency_key_blank = 'HY18', test_key_blank = 'T-HY-18' WHERE id = 'd72d6e9a-efde-4cb0-924a-741994ea0c0a';
-- Hyundai Tiburon (transponder, HY15)
UPDATE public.automotive_keys SET emergency_key_blank = 'HY15', test_key_blank = 'T-HY-15' WHERE id = 'bfeda6d7-660c-4e5a-a68d-5ad79a20f86a';
-- Hyundai Tiburon (transponder, HY15)
UPDATE public.automotive_keys SET emergency_key_blank = 'HY15', test_key_blank = 'T-HY-15' WHERE id = '138acc6e-aa77-4fc4-aa94-98e8c36c693d';
-- Hyundai Tiburon (transponder, HY15)
UPDATE public.automotive_keys SET emergency_key_blank = 'HY15', test_key_blank = 'T-HY-15' WHERE id = 'fbf82e7d-6a94-49e7-918c-1f70f071f1a4';
-- Hyundai Tucson (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F27', test_key_blank = 'T-HY-22' WHERE id = '981024d1-8c8f-40f7-acb8-2c4dab0adad6';
-- Hyundai Tucson (transponder, HY18)
UPDATE public.automotive_keys SET ic_number = '2022A-RKE3F03', emergency_key_blank = 'HY18', test_key_blank = 'T-HY-18' WHERE id = 'e248631e-b0e1-42d8-b5b6-3055c0aec471';
-- Hyundai Tucson (transponder, HY14)
UPDATE public.automotive_keys SET emergency_key_blank = 'HY14', test_key_blank = 'T-HY-14' WHERE id = 'f0d36a44-4dc1-480a-b675-c117cf860c22';
-- Hyundai Tucson (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F11', test_key_blank = 'T-HY-18R' WHERE id = 'a35eeb78-3d39-422c-9ca1-2248846afb7e';
-- Hyundai Veloster (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-HMFNA04', test_key_blank = 'T-HY-18R' WHERE id = 'd905a17f-fcb4-4ba9-9b1e-a7fe2473be94';
-- Hyundai Veloster (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-HMFNA04', test_key_blank = 'T-HY-18R' WHERE id = '473b7001-b89e-4199-bc9d-bb2364f8948f';
-- Hyundai Veloster (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-HMFNA04', test_key_blank = 'T-HY-18R' WHERE id = '587b4e9d-6756-4a0c-bfcd-45f45d3b2342';
-- Hyundai Veloster (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F11', test_key_blank = 'T-HY-22' WHERE id = '5020d42f-ce47-4b23-915e-c3457bb2ca85';
-- Hyundai Veloster (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F11', test_key_blank = 'T-HY-22' WHERE id = '79e57ee4-8298-4016-87bc-4ad3569b14cb';
-- Hyundai Veloster (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '2022A-FOB4F11', test_key_blank = 'T-HY-22' WHERE id = 'd5a1d844-7d09-4228-9cb3-35a4f38e624a';
-- Hyundai Venue (smart_key, HY22)
UPDATE public.automotive_keys SET ic_number = '8325A-IGFGE04', test_key_blank = 'T-HY-22' WHERE id = '39ba7200-0930-44ec-9c2b-4a2e9d7a924a';
-- Hyundai Veracruz (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-VISMKFNA04', test_key_blank = 'T-HY-18R' WHERE id = '7c81b6b6-a8ee-4d2b-9a51-b3fadbcae891';
-- Hyundai Veracruz (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-VISMKFNA04', test_key_blank = 'T-HY-18R' WHERE id = 'f94943e8-eca4-4c52-9698-3ea4157810a0';
-- Hyundai Veracruz (smart_key, HY18R)
UPDATE public.automotive_keys SET ic_number = '8325A-VISMKFNA04', test_key_blank = 'T-HY-18R' WHERE id = 'f2ce2394-e21d-46d3-bc63-169a6b89a287';

-- Total UPDATE statements: 274
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
-- Fix NULL fields for manufacturers P-Z (Porsche, RAM, Ram, Subaru, Tesla, Toyota)
-- Generated automatically from all_keys_full.json

-- Porsche 911 (991) (2012-2019)
UPDATE public.automotive_keys SET ic_number = '7681D-55WK50138', test_key_blank = 'T-HU-66' WHERE id = 'ccb1a010-a820-4920-b08a-75eadb39da1b';
-- Porsche 911 (992) (2020-2024)
UPDATE public.automotive_keys SET ic_number = '2694A-IYZPK3', test_key_blank = 'T-HU-66' WHERE id = '826a7ad5-cbb8-476f-b4c0-18bcac1e44d2';
-- Porsche Cayenne (92A/958) (2011-2018)
UPDATE public.automotive_keys SET ic_number = '7681D-55WK50138', test_key_blank = 'T-HU-66' WHERE id = 'cd8a4112-eefd-434d-b8ea-ef788337763a';
-- Porsche Cayenne (E3/9YA) (2019-2024)
UPDATE public.automotive_keys SET ic_number = '2694A-IYZPK3', test_key_blank = 'T-HU-66' WHERE id = '38113151-bd2f-47b9-b720-2c944b0d6629';
-- Porsche Macan (95B) (2015-2024)
UPDATE public.automotive_keys SET ic_number = '2694A-IYZPK3', test_key_blank = 'T-HU-66' WHERE id = 'f60624c7-8cbb-47dc-bc4b-7f0816287859';
-- Porsche Panamera (970) (2010-2016)
UPDATE public.automotive_keys SET ic_number = '7681D-55WK50138', test_key_blank = 'T-HU-66' WHERE id = '12bfd8a3-29fa-41c4-8894-28d1bdcc0661';
-- Porsche Panamera (971) (2017-2024)
UPDATE public.automotive_keys SET ic_number = '2694A-IYZPK3', test_key_blank = 'T-HU-66' WHERE id = '82a137fc-c36d-46fc-a555-9024c3d93c26';
-- Porsche Taycan (Y1A) (2020-2024)
UPDATE public.automotive_keys SET ic_number = '2694A-IYZPK3', test_key_blank = 'T-HU-66' WHERE id = '9c977411-f137-4bea-9788-62e44e6c1b2a';
-- Ram 1500 (2013-2018)
UPDATE public.automotive_keys SET ic_number = '7812D-GQ454T', test_key_blank = 'T-Y164' WHERE id = 'e4d90bbd-f3c9-40af-abd2-99033fd6a919';
-- Ram 1500 (2009-2012)
UPDATE public.automotive_keys SET ic_number = '7812D-C01C', test_key_blank = 'T-Y164' WHERE id = '27ff84c5-f42e-4c4a-a743-ee94d48e9ece';
-- Ram 1500 (2019-2024)
UPDATE public.automotive_keys SET ic_number = '7812D-4882056', test_key_blank = 'T-Y170' WHERE id = 'e4455887-afa8-4462-89e5-30ca4651f7be';
-- RAM 1500 (2002-2008)
UPDATE public.automotive_keys SET ic_number = '7812D-43VT17T', test_key_blank = 'T-Y160' WHERE id = '93835473-64e0-4726-a7e2-4aedb39d1e46';
-- Ram 2500 (2010-2018)
UPDATE public.automotive_keys SET ic_number = '7812D-GQ454T', test_key_blank = 'T-Y164' WHERE id = '5cbd2c10-5943-4f9c-a423-f83dadc36b20';
-- Ram 2500 (2019-2024)
UPDATE public.automotive_keys SET ic_number = '7812D-4882056', test_key_blank = 'T-Y170' WHERE id = 'f800b5c0-3722-4829-8df2-caef7d3aac96';
-- Ram 2500 (2010-2018)
UPDATE public.automotive_keys SET ic_number = '7812D-GQ454T', test_key_blank = 'T-Y164' WHERE id = '38c884aa-afeb-406c-a4b9-a971e16efa29';
-- Ram 2500 (2019-2024)
UPDATE public.automotive_keys SET ic_number = '7812D-4882056', test_key_blank = 'T-Y170' WHERE id = 'c3aac28c-2cb5-427c-b1ae-3673cad4b7e5';
-- Ram 2500 (2010-2018)
UPDATE public.automotive_keys SET ic_number = '7812D-GQ454T', test_key_blank = 'T-Y164' WHERE id = '9078c5b1-258a-41a9-9462-78db9a95e2b9';
-- Ram 2500 (2019-2024)
UPDATE public.automotive_keys SET ic_number = '7812D-4882056', test_key_blank = 'T-Y170' WHERE id = '6955be73-6a3a-444d-9069-1c4f7c13541b';
-- RAM 2500 (2003-2009)
UPDATE public.automotive_keys SET ic_number = '7812D-43VT17T', test_key_blank = 'T-Y160' WHERE id = 'c2c83b14-c1e4-47fa-ba6b-2ef2d3beacdc';
-- Ram 3500 (2019-2024)
UPDATE public.automotive_keys SET ic_number = '7812D-4882056', test_key_blank = 'T-Y170' WHERE id = 'd138cb37-63d7-4fcf-be7d-726e44e102f5';
-- Ram 3500 (2019-2024)
UPDATE public.automotive_keys SET ic_number = '7812D-4882056', test_key_blank = 'T-Y170' WHERE id = '5226e7fd-5e51-474b-b54f-c2c58989fe4d';
-- Ram 3500 (2010-2018)
UPDATE public.automotive_keys SET ic_number = '7812D-GQ454T', test_key_blank = 'T-Y164' WHERE id = '3bc40373-6fe1-4e7e-b448-8bbb587489f2';
-- Ram 3500 (2010-2018)
UPDATE public.automotive_keys SET ic_number = '7812D-GQ454T', test_key_blank = 'T-Y164' WHERE id = 'c8cbec76-e7c2-496d-89ea-ac404c136b1b';
-- Ram 3500 (2010-2018)
UPDATE public.automotive_keys SET ic_number = '7812D-GQ454T', test_key_blank = 'T-Y164' WHERE id = '5fed6d2b-c185-4ca9-b7dd-0c7441fe1bda';
-- Ram 3500 (2019-2024)
UPDATE public.automotive_keys SET ic_number = '7812D-4882056', test_key_blank = 'T-Y170' WHERE id = '26befc23-ff4c-4354-a4d9-59a4a5cd2ec7';
-- RAM 3500 (2003-2009)
UPDATE public.automotive_keys SET ic_number = '7812D-43VT17T', test_key_blank = 'T-Y160' WHERE id = '51dac69a-e287-49b0-8567-8575b869e0d5';
-- Ram ProMaster (2014-2024)
UPDATE public.automotive_keys SET test_key_blank = 'T-SIP-22' WHERE id = 'd05c094c-3dce-462c-8178-709c5143eba6';
-- Ram ProMaster (2014-2024)
UPDATE public.automotive_keys SET test_key_blank = 'T-SIP-22' WHERE id = '1556b7b9-4620-4d6d-94d8-3ad35201e035';
-- Ram ProMaster (2014-2024)
UPDATE public.automotive_keys SET test_key_blank = 'T-SIP-22' WHERE id = '5e77d1d1-bc35-43d5-b529-fb7dac5462ca';
-- Subaru Ascent (2019-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHK', test_key_blank = 'T-NSN-19' WHERE id = 'b81079a7-40ec-4073-b577-2ddfba768680';
-- Subaru Baja (2003-2006)
UPDATE public.automotive_keys SET test_key_blank = 'T-SUB-82' WHERE id = 'a62c5055-e36a-4ad9-82a1-0e8231c07b4b';
-- Subaru Baja (2003-2006)
UPDATE public.automotive_keys SET test_key_blank = 'T-SUB-82' WHERE id = '25bf6ec3-4fb1-4189-9374-777e5b81c218';
-- Subaru Baja (2003-2006)
UPDATE public.automotive_keys SET test_key_blank = 'T-SUB-82' WHERE id = 'd0e74cdd-8416-4587-9ef1-6a08ee4b58ae';
-- Subaru BRZ (2013-2020)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHC', test_key_blank = 'T-NSN-19' WHERE id = '1daae914-09bc-4801-81f8-d73ca8e170fa';
-- Subaru BRZ (2022-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHK', test_key_blank = 'T-NSN-19' WHERE id = '1075fbe7-6c97-41b5-92f1-6c8e1dc95552';
-- Subaru BRZ (2022-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHK', test_key_blank = 'T-NSN-19' WHERE id = 'b3cb22c1-cba0-4996-963c-fdcc370230e7';
-- Subaru BRZ (2022-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHK', test_key_blank = 'T-NSN-19' WHERE id = '64be932c-8a02-4394-a8fe-2fb9842ad318';
-- Subaru BRZ (2013-2020)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHC', test_key_blank = 'T-NSN-19' WHERE id = '4197340d-9513-4ae7-961b-03cb14bc4284';
-- Subaru BRZ (2013-2020)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHC', test_key_blank = 'T-NSN-19' WHERE id = '41057d74-4259-4098-96f6-a780d499799b';
-- Subaru Crosstrek (2013-2017)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHC', test_key_blank = 'T-NSN-19' WHERE id = '141983c1-4bb5-45ff-9cca-b0c5f1d964e7';
-- Subaru Crosstrek (2018-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHK', test_key_blank = 'T-NSN-19' WHERE id = 'fc738d8e-7009-47d6-a8de-efcbe65f0831';
-- Subaru Forester (2005-2008)
UPDATE public.automotive_keys SET test_key_blank = 'T-SUB-82' WHERE id = '21ebf09c-c4c2-4b33-8c50-e4d02a443165';
-- Subaru Forester (2009-2013)
UPDATE public.automotive_keys SET ic_number = '1788D-WB1U811', test_key_blank = 'T-NSN-19' WHERE id = '5f848bf7-3d23-49e8-9bac-22884b157a8f';
-- Subaru Forester (2014-2018)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHC', test_key_blank = 'T-NSN-19' WHERE id = '6136aa1a-3c65-4d14-96a7-5f79c0281237';
-- Subaru Forester (1998-2004)
UPDATE public.automotive_keys SET test_key_blank = 'T-SUB-82' WHERE id = '4df74861-3f50-4eb4-9bc8-0fbac6093e0d';
-- Subaru Forester (2019-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHK', test_key_blank = 'T-NSN-19' WHERE id = '77a0bfa3-b9c5-461f-9ec3-16c4ee30f4d1';
-- Subaru Impreza (2012-2016)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHC', test_key_blank = 'T-NSN-19' WHERE id = '9d944f90-a017-4d24-a521-166eb9a4b9d6';
-- Subaru Impreza (1998-2004)
UPDATE public.automotive_keys SET test_key_blank = 'T-SUB-82' WHERE id = '86e6a1cb-3015-4efd-9769-46ac7d6e1302';
-- Subaru Impreza (2005-2011)
UPDATE public.automotive_keys SET test_key_blank = 'T-SUB-82' WHERE id = '56583ca3-55e7-4770-ba68-488d1865046e';
-- Subaru Impreza (2017-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHK', test_key_blank = 'T-NSN-19' WHERE id = 'ad7412d2-baae-4e5d-933a-5ee54f9fe063';
-- Subaru Legacy (2020-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHK', test_key_blank = 'T-NSN-19' WHERE id = '31811b57-3eec-4bc9-901a-8b42b7b41b9e';
-- Subaru Legacy (2000-2004)
UPDATE public.automotive_keys SET test_key_blank = 'T-SUB-82' WHERE id = '448da4ed-d5eb-4775-b064-8373b6610b61';
-- Subaru Legacy (2005-2009)
UPDATE public.automotive_keys SET test_key_blank = 'T-SUB-82' WHERE id = 'e8e445c9-1511-44d0-a28c-28f71e20cbe1';
-- Subaru Legacy (2010-2014)
UPDATE public.automotive_keys SET ic_number = '1788D-WB1U811', test_key_blank = 'T-NSN-19' WHERE id = '4d901d28-831f-4a10-93d7-7062f186bb1c';
-- Subaru Legacy (2015-2019)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHC', test_key_blank = 'T-NSN-19' WHERE id = '0ce8fbf1-2f72-4f90-9b13-b3271e13ad33';
-- Subaru Outback (2005-2009)
UPDATE public.automotive_keys SET test_key_blank = 'T-SUB-82' WHERE id = '24ee1038-3d25-49a8-bfd5-68dcba1fa7c7';
-- Subaru Outback (2000-2004)
UPDATE public.automotive_keys SET test_key_blank = 'T-SUB-82' WHERE id = 'a5d32f06-0cc6-4f11-9c50-c129cc0f7ee7';
-- Subaru Outback (2010-2014)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHC', test_key_blank = 'T-NSN-19' WHERE id = 'ddecf9f3-f16a-479e-9494-6b2a77ca5358';
-- Subaru Outback (2015-2019)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHC', test_key_blank = 'T-NSN-19' WHERE id = '40b3a299-acc8-4341-b5ec-4e6c3c39f74b';
-- Subaru Outback (2020-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHK', test_key_blank = 'T-NSN-19' WHERE id = '75b8cfb8-5902-4eb6-8adc-628f9e92e000';
-- Subaru Solterra (2023-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-40' WHERE id = '83a597fe-87c5-4c54-a1c6-b6ed152bc16d';
-- Subaru Solterra (2023-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-40' WHERE id = 'fc6ff3c2-da38-42ba-a7ae-7651ac9c2567';
-- Subaru Solterra (2023-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-40' WHERE id = '53ebd169-f8c3-48f5-944f-a4fa4383faee';
-- Subaru Tribeca (2006-2014)
UPDATE public.automotive_keys SET ic_number = '1788D-WB1U811', test_key_blank = 'T-NSN-19' WHERE id = '3f3183c3-f0b0-4452-8add-80c270800c8c';
-- Subaru Tribeca (2006-2014)
UPDATE public.automotive_keys SET ic_number = '1788D-WB1U811', test_key_blank = 'T-NSN-19' WHERE id = '04411c91-6764-46a5-a73b-03417d14582b';
-- Subaru Tribeca (2006-2014)
UPDATE public.automotive_keys SET ic_number = '1788D-WB1U811', test_key_blank = 'T-NSN-19' WHERE id = '502dcaff-1704-4307-8477-e4597898c92d';
-- Subaru WRX (2015-2021)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHC', test_key_blank = 'T-NSN-19' WHERE id = '2fa6f14c-7ebd-4c87-8f92-5d1c87159e58';
-- Subaru WRX (2002-2007)
UPDATE public.automotive_keys SET test_key_blank = 'T-SUB-82' WHERE id = '852a2433-bf2f-48e2-a1f9-2cb2621b371e';
-- Subaru WRX (2008-2014)
UPDATE public.automotive_keys SET ic_number = '1788D-WB1U811', test_key_blank = 'T-NSN-19' WHERE id = '827321c8-ca74-40df-9aea-8ab9de71d5f9';
-- Subaru WRX (2022-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHK', test_key_blank = 'T-NSN-19' WHERE id = '3cec17db-ed2b-4585-8d86-5e331e1f5aa6';
-- Toyota 4Runner (2010-2019)
UPDATE public.automotive_keys SET ic_number = '1551A-14ACX', test_key_blank = 'T-TOY-40' WHERE id = 'fd5369a7-5248-4a7a-a85e-8a53e6203f76';
-- Toyota 4Runner (1996-2002)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '8f3b46aa-27fe-4bf8-88bb-3118a315587a';
-- Toyota 4Runner (2003-2009)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = 'd71b30b1-2fe4-49ff-8618-f30dc9364471';
-- Toyota 4Runner (2020-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBC', test_key_blank = 'T-TOY-40' WHERE id = '1cc897ad-4eeb-4102-910f-b236b26d6b3a';
-- Toyota Avalon (2000-2004)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '0bc1bb59-08d9-457c-8695-8820d0dac141';
-- Toyota Avalon (2005-2012)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '72bd8555-c248-4fee-96e5-a2acc6c0dc46';
-- Toyota Avalon (2013-2018)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBA', test_key_blank = 'T-TOY-40' WHERE id = '41787625-0e10-46da-bd18-f16417116ad9';
-- Toyota Avalon (2019-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBC', test_key_blank = 'T-TOY-40' WHERE id = '2e6ae475-a4c8-4033-821c-ff53ada78885';
-- Toyota bZ4X (2023-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-51' WHERE id = 'ee6fd378-1c17-4312-a3d6-4914c3434e5f';
-- Toyota bZ4X (2023-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-51' WHERE id = 'b71f15a1-f047-48f2-8c43-469466e69322';
-- Toyota bZ4X (2023-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-51' WHERE id = 'a09efc97-2b7b-465f-95f9-04ec8e111639';
-- Toyota C-HR (2018-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-BR1ET', test_key_blank = 'T-TOY-40' WHERE id = '45bc8b94-0804-45b3-bdf6-d0112eda9825';
-- Toyota Camry (2018-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBC', test_key_blank = 'T-TOY-51' WHERE id = '1e9a49d2-22bf-43bd-870d-75b7113a04da';
-- Toyota Camry (1997-2002)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '5a072e80-6eeb-440d-a937-4255a007b4ac';
-- Toyota Camry (2003-2011)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '4468d434-fa8b-488d-ac22-39e71321945d';
-- Toyota Camry (2012-2017)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBA', test_key_blank = 'T-TOY-40' WHERE id = '2e9133cd-ba50-4dc1-84cb-f7e7291a29e5';
-- Toyota Camry (2018-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBC', test_key_blank = 'T-TOY-51' WHERE id = 'f4da8444-6ad0-4695-b858-4d8e4f75b899';
-- Toyota Celica (2000-2005)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '372ce994-ed0b-42e9-91c2-d064756f0762';
-- Toyota Celica (2000-2005)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '71dc5ac3-0eee-4fcb-a82b-c6cd9ceaee49';
-- Toyota Celica (2000-2005)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '3e979b17-0d64-4e3a-9639-349739a8e999';
-- Toyota Corolla (2009-2013)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44G' WHERE id = '492c3023-bdc1-484c-8e6f-86e7d74c65c9';
-- Toyota Corolla (2014-2018)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBA', test_key_blank = 'T-TOY-40' WHERE id = 'c6aa9842-c211-4573-839f-b6fc69b11431';
-- Toyota Corolla (2019-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBC', test_key_blank = 'T-TOY-51' WHERE id = 'ec4840bc-532c-4b6d-a094-7bd3b590dd60';
-- Toyota Corolla (2003-2008)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '6ce8f9c2-7d0e-4e83-8bb6-06b84b6a9e85';
-- Toyota Corolla (1998-2002)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = 'cc15abcd-f2bb-49ee-8726-f6d07dd767e9';
-- Toyota Crown (2023-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-51' WHERE id = '0599308b-1ead-4473-a6f1-a1a4c1bf6d3a';
-- Toyota Echo (2000-2005)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '355776d7-93ae-43dd-8018-cc11c747ac1f';
-- Toyota Echo (2000-2005)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '3ca54039-eff4-4d77-b419-b509b8138a04';
-- Toyota Echo (2000-2005)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '0c947dc6-f2ea-43eb-a4e5-a3e6874ccebd';
-- Toyota FJ Cruiser (2007-2009)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = 'f028f858-a9b2-4a55-8edd-559c34914992';
-- Toyota FJ Cruiser (2007-2009)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '695653e5-385b-4bac-b3be-2984756875a0';
-- Toyota FJ Cruiser (2010-2014)
UPDATE public.automotive_keys SET ic_number = '1551A-12BBY', test_key_blank = 'T-TOY-44G' WHERE id = 'd98f57da-fb25-465b-bebb-91db37f9f7d0';
-- Toyota FJ Cruiser (2010-2014)
UPDATE public.automotive_keys SET ic_number = '1551A-12BBY', test_key_blank = 'T-TOY-44G' WHERE id = '29e618e0-6573-4a9b-94c2-60649b577626';
-- Toyota FJ Cruiser (2010-2014)
UPDATE public.automotive_keys SET ic_number = '1551A-12BBY', test_key_blank = 'T-TOY-44G' WHERE id = 'cbfa9201-f850-4ae6-b2a3-c77c2c84dd50';
-- Toyota FJ Cruiser (2007-2009)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = 'cd3abc17-e91a-44a5-ab96-430711179a3e';
-- Toyota GR86 (2022-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14AHK', test_key_blank = 'T-NSN-19' WHERE id = '65fcec69-5354-480f-bb67-0ab98101a222';
-- Toyota Highlander (2020-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBC', test_key_blank = 'T-TOY-40' WHERE id = '8748e5b8-7e33-41a3-9b56-db6d81eee807';
-- Toyota Highlander (2014-2019)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBA', test_key_blank = 'T-TOY-40' WHERE id = '671f3e80-0483-48a2-b539-14327c836116';
-- Toyota Highlander (2008-2013)
UPDATE public.automotive_keys SET ic_number = '1551A-14AAB', test_key_blank = 'T-TOY-40' WHERE id = 'e56be39d-13ce-4cc6-a34a-354f0cdf6d6f';
-- Toyota Highlander (2001-2007)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '83dc89c7-445b-4aec-9d10-3743d0282054';
-- Toyota Land Cruiser (2024-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-51' WHERE id = '6afa9611-32ce-42f2-a77a-ce8ee093c233';
-- Toyota Land Cruiser (2008-2021)
UPDATE public.automotive_keys SET ic_number = '1551A-14ACX', test_key_blank = 'T-TOY-40' WHERE id = '390124d9-44f1-43f6-bf27-82c131b6f018';
-- Toyota Land Cruiser (1998-2007)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = 'cc489aeb-a46b-4da8-9575-8c68cead15a8';
-- Toyota Matrix (2009-2013)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44G' WHERE id = 'b2310a63-f3d3-4cb2-96d4-744a7ef12862';
-- Toyota Matrix (2009-2013)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44G' WHERE id = '5e33823f-8df9-4867-a817-4a7fe7cedfde';
-- Toyota Matrix (2009-2013)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44G' WHERE id = '325cf538-8776-46f7-b249-0740bdb853ca';
-- Toyota Matrix (2003-2008)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '5b1d9fa2-f5d9-4392-b057-3587cb362adc';
-- Toyota Matrix (2003-2008)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '992a53d5-d105-48e1-8db1-38bd48c48041';
-- Toyota Matrix (2003-2008)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = 'bf964954-6149-496a-9c0c-cde2ef6c5a93';
-- Toyota Prius (2016-2022)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBC', test_key_blank = 'T-TOY-40' WHERE id = '34a6c410-5d6a-4587-ab06-df123a24a937';
-- Toyota Prius (2023-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-51' WHERE id = 'ae0c0bca-9b76-4bba-a5ac-48916ea2593a';
-- Toyota Prius (2010-2015)
UPDATE public.automotive_keys SET ic_number = '1551A-14ACX', test_key_blank = 'T-TOY-40' WHERE id = 'd627469c-c409-4e61-8347-a893fe7196a2';
-- Toyota Prius (2004-2009)
UPDATE public.automotive_keys SET ic_number = '1551A-B31EG', test_key_blank = 'T-TOY-40' WHERE id = '99dec8c2-b6c2-4116-98eb-43e9fb03d310';
-- Toyota Prius (2001-2003)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '515a9e15-9c27-4541-a082-3c812127866c';
-- Toyota RAV4 (1996-2000)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '8be57c02-7a7d-47b1-bd13-a088c2ce1ef4';
-- Toyota RAV4 (2001-2005)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '142674c6-7fb2-41c7-85ea-9638769d47a0';
-- Toyota RAV4 (2006-2012)
UPDATE public.automotive_keys SET ic_number = '1551A-12BDP', test_key_blank = 'T-TOY-44G' WHERE id = 'b57a2360-87c4-4610-b1ec-c3ee4be5688f';
-- Toyota RAV4 (2013-2018)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBA', test_key_blank = 'T-TOY-40' WHERE id = '4d68f650-b737-481e-9748-4ab0b256ad88';
-- Toyota RAV4 (2019-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBC', test_key_blank = 'T-TOY-51' WHERE id = 'b21d4630-ebc7-40b7-9354-dcc9aba2a6eb';
-- Toyota Sequoia (2001-2007)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = 'fa9046c7-9330-40ad-9869-3d82e66b0a37';
-- Toyota Sequoia (2008-2022)
UPDATE public.automotive_keys SET ic_number = '1551A-14ACX', test_key_blank = 'T-TOY-40' WHERE id = '1959168d-cfa5-477f-bc5d-fe9adf507946';
-- Toyota Sequoia (2023-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBX', test_key_blank = 'T-TOY-51' WHERE id = '43b404ba-fe8d-4a13-8ac4-fd31ac221eb4';
-- Toyota Sienna (2021-2024)
UPDATE public.automotive_keys SET ic_number = '1551A-14FBC', test_key_blank = 'T-TOY-51' WHERE id = 'ea2d280e-9908-4f26-b839-285c87c1398f';
-- Toyota Sienna (1998-2003)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = 'b323f80e-f49a-4615-bcc0-10116f76eb32';
-- Toyota Sienna (2004-2010)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = 'b2de2938-115b-4282-b17e-1211ee7413fb';
-- Toyota Sienna (2011-2020)
UPDATE public.automotive_keys SET ic_number = '1551A-14ADR', test_key_blank = 'T-TOY-40' WHERE id = '8bddead1-a6fa-4494-93ec-a86d8e353c88';
-- Toyota Solara (1999-2003)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = 'a0a54e41-f5ea-4176-b8ba-cbb3bf116673';
-- Toyota Solara (2004-2008)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '00b54ff1-70df-467a-abd8-f8dcb108f77d';
-- Toyota Solara (2004-2008)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = 'ef8a1cdc-4a65-4923-a453-6344e3de759b';
-- Toyota Solara (2004-2008)
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = 'cec9a95a-f47d-477d-9d8c-430a8f1b57a8';

-- Total UPDATE statements: 140

UPDATE public.automotive_keys SET ic_number = '7681D-ALFA434' WHERE id = '07f21200-4c85-43b9-98bd-36cf718058cd';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92R' WHERE id = 'bae7baf8-1f84-4200-87b6-bd0a4bdd37e9';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '62cbc7eb-f416-4fbe-ba8e-fcc640fdcfd1';
UPDATE public.automotive_keys SET ic_number = '2694A-HUF5767', test_key_blank = 'T-HU-92R' WHERE id = 'f309ed1e-a696-4681-a007-4a8ddb39f452';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '89fd6f5d-e49b-49e1-87d9-e95eba7c11fa';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = 'dcd08ea3-f379-4c71-aac7-53af0be9e1bb';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '2662ca90-7b96-4db0-8405-d7af39d50f15';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = 'e7ab994e-93bd-4a53-a5c9-01dd1b382feb';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '11088648-7c7b-4fc9-beea-199443736a6e';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-92R' WHERE id = '92db1e39-75a7-4268-b6f9-493d55a46d3e';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = '053375e6-85cd-45b3-a8c5-1260d3f57546';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-92R' WHERE id = '8a4cc621-0b14-41dc-a8a7-4d503482ab34';
UPDATE public.automotive_keys SET ic_number = '2694A-ID2A', test_key_blank = 'T-HU-100R' WHERE id = '1527590d-6181-4363-87e0-fb166f3d12b8';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = 'eaf9ad35-0f8f-4741-89de-35d94552b951';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '1e01e9a1-5641-46c3-b1e8-e96266c2654d';
UPDATE public.automotive_keys SET ic_number = '3521A-UT1BT', test_key_blank = 'T-B-97' WHERE id = 'd622ae61-87cd-4448-b7cb-b52c3a4f3257';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-106' WHERE id = '115b7da7-1f0d-4502-9500-5ad0f77033c3';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-106' WHERE id = 'dbe2249b-7732-40e4-b689-763865f81f89';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '6bfdd5ac-9741-4474-95a7-7008320ac2ec';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '66dd36c3-1ffb-497b-a6a6-0f248109d5e9';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '3af9dc74-e532-4326-8c35-a47404a2998d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-106' WHERE id = 'bdcc3a4d-ab6c-4235-9692-e2182dc647ed';
UPDATE public.automotive_keys SET ic_number = '3521A-009768T', test_key_blank = 'T-B-111' WHERE id = 'f358a66e-42dd-42da-9191-7bb371319fef';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-106' WHERE id = '29346041-1a22-43c7-98cb-b9f9a2a03240';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-102' WHERE id = '4b850a95-6e94-462c-989c-6dc311c2d82c';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '22012213-3cfa-451f-83bc-d24a83394ced';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '7fd457b1-e556-4b7a-9137-136fd83854e5';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '855bf86f-0888-4215-9947-ecea1a9204e5';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '20edcbe0-ffcb-4277-b4cc-d02e8eb36a3f';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = 'ce58064b-7c2a-4935-a431-f29fb8a9556c';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = 'd1970019-1b59-408a-8e5d-684ea41e1723';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-102' WHERE id = 'cbca47ca-1686-4438-84a7-81265f6e5ed8';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-102' WHERE id = '43142b9f-2e3b-4dce-8d13-a9f5b071b27b';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '347ff485-8278-4e49-aaa0-ccdce7189c8a';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '8c654ef0-8844-4dd2-9ada-a4ef9c69f3ec';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '1400f9fd-1649-40c9-b17f-b91f51f1f43f';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-102' WHERE id = 'b2d9db06-167f-4e5f-bdfe-e22d8b230f0d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '61646ae4-c2e9-4bc4-93c0-44a32895ea86';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '38beb059-1cd3-4b6a-91f7-8606c85cf1dd';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-102' WHERE id = '54d00ef7-47cf-411a-82ad-7413c50e5fcf';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '0e1e2453-3496-46be-9145-db04b055deea';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '54a25741-393b-41e2-8f3b-1e5a4e78f2bc';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = 'd57d343b-7b8e-4c11-8000-b2b9b27a0222';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '515ca9df-2733-45a3-af54-f8d8d484b56d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '0336f02c-9826-4800-a50a-f25cda3f93a6';
UPDATE public.automotive_keys SET ic_number = '5765A-692427AA', test_key_blank = 'T-Y-160' WHERE id = 'fb0aa160-717d-4204-b5e4-071eda584aa5';
UPDATE public.automotive_keys SET ic_number = '5765A-692427AA', test_key_blank = 'T-Y-160' WHERE id = '055fce8c-1384-43f2-8e6e-db3af543ab3f';
UPDATE public.automotive_keys SET ic_number = '5765A-692427AA', test_key_blank = 'T-Y-160' WHERE id = '9743ca4e-2465-452b-942a-c410499ef3f8';
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-Y-160' WHERE id = '88155d65-0623-45d5-8755-db5ad1f91f41';
UPDATE public.automotive_keys SET ic_number = '5765A-692427AA', test_key_blank = 'T-Y-160' WHERE id = '147d1859-6d3f-4b8d-987b-1d14d357dac0';
UPDATE public.automotive_keys SET ic_number = '1470A-DT04A', test_key_blank = 'T-Y-160' WHERE id = 'd790da38-d1d7-4ec4-91be-333fa8fd76a5';
UPDATE public.automotive_keys SET ic_number = '7812A-40821302', test_key_blank = 'T-SIP-22' WHERE id = '5c9af1b9-b464-49f1-bc59-5d6671baf534';
UPDATE public.automotive_keys SET ic_number = '7812A-5WY72XX', test_key_blank = 'T-Y-160' WHERE id = '085af717-0bcc-402d-8d2d-28bce76a144e';
UPDATE public.automotive_keys SET ic_number = '1470A-DT04A', test_key_blank = 'T-Y-160' WHERE id = 'b658557d-9976-4fae-a38f-b7ff9554010b';
UPDATE public.automotive_keys SET ic_number = '1788D-WB1U793', test_key_blank = 'T-H-84' WHERE id = 'cb7b925e-eb48-41c7-885a-76b13ecfe92b';
UPDATE public.automotive_keys SET ic_number = '7812A-A3C054339', test_key_blank = 'T-H-92' WHERE id = '5e687c57-e123-40e7-8e6e-f9d50c0278d9';
UPDATE public.automotive_keys SET ic_number = '1788D-WB1U793', test_key_blank = 'T-H-92' WHERE id = '399e15d4-37b2-4bad-8cb6-3b76f43b872d';
UPDATE public.automotive_keys SET ic_number = '1788D-WB1U793', test_key_blank = 'T-H-84' WHERE id = '3776d58a-0ec6-417c-97b3-c9c28c8f24d2';
UPDATE public.automotive_keys SET ic_number = '7812A-5WY8609', test_key_blank = 'T-H-92' WHERE id = 'c4675955-1632-44b3-b9db-0b9274c97ca1';
UPDATE public.automotive_keys SET ic_number = '7812A-5WY783X', test_key_blank = 'T-H-84' WHERE id = '6291d932-479b-462a-82b9-b43488c3490c';
UPDATE public.automotive_keys SET ic_number = '1788D-WB1U793', test_key_blank = 'T-H-84' WHERE id = '04e494c8-ce53-4e43-9236-1b77e1066618';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-97' WHERE id = 'c5a5f5dc-8df9-4592-85d6-ed0996fc5e25';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-102' WHERE id = 'acba0782-c21c-4e1a-a27b-2db8b3eacc33';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '67fa3a44-8b95-4c7c-a6f4-8f3caec836fa';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-102' WHERE id = 'b92be733-58a5-41a9-bf2d-953d334bd82e';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '9c4634f7-ef42-43db-ad94-f7edd8641828';
UPDATE public.automotive_keys SET test_key_blank = 'T-HON-66' WHERE id = '4cfd5c4f-5865-402b-9eda-dd1c271d5a00';
UPDATE public.automotive_keys SET test_key_blank = 'T-HON-66' WHERE id = '83320305-9b83-46bb-a73d-a43442b6da0f';
UPDATE public.automotive_keys SET test_key_blank = 'T-HON-66' WHERE id = '46c39c8c-9ca1-4a0c-819a-99ba9bf4ec6a';
UPDATE public.automotive_keys SET test_key_blank = 'T-HON-66' WHERE id = '815f36eb-dcda-44ce-95cf-4586542700ff';
UPDATE public.automotive_keys SET test_key_blank = 'T-HON-66' WHERE id = '9e7126f3-c4fb-4264-9747-4e617ca4aac5';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-111' WHERE id = '73f8217f-eda3-459f-8d8b-3135537043da';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-18R' WHERE id = '8875f3f1-c223-4dd2-9e31-51dedfe0ac63';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-18R' WHERE id = '6ae345fc-0dfd-4661-a07d-68beae387683';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-22' WHERE id = '9759fe3c-1414-47df-bf44-c4a88aa5693e';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-22' WHERE id = '3e9079bf-6876-451c-9d4b-431e9bbfcd1a';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-22' WHERE id = '87f5cdac-ae30-40fe-94fb-8f0fc2af4198';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-22' WHERE id = '7c3d8c63-838f-4ea6-8a45-d59d6a10f127';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-18R' WHERE id = 'cb8953e0-42d7-4374-93f0-58111ff99d95';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-18R' WHERE id = '7ba871da-cabc-492a-9f45-efe21e90ba94';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-160' WHERE id = 'e7317595-07ea-4498-90c5-2990133e087a';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-159' WHERE id = '7f9c219b-d600-45e6-88f6-f081c94a899b';
UPDATE public.automotive_keys SET ic_number = '1470A-DT04A', test_key_blank = 'T-Y-160' WHERE id = '83d676cc-17ef-41a6-a776-c51d9f58edc9';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-160' WHERE id = '4f98a518-a842-4c94-ad70-6ec8afe9d9b9';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-160' WHERE id = '3610a28d-6775-4b82-a7e1-ac3f9add7c63';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-159' WHERE id = 'f4ba9caa-71e2-498b-90f2-d3f19e7023d1';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-15' WHERE id = 'df4d233e-6abe-4411-8559-7f527a1b1db5';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-18R' WHERE id = '7f0bca17-5dfe-4317-9cbb-f378eb4b3677';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-22' WHERE id = 'be19d8c9-cf8a-42a7-8c91-3d4a8e462caf';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-22' WHERE id = 'f82a0e39-7f66-471d-bb30-79167895b04a';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-15' WHERE id = '4a1aea5b-eaeb-4805-ac79-2d602a58b146';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-18R' WHERE id = '3c993ec4-3571-4253-814e-7278a0d4a9b4';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-22' WHERE id = '453a1408-f19e-4a16-8c2d-7d63e6a12d64';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-18R' WHERE id = '0b7bea44-7f9e-4bad-83d8-691cd34dc914';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-15' WHERE id = '7f7791dc-555e-4769-ba0e-ce80340acf03';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-15' WHERE id = 'cb7f1c2b-483a-42fa-af93-4b3cbb3b8391';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-22' WHERE id = '736067ec-77aa-45ce-99d7-f87e89c5c039';
UPDATE public.automotive_keys SET test_key_blank = 'T-MAZ-24R' WHERE id = '7fbda45a-a404-43f3-87d1-1b744ef50412';
UPDATE public.automotive_keys SET test_key_blank = 'T-MAZ-24R' WHERE id = 'b9be8438-71f5-4c9c-85ca-3570822dc6fd';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = 'f8fbea2f-e220-47fb-be57-68ce5b5e7046';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = 'ca1fe7b1-f1cb-4042-b860-899ddfc47cb1';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '9a94d2f6-8605-4a39-9a2b-d8fe1a37030a';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '1ed34f96-b83c-45c6-a9f6-a0171bb3624c';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '7d6e23f6-1549-4be3-a187-5c60b6b956c2';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = 'f4978855-bc94-4726-b143-fbfd81f6cc93';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '6fb30959-415e-4ad9-beb2-d1a00354627a';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '2a2e3f39-e172-4b89-9a01-4db20980135e';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = 'bf8cf005-1f57-4b17-8da4-c7f49d828689';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = 'e8adca20-59c9-439c-8062-33bb6d4d2302';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = 'd6b5e373-587b-4640-9135-33fcaf85064d';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = 'b8462f30-c54b-4566-abcc-254579e03fc1';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '9d2b4b18-09f9-4391-bf98-7bfb262e407f';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '632b9082-c004-4f71-9fe0-3cfc68a8112f';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '8d8726b9-1e8c-4d43-a593-e43d51803bcc';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '733ed9c9-2880-453e-af09-5d1443070b2e';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '6118258c-e50d-46c6-ad5f-9ad54859d4ee';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = 'e0129baa-ea7b-46a9-820b-0f7b946503e6';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = 'e3ed3254-0478-45c2-bb01-36a618a93547';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '7a5f0851-3f2c-44c0-bc8b-a12a83821d12';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '3d13fd2b-ed94-472c-a595-bdbb7f3b645b';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = 'ea64fd86-f164-48d8-af40-61870b84777a';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-159' WHERE id = '309ada1c-52b0-4147-aa72-265e883a9688';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-160' WHERE id = 'cc5b2546-0138-426f-a606-0d71f902b39a';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-160' WHERE id = 'b7722175-6eb9-4249-8ead-d2cdca004d54';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-159' WHERE id = 'dd301794-4e07-47d0-a348-ac2889b549c5';
UPDATE public.automotive_keys SET test_key_blank = 'T-SIP-22' WHERE id = '4d50b67c-9555-4e71-959e-1c40480c65cf';
UPDATE public.automotive_keys SET test_key_blank = 'T-DAT-17' WHERE id = '5d46705d-68bb-45b6-aa1a-23d5fae827cf';
UPDATE public.automotive_keys SET test_key_blank = 'T-SUB-44' WHERE id = '0b82082f-7628-434d-a7a9-76611f49dd99';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-51' WHERE id = 'f65a9721-ef4d-4a90-bd3c-c019cd0c92a3';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-19' WHERE id = 'bce8f8c8-3c0c-4c19-b676-4022ba064c75';
UPDATE public.automotive_keys SET test_key_blank = 'T-N-/A (Key Fob)' WHERE id = 'ef221434-d60f-45b7-86f5-cb03702973cd';
UPDATE public.automotive_keys SET test_key_blank = 'T-N-/A (Key Fob)' WHERE id = '3bbc3b5a-3f60-4be8-baa5-273570772fcf';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-51' WHERE id = '6133e6b2-223f-4119-9341-8d134610b46c';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44G' WHERE id = '1364889a-b6b1-4944-8f11-4c0faf3242ff';
UPDATE public.automotive_keys SET ic_number = '2694A-GNG1', test_key_blank = 'T-HU-100R' WHERE id = 'e0afc04b-3120-4b7d-9c13-7f8a2ba513ea';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44H' WHERE id = '15a877ee-c735-455a-bedc-2943aa1660df';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-51' WHERE id = '66b22363-e839-47cb-9d6a-caa7c977d457';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '75b4d519-6855-442c-8354-61d8383bcee3';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44H' WHERE id = '323d5fd7-af20-482d-b839-ce8553e6bc37';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-51' WHERE id = '974290e3-7796-44da-baac-4754d89bcc78';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44H' WHERE id = 'b6fd79c1-86bc-4f28-b631-e15cd3ba2de4';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44H' WHERE id = '6ba5d515-221c-4220-879a-682c212ca478';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44H' WHERE id = '41b438c9-be7f-4b98-b04a-81d0e269494e';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44H' WHERE id = '38796c67-c919-4954-9043-732f0c5e028b';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-162' WHERE id = '7a6c6214-1705-455f-8fed-2612f82865a0';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = '9d03fa2f-2e63-47d4-80d9-525ac7e47ab2';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = '83b81592-eadd-410d-bb3b-282b7ca682e0';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = 'b13014ab-c9c8-4910-926c-a75876e21956';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-162' WHERE id = '40b9df68-a35c-487d-9342-aa047966eedf';
UPDATE public.automotive_keys SET test_key_blank = 'T-Smart- Key Fob' WHERE id = '158a3058-9381-4c27-bc4d-65189b4e7746';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = 'd771a217-fa0f-4cf3-a961-fd09e97c3ad2';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = '427da820-f1ec-48db-b865-f1b29db086f9';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = '1b2c10d6-0b25-4252-9627-28ec3cd9faf9';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-162' WHERE id = 'd6db9d78-9d21-4d16-acf6-9a3fd4641bb2';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = '56980be9-eb98-4660-88fc-61174dfffc66';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = '4fcffc22-9852-45b1-bb54-0dd5c2f60ce3';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = 'e88d4bf2-c0d5-44d2-aba8-a539bdf1bf1f';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-162' WHERE id = '0fa1ae35-201c-4dc3-9e6f-3f8ccbe599be';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-162' WHERE id = '18ff4c70-db24-4630-b7d6-e803ce037e1a';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-66' WHERE id = '0f44772f-755d-4ef4-8def-c0b5855a8785';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-162' WHERE id = 'b9c8e7c9-34ed-4a39-8ebd-924017e229cc';
UPDATE public.automotive_keys SET test_key_blank = 'T-Smart- Key Fob Only' WHERE id = '48e13931-0857-42f1-8b0d-621186782165';
UPDATE public.automotive_keys SET test_key_blank = 'T-NE-66' WHERE id = 'e59ea259-865a-4174-ac17-70864a1a2a6d';
UPDATE public.automotive_keys SET test_key_blank = 'T-NE-66' WHERE id = 'bcccc567-7559-45fd-9e36-6b4561226e8c';
UPDATE public.automotive_keys SET test_key_blank = 'T-Smart- Key Fob Only' WHERE id = 'bcbeaf9e-35f2-47b2-95c0-4c27fddb063a';
UPDATE public.automotive_keys SET test_key_blank = 'T-NE-66' WHERE id = 'd88113f2-a053-4b4c-b0da-132806bee8c6';
UPDATE public.automotive_keys SET test_key_blank = 'T-Smart- Key Fob Only' WHERE id = '751931cc-cbb4-4c33-9a64-848c5af3bedc';
UPDATE public.automotive_keys SET test_key_blank = 'T-Smart- Key Fob Only' WHERE id = 'af8c28ca-6b03-4761-9666-3129591f838c';
UPDATE public.automotive_keys SET test_key_blank = 'T-Smart- Key Fob Only' WHERE id = 'f8e0fb97-c359-4f44-8856-51086179f9ad';
UPDATE public.automotive_keys SET test_key_blank = 'T-NE-66' WHERE id = '48cead80-5c6b-45c5-873a-8886990ba923';
UPDATE public.automotive_keys SET test_key_blank = 'T-Smart- Key Fob Only' WHERE id = '9ea7a90b-50a4-4cb3-83c3-bf7712ada973';
UPDATE public.automotive_keys SET test_key_blank = 'T-NE-66' WHERE id = '168fc874-8caa-4bb5-a0c1-75bb85a65c02';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-97' WHERE id = '97a4c7b3-bed4-49ac-8ec1-7051144adee9';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-97' WHERE id = '58bafc1c-b732-4899-95c9-2d61265402d8';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-102' WHERE id = '5aa622ea-9b35-46ca-8dfc-c9aa55eabfe6';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-102' WHERE id = '7df94874-ccc1-4098-a780-e871b965260f';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-97' WHERE id = '50fc27c1-c932-4abe-b002-85f7c82354b7';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-102' WHERE id = '4021afd6-0f7e-474a-8e84-dededf1fb4b8';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-97' WHERE id = '989235ef-6e4b-4506-9f06-2abb13abe68d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-97' WHERE id = 'b934779f-5024-416d-863a-116e2b945da7';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-97' WHERE id = 'dfb83f25-0a8a-41f8-a533-182178dceaa7';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-160' WHERE id = '3b79536c-14ca-488b-b02d-56cb1ce621eb';
UPDATE public.automotive_keys SET test_key_blank = 'T-HU-64' WHERE id = 'ead3145b-4b57-4331-9afa-5283416cba30';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-160' WHERE id = '2eb5c55c-f5db-434a-be15-12699d715d01';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-160' WHERE id = '9ebe266c-1404-4a95-a89c-0129208d8a1d';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-160' WHERE id = '8485a4d7-ca3e-455e-8c76-f83a06282398';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-160' WHERE id = '5cf4f51f-57b8-4d8b-8fae-3f5ffa6faeec';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-160' WHERE id = 'a7d92e00-4ccd-405a-805f-5dcde9e3e265';
UPDATE public.automotive_keys SET test_key_blank = 'T-Y-170' WHERE id = 'a6f165ce-08c5-4c8f-ad6f-8935521418c8';
UPDATE public.automotive_keys SET test_key_blank = 'T-H-74' WHERE id = 'b5b460ee-a39f-4cab-92ca-2bf70585ea08';
UPDATE public.automotive_keys SET test_key_blank = 'T-H-84' WHERE id = '55e60f40-4f37-4380-8680-226884b1b04e';
UPDATE public.automotive_keys SET test_key_blank = 'T-H-84' WHERE id = '58cbc7f7-fb87-42e6-aa9c-5ddda39d7b31';
UPDATE public.automotive_keys SET test_key_blank = 'T-H-74' WHERE id = '2107561f-77ac-42f4-a354-39a7566c797d';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-97' WHERE id = 'd0e18ac3-a905-4916-85cb-50a5462a6bc2';
UPDATE public.automotive_keys SET test_key_blank = 'T-B-97' WHERE id = 'acd26bb8-c39c-4965-a065-d0f37c8a5d55';
UPDATE public.automotive_keys SET test_key_blank = 'T-HON-66' WHERE id = '120b0632-c71f-489e-9b5a-4c465aa43692';
UPDATE public.automotive_keys SET test_key_blank = 'T-HON-66' WHERE id = '050ff126-9577-42ba-a6e3-61a787b72c1b';
UPDATE public.automotive_keys SET test_key_blank = 'T-HON-66' WHERE id = '8bda6761-e570-46b6-91a2-faf58c9a9f75';
UPDATE public.automotive_keys SET test_key_blank = 'T-HON-66' WHERE id = '7e10f776-d9c8-483e-9d7c-ad11ffa66c86';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-15' WHERE id = '0d9a7458-c157-4b73-a08f-c4fba6d3b005';
UPDATE public.automotive_keys SET test_key_blank = 'T-HY-15' WHERE id = '62a85815-2f8f-49df-8098-70830a7e111b';
UPDATE public.automotive_keys SET test_key_blank = 'T-MAZ-24R' WHERE id = '575067eb-b39a-41a7-b565-730f65bc5cce';
UPDATE public.automotive_keys SET test_key_blank = 'T-MAZ-24R' WHERE id = '2e4f7dc5-0e79-4f57-b427-5c2aede165b2';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '798af4b0-cd60-411f-a1fa-2c504295a635';
UPDATE public.automotive_keys SET test_key_blank = 'T-DA-34' WHERE id = '7af3118f-7937-4b8a-88cb-cf63952c25c7';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '142a9a89-5aa1-4ce0-9065-6da14b47109e';
UPDATE public.automotive_keys SET test_key_blank = 'T-DA-34' WHERE id = '46df5e6d-64e8-4495-9d81-852f1ec1d735';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = 'a6714abf-c9ac-4a47-8c6c-bc4f2ae1bd1f';
UPDATE public.automotive_keys SET test_key_blank = 'T-DA-34' WHERE id = 'a8a05456-8cda-401d-85eb-a62f96248c79';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '4de7138f-1a50-4176-bf04-de80fac9203b';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-14' WHERE id = '15587e63-d3b5-4700-bed8-a7e88efe18d0';
UPDATE public.automotive_keys SET test_key_blank = 'T-DA-34' WHERE id = '0b0aa244-0e21-4089-81fe-f6905024aa8b';
UPDATE public.automotive_keys SET test_key_blank = 'T-NSN-19' WHERE id = '91c94b38-0676-4532-87dc-ba734decc0de';
UPDATE public.automotive_keys SET test_key_blank = 'T-N-/A (Key Card)' WHERE id = '6f934002-b1eb-4fbf-9dc5-2617e74b0171';
UPDATE public.automotive_keys SET test_key_blank = 'T-N-/A (Key Card)' WHERE id = '8134cb92-fdab-4b4a-80c4-5bf7b9fef580';
UPDATE public.automotive_keys SET test_key_blank = 'T-N-/A (Key Card)' WHERE id = 'd723ef94-e67f-484d-9b0c-df95bd4ed77b';
UPDATE public.automotive_keys SET test_key_blank = 'T-N-/A (Key Card)' WHERE id = 'd72259ce-8478-4e96-a026-bc1ccb6637e9';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = 'ad0a6b30-51b8-482d-806a-eb7343a17806';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '886a795b-75d8-4803-89c3-6ecff7e5c966';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '7d2fddd7-06cf-4947-ba11-92305c4f6283';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44G' WHERE id = '3a2b328b-a130-4c5b-bba2-fc7e3357dde6';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '1bd47fee-eb4c-4771-973b-3febc56d2e7c';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = 'b88db432-0780-4bc6-98e6-0518f0e469fd';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '7534a798-cda0-41b5-8ae9-37e2131178ef';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = 'a3a698ca-bbe5-4b02-8c52-3354a8e72881';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '662605e3-6cb6-4717-9c4e-201e08403c05';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-43' WHERE id = '0bafcf61-1c36-4f21-a8a7-6b22c5a13ee2';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '13bca0ed-260f-4727-9dc8-1d6457791f83';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '8623daf7-3936-4ffa-bb12-5b2b9c0f53ee';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = 'd886fa00-4c7c-4fe3-80de-9f6a56ada01e';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '3ea7ef53-dcb2-41c5-a253-98d36b73d408';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = 'e5d29622-3d5c-44f3-a3a6-411e388feae1';
UPDATE public.automotive_keys SET test_key_blank = 'T-TOY-44D' WHERE id = '2af6f515-9f91-4f90-a8a0-87aac4f6ffdc';

-- ============================================================
-- STEP 10: Add Lishi tool mappings
-- ============================================================
-- Add lishi_tool column
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS lishi_tool TEXT;

-- Map Lishi tools by key_blank
-- GM B-series
UPDATE public.automotive_keys SET lishi_tool = 'Lishi B106/B111 (GM37)' WHERE key_blank IN ('B106', 'B106-PT', 'B110', 'B111', 'B111-PT') AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi B102/B106 (GM37)' WHERE key_blank IN ('B102', 'B102-PT') AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi GM39 (B89/B97)' WHERE key_blank IN ('B89', 'B97', 'B97-PT', 'B82-P') AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi GM37 (B65)' WHERE key_blank = 'B65' AND lishi_tool IS NULL;

-- Nissan / Infiniti
UPDATE public.automotive_keys SET lishi_tool = 'Lishi NSN14 (Nissan)' WHERE key_blank IN ('NSN14', 'NSN14-PT') AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi NSN11 (Nissan)' WHERE key_blank = 'NSN11' AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi DA34 (Nissan)' WHERE key_blank = 'DA34' AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi NSN19 (Subaru)' WHERE key_blank = 'NSN19' AND lishi_tool IS NULL;

-- Ford / Lincoln / Mercury
UPDATE public.automotive_keys SET lishi_tool = 'Lishi HU101 (Ford)' WHERE key_blank IN ('H128-PT', 'HU101') AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi FO38 (Ford H75)' WHERE key_blank IN ('H75', 'H74', 'H72', 'H72-PT') AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi HU92 (Ford H92)' WHERE key_blank IN ('H92', 'H92-PT', 'H84-PT') AND lishi_tool IS NULL;

-- Honda / Acura
UPDATE public.automotive_keys SET lishi_tool = 'Lishi HON66 (Honda)' WHERE key_blank IN ('HON66', 'HD106', 'HD103') AND lishi_tool IS NULL;

-- BMW / Mini / Rolls-Royce
UPDATE public.automotive_keys SET lishi_tool = 'Lishi HU92 (BMW)' WHERE key_blank IN ('HU92', 'HU92R') AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi HU100R (BMW)' WHERE key_blank = 'HU100R' AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi HU58 (BMW)' WHERE key_blank = 'HU58' AND lishi_tool IS NULL;

-- VW / Audi / Porsche / Bentley / Lamborghini
UPDATE public.automotive_keys SET lishi_tool = 'Lishi HU66 (VW/Audi)' WHERE key_blank = 'HU66' AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi HU162T (VW/Audi)' WHERE key_blank = 'HU162' AND lishi_tool IS NULL;

-- Mercedes-Benz / Maybach / Smart / Freightliner / Chrysler Crossfire
UPDATE public.automotive_keys SET lishi_tool = 'Lishi HU64 (Mercedes)' WHERE key_blank IN ('HU64', 'HU64-PT') AND lishi_tool IS NULL;

-- Hyundai / Kia / Genesis
UPDATE public.automotive_keys SET lishi_tool = 'Lishi HY22 (Hyundai/Kia)' WHERE key_blank = 'HY22' AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi HYN14R (Hyundai/Kia)' WHERE key_blank IN ('HY14', 'HY15', 'HY18', 'HY18R') AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi KIA3R (Kia)' WHERE key_blank IN ('KK7', 'KK10') AND lishi_tool IS NULL;

-- Toyota / Lexus / Scion
UPDATE public.automotive_keys SET lishi_tool = 'Lishi TOY48 (Toyota)' WHERE key_blank IN ('TOY48', 'TOY48-PT', 'TOY51') AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi TOY43 (Toyota)' WHERE key_blank IN ('TOY43', 'TOY43-PT', 'TOY44D-PT', 'TOY44G-PT', 'TOY44H-PT') AND lishi_tool IS NULL;

-- Subaru
UPDATE public.automotive_keys SET lishi_tool = 'Lishi DAT17 (Subaru)' WHERE key_blank = 'DAT17' AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi NSN19 (Subaru)' WHERE key_blank IN ('SUB44', 'SUB82') AND lishi_tool IS NULL;

-- Chrysler / Dodge / Jeep / RAM / Plymouth / Eagle
UPDATE public.automotive_keys SET lishi_tool = 'Lishi CY24 (Chrysler Y160)' WHERE key_blank IN ('Y160', 'Y160-PT', 'Y164-PT', 'Y170') AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi MIT11 (Chrysler Y157)' WHERE key_blank IN ('Y157', 'Y159', 'Y159-PT', 'Y155') AND lishi_tool IS NULL;

-- Alfa Romeo / Fiat / Ferrari / Maserati
UPDATE public.automotive_keys SET lishi_tool = 'Lishi SIP22 (Fiat/Alfa)' WHERE key_blank = 'SIP22' AND lishi_tool IS NULL;

-- Mitsubishi
UPDATE public.automotive_keys SET lishi_tool = 'Lishi MIT11 (Mitsubishi)' WHERE key_blank IN ('MIT11R', 'MIT8') AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi MIT2 (Mitsubishi)' WHERE key_blank IN ('MIT2', 'MIT3') AND lishi_tool IS NULL;

-- Mazda
UPDATE public.automotive_keys SET lishi_tool = 'Lishi MAZ24 (Mazda)' WHERE key_blank = 'MAZ24R' AND lishi_tool IS NULL;

-- Volvo / Saab
UPDATE public.automotive_keys SET lishi_tool = 'Lishi NE66 (Volvo)' WHERE key_blank IN ('NE66', 'NE66-PT') AND lishi_tool IS NULL;
UPDATE public.automotive_keys SET lishi_tool = 'Lishi NE38 (Saab)' WHERE key_blank IN ('NE38-PT', 'HU100') AND lishi_tool IS NULL;

-- Suzuki
UPDATE public.automotive_keys SET lishi_tool = 'Lishi SUZ17 (Suzuki)' WHERE key_blank IN ('SUZ17', 'SUZ17-PT') AND lishi_tool IS NULL;

-- Daewoo
UPDATE public.automotive_keys SET lishi_tool = 'Lishi DWO4R (Daewoo)' WHERE key_blank IN ('DWO4R', 'DWO5') AND lishi_tool IS NULL;

-- Isuzu
UPDATE public.automotive_keys SET lishi_tool = 'Lishi ISU5 (Isuzu)' WHERE key_blank = 'ISU5' AND lishi_tool IS NULL;

-- Commercial trucks
UPDATE public.automotive_keys SET lishi_tool = 'Lishi SC1 (Commercial)' WHERE key_blank = 'SC1' AND lishi_tool IS NULL;

-- Smart key fob only / key cards (no physical blade = no Lishi)
UPDATE public.automotive_keys SET lishi_tool = 'N/A (No physical blade)' WHERE key_blank IN ('N/A', 'N/A (Key Card)', 'N/A (Key Fob)', 'N/A (Smart Fob Only)', 'Smart Key Fob', 'Smart Key Fob Only') AND lishi_tool IS NULL;

