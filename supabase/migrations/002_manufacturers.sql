-- Manufacturers (automotive, residential, or both)
CREATE TABLE IF NOT EXISTS public.manufacturers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('automotive', 'residential', 'both')),
  logo_url TEXT,
  country TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_manufacturers_type ON public.manufacturers(type);
CREATE INDEX idx_manufacturers_slug ON public.manufacturers(slug);
