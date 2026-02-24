-- Residential locks
CREATE TABLE IF NOT EXISTS public.residential_locks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  manufacturer_id UUID NOT NULL REFERENCES public.manufacturers(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  slug TEXT NOT NULL,
  lock_type TEXT NOT NULL CHECK (lock_type IN ('deadbolt', 'knob', 'lever', 'padlock', 'smart_lock', 'mortise')),
  keyway TEXT NOT NULL,
  num_pins INTEGER NOT NULL DEFAULT 5,
  security_pins TEXT,
  bump_resistant BOOLEAN DEFAULT FALSE,
  pick_resistant BOOLEAN DEFAULT FALSE,
  drill_resistant BOOLEAN DEFAULT FALSE,
  ansi_grade TEXT,
  smart_features TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(manufacturer_id, slug)
);

CREATE INDEX idx_residential_locks_manufacturer ON public.residential_locks(manufacturer_id);
CREATE INDEX idx_residential_locks_keyway ON public.residential_locks(keyway);

-- Residential key blanks
CREATE TABLE IF NOT EXISTS public.residential_key_blanks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  lock_id UUID NOT NULL REFERENCES public.residential_locks(id) ON DELETE CASCADE,
  manufacturer_id UUID NOT NULL REFERENCES public.manufacturers(id) ON DELETE CASCADE,
  blank_number TEXT NOT NULL,
  brand TEXT NOT NULL,
  keyway TEXT NOT NULL,
  material TEXT DEFAULT 'nickel silver',
  depth_spec TEXT,
  spacing_spec TEXT,
  pinning_chart JSONB,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_residential_blanks_lock ON public.residential_key_blanks(lock_id);
CREATE INDEX idx_residential_blanks_blank ON public.residential_key_blanks(blank_number);
