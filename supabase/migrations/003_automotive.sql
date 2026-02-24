-- Vehicle models
CREATE TABLE IF NOT EXISTS public.vehicle_models (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  manufacturer_id UUID NOT NULL REFERENCES public.manufacturers(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  slug TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(manufacturer_id, slug)
);

CREATE INDEX idx_vehicle_models_manufacturer ON public.vehicle_models(manufacturer_id);

-- Vehicle year ranges
CREATE TABLE IF NOT EXISTS public.vehicle_years (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  model_id UUID NOT NULL REFERENCES public.vehicle_models(id) ON DELETE CASCADE,
  year_start INTEGER NOT NULL,
  year_end INTEGER NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_vehicle_years_model ON public.vehicle_years(model_id);

-- Automotive keys
CREATE TABLE IF NOT EXISTS public.automotive_keys (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  year_id UUID NOT NULL REFERENCES public.vehicle_years(id) ON DELETE CASCADE,
  manufacturer_id UUID NOT NULL REFERENCES public.manufacturers(id) ON DELETE CASCADE,
  model_name TEXT NOT NULL,
  key_blank TEXT NOT NULL,
  transponder_type TEXT,
  chip_type TEXT,
  remote_frequency TEXT,
  key_type TEXT NOT NULL CHECK (key_type IN ('standard', 'transponder', 'smart_key', 'proximity')),
  fcc_id TEXT,
  programming_notes TEXT,
  pin_code_required BOOLEAN DEFAULT FALSE,
  obd_programmable BOOLEAN DEFAULT FALSE,
  emergency_key_blank TEXT,
  year_start INTEGER NOT NULL,
  year_end INTEGER NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_automotive_keys_year ON public.automotive_keys(year_id);
CREATE INDEX idx_automotive_keys_manufacturer ON public.automotive_keys(manufacturer_id);
CREATE INDEX idx_automotive_keys_blank ON public.automotive_keys(key_blank);
