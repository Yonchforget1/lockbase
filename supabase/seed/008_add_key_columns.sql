-- Add missing columns to automotive_keys table for complete locksmith data
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS ic_number TEXT;
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS battery_type TEXT;
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS buttons TEXT;
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS test_key_blank TEXT;
ALTER TABLE public.automotive_keys ADD COLUMN IF NOT EXISTS image_url TEXT;
