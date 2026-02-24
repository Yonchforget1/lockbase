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
