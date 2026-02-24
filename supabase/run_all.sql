-- ============================================
-- LOCKBASE: ALL MIGRATIONS + SEED DATA
-- Run this in Supabase SQL Editor
-- Safe to re-run (idempotent)
-- ============================================

-- ============================================
-- MIGRATION: 001_profiles
-- ============================================
-- Profiles table (extends auth.users)
CREATE TABLE IF NOT EXISTS public.profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  username TEXT UNIQUE NOT NULL,
  display_name TEXT,
  avatar_url TEXT,
  bio TEXT,
  reputation INTEGER DEFAULT 0,
  role TEXT DEFAULT 'user' CHECK (role IN ('user', 'moderator', 'admin')),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Auto-create profile on user signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, username, display_name)
  VALUES (NEW.id, COALESCE(NEW.raw_user_meta_data->>'username', split_part(NEW.email, '@', 1)), COALESCE(NEW.raw_user_meta_data->>'display_name', split_part(NEW.email, '@', 1)));
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Updated_at trigger
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS profiles_updated_at ON public.profiles;
CREATE TRIGGER profiles_updated_at
  BEFORE UPDATE ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();


-- ============================================
-- MIGRATION: 002_manufacturers
-- ============================================
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

CREATE INDEX IF NOT EXISTS idx_manufacturers_type ON public.manufacturers(type);
CREATE INDEX IF NOT EXISTS idx_manufacturers_slug ON public.manufacturers(slug);


-- ============================================
-- MIGRATION: 003_automotive
-- ============================================
-- Vehicle models
CREATE TABLE IF NOT EXISTS public.vehicle_models (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  manufacturer_id UUID NOT NULL REFERENCES public.manufacturers(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  slug TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(manufacturer_id, slug)
);

CREATE INDEX IF NOT EXISTS idx_vehicle_models_manufacturer ON public.vehicle_models(manufacturer_id);

-- Vehicle year ranges
CREATE TABLE IF NOT EXISTS public.vehicle_years (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  model_id UUID NOT NULL REFERENCES public.vehicle_models(id) ON DELETE CASCADE,
  year_start INTEGER NOT NULL,
  year_end INTEGER NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_vehicle_years_model ON public.vehicle_years(model_id);

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

CREATE INDEX IF NOT EXISTS idx_automotive_keys_year ON public.automotive_keys(year_id);
CREATE INDEX IF NOT EXISTS idx_automotive_keys_manufacturer ON public.automotive_keys(manufacturer_id);
CREATE INDEX IF NOT EXISTS idx_automotive_keys_blank ON public.automotive_keys(key_blank);


-- ============================================
-- MIGRATION: 004_residential
-- ============================================
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

CREATE INDEX IF NOT EXISTS idx_residential_locks_manufacturer ON public.residential_locks(manufacturer_id);
CREATE INDEX IF NOT EXISTS idx_residential_locks_keyway ON public.residential_locks(keyway);

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

CREATE INDEX IF NOT EXISTS idx_residential_blanks_lock ON public.residential_key_blanks(lock_id);
CREATE INDEX IF NOT EXISTS idx_residential_blanks_blank ON public.residential_key_blanks(blank_number);


-- ============================================
-- MIGRATION: 005_community
-- ============================================
-- Posts
CREATE TABLE IF NOT EXISTS public.posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  author_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  category TEXT NOT NULL CHECK (category IN ('automotive', 'residential', 'general', 'tips')),
  reference_type TEXT CHECK (reference_type IN ('automotive_key', 'residential_lock')),
  reference_id UUID,
  vote_count INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_posts_author ON public.posts(author_id);
CREATE INDEX IF NOT EXISTS idx_posts_category ON public.posts(category);
CREATE INDEX IF NOT EXISTS idx_posts_reference ON public.posts(reference_type, reference_id);

DROP TRIGGER IF EXISTS posts_updated_at ON public.posts;
CREATE TRIGGER posts_updated_at
  BEFORE UPDATE ON public.posts
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- Comments
CREATE TABLE IF NOT EXISTS public.comments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  post_id UUID NOT NULL REFERENCES public.posts(id) ON DELETE CASCADE,
  author_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  parent_id UUID REFERENCES public.comments(id) ON DELETE CASCADE,
  body TEXT NOT NULL,
  vote_count INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_comments_post ON public.comments(post_id);
CREATE INDEX IF NOT EXISTS idx_comments_parent ON public.comments(parent_id);

DROP TRIGGER IF EXISTS comments_updated_at ON public.comments;
CREATE TRIGGER comments_updated_at
  BEFORE UPDATE ON public.comments
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- Votes
CREATE TABLE IF NOT EXISTS public.votes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  votable_type TEXT NOT NULL CHECK (votable_type IN ('post', 'comment')),
  votable_id UUID NOT NULL,
  value SMALLINT NOT NULL CHECK (value IN (-1, 1)),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, votable_type, votable_id)
);

CREATE INDEX IF NOT EXISTS idx_votes_votable ON public.votes(votable_type, votable_id);

-- Bookmarks
CREATE TABLE IF NOT EXISTS public.bookmarks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  bookmarkable_type TEXT NOT NULL CHECK (bookmarkable_type IN ('automotive_key', 'residential_lock', 'residential_blank', 'post')),
  bookmarkable_id UUID NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, bookmarkable_type, bookmarkable_id)
);

CREATE INDEX IF NOT EXISTS idx_bookmarks_user ON public.bookmarks(user_id);


-- ============================================
-- MIGRATION: 006_rls_policies
-- ============================================
-- Enable RLS on all tables
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.manufacturers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.vehicle_models ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.vehicle_years ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.automotive_keys ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.residential_locks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.residential_key_blanks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.comments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.votes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.bookmarks ENABLE ROW LEVEL SECURITY;

-- Profiles: public read, own write
DROP POLICY IF EXISTS "Profiles are viewable by everyone" ON public.profiles;
CREATE POLICY "Profiles are viewable by everyone" ON public.profiles FOR SELECT USING (true);
DROP POLICY IF EXISTS "Users can update own profile" ON public.profiles;
CREATE POLICY "Users can update own profile" ON public.profiles FOR UPDATE USING (auth.uid() = id);
DROP POLICY IF EXISTS "Users can insert own profile" ON public.profiles;
CREATE POLICY "Users can insert own profile" ON public.profiles FOR INSERT WITH CHECK (auth.uid() = id);

-- Reference data: public read
DROP POLICY IF EXISTS "Manufacturers are viewable by everyone" ON public.manufacturers;
CREATE POLICY "Manufacturers are viewable by everyone" ON public.manufacturers FOR SELECT USING (true);
DROP POLICY IF EXISTS "Vehicle models are viewable by everyone" ON public.vehicle_models;
CREATE POLICY "Vehicle models are viewable by everyone" ON public.vehicle_models FOR SELECT USING (true);
DROP POLICY IF EXISTS "Vehicle years are viewable by everyone" ON public.vehicle_years;
CREATE POLICY "Vehicle years are viewable by everyone" ON public.vehicle_years FOR SELECT USING (true);
DROP POLICY IF EXISTS "Automotive keys are viewable by everyone" ON public.automotive_keys;
CREATE POLICY "Automotive keys are viewable by everyone" ON public.automotive_keys FOR SELECT USING (true);
DROP POLICY IF EXISTS "Residential locks are viewable by everyone" ON public.residential_locks;
CREATE POLICY "Residential locks are viewable by everyone" ON public.residential_locks FOR SELECT USING (true);
DROP POLICY IF EXISTS "Residential blanks are viewable by everyone" ON public.residential_key_blanks;
CREATE POLICY "Residential blanks are viewable by everyone" ON public.residential_key_blanks FOR SELECT USING (true);

-- Posts: public read, authenticated write own
DROP POLICY IF EXISTS "Posts are viewable by everyone" ON public.posts;
CREATE POLICY "Posts are viewable by everyone" ON public.posts FOR SELECT USING (true);
DROP POLICY IF EXISTS "Authenticated users can create posts" ON public.posts;
CREATE POLICY "Authenticated users can create posts" ON public.posts FOR INSERT WITH CHECK (auth.uid() = author_id);
DROP POLICY IF EXISTS "Users can update own posts" ON public.posts;
CREATE POLICY "Users can update own posts" ON public.posts FOR UPDATE USING (auth.uid() = author_id);
DROP POLICY IF EXISTS "Users can delete own posts" ON public.posts;
CREATE POLICY "Users can delete own posts" ON public.posts FOR DELETE USING (auth.uid() = author_id);

-- Comments: public read, authenticated write own
DROP POLICY IF EXISTS "Comments are viewable by everyone" ON public.comments;
CREATE POLICY "Comments are viewable by everyone" ON public.comments FOR SELECT USING (true);
DROP POLICY IF EXISTS "Authenticated users can create comments" ON public.comments;
CREATE POLICY "Authenticated users can create comments" ON public.comments FOR INSERT WITH CHECK (auth.uid() = author_id);
DROP POLICY IF EXISTS "Users can update own comments" ON public.comments;
CREATE POLICY "Users can update own comments" ON public.comments FOR UPDATE USING (auth.uid() = author_id);
DROP POLICY IF EXISTS "Users can delete own comments" ON public.comments;
CREATE POLICY "Users can delete own comments" ON public.comments FOR DELETE USING (auth.uid() = author_id);

-- Votes: own only
DROP POLICY IF EXISTS "Users can view own votes" ON public.votes;
CREATE POLICY "Users can view own votes" ON public.votes FOR SELECT USING (auth.uid() = user_id);
DROP POLICY IF EXISTS "Users can create own votes" ON public.votes;
CREATE POLICY "Users can create own votes" ON public.votes FOR INSERT WITH CHECK (auth.uid() = user_id);
DROP POLICY IF EXISTS "Users can update own votes" ON public.votes;
CREATE POLICY "Users can update own votes" ON public.votes FOR UPDATE USING (auth.uid() = user_id);
DROP POLICY IF EXISTS "Users can delete own votes" ON public.votes;
CREATE POLICY "Users can delete own votes" ON public.votes FOR DELETE USING (auth.uid() = user_id);

-- Bookmarks: own only
DROP POLICY IF EXISTS "Users can view own bookmarks" ON public.bookmarks;
CREATE POLICY "Users can view own bookmarks" ON public.bookmarks FOR SELECT USING (auth.uid() = user_id);
DROP POLICY IF EXISTS "Users can create bookmarks" ON public.bookmarks;
CREATE POLICY "Users can create bookmarks" ON public.bookmarks FOR INSERT WITH CHECK (auth.uid() = user_id);
DROP POLICY IF EXISTS "Users can delete own bookmarks" ON public.bookmarks;
CREATE POLICY "Users can delete own bookmarks" ON public.bookmarks FOR DELETE USING (auth.uid() = user_id);


-- ============================================
-- MIGRATION: 007_functions
-- ============================================
-- Update vote count on posts after vote change
CREATE OR REPLACE FUNCTION update_post_vote_count()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
    IF NEW.votable_type = 'post' THEN
      UPDATE public.posts SET vote_count = (
        SELECT COALESCE(SUM(value), 0) FROM public.votes WHERE votable_type = 'post' AND votable_id = NEW.votable_id
      ) WHERE id = NEW.votable_id;
    ELSIF NEW.votable_type = 'comment' THEN
      UPDATE public.comments SET vote_count = (
        SELECT COALESCE(SUM(value), 0) FROM public.votes WHERE votable_type = 'comment' AND votable_id = NEW.votable_id
      ) WHERE id = NEW.votable_id;
    END IF;
    RETURN NEW;
  ELSIF TG_OP = 'DELETE' THEN
    IF OLD.votable_type = 'post' THEN
      UPDATE public.posts SET vote_count = (
        SELECT COALESCE(SUM(value), 0) FROM public.votes WHERE votable_type = 'post' AND votable_id = OLD.votable_id
      ) WHERE id = OLD.votable_id;
    ELSIF OLD.votable_type = 'comment' THEN
      UPDATE public.comments SET vote_count = (
        SELECT COALESCE(SUM(value), 0) FROM public.votes WHERE votable_type = 'comment' AND votable_id = OLD.votable_id
      ) WHERE id = OLD.votable_id;
    END IF;
    RETURN OLD;
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_vote_change ON public.votes;
CREATE TRIGGER on_vote_change
  AFTER INSERT OR UPDATE OR DELETE ON public.votes
  FOR EACH ROW EXECUTE FUNCTION update_post_vote_count();

-- Update reputation when user gets votes on posts
CREATE OR REPLACE FUNCTION update_user_reputation()
RETURNS TRIGGER AS $$
DECLARE
  post_author_id UUID;
BEGIN
  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
    IF NEW.votable_type = 'post' THEN
      SELECT author_id INTO post_author_id FROM public.posts WHERE id = NEW.votable_id;
      IF post_author_id IS NOT NULL THEN
        UPDATE public.profiles SET reputation = (
          SELECT COALESCE(SUM(v.value), 0)
          FROM public.votes v
          JOIN public.posts p ON v.votable_id = p.id AND v.votable_type = 'post'
          WHERE p.author_id = post_author_id
        ) WHERE id = post_author_id;
      END IF;
    END IF;
    RETURN NEW;
  END IF;
  RETURN OLD;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_vote_reputation ON public.votes;
CREATE TRIGGER on_vote_reputation
  AFTER INSERT OR UPDATE OR DELETE ON public.votes
  FOR EACH ROW EXECUTE FUNCTION update_user_reputation();


-- ============================================
-- CLEAN EXISTING SEED DATA (safe re-run)
-- ============================================
-- Cascade deletes handle child tables automatically
TRUNCATE public.automotive_keys CASCADE;
TRUNCATE public.vehicle_years CASCADE;
TRUNCATE public.vehicle_models CASCADE;
TRUNCATE public.residential_key_blanks CASCADE;
TRUNCATE public.residential_locks CASCADE;
-- Do NOT truncate manufacturers - just upsert below

-- ============================================
-- SEED DATA: Manufacturers
-- ============================================
-- Automotive Manufacturers (65+)
INSERT INTO public.manufacturers (name, slug, type, country) VALUES
('Acura', 'acura', 'automotive', 'Japan'),
('Alfa Romeo', 'alfa-romeo', 'automotive', 'Italy'),
('Audi', 'audi', 'automotive', 'Germany'),
('BMW', 'bmw', 'automotive', 'Germany'),
('Buick', 'buick', 'automotive', 'USA'),
('Cadillac', 'cadillac', 'automotive', 'USA'),
('Chevrolet', 'chevrolet', 'automotive', 'USA'),
('Chrysler', 'chrysler', 'automotive', 'USA'),
('Dodge', 'dodge', 'automotive', 'USA'),
('Fiat', 'fiat', 'automotive', 'Italy'),
('Ford', 'ford', 'automotive', 'USA'),
('Genesis', 'genesis', 'automotive', 'South Korea'),
('GMC', 'gmc', 'automotive', 'USA'),
('Honda', 'honda', 'automotive', 'Japan'),
('Hyundai', 'hyundai', 'automotive', 'South Korea'),
('Infiniti', 'infiniti', 'automotive', 'Japan'),
('Jaguar', 'jaguar', 'automotive', 'UK'),
('Jeep', 'jeep', 'automotive', 'USA'),
('Kia', 'kia', 'automotive', 'South Korea'),
('Land Rover', 'land-rover', 'automotive', 'UK'),
('Lexus', 'lexus', 'automotive', 'Japan'),
('Lincoln', 'lincoln', 'automotive', 'USA'),
('Mazda', 'mazda', 'automotive', 'Japan'),
('Mercedes-Benz', 'mercedes-benz', 'automotive', 'Germany'),
('Mercury', 'mercury', 'automotive', 'USA'),
('Mini', 'mini', 'automotive', 'UK'),
('Mitsubishi', 'mitsubishi', 'automotive', 'Japan'),
('Nissan', 'nissan', 'automotive', 'Japan'),
('Oldsmobile', 'oldsmobile', 'automotive', 'USA'),
('Pontiac', 'pontiac', 'automotive', 'USA'),
('Porsche', 'porsche', 'automotive', 'Germany'),
('Ram', 'ram', 'automotive', 'USA'),
('Saab', 'saab', 'automotive', 'Sweden'),
('Saturn', 'saturn', 'automotive', 'USA'),
('Scion', 'scion', 'automotive', 'Japan'),
('Subaru', 'subaru', 'automotive', 'Japan'),
('Suzuki', 'suzuki', 'automotive', 'Japan'),
('Tesla', 'tesla', 'automotive', 'USA'),
('Toyota', 'toyota', 'automotive', 'Japan'),
('Volkswagen', 'volkswagen', 'automotive', 'Germany'),
('Volvo', 'volvo', 'automotive', 'Sweden'),
('Isuzu', 'isuzu', 'automotive', 'Japan'),
('Hummer', 'hummer', 'automotive', 'USA'),
('Daewoo', 'daewoo', 'automotive', 'South Korea'),
('Geo', 'geo', 'automotive', 'USA'),
('Eagle', 'eagle', 'automotive', 'USA'),
('Plymouth', 'plymouth', 'automotive', 'USA'),
('Rivian', 'rivian', 'automotive', 'USA'),
('Lucid', 'lucid', 'automotive', 'USA'),
('Polestar', 'polestar', 'automotive', 'Sweden'),
('Maserati', 'maserati', 'automotive', 'Italy'),
('Bentley', 'bentley', 'automotive', 'UK'),
('Rolls-Royce', 'rolls-royce', 'automotive', 'UK'),
('Aston Martin', 'aston-martin', 'automotive', 'UK'),
('Ferrari', 'ferrari', 'automotive', 'Italy'),
('Lamborghini', 'lamborghini', 'automotive', 'Italy'),
('McLaren', 'mclaren', 'automotive', 'UK'),
('Lotus', 'lotus', 'automotive', 'UK'),
('Maybach', 'maybach', 'automotive', 'Germany'),
('Smart', 'smart', 'automotive', 'Germany'),
('Freightliner', 'freightliner', 'automotive', 'USA'),
('Kenworth', 'kenworth', 'automotive', 'USA'),
('Peterbilt', 'peterbilt', 'automotive', 'USA'),
('International', 'international', 'automotive', 'USA'),
('Mack', 'mack', 'automotive', 'USA')
ON CONFLICT (slug) DO NOTHING;

-- Residential Lock Manufacturers (11+)
INSERT INTO public.manufacturers (name, slug, type, country) VALUES
('Schlage', 'schlage', 'residential', 'USA'),
('Kwikset', 'kwikset', 'residential', 'USA'),
('Yale', 'yale', 'residential', 'USA'),
('Defiant', 'defiant', 'residential', 'USA'),
('Baldwin', 'baldwin', 'residential', 'USA'),
('Medeco', 'medeco', 'residential', 'USA'),
('Mul-T-Lock', 'mul-t-lock', 'residential', 'Israel'),
('ASSA', 'assa', 'residential', 'Sweden'),
('Sargent', 'sargent', 'residential', 'USA'),
('Corbin Russwin', 'corbin-russwin', 'residential', 'USA'),
('Emtek', 'emtek', 'residential', 'USA'),
('Weiser', 'weiser', 'residential', 'Canada'),
('Brinks', 'brinks', 'residential', 'USA')
ON CONFLICT (slug) DO NOTHING;


-- ============================================
-- SEED DATA: automotive_toyota
-- ============================================
-- Toyota models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';

  -- Camry
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Camry', 'camry') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Camry', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBC', 'Requires Toyota Techstream or aftermarket tool. All keys must be present during programming.', false, true, 2018, 2024);
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Camry', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'proximity', 'Smart key programming via Techstream. Emergency key blade included.', false, true, 'TOY43', 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Camry', 'TOY44D-PT', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'transponder', 'On-board programming available with 2 working keys. Otherwise requires Techstream.', false, true, 2012, 2017);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2003, 2011) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Camry', 'TOY44D-PT', 'Texas Fixed Code', '4D67/4D68', 'transponder', 'OBD programmable. Customer self-learn with 2 working master keys.', false, true, 2003, 2011);

  -- Corolla
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Corolla', 'corolla') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Corolla', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBN', 'Techstream or aftermarket programmer required.', true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Corolla', 'TOY44G-PT', 'Texas Crypto 128-bit', 'G chip', 'transponder', 'G chip transponder. On-board with 2 keys or Techstream.', true, 2014, 2018);

  -- RAV4
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'RAV4', 'rav4') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota RAV4', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBC', 'All keys programming via Techstream. Must have all existing keys present.', true, 2019, 2024);

  -- Tacoma
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Tacoma', 'tacoma') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Tacoma', 'TOY44H-PT', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'transponder', 'H chip transponder key. OBD programming with compatible tool.', true, 2016, 2024);

  -- Highlander
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Highlander', 'highlander') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Highlander', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'Smart key system. Techstream or compatible aftermarket tool.', true, 2020, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_toyota_additional
-- ============================================
-- Toyota additional models, years, and keys

-- Tundra
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Tundra', 'tundra') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Tundra', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'New generation smart key. Requires Toyota Techstream or compatible aftermarket tool. All keys must be present during programming.', false, true, 'TOY43', 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Tundra', 'TOY44H-PT', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'transponder', 'HYQ14FBA', 'H chip transponder key. OBD programmable with Techstream or aftermarket tool.', false, true, 2014, 2021);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Tundra', 'TOY44D-PT', 'Texas Fixed Code', '4D67', 'transponder', '4D67 transponder. OBD programmable. Customer self-learn available with 2 working master keys.', false, true, 2007, 2013);
END $$;

-- 4Runner
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '4Runner', '4runner') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota 4Runner', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'Smart key system. Requires Techstream or aftermarket programmer. All existing keys must be present.', false, true, 'TOY43', 2020, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota 4Runner', 'TOY44G-PT', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'transponder', 'HYQ14FBA', 'G chip transponder. OBD programmable. On-board programming with 2 working keys or Techstream.', false, true, 2010, 2019);
END $$;

-- Prius
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Prius', 'prius') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Prius', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', '5th generation Prius. Smart key system. Techstream or compatible aftermarket tool required.', false, true, 'TOY43', 2023, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Prius', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBC', '4th generation Prius. Smart key with push-button start. Techstream or aftermarket tool.', false, true, 'TOY43', 2016, 2022);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Prius', 'TOY51', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'smart_key', 'HYQ14FBA', '3rd generation Prius. Smart key system. G chip. Techstream required for all-keys-lost.', false, true, 'TOY43', 2010, 2015);
END $$;

-- Avalon
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Avalon', 'avalon') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Avalon', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBC', 'Smart key with push-button start. Techstream or compatible aftermarket programmer required.', false, true, 'TOY43', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Avalon', 'TOY51', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'smart_key', 'HYQ14FBA', 'G chip smart key. Techstream or aftermarket tool required. All keys must be present for programming.', false, true, 'TOY43', 2013, 2018);
END $$;

-- Sienna
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sienna', 'sienna') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Sienna', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBN', 'New generation hybrid-only Sienna. Smart key system. Techstream or aftermarket tool.', false, true, 'TOY43', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Sienna', 'TOY51', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'smart_key', 'HYQ14FBA', 'Smart key equipped models. Some base trims use transponder key (TOY44G-PT). Techstream or aftermarket tool.', false, true, 'TOY43', 2011, 2020);
END $$;

-- Sequoia
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sequoia', 'sequoia') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Sequoia', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'New generation Sequoia on TNGA-F platform. Smart key. Techstream or aftermarket programmer.', false, true, 'TOY43', 2023, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Sequoia', 'TOY51', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'smart_key', 'HYQ14FBA', 'Smart key system. Techstream or compatible tool. 2008-2009 models may use 4D chip transponder key instead.', false, true, 'TOY43', 2008, 2022);
END $$;

-- Land Cruiser
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Land Cruiser', 'land-cruiser') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2024, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Land Cruiser', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'New generation Land Cruiser (250 series). Smart key system. Techstream or aftermarket tool required.', false, true, 'TOY43', 2024, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Land Cruiser', 'TOY51', 'Texas Crypto 128-bit', 'G chip', '315 MHz', 'smart_key', 'HYQ14FBA', '200 series Land Cruiser. Smart key system. Techstream required for all-keys-lost scenarios.', false, true, 'TOY43', 2008, 2021);
END $$;

-- C-HR
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'C-HR', 'c-hr') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota C-HR', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBC', 'Smart key with push-button start standard on all trims. Techstream or aftermarket programmer.', false, true, 'TOY43', 2018, 2024);
END $$;

-- Venza
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Venza', 'venza') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Venza', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBN', 'Hybrid-only model. Smart key system standard. Techstream or aftermarket tool required.', false, true, 'TOY43', 2021, 2024);
END $$;

-- GR86
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GR86', 'gr86') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota GR86', 'TOY44H-PT', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'transponder', 'HYQ14FBK', 'H chip transponder key. No push-button start. OBD programmable with Techstream or aftermarket tool.', false, true, 2022, 2024);
END $$;

-- Supra
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Supra', 'supra') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Supra', 'HU100R', 'BMW CAS4+/FEM', 'BMW Hitag Pro', '315 MHz', 'smart_key', 'YGOHUF5767', 'BMW A90 platform. Uses BMW key system, NOT Toyota. Requires BMW ISTA/Autel/Xhorse for programming. BMW dealer may be needed for all-keys-lost.', false, false, 2020, 2024);
END $$;

-- Crown
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'toyota';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Crown', 'crown') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Toyota Crown', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'New US-market Crown sedan. Smart key with push-button start. Techstream or compatible aftermarket tool required.', false, true, 'TOY43', 2023, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_honda
-- ============================================
-- Honda models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';

  -- Civic
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Civic', 'civic') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Civic', 'HON66', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'KR5TP-4', 'Requires Honda HDS or compatible aftermarket tool. Proximity key system.', true, 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Civic', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', 'Smart key. Honda HDS tool or aftermarket programmer required.', true, 2016, 2021);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Civic', 'HON66', 'Megamos 46', '46 chip', 'transponder', 'OBD programmable with Honda HDS. Aftermarket tools available.', true, 2006, 2015);

  -- Accord
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Accord', 'accord') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Accord', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'CWTWB1G0090', 'Smart proximity key. Program via Honda HDS or aftermarket.', true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Accord', 'HON66', 'Megamos 46', '46 chip', 'transponder', 'Standard transponder. OBD programmable.', true, 2008, 2017);

  -- CR-V
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CR-V', 'cr-v') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda CR-V', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', 'Smart key system. Honda HDS or aftermarket programmer.', true, 2017, 2024);

  -- Pilot
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Pilot', 'pilot') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Pilot', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', 'Proximity key. All keys must be present for programming.', true, 2016, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_honda_additional
-- ============================================
-- Honda additional models, years, and keys

-- HR-V
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'HR-V', 'hr-v') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda HR-V', 'HON66', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'KR5TP-4', 'New generation HR-V. Smart key with push-button start. Honda HDS or compatible aftermarket tool required.', false, true, 2023, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda HR-V', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', 'Smart key equipped trims. Some base trims use transponder key. Honda HDS or aftermarket programmer.', false, true, 2016, 2022);
END $$;

-- Odyssey
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Odyssey', 'odyssey') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Odyssey', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', '5th generation Odyssey. Smart key with push-button start. Honda HDS or aftermarket tool required.', false, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Odyssey', 'HON66', 'Megamos 46', '46 chip', '315 MHz', 'smart_key', 'CWTWB1G0090', '4th generation Odyssey. Smart key on Touring trims. Some trims use transponder key with 46 chip.', false, true, 2011, 2017);
END $$;

-- Ridgeline
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Ridgeline', 'ridgeline') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Ridgeline', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', '2nd generation Ridgeline. Smart key with push-button start standard. Honda HDS or aftermarket programmer.', false, true, 2017, 2024);
END $$;

-- Passport
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Passport', 'passport') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Passport', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', 'Smart key with push-button start. Honda HDS or compatible aftermarket tool. All keys must be present during programming.', false, true, 2019, 2024);
END $$;

-- Fit
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'honda';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Fit', 'fit') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Honda Fit', 'HON66', 'Megamos 46', '46 chip', 'transponder', 'A2C98676600', '3rd generation Fit. Transponder key standard. EX and above trims may have smart key option. OBD programmable via Honda HDS or aftermarket.', false, true, 2015, 2020);
END $$;


-- ============================================
-- SEED DATA: automotive_ford
-- ============================================
-- Ford models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';

  -- F-150
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'F-150', 'f-150') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, pin_code_required, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-150', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'PATS system. Requires Ford IDS/FDRS or compatible tool. Must have admin key or security code.', true, false, 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, pin_code_required, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-150', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'transponder', 'M3N-A2C93142600', 'PATS 128-bit. Requires 2 working keys for on-board or Ford IDS with security code.', true, true, 2015, 2020);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, obd_programmable, pin_code_required, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-150', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', 'PATS system. On-board programming with 2 working keys. PIN code bypass available via Ford IDS.', true, true, 2005, 2014);

  -- Explorer
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Explorer', 'explorer') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Explorer', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'Smart key with PATS. Ford IDS/FDRS required for all-keys-lost.', true, 2020, 2024);

  -- Escape
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Escape', 'escape') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Escape', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'Proximity smart key. Ford IDS/FDRS or aftermarket tool required.', true, 2020, 2024);

  -- Mustang
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Mustang', 'mustang') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Mustang', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'smart_key', 'M3N-A2C931426', 'Smart key system. PATS 128-bit. Ford IDS/FDRS or compatible programmer.', true, 2015, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_ford_additional
-- ============================================
-- Ford additional models, years, and keys

-- F-250/F-350 Super Duty
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'F-250/F-350 Super Duty', 'f-250-f-350-super-duty') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-250/F-350 Super Duty', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'PATS system. Smart key with push-button start on higher trims. Ford IDS/FDRS or compatible aftermarket tool. Security code may be required.', true, true, 2017, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-250/F-350 Super Duty', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'transponder', 'M3N-A2C93142600', 'PATS 128-bit transponder. On-board programming with 2 working keys. Ford IDS with security code for all-keys-lost.', true, true, 2011, 2016);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2010) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, key_type, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford F-250/F-350 Super Duty', 'H84-PT', 'Texas 4D63', '4D63 80-bit', 'transponder', 'PATS 80-bit system. On-board programming with 2 working keys. PIN code bypass via Ford IDS.', true, true, 2005, 2010);
END $$;

-- Edge
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Edge', 'edge') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Edge', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key. Push-button start standard. Ford IDS/FDRS or compatible aftermarket tool required.', true, true, 2015, 2024);
END $$;

-- Expedition
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Expedition', 'expedition') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Expedition', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', '4th generation Expedition. Smart key with PATS. Ford IDS/FDRS required for all-keys-lost programming.', true, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Expedition', 'H84-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'transponder', 'M3N-A2C93142600', 'PATS transponder key. 2011+ uses 128-bit, 2007-2010 uses 80-bit 4D63. On-board with 2 keys or Ford IDS.', true, true, 2007, 2017);
END $$;

-- Ranger
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Ranger', 'ranger') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Ranger', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'Reintroduced Ranger. Smart key with PATS system. Ford IDS/FDRS or compatible aftermarket programmer.', true, true, 2019, 2024);
END $$;

-- Maverick
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Maverick', 'maverick') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Maverick', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'Compact truck. Smart key standard on all trims. Ford IDS/FDRS or aftermarket tool required.', true, true, 2022, 2024);
END $$;

-- Bronco
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Bronco', 'bronco') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Bronco', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', '6th generation Bronco. Smart key with push-button start. Ford IDS/FDRS or compatible aftermarket tool.', true, true, 2021, 2024);
END $$;

-- Bronco Sport
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Bronco Sport', 'bronco-sport') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Bronco Sport', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'Compact SUV on Escape platform. Smart key standard. Ford IDS/FDRS or aftermarket programmer.', true, true, 2021, 2024);
END $$;

-- Fusion
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Fusion', 'fusion') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Fusion', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'smart_key', 'M3N-A2C931426', '2nd generation Fusion. Smart key with PATS. Push-button start on most trims. Ford IDS/FDRS or aftermarket tool.', true, true, 2013, 2020);
END $$;

-- Focus
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Focus', 'focus') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Focus', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'transponder', 'M3N-A2C931426', '3rd generation Focus. PATS 128-bit transponder. On-board programming with 2 working keys or Ford IDS with security code.', true, true, 2012, 2018);
END $$;

-- Taurus
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Taurus', 'taurus') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Taurus', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'smart_key', 'M3N-A2C931426', '6th generation Taurus. Smart key with push-button start. PATS 128-bit. Ford IDS/FDRS or compatible aftermarket tool.', true, true, 2010, 2019);
END $$;

-- Transit
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ford';
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Transit', 'transit') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ford Transit', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'transponder', 'M3N-A2C93142600', 'Full-size van. PATS 128-bit transponder key. Standard key with remote head. Ford IDS/FDRS or aftermarket tool required. PIN code often needed.', true, true, 2015, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_chevrolet
-- ============================================
-- Chevrolet models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chevrolet';

  -- Silverado
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Silverado', 'silverado') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Silverado', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Prox key system. Requires GM Tech 2 or SPS/TIS2Web. All-keys-lost requires IMMO reset.', true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Silverado', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N-32337100', 'PK3+ transponder. OBD programmable with 10-minute relearn procedure.', true, 2014, 2018);

  -- Equinox
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Equinox', 'equinox') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Equinox', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4AA', 'Proximity key. GM Tech 2 or compatible aftermarket tool.', true, 2018, 2024);

  -- Malibu
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Malibu', 'malibu') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Malibu', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4EA', 'Smart key with push-button start. OBD programmable.', true, 2016, 2024);

  -- Traverse
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Traverse', 'traverse') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chevrolet Traverse', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4AA', 'Smart proximity key. GM SPS or compatible tool required.', true, 2018, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_nissan
-- ============================================
-- Nissan models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'nissan';

  -- Altima
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Altima', 'altima') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Altima', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'Intelligent key. Requires Nissan CONSULT or compatible aftermarket tool.', true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Altima', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR5S180144014', 'Intelligent key system. CONSULT III or aftermarket tool.', true, 2013, 2018);

  -- Rogue
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Rogue', 'rogue') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Rogue', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'Intelligent key. Nissan CONSULT or aftermarket programmer.', true, 2021, 2024);

  -- Sentra
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sentra', 'sentra') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Nissan Sentra', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'Push-button start with intelligent key. CONSULT required.', true, 2020, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_dodge
-- ============================================
-- Dodge models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'dodge';

  -- Charger
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Charger', 'charger') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Charger', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Fobik smart key with push-button start. Requires Autel IM608, SmartPro, or wiTECH for programming. All-keys-lost requires PIN from CAN bus or dealer. Emergency blade Y159 for door entry only.', true, true, 2015, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Charger', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N-40821302', 'Y160', 'Fobik key. Uses Hitag2 transponder. OBD programmable with PIN code. PIN can be retrieved from CAN bus via Autel, SmartPro, or Abrites. Emergency key blade Y160.', true, true, 2011, 2014);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2006, 2010) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Charger', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'First generation Fobik key. PIN code required for programming. Retrieve PIN from dealer or CAN bus. OBD programmable with compatible tool. Emergency blade Y160.', true, true, 2006, 2010);

  -- Challenger
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Challenger', 'challenger') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Challenger', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Fobik smart key. 2019+ uses Hitag AES (4A chip). 2015-2018 uses Hitag2 (46 chip) but same FCC ID. Requires PIN from CAN bus for all-keys-lost. OBD programmable with Autel IM608, SmartPro, or wiTECH.', true, true, 2015, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Challenger', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'Fobik key with Hitag2 transponder. PIN required for programming. PIN from dealer or CAN bus. Some 2008-2009 models may use IYZ-C01C FCC ID. Emergency blade Y160.', true, true, 2008, 2014);

  -- Durango
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Durango', 'durango') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Durango', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Fobik smart key with Hitag AES transponder. Push-button start. Requires wiTECH, Autel IM608, or SmartPro. All-keys-lost requires PIN from CAN bus. Emergency blade Y159.', true, true, 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Durango', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'GQ4-54T', 'Y160', 'Fobik key with Hitag2 transponder. OBD programmable with PIN code. 2014-2018 uses GQ4-54T FCC ID. Some 2019-2020 may transition to Hitag AES. PIN from CAN bus or dealer.', true, true, 2014, 2020);

  -- Journey
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Journey', 'journey') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Journey', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N5WY783X', 'Y160', 'Fobik key. Uses Hitag2 transponder (46 chip). PIN code required for programming, retrieve via CAN bus or dealer. OBD programmable. Some base models may have standard transponder key Y160 without Fobik. Emergency blade Y160.', true, true, 2011, 2020);

  -- Grand Caravan
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Grand Caravan', 'grand-caravan') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Dodge Grand Caravan', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N5WY783X', 'Y160', 'Fobik key with integrated remote. Hitag2 transponder. PIN code required for all-keys-lost. Some 2008-2010 models use IYZ-C01C FCC ID. OBD programmable with PIN. Emergency key blade Y160 for door/ignition backup.', true, true, 2008, 2020);

END $$;


-- ============================================
-- SEED DATA: automotive_ram
-- ============================================
-- Ram models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'ram';

  -- Ram 1500
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '1500', '1500') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ram 1500', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'OHT4882056', 'Y159', '5th gen Ram 1500. Fobik smart key with Hitag AES transponder. Push-button start standard. Requires Autel IM608, SmartPro, Abrites, or wiTECH. All-keys-lost requires PIN from CAN bus. Emergency blade Y159 for door only.', true, true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ram 1500', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'GQ4-54T', 'Y160', '4th gen Ram 1500. Fobik key with Hitag2 transponder. PIN required for programming. PIN retrievable from CAN bus or dealer. OBD programmable. Some base models may use standard Y160 transponder key without Fobik remote.', true, true, 2013, 2018);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2012) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Ram 1500', 'Y164-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N5WY783X', 'Y164', 'Fobik key. Early Ram brand models (separated from Dodge in 2009). Hitag2 transponder with 46 chip. PIN code required. Some 2009 models may still be titled as Dodge Ram. OBD programmable with PIN. Emergency blade Y164.', true, true, 2009, 2012);

END $$;


-- ============================================
-- SEED DATA: automotive_chrysler
-- ============================================
-- Chrysler models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'chrysler';

  -- 300
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '300', '300') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler 300', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Fobik smart key with Hitag AES transponder. Push-button start. 2019+ models use 4A chip. Requires Autel IM608, SmartPro, or wiTECH. All-keys-lost requires PIN from CAN bus. Emergency blade Y159.', true, true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler 300', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N-40821302', 'Y160', 'Fobik key with Hitag2 transponder (46 chip). PIN code required for programming. Retrieve PIN from CAN bus or dealer. OBD programmable. Same platform as Dodge Charger. Emergency blade Y160.', true, true, 2011, 2018);

  -- Pacifica
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Pacifica', 'pacifica') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler Pacifica', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-97395900', 'Y159', 'Fobik smart key. 2017-2018 uses Hitag2 (46 chip), 2019+ uses Hitag AES (4A chip). Push-button start. Requires Autel IM608, SmartPro, or wiTECH. PIN required for all-keys-lost via CAN bus. Some models have KeySense feature (speed-limited key).', true, true, 2017, 2024);

  -- Town & Country
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Town & Country', 'town-and-country') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler Town & Country', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N5WY783X', 'Y160', 'Fobik key with integrated remote. Hitag2 transponder. PIN required for programming via CAN bus or dealer. OBD programmable. Replaced by Pacifica in 2017. Some 2008-2010 may use IYZ-C01C FCC ID. Emergency blade Y160.', true, true, 2008, 2016);

  -- 200
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '200', '200') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler 200', 'Y159-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Second generation Chrysler 200. Smart proximity key with push-button start. Fobik style. PIN required for all-keys-lost. OBD programmable. Emergency blade Y159.', true, true, 2015, 2017);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Chrysler 200', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'M3N-40821302', 'Y160', 'First generation Chrysler 200 (replaced Sebring). Fobik key with Hitag2 transponder. PIN code required. OBD programmable with PIN from CAN bus or dealer. Emergency blade Y160.', true, true, 2011, 2014);

END $$;


-- ============================================
-- SEED DATA: automotive_jeep
-- ============================================
-- Jeep models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'jeep';

  -- Wrangler
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Wrangler', 'wrangler') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Wrangler JL', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'OHT1130261', 'Y159', 'JL generation Wrangler. Fobik smart key with Hitag AES transponder. Push-button start on most trims. Requires Autel IM608, SmartPro, or wiTECH. PIN required for all-keys-lost via CAN bus. Emergency blade Y159 for door entry.', true, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Wrangler JK', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'JK generation Wrangler. Fobik key with Hitag2 transponder. PIN required for programming. OBD programmable with PIN from CAN bus or dealer. 2007-2011 may use different key blade profile. Emergency blade Y160.', true, true, 2007, 2017);

  -- Grand Cherokee
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Grand Cherokee', 'grand-cherokee') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Grand Cherokee WL', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'WL generation Grand Cherokee. Fobik smart key with Hitag AES (4A chip). Push-button start standard. Requires Autel IM608, SmartPro, or wiTECH. All-keys-lost requires PIN from CAN bus. Also available as Grand Cherokee L (3-row). Emergency blade Y159.', true, true, 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Grand Cherokee WK2', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'GQ4-54T', 'Y160', 'WK2 generation. Fobik key with Hitag2 transponder (46 chip). PIN code required for programming. OBD programmable. 2019+ may have transitioned to Hitag AES on some builds. PIN from CAN bus or dealer. Emergency blade Y160.', true, true, 2014, 2021);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2005, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Grand Cherokee WK', 'Y160-PT', 'Hitag2 PCF7941', 'Hitag2 46', '433 MHz', 'smart_key', 'OHT692427AA', 'Y160', 'WK/WK2 generation. 2008+ uses Fobik key. 2005-2007 uses Y160 transponder key with separate remote (FCC: OHT692427AA). PIN required for all-keys-lost. OBD programmable. Emergency blade Y160.', true, true, 2005, 2013);

  -- Cherokee
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Cherokee', 'cherokee') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Cherokee KL', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'GQ4-54T', 'Y159', 'KL generation Cherokee. 2014-2018 uses Hitag2 (46 chip), 2019+ uses Hitag AES (4A chip). Fobik smart key with push-button start. PIN required for all-keys-lost. OBD programmable. Requires Autel IM608, SmartPro, or wiTECH. Emergency blade Y159.', true, true, 2014, 2024);

  -- Compass
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Compass', 'compass') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Compass MP', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'Y159', 'Second generation Compass (MP platform). Fobik smart key. 2017-2018 uses Hitag2 (46 chip), 2019+ uses Hitag AES (4A chip). Push-button start on higher trims. PIN required for all-keys-lost. OBD programmable. Emergency blade Y159.', true, true, 2017, 2024);

  -- Gladiator
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Gladiator', 'gladiator') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Gladiator JT', 'Y159-PT', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'OHT1130261', 'Y159', 'JT Gladiator pickup. Same platform as Wrangler JL. Fobik smart key with Hitag AES transponder. Push-button start on most trims. Requires Autel IM608, SmartPro, or wiTECH. PIN required for all-keys-lost via CAN bus. Emergency blade Y159.', true, true, 2020, 2024);

  -- Renegade
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Renegade', 'renegade') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, emergency_key_blank, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jeep Renegade BU', 'SIP22', 'Hitag AES', 'Hitag AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'SIP22', 'Built on Fiat Small Wide platform (shared with Fiat 500X). Uses SIP22 key blade (not Y159/Y160). 2015-2017 uses Hitag2 (46 chip), 2018+ uses Hitag AES (4A chip). Smart key with push-button start. PIN required for all-keys-lost. OBD programmable with Autel IM608, SmartPro, or wiTECH.', true, true, 2015, 2024);

END $$;


-- ============================================
-- SEED DATA: automotive_hyundai
-- ============================================
-- Hyundai models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'hyundai';

  -- Elantra
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Elantra', 'elantra') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Elantra', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F27', 'Program via Autel IM508/IM608, SmartPro, or VVDI Key Tool Max. PIN code from immobilizer ECU dump or OBD. All keys lost requires PIN from ECU.', true, true, 'HY22', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Elantra', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'CQOFD00120', 'Smart key programming via Autel, SmartPro, or VVDI. PIN from immobilizer ECU or OBD reading. Proximity system with push-button start.', true, true, 'HY22', 2017, 2020);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Elantra', 'HY15', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'OSLOKA-360T', 'Standard transponder key. OBD programmable with PIN code. PIN extracted from immobilizer ECU or dealer. Aftermarket tools: SmartPro, Zedfull.', true, true, 2011, 2016);

  -- Sonata
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sonata', 'sonata') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Sonata', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F11', 'Program via Autel IM508/IM608, SmartPro, or VVDI Key Tool Max. Digital Key support on some trims. PIN from immobilizer ECU. All keys lost requires PIN extraction.', true, true, 'HY22', 2020, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Sonata', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'CQOFD00120', 'Smart proximity key. Program via OBD with PIN code. Tools: Autel IM508, SmartPro, VVDI. PIN from immobilizer unit or OBD extraction.', true, true, 'HY22', 2015, 2019);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Sonata', 'HY15', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'SY5HMFNA04', 'Transponder key with remote. OBD programmable with PIN. PIN code from immobilizer ECU. Tools: SmartPro, Zedfull, Autel.', true, true, 2011, 2014);

  -- Tucson
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Tucson', 'tucson') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Tucson', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F27', 'New generation smart key with Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU. All keys lost supported with PIN.', true, true, 'HY22', 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Tucson', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F11', 'Smart key with push-button start. OBD programming with PIN. Autel IM508/608, SmartPro, or VVDI. PIN from immobilizer ECU via OBD.', true, true, 'HY22', 2016, 2021);

  -- Santa Fe
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Santa Fe', 'santa-fe') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Santa Fe', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F19', 'Smart proximity key with Hitag AES. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required. Some 2019 models may use Hitag 3 (47 chip).', true, true, 'HY22', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Santa Fe', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5DMFNA433', 'Smart key system. OBD programmable with PIN code. Tools: Autel IM508, SmartPro, VVDI. PIN extracted from immobilizer ECU.', true, true, 'HY22', 2013, 2018);

  -- Kona
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Kona', 'kona') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Kona', 'HY22', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F11', 'Smart key with push-button start. 2018-2019 uses Hitag 3 (47 chip). 2020+ may use Hitag AES (4A chip). OBD programmable with PIN. Tools: Autel, SmartPro, VVDI.', true, true, 'HY22', 2018, 2024);

  -- Palisade
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Palisade', 'palisade') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Palisade', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F19', 'Premium smart key system. Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU. All keys lost requires PIN extraction from immobilizer.', true, true, 'HY22', 2020, 2024);

  -- Venue
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Venue', 'venue') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Venue', 'HY22', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5IGFGE04', 'Smart key with proximity. Some base trims may use standard flip key with transponder. OBD programmable with PIN. Tools: Autel IM508, SmartPro, VVDI.', true, true, 'HY22', 2020, 2024);

  -- Accent
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Accent', 'accent') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Hyundai Accent', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5IGFGE04', 'Smart key available on higher trims. Base trims use flip key with Hitag 3 transponder. OBD programmable with PIN. Tools: Autel IM508, SmartPro, VVDI.', true, true, 'HY22', 2018, 2024);

END $$;


-- ============================================
-- SEED DATA: automotive_kia
-- ============================================
-- Kia models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'kia';

  -- Forte
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Forte', 'forte') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Forte', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'CQOFD00120', 'Smart key with push-button start. Hitag AES on 2020+ models, 2019 may use Hitag 3. Program via Autel IM508/IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU.', true, true, 'HY22', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Forte', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'CQOFD00120', 'Smart key on higher trims. Base trims use flip key with transponder. OBD programmable with PIN. Tools: SmartPro, Autel IM508, VVDI. PIN from immobilizer ECU.', true, true, 'HY22', 2014, 2018);

  -- K5 (formerly Optima)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'K5', 'k5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia K5', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F24', 'Replaces the Optima nameplate. Smart key with Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU dump or OBD.', true, true, 'HY22', 2021, 2024);

  -- Optima
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Optima', 'optima') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Optima', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5JFFGE04', 'Smart key with proximity. OBD programmable with PIN code. Tools: Autel IM508, SmartPro, VVDI. PIN from immobilizer ECU via OBD extraction.', true, true, 'HY22', 2016, 2020);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Optima', 'HY15', 'Philips 46', '46 chip', '315 MHz', 'transponder', 'SY5HMFNA04', 'Transponder key with remote head. OBD programmable with PIN code. PIN from immobilizer ECU or dealer. Tools: SmartPro, Zedfull, Autel.', true, true, 2011, 2015);

  -- Sportage
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sportage', 'sportage') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Sportage', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F27', 'New generation Sportage. Smart key with Hitag AES. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN from ECU. All keys lost supported.', true, true, 'HY22', 2023, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Sportage', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F08', 'Smart key with push-button start. OBD programmable with PIN. 2020+ may use Hitag AES (4A). Tools: Autel IM508/608, SmartPro, VVDI.', true, true, 'HY22', 2017, 2022);

  -- Sorento
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sorento', 'sorento') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Sorento', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F24', 'Smart key with Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU. All keys lost requires PIN extraction.', true, true, 'HY22', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Sorento', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F06', 'Smart proximity key. OBD programmable with PIN code. Tools: Autel IM508, SmartPro, VVDI. PIN from immobilizer ECU via OBD.', true, true, 'HY22', 2016, 2020);

  -- Telluride
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Telluride', 'telluride') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Telluride', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F24', 'Premium smart key system. Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU. All keys lost supported with PIN extraction.', true, true, 'HY22', 2020, 2024);

  -- Soul
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Soul', 'soul') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Soul', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'SY5SKFGE04', 'Smart key with push-button start. Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN from ECU required.', true, true, 'HY22', 2020, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Soul', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'CQOFD00120', 'Smart key on higher trims. Base uses flip key transponder. OBD programmable with PIN. Tools: SmartPro, Autel IM508, VVDI. PIN from immobilizer ECU.', true, true, 'HY22', 2014, 2019);

  -- Seltos
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Seltos', 'seltos') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Kia Seltos', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'SY5SKFGE04', 'Smart key with proximity. Hitag AES encryption. Program via Autel IM508/IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU. All keys lost supported.', true, true, 'HY22', 2021, 2024);

END $$;


-- ============================================
-- SEED DATA: automotive_genesis
-- ============================================
-- Genesis models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'genesis';

  -- G70
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'G70', 'g70') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Genesis G70', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F17', 'Luxury smart key with Hitag AES encryption. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from immobilizer ECU. 2019-2020 models may use Hitag 3 (47 chip). All keys lost requires PIN extraction.', true, true, 'HY22', 2019, 2024);

  -- G80
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'G80', 'g80') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Genesis G80', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F35', 'New generation G80. Hitag AES encryption with advanced smart key. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN from immobilizer ECU required. Digital Key support on select trims.', true, true, 'HY22', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Genesis G80', 'HY18R', 'Hitag 3', '47 chip', '433 MHz', 'smart_key', 'SY5DHFNA433', 'Smart key with proximity. Hitag 3 transponder. OBD programmable with PIN code. Tools: Autel IM508/IM608, SmartPro, VVDI. PIN from immobilizer ECU via OBD.', true, true, 'HY22', 2017, 2020);

  -- GV70
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GV70', 'gv70') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Genesis GV70', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F35', 'Luxury compact SUV. Hitag AES smart key system. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from ECU. All keys lost supported with PIN extraction. Digital Key available on select trims.', true, true, 'HY22', 2022, 2024);

  -- GV80
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GV80', 'gv80') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Genesis GV80', 'HY22', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'TQ8-FOB-4F35', 'Flagship SUV. Hitag AES smart key with advanced proximity. Program via Autel IM608, SmartPro, VVDI Key Tool Max. PIN required from immobilizer ECU. All keys lost requires PIN extraction. Digital Key support.', true, true, 'HY22', 2021, 2024);

END $$;


-- ============================================
-- SEED DATA: automotive_subaru
-- ============================================
-- Subaru models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'subaru';

  -- Outback
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Outback', 'outback') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Outback', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'Requires Subaru Select Monitor (SSM) IV or compatible aftermarket tool (Autel, SmartPro). All keys must be present during programming. Push-button start system.', false, true, 2020, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Outback', 'DAT17', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHC', 'Smart key system. Program via SSM III/IV or aftermarket tool. Proximity entry and push-button start.', false, true, 2015, 2019);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Outback', 'NSN19', 'Texas Fixed Code', '4D62', '315 MHz', 'transponder', 'CWTWB1U811', 'Transponder key with separate remote. OBD programmable with aftermarket tools. Pincode may be needed for all-keys-lost.', true, true, 2010, 2014);

  -- Forester
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Forester', 'forester') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Forester', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'Push-button start with proximity entry. Requires SSM IV or Autel IM608/SmartPro. All keys must be present.', false, true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Forester', 'DAT17', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHC', 'Smart key. Program via SSM III or aftermarket. Some trims use transponder key without push-button start.', false, true, 2014, 2018);

  -- Crosstrek
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Crosstrek', 'crosstrek') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Crosstrek', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'Push-button start. SSM IV or compatible aftermarket tool required. All keys must be registered together.', false, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Crosstrek', 'DAT17', 'Texas Fixed Code', '4D62', '315 MHz', 'transponder', 'CWTWB1U811', 'Transponder key with separate remote fob. OBD programmable. Pin code required for all-keys-lost via aftermarket tool.', true, true, 2013, 2017);

  -- Impreza
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Impreza', 'impreza') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Impreza', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'Push-button start on most trims. SSM IV or aftermarket tool. Base trims may use standard transponder key (DAT17).', false, true, 2017, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Impreza', 'NSN19', 'Texas Fixed Code', '4D62', '315 MHz', 'transponder', 'CWTWB1U811', 'Transponder key with separate remote. OBD programming available. Pin code needed for all-keys-lost situations.', true, true, 2012, 2016);

  -- WRX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'WRX', 'wrx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru WRX', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'New generation WRX. Push-button start standard. SSM IV or Autel/SmartPro required for programming.', false, true, 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru WRX', 'DAT17', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHC', 'Smart key on Limited/Premium trims. Base uses transponder key. SSM III/IV or aftermarket tool.', false, true, 2015, 2021);

  -- Legacy
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Legacy', 'legacy') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Legacy', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'Push-button start standard. SSM IV or compatible aftermarket tool. All existing keys must be present during registration.', false, true, 2020, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Legacy', 'DAT17', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHC', 'Smart key system. SSM III or aftermarket programmer. Proximity entry and push-button start on most trims.', false, true, 2015, 2019);

  -- Ascent
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Ascent', 'ascent') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Subaru Ascent', 'SUB44', 'Hitag 128-bit AES', 'H chip (8A)', '433 MHz', 'smart_key', 'HYQ14AHK', 'Push-button start standard on all trims. SSM IV or Autel IM608/SmartPro. All keys must be present for registration.', false, true, 2019, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_mazda
-- ============================================
-- Mazda models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mazda';

  -- CX-5
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CX-5', 'cx-5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda CX-5', 'MAZ24R', 'Hitag Pro', '49 chip (Hitag Pro)', '315 MHz', 'smart_key', 'WAZSKE13D03', 'Push-button start. Requires Mazda IDS/M-MDS or aftermarket tool (Autel, SmartPro). Must register all keys at once.', false, true, 2017, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda CX-5', 'MAZ24R', 'Hitag 3', '49 chip', '315 MHz', 'smart_key', 'WAZSKE13D01', 'Smart key system. Mazda IDS or compatible aftermarket tool required. Proximity entry and push-button start.', false, true, 2013, 2016);

  -- CX-9
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CX-9', 'cx-9') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda CX-9', 'MAZ24R', 'Hitag Pro', '49 chip (Hitag Pro)', '315 MHz', 'smart_key', 'WAZSKE13D03', 'Push-button start standard. Mazda IDS or aftermarket tool (Autel IM608, XTOOL). All keys must be present during programming.', false, true, 2016, 2024);

  -- CX-30
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CX-30', 'cx-30') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda CX-30', 'MAZ24R', 'Hitag Pro', '49 chip (Hitag Pro)', '315 MHz', 'smart_key', 'WAZSKE13D03', 'Push-button start. Mazda IDS/M-MDS or Autel IM608. Must program all keys simultaneously. Emergency key blade included in fob.', false, true, 2020, 2024);

  -- Mazda3
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Mazda3', 'mazda3') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda Mazda3', 'MAZ24R', 'Hitag Pro', '49 chip (Hitag Pro)', '315 MHz', 'smart_key', 'WAZSKE13D03', '4th gen Mazda3. Push-button start. Mazda IDS or aftermarket tool required. All keys registered at once.', false, true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda Mazda3', 'MAZ24R', 'Hitag 3', '49 chip', '315 MHz', 'smart_key', 'WAZSKE13D01', '3rd gen Mazda3. Smart key with push-button start on select trims. Mazda IDS or compatible aftermarket programmer.', false, true, 2014, 2018);

  -- Mazda6
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Mazda6', 'mazda6') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda Mazda6', 'MAZ24R', 'Hitag 3', '49 chip', '315 MHz', 'smart_key', 'WAZSKE13D01', 'Smart key with push-button start. Mazda IDS or aftermarket tool. Discontinued after 2021 model year.', false, true, 2014, 2021);

  -- MX-5 Miata
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'MX-5 Miata', 'mx-5-miata') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda MX-5 Miata', 'MAZ24R', 'Hitag Pro', '49 chip (Hitag Pro)', '315 MHz', 'smart_key', 'SKE13D-02', 'ND generation Miata. Push-button start on Grand Touring and above. Mazda IDS or aftermarket programmer.', false, true, 2016, 2024);

  -- CX-50
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CX-50', 'cx-50') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mazda CX-50', 'MAZ24R', 'Hitag Pro', '49 chip (Hitag Pro)', '315 MHz', 'smart_key', 'WAZSKE13D03', 'Push-button start standard. Built on Mazda large platform. Mazda IDS or Autel IM608. Emergency key blade included in fob.', false, true, 2023, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_mitsubishi
-- ============================================
-- Mitsubishi models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mitsubishi';

  -- Outlander
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Outlander', 'outlander') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Outlander', 'MIT11R', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'OUCJ166N', 'New generation on Nissan-Renault platform. Smart key system. Requires MUT-III or compatible aftermarket tool (Autel, SmartPro). All keys must be present.', false, true, 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Outlander', 'MIT11R', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'OUC644M-KEY-N', 'Smart key with push-button start. Program via MUT-III or aftermarket tool. Pincode from BCM may be required for all-keys-lost.', true, true, 2014, 2021);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Outlander', 'MIT3', 'Philips Crypto', '46 chip', '315 MHz', 'transponder', 'OUC644M-KEY-N', 'Transponder key with separate remote. Philips 46 chip. MUT-III or aftermarket tool. Pin code from dealer may be required.', true, true, 2007, 2013);

  -- Eclipse Cross
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Eclipse Cross', 'eclipse-cross') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Eclipse Cross', 'MIT11R', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'OUCJ166N', 'Smart key with push-button start. MUT-III or aftermarket programmer. 2022+ facelift uses updated firmware. All keys programmed simultaneously.', false, true, 2018, 2024);

  -- Outlander Sport
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Outlander Sport', 'outlander-sport') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Outlander Sport', 'MIT11R', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'OUCJ166N', 'Smart key on SE and above trims. Push-button start. MUT-III or aftermarket tool required.', false, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Outlander Sport', 'MIT11R', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'OUC644M-KEY-N', 'Smart key on higher trims. Base models use transponder key (MIT3). MUT-III or aftermarket tool. Pin code may be required.', true, true, 2011, 2017);

  -- Mirage
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Mirage', 'mirage') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Mirage', 'MIT11R', 'Hitag 2', '46 chip', '315 MHz', 'transponder', 'OUC644M-KEY-N', 'Transponder key with separate remote on most trims. No push-button start on base models. MUT-III or aftermarket OBD tool. Budget-friendly key replacement.', true, true, 2014, 2024);

  -- Lancer
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Lancer', 'lancer') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mitsubishi Lancer', 'MIT3', 'Philips Crypto', '46 chip', '315 MHz', 'transponder', 'OUC644M-KEY-N', 'Transponder key with separate remote fob. Philips 46 chip. MUT-III or aftermarket tool. Evolution models may have smart key option. Discontinued after 2017.', true, true, 2008, 2017);
END $$;


-- ============================================
-- SEED DATA: automotive_volvo
-- ============================================
-- Volvo models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volvo';

  -- XC90
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XC90', 'xc90') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volvo XC90', 'Smart Key Fob Only', 'Hitag Pro AES', '128-bit AES', '433 MHz', 'smart_key', 'KR5V2X', 'SPA platform. Fully keyless system. Requires Volvo VIDA/DiCE or dealer programming. Aftermarket support limited (Lonsdor, VVDI). Emergency key blade NE66 included in fob.', false, false, 'NE66', 2016, 2024);

  -- XC60
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XC60', 'xc60') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volvo XC60', 'Smart Key Fob Only', 'Hitag Pro AES', '128-bit AES', '433 MHz', 'smart_key', 'KR5V2X', 'SPA platform. Fully keyless with push-button start. Volvo VIDA/DiCE required. Limited aftermarket support. Emergency blade NE66 stored in fob casing.', false, false, 'NE66', 2018, 2024);

  -- XC40
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XC40', 'xc40') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volvo XC40', 'Smart Key Fob Only', 'Hitag Pro AES', '128-bit AES', '433 MHz', 'smart_key', 'KR5V2X', 'CMA platform. Fully keyless system. Volvo VIDA/DiCE or dealer only. Some aftermarket tools gaining support (Lonsdor K518). Emergency key blade NE66. EV Recharge models same key system.', false, false, 'NE66', 2019, 2024);

  -- S60
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'S60', 's60') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volvo S60', 'Smart Key Fob Only', 'Hitag Pro AES', '128-bit AES', '433 MHz', 'smart_key', 'KR5V2X', 'SPA platform. Fully keyless system with push-button start. Volvo VIDA/DiCE or dealer programming. Emergency key blade NE66 hidden in fob.', false, false, 'NE66', 2019, 2024);

  -- V60
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'V60', 'v60') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volvo V60', 'Smart Key Fob Only', 'Hitag Pro AES', '128-bit AES', '433 MHz', 'smart_key', 'KR5V2X', 'SPA platform. Same key system as S60/XC60. Volvo VIDA/DiCE or dealer only. Cross Country variant uses identical key system. Emergency blade NE66.', false, false, 'NE66', 2019, 2024);

  -- S90
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'S90', 's90') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volvo S90', 'Smart Key Fob Only', 'Hitag Pro AES', '128-bit AES', '433 MHz', 'smart_key', 'KR5V2X', 'SPA platform flagship sedan. Fully keyless with push-button start. Volvo VIDA/DiCE required for programming. Very limited aftermarket support. Emergency key blade NE66.', false, false, 'NE66', 2017, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_bmw
-- ============================================
-- BMW models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'bmw';

  -- 3 Series (G20 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '3 Series', '3-series') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 3 Series (G20)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'BDC/FEM system. Requires ISTA+, Autel IM608 Pro, or Xhorse VVDI2/VVDI BMW. ISN (IMMO Secret Number) required from DME — read via OBD or bench. All keys lost requires ISN read from ECU. Comfort Access standard.', true, false, 'HU100R', 2019, 2024);

  -- 3 Series (F30 2012-2018)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 3 Series (F30)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS4)', '315 MHz / 433 MHz', 'smart_key', 'KR55WK49863', 'CAS4/CAS4+ system. Program via ISTA, Autel IM608 Pro, VVDI2, or Yanhua ACDP. ISN required — read CAS4 via OBD or remove for bench read. Supports add key and all keys lost.', true, true, 'HU92R', 2012, 2018);

  -- 5 Series (G30 2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '5 Series', '5-series') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 5 Series (G30)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'FEM/BDC system (2017-2018), BDC module (2019+). Requires ISTA+, Autel IM608 Pro, or VVDI2/VVDI BMW. ISN read from DME required. Display Key option available on some trims. All keys lost: read ISN from ECU via bench or OBD.', true, false, 'HU100R', 2017, 2024);

  -- 5 Series (F10 2011-2016)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 5 Series (F10)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS4)', '315 MHz / 433 MHz', 'smart_key', 'YGOHUF5767', 'CAS4/CAS4+ system. ISN required from CAS module. Program via ISTA, Autel IM608 Pro, VVDI2, or Yanhua ACDP. CAS4 can be read via OBD on earlier models; CAS4+ may require bench.', true, true, 'HU92R', 2011, 2016);

  -- X3 (G01 2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'X3', 'x3') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X3 (G01)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'FEM/BDC system. Requires ISTA+, Autel IM608 Pro, or VVDI2. ISN required from DME. Comfort Access standard on most trims. All keys lost requires ISN read from ECU.', true, false, 'HU100R', 2018, 2024);

  -- X3 (F25 2011-2017)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X3 (F25)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS4)', '315 MHz / 433 MHz', 'smart_key', 'KR55WK49863', 'CAS4/CAS4+ immobilizer. ISN required from CAS module. Program via ISTA, VVDI2, or Autel IM608 Pro. OBD programmable on CAS4; CAS4+ may require bench read.', true, true, 'HU92R', 2011, 2017);

  -- X5 (G05 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'X5', 'x5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X5 (G05)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'N5F-ID2A', 'BDC system. Requires ISTA+, Autel IM608 Pro, or VVDI2/VVDI BMW. ISN from DME required. Display Key available as option. All keys lost: bench read ISN from ECU.', true, false, 'HU100R', 2019, 2024);

  -- X5 (F15 2014-2018)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X5 (F15)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS4+)', '315 MHz / 433 MHz', 'smart_key', 'N5F-ID2A', 'CAS4+ system. ISN read required from CAS module — bench read recommended. Program via ISTA, VVDI2, Autel IM608 Pro, or Yanhua ACDP. Comfort Access equipped.', true, true, 'HU92R', 2014, 2018);

  -- X1 (2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'X1', 'x1') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X1 (F48/U11)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'FEM/BDC system. Requires ISTA+, Autel IM608 Pro, or VVDI2. ISN from DME required. F48 (2016-2022) uses FEM, U11 (2023+) uses BDC. All keys lost supported with ISN.', true, false, 'HU100R', 2016, 2024);

  -- 7 Series (G11/G70 2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '7 Series', '7-series') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 7 Series (G11/G70)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'N5F-ID2A', 'FEM/BDC system. Display Key standard on 2016+. Requires ISTA+ or Autel IM608 Pro. ISN from DME required. All keys lost: read ISN via bench from ECU. High-security programming.', true, false, 'HU100R', 2016, 2024);

  -- 4 Series (G22 2021-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '4 Series', '4-series') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW 4 Series (G22)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'IDGNG1', 'BDC system. Same platform as G20 3 Series. Requires ISTA+, Autel IM608 Pro, or VVDI2. ISN from DME required. Comfort Access standard.', true, false, 'HU100R', 2021, 2024);

  -- X7 (G07 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'X7', 'x7') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'BMW X7 (G07)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '433 MHz', 'smart_key', 'N5F-ID2A', 'BDC system. Display Key available. Requires ISTA+, Autel IM608 Pro, or VVDI2/VVDI BMW. ISN from DME required. All keys lost: bench read ISN from ECU. High-security vehicle.', true, false, 'HU100R', 2019, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_lexus
-- ============================================
-- Lexus models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lexus';

  -- RX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'RX', 'rx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus RX500h', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FLB', 'Requires Toyota Techstream or aftermarket tool (Autel, Xhorse). All keys must be present during programming. New platform (RX 5th gen).', false, true, 'TOY48', 2023, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus RX350', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBA', 'Smart key system. Program via Toyota Techstream or aftermarket (Autel, Xhorse). All existing keys must be present.', false, true, 'TOY48', 2016, 2022);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus RX350', 'TOY48', 'Texas Fixed Code', 'D chip (4D-67/4D-68)', '315 MHz', 'smart_key', 'HYQ14AAB', 'Older smart key system. Texas 4D transponder. Techstream or aftermarket tool required. All keys must be present.', false, true, 'TOY48', 2010, 2015);

  -- ES
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'ES', 'es') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus ES350', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'Smart key system (7th gen ES). Program via Toyota Techstream or aftermarket tool. All keys must be present during programming.', false, true, 'TOY48', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus ES350', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBA', 'Smart key. Techstream or aftermarket programmer. All keys must be present.', false, true, 'TOY48', 2013, 2018);

  -- NX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'NX', 'nx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus NX', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', '2nd gen NX. Smart key system. Toyota Techstream or aftermarket tool (Autel, Xhorse). All keys must be present.', false, true, 'TOY48', 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus NX', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBA', '1st gen NX. Smart key. Techstream or aftermarket tool required. All keys present during programming.', false, true, 'TOY48', 2015, 2021);

  -- IS
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'IS', 'is') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus IS', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'IS facelift (2021+). Smart key system. Techstream or aftermarket tool. All keys must be present.', false, true, 'TOY48', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus IS', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBA', '3rd gen IS. Smart key. Toyota Techstream or aftermarket programmer required. All keys present.', false, true, 'TOY48', 2014, 2020);

  -- GX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GX', 'gx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2024, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus GX550', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FLB', 'All-new GX550 platform (2024+). Smart key. Techstream or aftermarket tool. All keys must be present.', false, true, 'TOY48', 2024, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2023) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus GX460', 'TOY48', 'Texas Fixed Code', 'D chip (4D-67/4D-68)', '315 MHz', 'smart_key', 'HYQ14AAB', 'GX460 smart key system. Texas 4D transponder. Techstream or aftermarket tool. All keys must be present during programming.', false, true, 'TOY48', 2010, 2023);

  -- UX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'UX', 'ux') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus UX', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'Subcompact crossover. Smart key system. Techstream or aftermarket tool (Autel, Xhorse). All keys must be present.', false, true, 'TOY48', 2019, 2024);

  -- LC
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'LC', 'lc') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus LC', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FBK', 'Flagship coupe. Smart key system. Toyota Techstream or aftermarket tool. All keys must be present during programming.', false, true, 'TOY48', 2018, 2024);

  -- LX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'LX', 'lx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lexus LX600', 'TOY51', 'Texas Crypto 128-bit AES', 'H chip (8A)', '315 MHz', 'smart_key', 'HYQ14FLB', 'LX600 (4th gen, TNGA-F platform). Smart key. Techstream or aftermarket tool. All keys must be present.', false, true, 'TOY48', 2022, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_mercedes
-- ============================================
-- Mercedes-Benz models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mercedes-benz';

  -- C-Class (W206 2022-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'C-Class', 'c-class') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz C-Class (W206)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS4 system. Requires VVDI MB Tool, Autel IM608 Pro with G-Box3, or dealer XENTRY. EIS/EZS read required for all keys lost — must read NEC chip on EZS. Keyless Go standard. Password calculation via server.', true, false, 'HU64', 2022, 2024);

  -- C-Class (W205 2015-2021)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz C-Class (W205)', 'Smart Key Fob', 'Hitag Pro', 'NEC Pro', '315 MHz', 'smart_key', 'IYZDC07', 'FBS3 system. Requires VVDI MB Tool, Autel IM608 with XP400 Pro, or dealer XENTRY/DAS. EIS/EZS read via OBD for key data. Keyless Go on most trims. All keys lost: read EIS via OBD or IR.', true, false, 'HU64', 2015, 2021);

  -- E-Class (W213 2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'E-Class', 'e-class') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz E-Class (W213)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS3 (2017-2019) / FBS4 (2020+). Requires VVDI MB, Autel IM608 Pro, or XENTRY. EIS/EZS data read required. Keyless Go standard. 2020+ FBS4 requires server calculation for password. All keys lost: read EZS NEC chip.', true, false, 'HU64', 2017, 2024);

  -- E-Class (W212 2010-2016)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz E-Class (W212)', 'Smart Key Fob', 'Hitag 2', 'NEC', '315 MHz', 'smart_key', 'IYZDC07', 'FBS3 system. IR key system — uses infrared for EIS communication. Requires VVDI MB Tool or dealer XENTRY/DAS. EIS read via OBD or IR adapter. All keys lost: read EIS NEC chip via OBD. Supports Keyless Go on equipped models.', true, false, 'HU64', 2010, 2016);

  -- GLC (X253 2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GLC', 'glc') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz GLC (X253/X254)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS3 (2016-2019) / FBS4 (2020+). Requires VVDI MB, Autel IM608 Pro, or XENTRY. EIS/EZS read required. Keyless Go standard. 2020+ models use FBS4 — password via server calculation. All keys lost: read EZS.', true, false, 'HU64', 2016, 2024);

  -- GLE (V167 2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GLE', 'gle') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz GLE (V167)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS4 system. Requires VVDI MB Tool with server calculation, Autel IM608 Pro with G-Box3, or dealer XENTRY. EIS/EZS read required. Keyless Go standard. All keys lost: read EZS NEC chip and calculate password via server.', true, false, 'HU64', 2020, 2024);

  -- GLE (W166 2016-2019)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz GLE (W166)', 'Smart Key Fob', 'Hitag Pro', 'NEC Pro', '315 MHz', 'smart_key', 'IYZDC07', 'FBS3 system. Requires VVDI MB Tool or dealer XENTRY/DAS. EIS read via OBD. Keyless Go on most trims. All keys lost: read EIS NEC chip data via OBD or IR adapter.', true, false, 'HU64', 2016, 2019);

  -- S-Class (W223 2021-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'S-Class', 's-class') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz S-Class (W223)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZMS1', 'FBS4 system. High-security vehicle. Requires VVDI MB with server calculation, Autel IM608 Pro with G-Box3, or dealer XENTRY. EIS/EZS read required. All keys lost: read EZS NEC chip. Digital key via smartphone also supported.', true, false, 'HU64', 2021, 2024);

  -- S-Class (W222 2014-2020)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz S-Class (W222)', 'Smart Key Fob', 'Hitag Pro', 'NEC Pro', '315 MHz', 'smart_key', 'IYZDC07', 'FBS3 (2014-2019) / FBS4 (2020). Requires VVDI MB or dealer XENTRY. EIS read via OBD for FBS3 models. 2020 model uses FBS4 with server calculation. Keyless Go standard. All keys lost: read EIS NEC data.', true, false, 'HU64', 2014, 2020);

  -- A-Class (W177 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'A-Class', 'a-class') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz A-Class (W177)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS4 system. Requires VVDI MB with server calculation, Autel IM608 Pro, or XENTRY. EIS/EZS read required. Keyless Go standard. All keys lost: read EZS NEC chip and calculate via server.', true, false, 'HU64', 2019, 2024);

  -- GLB (X247 2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GLB', 'glb') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz GLB (X247)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS4 system. Same platform as A-Class/GLA. Requires VVDI MB with server calculation, Autel IM608 Pro, or XENTRY. EIS/EZS read required. Keyless Go standard. All keys lost: read EZS NEC chip.', true, false, 'HU64', 2020, 2024);

  -- GLA (H247 2021-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'GLA', 'gla') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mercedes-Benz GLA (H247)', 'Smart Key Fob', 'Hitag Pro AES', 'NEC AES', '315 MHz', 'smart_key', 'IYZDC11', 'FBS4 system. Same MFA2 platform as A-Class/GLB. Requires VVDI MB with server calculation, Autel IM608 Pro, or XENTRY. EIS/EZS read required. Keyless Go standard. All keys lost: read EZS NEC chip.', true, false, 'HU64', 2021, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_audi
-- ============================================
-- Audi models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'audi';

  -- A4 (B9 2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'A4', 'a4') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi A4 (B9)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 5/MQB system. Requires VVDI2 with VVDI Audi adapter, Autel IM608 Pro, or dealer ODIS. Component protection must be removed before programming. PIN from BCM2 module or dealer. All keys lost: read BCM2 data via bench or OBDII.', true, false, 'HU66', 2017, 2024);

  -- A4 (B8 2009-2016)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi A4 (B8)', 'HU66', 'Megamos 48', 'Megamos Crypto 48 (CAN)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 4 system. Requires VVDI2, Autel IM608, or dealer ODIS. Can read PIN via OBD on most models. Add key via OBD supported. All keys lost: read component protection data from instrument cluster.', true, true, 'HU66', 2009, 2016);

  -- A6 (C8 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'A6', 'a6') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi A6 (C8)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '4M0959754', 'IMMO 5/MLBevo platform. Requires VVDI2 with Audi adapter, Autel IM608 Pro, or dealer ODIS. Component protection removal required. PIN from BCM2 or dealer. All keys lost: bench read BCM2. Higher security than MQB platform.', true, false, 'HU66', 2019, 2024);

  -- A6 (C7 2012-2018)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi A6 (C7)', 'HU66', 'Hitag Pro', 'Hitag Pro ID49', '433 MHz', 'smart_key', '4M0959754', 'IMMO 4/5 system (MLBevo). Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD supported on earlier models. Component protection on later C7 models. All keys lost: read instrument cluster or BCM2 data.', true, true, 'HU66', 2012, 2018);

  -- Q5 (FY 2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Q5', 'q5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi Q5 (FY)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 5/MQB platform. Requires VVDI2 with Audi adapter, Autel IM608 Pro, or ODIS. Component protection removal required. PIN from BCM2. All keys lost: read BCM2 via bench. Advanced key with Audi connect available.', true, false, 'HU66', 2018, 2024);

  -- Q5 (8R 2009-2017)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi Q5 (8R)', 'HU66', 'Megamos 48', 'Megamos Crypto 48 (CAN)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 4 system. Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD supported. Add key OBD programmable. All keys lost: read data from instrument cluster. Comfort key on equipped models.', true, true, 'HU66', 2009, 2017);

  -- Q7 (4M 2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Q7', 'q7') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi Q7 (4M)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '4M0959754', 'IMMO 5/MLBevo platform. Requires VVDI2 with Audi adapter, Autel IM608 Pro, or ODIS. Component protection removal required. PIN from BCM2 or dealer. All keys lost: bench read BCM2 module.', true, false, 'HU66', 2017, 2024);

  -- Q7 (4L 2007-2015)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi Q7 (4L)', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'proximity', 'NBG010206T', 'IMMO 3/4 system. Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD. Add key programmable via OBD. All keys lost: read data from instrument cluster. Earlier models (2007-2010) use IMMO 3.', true, true, 'HU66', 2007, 2015);

  -- A3 (8V/8Y 2015-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'A3', 'a3') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi A3 (8V/8Y)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 5/MQB platform. 8V (2015-2020), 8Y (2021+). Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection removal required on 2020+. PIN from BCM2. All keys lost: read BCM2 via bench.', true, false, 'HU66', 2015, 2024);

  -- Q3 (F3 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Q3', 'q3') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi Q3 (F3)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 5/MQB platform. Same as A3 platform. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection removal required. PIN from BCM2. All keys lost: read BCM2 via bench.', true, false, 'HU66', 2019, 2024);

  -- e-tron (GE 2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'e-tron', 'e-tron') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi e-tron (GE)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '4M0959754', 'IMMO 5/MLBevo platform. Requires VVDI2 with Audi adapter, Autel IM608 Pro, or ODIS. Component protection removal required. PIN from BCM2. All keys lost: bench read BCM2. Electric vehicle — no traditional engine start.', true, false, 'HU66', 2019, 2024);

  -- A5 (F5 2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'A5', 'a5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Audi A5 (F5)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', 'IYZFBSB802', 'IMMO 5/MQB platform. Same as B9 A4 platform. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection removal required. PIN from BCM2. All keys lost: read BCM2 via bench.', true, false, 'HU66', 2018, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_volkswagen
-- ============================================
-- Volkswagen models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'volkswagen';

  -- Jetta (2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Jetta', 'jetta') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Jetta (MK7)', 'HU162', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '3G0959752', 'MQB platform / IMMO 5. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or dealer ODIS. Component protection on 2020+ models. PIN from BCM2. All keys lost: read BCM2 via bench or OBDII. KESSY equipped models use smart key.', true, false, 'HU162', 2019, 2024);

  -- Jetta (2011-2018)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Jetta (MK6)', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'transponder', '5K0837202AK', 'PQ platform / IMMO 4. Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD supported. OBD add key programming available. All keys lost: read data from instrument cluster. Non-KESSY models use standard flip key.', true, true, 'HU66', 2011, 2018);

  -- Tiguan (2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Tiguan', 'tiguan') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Tiguan (MK2)', 'HU162', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '3G0959752', 'MQB platform / IMMO 5. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection on later models. PIN from BCM2. All keys lost: read BCM2 via bench. KESSY standard on SEL and above trims.', true, false, 'HU162', 2018, 2024);

  -- Tiguan (2009-2017)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Tiguan (MK1)', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'transponder', '5K0837202AK', 'PQ platform / IMMO 4. Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD. OBD programmable for add key. All keys lost: read instrument cluster data. Standard flip key with remote.', true, true, 'HU66', 2009, 2017);

  -- Atlas (2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Atlas', 'atlas') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Atlas', 'HU162', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '3G0959752', 'MQB platform / IMMO 5. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection on 2020+ models. PIN from BCM2. All keys lost: read BCM2 via bench. KESSY standard on most trims.', true, false, 'HU162', 2018, 2024);

  -- Golf/GTI (MK7/MK8 2015-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Golf/GTI', 'golf-gti') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Golf/GTI (MK7/MK8)', 'HU162', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', 'NBG010180T', 'MQB platform / IMMO 5. MK7 (2015-2021), MK8 (2022+). Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection on MK8 models. PIN from BCM2. All keys lost: read BCM2 via bench. KESSY on GTI Autobahn and above.', true, false, 'HU162', 2015, 2024);

  -- Golf (MK6 2010-2014)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Golf/GTI (MK6)', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'transponder', '5K0837202AK', 'PQ platform / IMMO 4. Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD. OBD programmable for add key. All keys lost: read instrument cluster. Standard flip key remote.', true, true, 'HU66', 2010, 2014);

  -- Passat (2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Passat', 'passat') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Passat (NMS)', 'HU162', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '3G0959752', 'MQB platform / IMMO 5. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection on later models. PIN from BCM2. All keys lost: read BCM2 via bench. KESSY standard on most trims.', true, false, 'HU162', 2020, 2024);

  -- Passat (2012-2019)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Passat (NMS B7)', 'HU66', 'Megamos 48', 'Megamos Crypto 48', '315 MHz', 'transponder', '5K0837202AK', 'PQ/NMS platform / IMMO 4. Requires VVDI2, Autel IM608, or ODIS. PIN read via OBD supported. OBD programmable for add key. All keys lost: read instrument cluster data. Flip key with remote standard.', true, true, 'HU66', 2012, 2019);

  -- Taos (2022-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Taos', 'taos') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen Taos', 'HU162', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '3G0959752', 'MQB platform / IMMO 5. Requires VVDI2 with MQB adapter, Autel IM608 Pro, or ODIS. Component protection present. PIN from BCM2. All keys lost: read BCM2 via bench. KESSY on SEL trim and above.', true, false, 'HU162', 2022, 2024);

  -- ID.4 (2021-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'ID.4', 'id-4') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Volkswagen ID.4 (MEB)', 'Smart Key Fob', 'Megamos AES', 'MQB 48 (AES)', '315 MHz', 'smart_key', '3G0959752', 'MEB electric platform / IMMO 5. Requires dealer ODIS or Autel IM608 Pro. Limited aftermarket support — newer platform. Component protection present. PIN from BCM2. All keys lost: dealer recommended. Electric vehicle — no traditional engine start. Smartphone key also supported.', true, false, 'N/A', 2021, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_porsche
-- ============================================
-- Porsche models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'porsche';

  -- Cayenne (2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Cayenne', 'cayenne') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche Cayenne (E3/9YA)', 'N/A (Smart Fob Only)', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'IYZPK3', 'Third-gen Cayenne. Porsche PIWIS 3 (dealer tool) required for most programming. Autel IM608 Pro has limited add key support. All keys lost typically dealer only. Very restricted immobilizer system. No emergency key blade on newer fobs — separate valet key available.', true, false, 'N/A', 2019, 2024);

  -- Cayenne (2011-2018)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche Cayenne (92A/958)', 'HU66', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KR55WK50138', 'Second-gen Cayenne. Porsche PIWIS 2/3 for dealer programming. Autel IM608 Pro and Lonsdor K518 support add key on some years. AKL very limited with aftermarket tools. Emergency blade HU66 concealed in fob. Kessy (Keyless Entry Start and Exit System).', true, false, 'HU66', 2011, 2018);

  -- Macan (2015-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Macan', 'macan') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche Macan (95B)', 'HU66', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'IYZPK3', 'Shares MLB platform with Audi Q5. Porsche PIWIS 2/3 for dealer programming. Autel IM608 Pro supports add key on 2015-2019. Lonsdor K518 has partial support. AKL often requires dealer. Emergency blade HU66 in fob. Kessy system standard.', true, false, 'HU66', 2015, 2024);

  -- 911 (992, 2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '911', '911') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche 911 (992)', 'N/A (Smart Fob Only)', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', '9J1959753', 'Current-gen 992. Porsche PIWIS 3 required — virtually no aftermarket support for programming. Dealer only for add key and all keys lost. Fob shaped like car silhouette. Ignition switch on left (Porsche tradition). Extremely high security.', true, false, 'N/A', 2020, 2024);

  -- 911 (991, 2012-2019)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche 911 (991)', 'HU66', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KR55WK50138', 'Porsche PIWIS 2/3 for dealer programming. Limited aftermarket support — Autel IM608 Pro may support add key on earlier 991 models. AKL typically dealer only. Emergency blade HU66 in fob. Left-side ignition switch. Kessy equipped.', true, false, 'HU66', 2012, 2019);

  -- Panamera (2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Panamera', 'panamera') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche Panamera (971)', 'N/A (Smart Fob Only)', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'IYZPK3', 'Second-gen Panamera on MSB platform. Porsche PIWIS 3 required. Very limited aftermarket support. Add key and AKL typically dealer only. Push-button start with left-side ignition position. High-security immobilizer.', true, false, 'N/A', 2017, 2024);

  -- Panamera (2010-2016)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche Panamera (970)', 'HU66', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KR55WK50138', 'First-gen Panamera. Porsche PIWIS 2 for dealer programming. Autel IM608 Pro has limited add key support. AKL usually dealer only. Emergency blade HU66 concealed in fob. Kessy system. Left-side ignition.', true, false, 'HU66', 2010, 2016);

  -- Taycan (2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Taycan', 'taycan') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Porsche Taycan (Y1A)', 'N/A (Smart Fob Only)', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', '9J1959753', 'All-electric vehicle on J1 platform. Porsche PIWIS 3 required — dealer only for all key programming. No aftermarket tool support. Phone key available via Porsche Connect app. No emergency blade. Extremely restricted system.', true, false, 'N/A', 2020, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_acura
-- ============================================
-- Acura models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'acura';

  -- TLX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'TLX', 'tlx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura TLX', 'HON66', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'KR5TP-4', '2nd gen TLX. Smart key system. Requires Honda HDS or aftermarket tool (Autel, Smart Pro). All keys must be present.', false, true, 'HON66', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura TLX', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V1X', '1st gen TLX. Smart key. Honda HDS or aftermarket programmer. All keys present during programming.', false, true, 'HON66', 2015, 2020);

  -- MDX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'MDX', 'mdx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura MDX', 'HON66', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'KR5TP-4', '4th gen MDX. Smart key system. Honda HDS or aftermarket tool (Autel, Smart Pro). All keys must be present.', false, true, 'HON66', 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura MDX', 'HON66', 'Hitag 3', '47 chip', '313.8 MHz', 'smart_key', 'KR5V1X', '3rd gen MDX. Smart key. Honda HDS or aftermarket tool. All keys present during programming.', false, true, 'HON66', 2014, 2021);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura MDX', 'HON66', 'Megamos 46', '46 chip', '315 MHz', 'smart_key', 'ACJ932HK1210A', '2nd gen MDX. Proximity smart key with Megamos 46 transponder. Honda HDS or aftermarket tool. OBD programmable.', false, true, 'HON66', 2007, 2013);

  -- RDX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'RDX', 'rdx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura RDX', 'HON66', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'KR5V2X', '3rd gen RDX. Smart key system. Honda HDS or aftermarket tool (Autel, Smart Pro). All keys must be present.', false, true, 'HON66', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura RDX', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V1X', '2nd gen RDX. Smart key. Honda HDS or aftermarket tool required. All keys present during programming.', false, true, 'HON66', 2013, 2018);

  -- ILX
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'ILX', 'ilx') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura ILX', 'HON66', 'Hitag 3', '47 chip', '315 MHz', 'smart_key', 'KR5V1X', 'ILX facelift. Smart key system. Honda HDS or aftermarket tool. All keys must be present during programming.', false, true, 'HON66', 2016, 2022);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura ILX', 'HON66', 'Megamos 46', '46 chip', '315 MHz', 'smart_key', 'ACJ932HK1210A', 'Early ILX. Megamos 46 transponder. Honda HDS or aftermarket programmer. OBD programmable.', false, true, 'HON66', 2013, 2015);

  -- Integra
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Integra', 'integra') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Acura Integra', 'HON66', 'Hitag Pro', '47 chip', '315 MHz', 'smart_key', 'KR5TP-4', 'Revived Integra (Civic-based). Smart key system. Honda HDS or aftermarket tool (Autel, Smart Pro). All keys must be present.', false, true, 'HON66', 2023, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_buick
-- ============================================
-- Buick models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'buick';

  -- Encore
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Encore', 'encore') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Encore', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4AA', 'Proximity smart key with push-button start. GM SPS/TIS2Web or Autel IM508/608 required. All-keys-lost requires IMMO reset.', false, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Encore', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3+ transponder. OBD programmable with 10-minute relearn procedure. GM Tech 2 or compatible tool.', false, true, 2013, 2017);

  -- Enclave
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Enclave', 'enclave') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Enclave', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4EA', 'Proximity key system. Requires GM SPS or Autel IM608. All-keys-lost requires IMMO reset.', false, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Enclave', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3+ transponder system. 10-minute relearn procedure via OBD. GM Tech 2 or compatible aftermarket tool.', false, true, 2008, 2017);

  -- Envision
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Envision', 'envision') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Envision', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4EA', 'Proximity smart key with push-button start. GM SPS/TIS2Web or Autel IM608 required. All-keys-lost requires IMMO reset.', false, true, 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Envision', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N-32337100', 'PK3+ transponder. OBD programmable with 10-minute relearn. GM Tech 2 or Autel IM508.', false, true, 2016, 2020);

  -- Regal
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Regal', 'regal') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Regal', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4EA', 'Proximity key with push-button start. GM SPS or Autel IM608 required.', false, true, 2018, 2020);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick Regal', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3+ transponder. OBD programmable with 10-minute relearn procedure.', false, true, 2011, 2017);

  -- LaCrosse
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'LaCrosse', 'lacrosse') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick LaCrosse', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ4AA', 'Proximity key system with push-button start. GM SPS/TIS2Web or Autel IM608 required.', false, true, 2017, 2019);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Buick LaCrosse', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3+ transponder. 10-minute relearn via OBD. GM Tech 2 or compatible aftermarket tool.', false, true, 2010, 2016);
END $$;


-- ============================================
-- SEED DATA: automotive_gmc
-- ============================================
-- GMC models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'gmc';

  -- Sierra 1500
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Sierra 1500', 'sierra-1500') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Sierra 1500', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Proximity key with push-button start. Requires GM Tech 2 or SPS/TIS2Web. All-keys-lost requires IMMO reset. Autel IM508/608 compatible.', false, true, 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Sierra 1500', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N-32337100', 'PK3+ transponder system. OBD programmable with 10-minute relearn procedure. GM Tech 2 or Autel IM508.', false, true, 2014, 2018);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Sierra 1500', 'B102-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3 transponder. OBD programmable with 10-minute relearn. GM Tech 2 or compatible aftermarket tool.', false, true, 2007, 2013);

  -- Terrain
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Terrain', 'terrain') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Terrain', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1AA', 'Proximity smart key. GM SPS/TIS2Web or Autel IM508/608 required. All-keys-lost requires IMMO reset.', false, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2010, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Terrain', 'B102-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3+ transponder. 10-minute relearn procedure via OBD. GM Tech 2 or compatible tool.', false, true, 2010, 2017);

  -- Acadia
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Acadia', 'acadia') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Acadia', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1AA', 'Proximity key system with push-button start. Requires GM SPS or Autel IM608. All-keys-lost requires IMMO reset.', false, true, 2017, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Acadia', 'B102-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OHT01060512', 'PK3 transponder system. OBD programmable with 10-minute relearn procedure.', false, true, 2007, 2016);

  -- Yukon
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Yukon', 'yukon') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Yukon', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Proximity key with push-button start. GM SPS/TIS2Web or Autel IM608 required. All-keys-lost requires IMMO reset.', false, true, 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Yukon', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N-32337100', 'PK3+ transponder. OBD programmable with 10-minute relearn. GM Tech 2 or Autel IM508.', false, true, 2015, 2020);

  -- Canyon
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Canyon', 'canyon') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'GMC Canyon', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N-32337100', 'PK3+ transponder system. OBD programmable with 10-minute relearn procedure. GM Tech 2 or compatible tool.', false, true, 2015, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_cadillac
-- ============================================
-- Cadillac models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'cadillac';

  -- Escalade
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Escalade', 'escalade') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac Escalade', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Proximity key with push-button start. Requires GM SPS/TIS2Web or Autel IM608Pro. All-keys-lost requires IMMO reset and possible component replacement.', false, true, 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac Escalade', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'proximity', 'HYQ2AB', 'PK3+ transponder with proximity. GM SPS or Autel IM608. OBD programmable with 10-minute relearn.', false, true, 2015, 2020);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2014) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac Escalade', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'OUC6000066', 'PK3 transponder system. OBD programmable with 10-minute relearn. GM Tech 2 or compatible tool.', false, true, 2007, 2014);

  -- XT5
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XT5', 'xt5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac XT5', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ2AB', 'Proximity smart key with push-button start. GM SPS/TIS2Web or Autel IM608Pro required. All-keys-lost requires IMMO reset.', false, true, 2020, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac XT5', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'proximity', 'HYQ2AB', 'PK3+ transponder with proximity features. GM SPS or Autel IM608. 10-minute relearn procedure.', false, true, 2017, 2019);

  -- XT4
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XT4', 'xt4') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac XT4', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ2AB', 'Proximity key with push-button start. Requires GM SPS/TIS2Web or Autel IM608Pro. All-keys-lost requires IMMO reset.', false, true, 2019, 2024);

  -- CT5
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CT5', 'ct5') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac CT5', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Proximity smart key. GM SPS/TIS2Web or Autel IM608Pro required. All-keys-lost may require component replacement.', false, true, 2020, 2024);

  -- CT4
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CT4', 'ct4') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac CT4', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ1EA', 'Proximity key with push-button start. GM SPS or Autel IM608Pro required. All-keys-lost may require component replacement.', false, true, 2020, 2024);

  -- XT6
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XT6', 'xt6') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac XT6', 'B111-PT', 'Megamos AES', '46 AES', '315 MHz', 'proximity', 'HYQ2AB', 'Proximity smart key with push-button start. Requires GM SPS/TIS2Web or Autel IM608Pro. All-keys-lost requires IMMO reset.', false, true, 2020, 2024);

  -- CTS
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'CTS', 'cts') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac CTS', 'B111-PT', 'Megamos 46', '46 chip', '315 MHz', 'proximity', 'HYQ2AB', 'PK3+ transponder with proximity. GM SPS or Autel IM608. OBD programmable with 10-minute relearn.', false, true, 2014, 2019);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2008, 2013) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Cadillac CTS', 'B106-PT', 'Megamos 46', '46 chip', '315 MHz', 'transponder', 'M3N5WY7777A', 'PK3 transponder system. OBD programmable with 10-minute relearn. GM Tech 2 or compatible tool.', false, true, 2008, 2013);
END $$;


-- ============================================
-- SEED DATA: automotive_lincoln
-- ============================================
-- Lincoln models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'lincoln';

  -- Navigator
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Navigator', 'navigator') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln Navigator', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key system. Ford IDS/FDRS or Autel IM608 required. PIN code required for all-keys-lost (from PCM or dealer). Phone-as-a-key available on 2020+.', true, true, 2018, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2007, 2017) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln Navigator', 'H75', 'Texas 4D63', '4D63 80-bit', '315 MHz', 'transponder', 'M3N5WY8609', 'PATS system with 4D63 80-bit chip. On-board programming with 2 working keys. PIN code bypass via Ford IDS for all-keys-lost.', true, true, 2007, 2017);

  -- Aviator
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Aviator', 'aviator') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln Aviator', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key with push-button start. Ford IDS/FDRS or Autel IM608 required. PIN code required for all-keys-lost. Phone-as-a-key supported.', true, true, 2020, 2024);

  -- Corsair
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Corsair', 'corsair') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln Corsair', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key system. Ford IDS/FDRS, Autel IM608, or SmartPro required. PIN code required for all-keys-lost. Phone-as-a-key supported on 2020+.', true, true, 2020, 2024);

  -- Nautilus
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Nautilus', 'nautilus') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln Nautilus', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key with push-button start. Ford IDS/FDRS or Autel IM608 required. PIN code needed for all-keys-lost scenarios.', true, true, 2019, 2024);

  -- MKZ
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'MKZ', 'mkz') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln MKZ', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key system. Ford IDS/FDRS or compatible aftermarket tool required. PIN code required for all-keys-lost.', true, true, 2017, 2020);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln MKZ', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'smart_key', 'M3N5WY8609', 'PATS 128-bit smart key. Ford IDS/FDRS required. On-board programming with 2 working keys or PIN code for all-keys-lost.', true, true, 2013, 2016);

  -- MKC
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'MKC', 'mkc') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln MKC', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '315 MHz', 'smart_key', 'M3N-A2C931426', 'PATS smart key system. Ford IDS/FDRS or Autel IM608 required. PIN code needed for all-keys-lost. On-board programming with 2 working keys.', true, true, 2015, 2019);

  -- Continental
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Continental', 'continental') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, year_start, year_end)
  VALUES (year_id, mfr_id, 'Lincoln Continental', 'H92-PT', 'Texas Crypto 128-bit', '128-bit', '902 MHz', 'smart_key', 'M3N-A3C054339', 'PATS smart key with push-button start. Ford IDS/FDRS or Autel IM608 required. PIN code required for all-keys-lost scenarios.', true, true, 2017, 2020);
END $$;


-- ============================================
-- SEED DATA: automotive_land_rover
-- ============================================
-- Land Rover models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'land-rover';

  -- Range Rover (2022-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Range Rover', 'range-rover') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Range Rover (L460)', 'HU101', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'HK83-15K601-AB', 'JLR Pathfinder SDD required for dealer-level programming. Autel IM608 Pro and Lonsdor K518 support add key and all keys lost. KVM (Key Vehicle Module) may need virginization for AKL on 2022+. Emergency blade HU101. Extremely complex immobilizer — recommend dealer backup.', true, false, 'HU101', 2022, 2024);

  -- Range Rover (2013-2021)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2013, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Range Rover (L405)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'JLR SDD/Pathfinder for dealer programming. Autel IM608 Pro, Lonsdor K518, and OBDSTAR support add key via OBD. All keys lost requires KVM module replacement or virginization. PIN/security code required from dealer or EEPROM read.', true, false, 'HU101', 2013, 2021);

  -- Range Rover Sport (2023-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Range Rover Sport', 'range-rover-sport') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Range Rover Sport (L461)', 'HU101', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'HK83-15K601-AB', 'JLR Pathfinder required. Autel IM608 Pro and Lonsdor K518 support add key. All keys lost requires KVM virginization or replacement. New generation platform with enhanced immobilizer security. Emergency blade HU101.', true, false, 'HU101', 2023, 2024);

  -- Range Rover Sport (2014-2022)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2022) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Range Rover Sport (L494)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'JLR SDD/Pathfinder for programming. Autel IM608 Pro, Lonsdor K518 support add key via OBD. All keys lost: KVM replacement or virginization required. Security access code needed. 5-button smart key fob.', true, false, 'HU101', 2014, 2022);

  -- Discovery (2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Discovery', 'discovery') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Discovery 5 (L462)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJXF18A', 'JLR SDD/Pathfinder for dealer programming. Autel IM608 Pro and Lonsdor K518 support add key and all keys lost. KVM virginization may be needed for AKL. Shares platform with Range Rover Sport L494.', true, false, 'HU101', 2017, 2024);

  -- Defender (2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Defender', 'defender') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Defender (L663)', 'HU101', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'HK83-15K601-AB', 'New Defender platform (L663). JLR Pathfinder required. Autel IM608 Pro and Lonsdor K518 have limited support. All keys lost requires KVM module work. Very high security system. Emergency blade HU101 for door only.', true, false, 'HU101', 2020, 2024);

  -- Range Rover Evoque (2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Range Rover Evoque', 'range-rover-evoque') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Range Rover Evoque (L551)', 'HU101', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJXF18A', 'Second-gen Evoque on PTA platform. JLR Pathfinder for dealer programming. Autel IM608 Pro and Lonsdor K518 support add key. AKL requires KVM virginization. Enhanced security over first gen.', true, false, 'HU101', 2020, 2024);

  -- Range Rover Evoque (2012-2019)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Range Rover Evoque (L538)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'First-gen Evoque. JLR SDD for dealer programming. Autel IM608 Pro, Lonsdor K518, OBDSTAR support add key via OBD. All keys lost: KVM replacement or EEPROM read. 5-button smart fob.', true, false, 'HU101', 2012, 2019);

  -- Discovery Sport (2015-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Discovery Sport', 'discovery-sport') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2015, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Land Rover Discovery Sport (L550)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJXF18A', 'JLR SDD/Pathfinder for programming. Autel IM608 Pro and Lonsdor K518 support add key via OBD. All keys lost requires KVM module virginization or replacement. 2020+ facelift may have updated security. Emergency key blade HU101.', true, false, 'HU101', 2015, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_infiniti
-- ============================================
-- Infiniti models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'infiniti';

  -- QX60
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'QX60', 'qx60') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2022, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti QX60', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'All-new QX60 platform (2022+). Intelligent key. Requires Nissan CONSULT III+ or aftermarket tool (Autel, Smart Pro). All keys must be present.', false, true, 'NSN14', 2022, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2021) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti QX60', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR5S180144014', 'QX60 (formerly JX35). Intelligent key system. Nissan CONSULT III+ or aftermarket tool. OBD programmable.', false, true, 'NSN14', 2014, 2021);

  -- QX80
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'QX80', 'qx80') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti QX80', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'QX80 facelift. Intelligent key with Hitag AES. Nissan CONSULT III+ or aftermarket tool. All keys must be present.', false, true, 'NSN14', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti QX80', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'CWTWB1G767', 'QX80 (1st gen). Intelligent key. Hitag 2 transponder. Nissan CONSULT III+ or aftermarket tool. OBD programmable.', false, true, 'NSN14', 2014, 2018);

  -- QX50
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'QX50', 'qx50') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti QX50', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', '2nd gen QX50. Intelligent key with Hitag AES. Nissan CONSULT III+ or aftermarket tool (Autel, Smart Pro).', false, true, 'NSN14', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti QX50', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'S180144014', '1st gen QX50. Intelligent key. Hitag 2 transponder. CONSULT III+ or aftermarket tool.', false, true, 'NSN14', 2014, 2018);

  -- Q50
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Q50', 'q50') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti Q50', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'Q50 refresh. Intelligent key with Hitag AES (4A chip). Nissan CONSULT III+ or aftermarket tool. All keys present.', false, true, 'NSN14', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti Q50', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'KR5S180144014', 'Q50 (V37). Intelligent key system. Hitag 2 transponder. CONSULT III+ or aftermarket tool. OBD programmable.', false, true, 'NSN14', 2014, 2018);

  -- Q60
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Q60', 'q60') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti Q60', 'NSN14', 'Hitag AES', '4A chip', '433 MHz', 'smart_key', 'KR5TXN7', 'Q60 coupe. Intelligent key with Hitag AES. Nissan CONSULT III+ or aftermarket tool. All keys must be present.', false, true, 'NSN14', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Infiniti Q60', 'NSN14', 'Hitag 2', '46 chip', '315 MHz', 'smart_key', 'CWTWB1G767', 'Q60 (CV37). Intelligent key system. Hitag 2 transponder. CONSULT III+ or aftermarket tool. OBD programmable.', false, true, 'NSN14', 2017, 2018);
END $$;


-- ============================================
-- SEED DATA: automotive_jaguar
-- ============================================
-- Jaguar models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'jaguar';

  -- F-Pace (2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'F-Pace', 'f-pace') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar F-Pace (X761)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'JLR SDD/Pathfinder for dealer programming. Autel IM608 Pro and Lonsdor K518 support add key via OBD. All keys lost requires KVM module virginization or replacement. Same JLR platform as Land Rover. Security access code required.', true, false, 'HU101', 2017, 2024);

  -- E-Pace (2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'E-Pace', 'e-pace') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar E-Pace (X540)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'JLR SDD/Pathfinder required. Autel IM608 Pro and Lonsdor K518 support add key. All keys lost requires KVM replacement or virginization. Shares platform with Land Rover Discovery Sport. Emergency blade HU101.', true, false, 'HU101', 2018, 2024);

  -- XF (2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XF', 'xf') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar XF (X260)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'Second-gen XF on iQ[Al] platform. JLR SDD/Pathfinder for programming. Autel IM608 Pro, Lonsdor K518 support add key via OBD. AKL requires KVM module work. 5-button smart key fob.', true, false, 'HU101', 2016, 2024);

  -- XF (2009-2015)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2009, 2015) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar XF (X250)', 'HU101', 'Hitag 2', 'PCF7945 (46 chip)', '315 MHz', 'smart_key', 'KOBJTF10A', 'First-gen XF. JLR SDD for programming. Older immobilizer system — more aftermarket tool support. Autel IM608, VVDI2, and Lonsdor K518 can add keys. All keys lost supported via OBD on most years. Less restrictive than newer models.', false, true, 'HU101', 2009, 2015);

  -- XE (2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'XE', 'xe') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar XE (X760)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF18A', 'JLR iQ[Al] platform. SDD/Pathfinder for dealer programming. Autel IM608 Pro and Lonsdor K518 support add key. All keys lost requires KVM virginization. Same immobilizer complexity as F-Pace.', true, false, 'HU101', 2017, 2024);

  -- F-Type (2014-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'F-Type', 'f-type') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar F-Type (X152)', 'HU101', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF10A', 'Sports car platform. JLR SDD/Pathfinder for programming. Autel IM608 Pro and Lonsdor K518 support add key. AKL requires KVM module virginization or replacement. Premium fob design. Emergency blade HU101 for door/glove box.', true, false, 'HU101', 2014, 2024);

  -- I-Pace (2019-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'I-Pace', 'i-pace') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Jaguar I-Pace (X590)', 'HU101', 'Hitag Pro AES', 'HITAG PRO 49', '315 MHz', 'smart_key', 'KOBJTF18A', 'All-electric vehicle. JLR Pathfinder required. Limited aftermarket support — Autel IM608 Pro has partial coverage. AKL very complex, recommend dealer. No traditional ignition — push button start only. Emergency blade HU101 for door access.', true, false, 'HU101', 2019, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_mini
-- ============================================
-- Mini models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mini';

  -- Cooper (2014-2024 F-series/current)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Cooper', 'cooper') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mini Cooper (F56 LCI/F56 LCI2)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'NBGIDGNG1', 'BMW FEM/BDC system. Requires BMW ISTA+, Autel IM608 Pro, VVDI2/VVDI BMW, or Yanhua ACDP. ISN (IMMO Secret Number) read from DME required. All keys lost: read ISN via OBD or bench from ECU. Comfort Access available. Emergency blade HU100R.', true, false, 'HU100R', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mini Cooper (F56)', 'HU92R', 'Hitag Pro', 'HITAG PRO 49', '315 MHz / 433 MHz', 'smart_key', 'CWTWB1G767', 'BMW CAS/FEM system. Requires BMW ISTA+, Autel IM608 Pro, VVDI2, or Yanhua ACDP. ISN required from CAS/FEM module. OBD programmable on CAS models; FEM may require bench read. Emergency blade HU92R concealed in fob.', true, true, 'HU92R', 2014, 2018);

  -- Countryman (2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Countryman', 'countryman') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mini Countryman (F60)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'NBGIDGNG1', 'BMW UKL/FAAR platform. FEM/BDC system. Requires BMW ISTA+, Autel IM608 Pro, or VVDI2/VVDI BMW. ISN read from DME required. All keys lost supported with ISN. Shares platform with BMW X1. Emergency blade HU100R.', true, false, 'HU100R', 2017, 2024);

  -- Countryman (2011-2016)
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2011, 2016) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mini Countryman (R60)', 'HU92R', 'Hitag 2 Pro', 'PCF7953 (CAS3+)', '315 MHz / 433 MHz', 'smart_key', 'KR55WK49333', 'BMW CAS3/CAS3+ system. Program via BMW ISTA, VVDI2, Autel IM608, or Yanhua ACDP. ISN from CAS module required. OBD programming supported. All keys lost: read CAS via OBD or bench. Emergency blade HU92R.', true, true, 'HU92R', 2011, 2016);

  -- Clubman (2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Clubman', 'clubman') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Mini Clubman (F54)', 'HU100R', 'Hitag Pro', 'HITAG PRO 49', '315 MHz', 'smart_key', 'NBGIDGNG1', 'BMW UKL platform. FEM/BDC system same as Cooper F56 and Countryman F60. Requires BMW ISTA+, Autel IM608 Pro, or VVDI2/VVDI BMW. ISN from DME required. All keys lost with ISN read. Split barn-door tailgate — unique feature. Emergency blade HU100R.', true, false, 'HU100R', 2016, 2024);
END $$;


-- ============================================
-- SEED DATA: automotive_tesla
-- ============================================
-- Tesla models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'tesla';

  -- Model 3 (2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Model 3', 'model-3') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Tesla Model 3', 'N/A (Key Card)', 'NFC/BLE', 'Tesla proprietary', '13.56 MHz (NFC) / 433 MHz (fob)', 'smart_key', '1133148', 'NO traditional key or transponder. Primary: phone key via Tesla app (Bluetooth LE). Secondary: NFC key card (credit card size, 13.56 MHz). Optional: key fob accessory (Bluetooth, FCC ID 1133148). All programming done through Tesla app or service center. NO locksmith tools available. Emergency entry: 12V jump post under front tow hook cover. No OBD programming possible. Key card pairing via touchscreen with existing authenticated device.', false, false, 'N/A', 2018, 2024);

  -- Model Y (2020-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Model Y', 'model-y') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2020, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Tesla Model Y', 'N/A (Key Card)', 'NFC/BLE', 'Tesla proprietary', '13.56 MHz (NFC) / 433 MHz (fob)', 'smart_key', '1133148', 'Same key system as Model 3. NO traditional key or transponder. Primary: phone key via Tesla app (Bluetooth LE). Secondary: NFC key card. Optional: key fob accessory. All programming through Tesla app or service center only. NO locksmith tool support. Emergency entry: 12V jump post under nose cone. Key card pairing requires authenticated device on touchscreen.', false, false, 'N/A', 2020, 2024);

  -- Model S (2012-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Model S', 'model-s') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Tesla Model S (Refresh)', 'N/A (Key Card)', 'NFC/BLE', 'Tesla proprietary', '13.56 MHz (NFC) / 433 MHz (fob)', 'smart_key', '1133148', 'Refreshed Model S (2021+) uses same key card/phone key system as Model 3/Y. NO traditional key. Primary: phone key via Tesla app. Secondary: NFC key card. Optional: key fob. Programming through Tesla app or service center only. NO locksmith tools. Yoke steering option. Emergency entry via 12V jump post.', false, false, 'N/A', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Tesla Model S (Pre-Refresh)', 'N/A (Key Fob)', 'NFC/BLE', 'Tesla proprietary', '433 MHz', 'smart_key', '1133148', 'Pre-refresh Model S uses key fob as primary key (looks like Model S silhouette). Phone key added via software update on later models. Key fob uses 433 MHz passive entry. Programming through Tesla service center or app. NO locksmith tool support. 2012-2017 fobs had known relay attack vulnerability (patched via update). Emergency entry: manual cable release in front trunk area.', false, false, 'N/A', 2012, 2020);

  -- Model X (2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Model X', 'model-x') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2021, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Tesla Model X (Refresh)', 'N/A (Key Card)', 'NFC/BLE', 'Tesla proprietary', '13.56 MHz (NFC) / 433 MHz (fob)', 'smart_key', '1133148', 'Refreshed Model X (2021+) uses key card/phone key system like Model 3/Y. NO traditional key. Primary: phone key via Tesla app. Secondary: NFC key card. Optional: key fob. Programming through Tesla app or service center only. NO locksmith tools. Falcon wing doors. Emergency entry via 12V jump post.', false, false, 'N/A', 2021, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Tesla Model X (Pre-Refresh)', 'N/A (Key Fob)', 'NFC/BLE', 'Tesla proprietary', '433 MHz', 'smart_key', '1133148', 'Pre-refresh Model X uses key fob as primary key (Model X silhouette shape). Phone key added via later software updates. Key fob 433 MHz passive entry. Programming via Tesla service center or app only. NO locksmith tool support. Falcon wing doors require key fob for auto-open. Emergency entry: manual cable in front trunk.', false, false, 'N/A', 2016, 2020);
END $$;


-- ============================================
-- SEED DATA: automotive_fiat
-- ============================================
-- Fiat models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'fiat';

  -- 500 (2012-2019)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '500', '500') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2012, 2019) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Fiat 500', 'SIP22', 'Megamos 48', 'Megamos Crypto 48', '433 MHz', 'transponder', 'LTQF12AM433TX', 'Fiat Delphi immobilizer system. Program via WiTech or aftermarket tools (Autel IM608, VVDI2, Zed-Full). Flip key with 3-button remote. OBD programming supported for add key. All keys lost requires PIN from dealer or EEPROM/BCM read. SIP22 key blade.', false, true, 'SIP22', 2012, 2019);

  -- 500X (2016-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '500X', '500x') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2019, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Fiat 500X (Facelift)', 'SIP22', 'Hitag AES', 'HITAG AES 4A', '433 MHz', 'smart_key', 'M3N-40821302', 'FCA/Stellantis platform. WiTech 2.0 for dealer programming. Autel IM608 Pro supports add key. Hitag AES immobilizer — more secure than older Megamos. All keys lost may require BCM replacement or EEPROM work. Emergency blade SIP22.', true, false, 'SIP22', 2019, 2024);

  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2016, 2018) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Fiat 500X', 'SIP22', 'Megamos 48', 'Megamos Crypto 48', '433 MHz', 'smart_key', 'M3N-40821302', 'FCA platform. WiTech for dealer programming. Autel IM608, Lonsdor K518, VVDI2 support add key via OBD. Megamos 48 immobilizer. All keys lost: PIN code from dealer or BCM EEPROM read. Smart key with push-button start. Emergency blade SIP22.', false, true, 'SIP22', 2016, 2018);

  -- 500L (2014-2020)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, '500L', '500l') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2014, 2020) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Fiat 500L', 'SIP22', 'Megamos 48', 'Megamos Crypto 48', '433 MHz', 'transponder', 'LTQF12AM433TX', 'Fiat/FCA platform. WiTech or aftermarket tools (Autel IM608, VVDI2, Zed-Full) for programming. Flip key with 3-button remote. OBD programmable for add key. All keys lost requires PIN code from dealer or EEPROM read from BCM. SIP22 blade.', false, true, 'SIP22', 2014, 2020);
END $$;


-- ============================================
-- SEED DATA: automotive_alfa_romeo
-- ============================================
-- Alfa Romeo models, years, and keys
DO $$
DECLARE
  mfr_id UUID;
  model_id UUID;
  year_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'alfa-romeo';

  -- Giulia (2017-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Giulia', 'giulia') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2017, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Alfa Romeo Giulia (952)', 'SIP22', 'Hitag AES', 'HITAG AES 4A', '433 MHz', 'smart_key', 'M3N-7393490', 'FCA/Stellantis Giorgio platform. WiTech 2.0 for dealer programming. Autel IM608 Pro supports add key via OBD. Lonsdor K518 has partial support. All keys lost may require BCM replacement or EEPROM/flash work. Smart key with push-button start. Emergency blade SIP22. Quadrifoglio uses same key system.', true, false, 'SIP22', 2017, 2024);

  -- Stelvio (2018-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Stelvio', 'stelvio') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2018, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Alfa Romeo Stelvio (949)', 'SIP22', 'Hitag AES', 'HITAG AES 4A', '433 MHz', 'smart_key', 'M3N-7393490', 'Shares Giorgio platform with Giulia. WiTech 2.0 for dealer programming. Autel IM608 Pro supports add key. Same immobilizer system as Giulia. AKL may require BCM replacement or EEPROM work. Smart key with push-button start. Emergency blade SIP22. SUV variant of Giulia platform.', true, false, 'SIP22', 2018, 2024);

  -- Tonale (2023-2024)
  INSERT INTO public.vehicle_models (manufacturer_id, name, slug) VALUES (mfr_id, 'Tonale', 'tonale') ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO model_id;
  INSERT INTO public.vehicle_years (model_id, year_start, year_end) VALUES (model_id, 2023, 2024) RETURNING id INTO year_id;
  INSERT INTO public.automotive_keys (year_id, manufacturer_id, model_name, key_blank, transponder_type, chip_type, remote_frequency, key_type, fcc_id, programming_notes, pin_code_required, obd_programmable, emergency_key_blank, year_start, year_end)
  VALUES (year_id, mfr_id, 'Alfa Romeo Tonale', 'SIP22', 'Hitag AES', 'HITAG AES 4A', '433 MHz', 'smart_key', 'KR5ALFA434', 'Stellantis STLA Medium platform. WiTech 2.0 for dealer programming. Very new model — limited aftermarket tool coverage. Autel IM608 Pro may have partial support. All keys lost likely dealer only initially. Smart key with push-button start. PHEV option available. Emergency blade SIP22.', true, false, 'SIP22', 2023, 2024);
END $$;


-- ============================================
-- SEED DATA: residential_schlage
-- ============================================
-- Schlage residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'schlage';

  -- B60N Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'B60N Single Cylinder Deadbolt', 'b60n', 'deadbolt', 'C', 6, 'Spool pins on positions 2, 4, 5', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, depth_spec, spacing_spec, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Schlage', 'C', 'nickel silver', '0.335, 0.311, 0.287, 0.263, 0.239, 0.215, 0.191, 0.167, 0.143', '.1562, .2500, .3437, .4375, .5312', '5-pin C keyway. Most common Schlage residential keyway.');
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC4', 'Schlage', 'C', 'nickel silver', '6-pin C keyway. Used in higher security applications.');

  -- B60N Primus
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Primus Deadbolt', 'primus-deadbolt', 'deadbolt', 'Primus', 6, 'Finger pins, sidebar', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'P-SC1', 'Schlage', 'Primus', 'nickel silver', 'Primus high-security key. Side-milled for sidebar pins. Restricted blank.');

  -- F51 Knob
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'F51 Entry Knob', 'f51-knob', 'knob', 'C', 5, false, false, false, 'Grade 2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Schlage', 'C', 'nickel silver', 'Standard 5-pin SC1 key for residential knob sets.');

  -- FE575 Keypad
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'FE575 Keypad Entry', 'fe575', 'smart_lock', 'C', 5, false, false, false, 'Grade 2', 'Keypad entry, auto-lock, up to 19 codes')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Schlage', 'C', 'nickel silver', 'Mechanical key backup for electronic lock.');

  -- BE469 Connect
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'BE469 Connect Touchscreen Deadbolt', 'be469', 'smart_lock', 'C', 6, true, true, true, 'Grade 1', 'Z-Wave, touchscreen, up to 30 codes, alarm modes')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Schlage', 'C', 'nickel silver', 'Physical key override for smart lock.');
END $$;


-- ============================================
-- SEED DATA: residential_kwikset
-- ============================================
-- Kwikset residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'kwikset';

  -- 980 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, '980 Single Cylinder Deadbolt', '980', 'deadbolt', 'KW1', 5, false, false, false, 'Grade 2', 'SmartKey re-key technology')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, depth_spec, spacing_spec, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Kwikset', 'KW1', 'nickel silver', '0.329, 0.305, 0.281, 0.257, 0.233, 0.209, 0.185', '.247, .371, .495, .619, .743', 'Standard 5-pin KW1 keyway. Most common Kwikset key.');

  -- 660 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '660 Contemporary Deadbolt', '660', 'deadbolt', 'KW1', 5, false, false, false, 'Grade 3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Kwikset', 'KW1', 'nickel silver', 'Standard Kwikset keyway. Grade 3 residential.');

  -- SmartCode 916
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'SmartCode 916 Touchscreen', 'smartcode-916', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 2', 'Z-Wave Plus, touchscreen, SmartKey, up to 30 codes, auto-lock')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Kwikset', 'KW1', 'nickel silver', 'Physical key backup. SmartKey allows easy re-keying.');

  -- Kevo
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Kevo Contemporary', 'kevo', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 2', 'Bluetooth Smart, touch-to-open, eKeys, SmartKey re-key')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Kwikset', 'KW1', 'nickel silver', 'Physical key backup for Kevo smart lock.');

  -- 400T Entry Knob
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '400T Tylo Entry Knob', '400t', 'knob', 'KW1', 5, false, false, false, 'Grade 3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Kwikset', 'KW1', 'nickel silver', 'Standard KW1 entry knob key.');
END $$;


-- ============================================
-- SEED DATA: residential_yale
-- ============================================
-- Yale residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'yale';

  -- Assure Lock SL
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Assure Lock SL', 'assure-lock-sl', 'smart_lock', 'Y1', 5, false, false, false, 'Grade 2', 'Touchscreen, Z-Wave, HomeKit, key-free deadbolt, up to 25 codes')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'Y1', 'Yale', 'Y1', 'nickel silver', 'Yale Assure Lock SL is a key-free lock. No physical key backup - touchscreen only.');

  -- Assure Lock 2
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Assure Lock 2', 'assure-lock-2', 'smart_lock', 'Y1', 5, false, false, false, 'Grade 2', 'Wi-Fi, Bluetooth, Apple Home Key, Matter, auto-lock, DoorSense')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'Y1', 'Yale', 'Y1', 'nickel silver', 'Optional key cylinder module available. Key-free by default.');

  -- 840 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '840 Deadbolt', '840-deadbolt', 'deadbolt', 'Y1', 5, false, false, false, 'Grade 3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, depth_spec, notes)
  VALUES (lock_id, mfr_id, 'Y1', 'Yale', 'Y1', 'nickel silver', '0.320, 0.296, 0.272, 0.248, 0.224, 0.200', 'Standard Yale 5-pin key. Y1 keyway compatible.');

  -- YRD256 Touchscreen Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'YRD256 Touchscreen Deadbolt', 'yrd256', 'smart_lock', 'Y1', 5, false, false, false, 'Grade 2', 'Touchscreen, Z-Wave, up to 25 user codes, auto-lock, one-touch locking')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'Y1', 'Yale', 'Y1', 'nickel silver', 'Physical key backup included with touchscreen smart lock.');
END $$;


-- ============================================
-- SEED DATA: residential_defiant
-- ============================================
-- Defiant residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'defiant';

  -- Single Cylinder Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Single Cylinder Deadbolt', 'single-cylinder-deadbolt', 'deadbolt', 'KW1', 5, false, false, false, 'Grade 3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Defiant', 'KW1', 'nickel silver', 'Uses standard KW1 keyway. Compatible with Kwikset key blanks.');

  -- Brandywine Entry Knob
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Brandywine Entry Knob', 'brandywine-knob', 'knob', 'KW1', 5, false, false, false, 'Grade 3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Defiant', 'KW1', 'nickel silver', 'Standard entry knob. KW1 keyway for easy replacement.');

  -- Electronic Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Square Electronic Deadbolt', 'square-electronic', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 3', 'Keypad entry, up to 16 user codes, auto-lock')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Defiant', 'KW1', 'nickel silver', 'Physical key backup for electronic deadbolt. KW1 keyway.');

  -- Hartford Lever
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Hartford Entry Lever', 'hartford-lever', 'lever', 'KW1', 5, false, false, false, 'Grade 3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Defiant', 'KW1', 'nickel silver', 'Entry lever handle set. Standard KW1 key.');
END $$;


-- ============================================
-- SEED DATA: residential_baldwin
-- ============================================
-- Baldwin residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'baldwin';

  -- Prestige Series Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Prestige Series Deadbolt', 'prestige-deadbolt', 'deadbolt', 'SC1', 5, null, false, false, false, 'Grade 2', 'SmartKey re-key technology (Kwikset platform)')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Baldwin', 'SC1', 'nickel silver', 'Uses Schlage C keyway via Kwikset SmartKey platform. Standard 5-pin SC1 blank.');

  -- Estate Series Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Estate Series Deadbolt', 'estate-deadbolt', 'deadbolt', 'Baldwin Estate', 6, 'Spool pins', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'BA1', 'Baldwin', 'Baldwin Estate', 'nickel silver', 'Proprietary Baldwin Estate keyway. 6-pin high-security cylinder. Premium solid brass construction.');

  -- Reserve Series Entry
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Reserve Series Entry', 'reserve-entry', 'lever', 'SC1', 5, false, false, false, 'Grade 2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Baldwin', 'SC1', 'nickel silver', 'Premium decorative entry set. Standard SC1 keyway for easy rekeying and key duplication.');

  -- Evolved Smart Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Evolved Smart Lock', 'evolved-smart-lock', 'smart_lock', 'SC1', 5, false, false, false, 'Grade 2', 'Z-Wave, Bluetooth, up to 50 user codes, auto-lock, one-touch locking')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Baldwin', 'SC1', 'nickel silver', 'Physical key backup for smart lock. SC1 keyway with SmartKey re-key capability.');
END $$;


-- ============================================
-- SEED DATA: residential_medeco
-- ============================================
-- Medeco residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'medeco';

  -- Maxum Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Maxum Deadbolt', 'maxum-deadbolt', 'deadbolt', 'Medeco Original', 6, 'Spool pins, chisel point rotating pins', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'A1515', 'Medeco', 'Medeco Original', 'nickel silver', 'Medeco proprietary restricted blank. Angled cuts with rotation. DO NOT duplicate at hardware stores. Locksmith authorization required.');

  -- M3 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'M3 Deadbolt', 'm3-deadbolt', 'deadbolt', 'Medeco M3', 6, 'Rotating pins with sidebar, slider mechanism', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'M3-SC1', 'Medeco', 'Medeco M3', 'nickel silver', 'Medeco M3 restricted key. Features angled cuts, rotation, and fore-aft positioning for slider. UL437 listed. Patent protected.');

  -- Nexgen Padlock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Nexgen Padlock', 'nexgen-padlock', 'padlock', 'Medeco Biaxial', 6, 'Rotating pins with sidebar', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KY-P-BX', 'Medeco', 'Medeco Biaxial', 'nickel silver', 'Restricted Medeco Biaxial key blank. Hardened steel shackle padlock. Boron alloy anti-cut protection.');

  -- Medeco 4 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Medeco 4 Deadbolt', 'medeco-4-deadbolt', 'deadbolt', 'Medeco 4', 6, 'Rotating pins, sidebar, slider, ball bearing', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'M4-BX', 'Medeco', 'Medeco 4', 'nickel silver', 'Latest generation Medeco restricted blank. Four levels of security: rotation, sidebar, slider, and ball bearing. UL437 listed. DO NOT duplicate.');
END $$;


-- ============================================
-- SEED DATA: residential_mul-t-lock
-- ============================================
-- Mul-T-Lock residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'mul-t-lock';

  -- Hercular Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Hercular Deadbolt', 'hercular-deadbolt', 'deadbolt', 'MT5+', 5, 'Pin-in-pin telescoping (10 effective pins), sidebar', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'MTL-MT5+', 'Mul-T-Lock', 'MT5+', 'nickel silver', 'Restricted MT5+ key blank. Pin-in-pin system creates 10 effective shear lines from 5 chambers. Sidebar with alpha spring. Patent protected.');

  -- Cronus Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Cronus Deadbolt', 'cronus-deadbolt', 'deadbolt', 'Interactive+', 5, 'Pin-in-pin telescoping, floating pin element', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'MTL-INT+', 'Mul-T-Lock', 'Interactive+', 'nickel silver', 'Restricted Interactive+ key blank. Features floating pin for interactive element verification. Telescoping pin-in-pin design.');

  -- E-Series Padlock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'E-Series Padlock', 'e-series-padlock', 'padlock', 'MT5+', 5, 'Pin-in-pin telescoping, sidebar', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'MTL-MT5+', 'Mul-T-Lock', 'MT5+', 'nickel silver', 'High-security padlock with Mul-T-Lock MT5+ cylinder. Hardened boron shackle. Same restricted key platform as Hercular.');

  -- Entr Smart Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Entr Smart Lock', 'entr-smart-lock', 'smart_lock', 'MT5+', 5, 'Pin-in-pin telescoping, sidebar', true, true, true, 'Grade 1', 'Motorized smart lock, fingerprint reader, Bluetooth, remote access, up to 20 users')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'MTL-MT5+', 'Mul-T-Lock', 'MT5+', 'nickel silver', 'Physical key override for Entr smart lock. Uses high-security MT5+ cylinder as backup.');
END $$;


-- ============================================
-- SEED DATA: residential_assa
-- ============================================
-- ASSA residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'assa';

  -- Twin 6000 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Twin 6000 Deadbolt', 'twin-6000-deadbolt', 'deadbolt', 'ASSA Twin', 6, 'Sidebar with gin bottle pins', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'ASSA-6000', 'ASSA', 'ASSA Twin', 'nickel silver', 'ASSA proprietary restricted blank. Twin sidebar system with unique gin bottle pin design. Cannot be duplicated at hardware stores.');

  -- Protec2 Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'ASSA Abloy Protec2 Deadbolt', 'protec2-deadbolt', 'deadbolt', 'Protec2', 6, 'Rotating disc with sidebar, anti-bump', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'ASSA-P2', 'ASSA', 'Protec2', 'nickel silver', 'ASSA Abloy Protec2 restricted blank. Rotating disc element for pick and bump resistance. UL437 listed. Patent protected through 2029.');

  -- Twin Pro Mortise Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Twin Pro Mortise Lock', 'twin-pro-mortise', 'mortise', 'ASSA Twin', 6, 'Sidebar with gin bottle pins', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'ASSA-6000', 'ASSA', 'ASSA Twin', 'nickel silver', 'ASSA Twin keyway mortise cylinder. Used in commercial and high-security residential applications. Restricted key system.');

  -- Max+ Restricted Padlock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Max+ Restricted Padlock', 'max-plus-padlock', 'padlock', 'ASSA Twin', 6, 'Sidebar with gin bottle pins', true, true, true, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'ASSA-6000', 'ASSA', 'ASSA Twin', 'nickel silver', 'High-security padlock with ASSA Twin cylinder. Hardened steel body. Same restricted keyway as Twin 6000 series.');
END $$;


-- ============================================
-- SEED DATA: residential_sargent
-- ============================================
-- Sargent residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'sargent';

  -- 8200 Series Mortise Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '8200 Series Mortise Lock', '8200-mortise', 'mortise', 'Sargent LA', 6, 'Spool and serrated pins available', true, true, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '6275LA', 'Sargent', 'Sargent LA', 'nickel silver', 'Sargent 6-pin LA keyway. Commercial/institutional grade mortise lock. Heavy-duty chassis rated for high-traffic environments.');

  -- 6500 Series Cylindrical Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '6500 Series Cylindrical Lock', '6500-cylindrical', 'lever', 'Sargent LA', 6, null, false, false, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '6275LA', 'Sargent', 'Sargent LA', 'nickel silver', 'Sargent LA keyway cylindrical lever lock. Grade 1 commercial duty cycle. Common in schools, hospitals, and office buildings.');

  -- 7800 Series Mortise Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '7800 Series Mortise Lock', '7800-mortise', 'mortise', 'Sargent HA', 5, null, false, false, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '5275HA', 'Sargent', 'Sargent HA', 'nickel silver', 'Sargent 5-pin HA keyway. Standard duty mortise lock for commercial and institutional applications.');

  -- 10 Line Cylindrical Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, '10 Line Cylindrical Lock', '10-line-cylindrical', 'lever', 'Sargent LA', 6, null, false, false, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '6275LA', 'Sargent', 'Sargent LA', 'nickel silver', 'Sargent 10 Line bored lock. Heavy-duty cylindrical chassis. 6-pin LA keyway. ADA compliant lever trim available.');
END $$;


-- ============================================
-- SEED DATA: residential_corbin-russwin
-- ============================================
-- Corbin Russwin residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'corbin-russwin';

  -- CL3300 Series Cylindrical Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'CL3300 Series Cylindrical Lock', 'cl3300-cylindrical', 'lever', 'Corbin Russwin D1', 6, null, false, false, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '59D1', 'Corbin Russwin', 'D1', 'nickel silver', 'Corbin Russwin D1 keyway (6-pin). Grade 1 cylindrical lever lock. Common in commercial and institutional buildings. Also known as 59D1-6PIN.');

  -- ML2000 Series Mortise Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'ML2000 Series Mortise Lock', 'ml2000-mortise', 'mortise', 'Corbin Russwin D1', 6, 'Spool pins optional', true, false, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '59D1', 'Corbin Russwin', 'D1', 'nickel silver', 'Corbin Russwin D1 keyway mortise cylinder. Heavy-duty mortise chassis for high-traffic commercial applications. UL listed for 3-hour fire rating.');

  -- CL3800 Series Cylindrical Lock
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'CL3800 Series Cylindrical Lock', 'cl3800-cylindrical', 'lever', 'Corbin Russwin D1', 6, null, false, false, false, 'Grade 1')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '59D1', 'Corbin Russwin', 'D1', 'nickel silver', 'Corbin Russwin D1 keyway. CL3800 is the heavy-duty bored lock with Newport lever trim. Vandal-resistant design.');

  -- Access 800 Series Mortise
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, security_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Access 800LP1 Mortise Lock', 'access-800-mortise', 'mortise', 'Corbin Russwin D1', 6, null, false, false, false, 'Grade 1', 'Integrated access control, RFID compatible, audit trail')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, '59D1', 'Corbin Russwin', 'D1', 'nickel silver', 'Physical key override for Access 800 electronic mortise lock. Standard D1 keyway cylinder.');
END $$;


-- ============================================
-- SEED DATA: residential_emtek
-- ============================================
-- Emtek residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'emtek';

  -- Regular Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Regular Deadbolt', 'regular-deadbolt', 'deadbolt', 'SC1', 5, false, false, false, 'Grade 2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Emtek', 'SC1', 'nickel silver', 'Standard SC1 Schlage C keyway. Emtek focuses on designer hardware aesthetics. Multiple decorative rosette and lever options available.');

  -- EMPowered Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'EMPowered Deadbolt', 'empowered-deadbolt', 'smart_lock', 'SC1', 5, false, false, false, 'Grade 2', 'Bluetooth, Apple HomeKit, August app integration, auto-lock, auto-unlock, DoorSense')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Emtek', 'SC1', 'nickel silver', 'Physical key backup for EMPowered smart deadbolt. Uses August smart lock module inside Emtek decorative hardware. SC1 keyway.');

  -- Providence Entry Set
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Providence Entry Set', 'providence-entry', 'knob', 'SC1', 5, false, false, false, 'Grade 2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Emtek', 'SC1', 'nickel silver', 'Decorative crystal knob entry set. SC1 keyway. Emtek uses Schlage C compatible cylinders across their residential line.');

  -- Helios Lever Entry Set
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Helios Lever Entry Set', 'helios-lever-entry', 'lever', 'SC1', 5, false, false, false, 'Grade 2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'SC1', 'Emtek', 'SC1', 'nickel silver', 'Designer lever entry set. SC1 Schlage C keyway. Available in 20+ finish options. Solid forged brass construction.');
END $$;


-- ============================================
-- SEED DATA: residential_weiser
-- ============================================
-- Weiser residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'weiser';

  -- Smartcode 10
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'SmartCode 10 Keypad Deadbolt', 'smartcode-10', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 2', 'Keypad entry, up to 30 user codes, auto-lock, SmartKey re-key')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Weiser', 'KW1', 'nickel silver', 'KW1 keyway physical key backup. Same parent company as Kwikset (Spectrum Brands). SmartKey re-key compatible.');

  -- Elements Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Elements Deadbolt', 'elements-deadbolt', 'deadbolt', 'KW1', 5, false, false, false, 'Grade 3', 'SmartKey re-key technology')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Weiser', 'KW1', 'nickel silver', 'Standard KW1 keyway with SmartKey re-key. Budget-friendly residential deadbolt. Cross-compatible with Kwikset KW1 keys.');

  -- Halo Wi-Fi Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Halo Wi-Fi Smart Deadbolt', 'halo-wifi-deadbolt', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 2', 'Wi-Fi, fingerprint reader (select models), app control, up to 250 codes, SmartKey re-key')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Weiser', 'KW1', 'nickel silver', 'Physical key backup for Halo smart lock. KW1 keyway. No hub required — connects directly to Wi-Fi.');

  -- Powerbolt 2 Electronic Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Powerbolt 2 Electronic Deadbolt', 'powerbolt-2', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 3', 'Keypad entry, up to 6 user codes, one-touch locking')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Weiser', 'KW1', 'nickel silver', 'Basic electronic keypad deadbolt with KW1 physical key backup. Budget-friendly keyless option.');
END $$;


-- ============================================
-- SEED DATA: residential_brinks
-- ============================================
-- Brinks residential locks and key blanks
DO $$
DECLARE
  mfr_id UUID;
  lock_id UUID;
BEGIN
  SELECT id INTO mfr_id FROM public.manufacturers WHERE slug = 'brinks';

  -- Commercial Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Commercial Deadbolt', 'commercial-deadbolt', 'deadbolt', 'KW1', 5, false, false, false, 'Grade 2')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Brinks', 'KW1', 'nickel silver', 'Standard KW1 keyway. Brinks Grade 2 commercial-rated deadbolt. Compatible with Kwikset key blanks.');

  -- Push Pull Rotate Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade)
  VALUES (mfr_id, 'Push Pull Rotate Deadbolt', 'push-pull-rotate', 'deadbolt', 'KW1', 5, false, false, false, 'Grade 3')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Brinks', 'KW1', 'nickel silver', 'KW1 keyway residential deadbolt. Push-pull-rotate mechanism for easy operation. Budget-friendly Grade 3 option.');

  -- Digital Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Digital Deadbolt', 'digital-deadbolt', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 3', 'Keypad entry, up to 12 user codes, backlit keypad, auto-lock')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Brinks', 'KW1', 'nickel silver', 'Physical key backup for digital keypad deadbolt. Standard KW1 keyway. Battery powered — no hardwiring needed.');

  -- Array Smart Deadbolt
  INSERT INTO public.residential_locks (manufacturer_id, name, slug, lock_type, keyway, num_pins, bump_resistant, pick_resistant, drill_resistant, ansi_grade, smart_features)
  VALUES (mfr_id, 'Array Smart Deadbolt', 'array-smart-deadbolt', 'smart_lock', 'KW1', 5, false, false, false, 'Grade 2', 'Wi-Fi, app control, up to 50 user codes, auto-lock, activity log, guest access')
  ON CONFLICT (manufacturer_id, slug) DO UPDATE SET name = EXCLUDED.name
  RETURNING id INTO lock_id;
  INSERT INTO public.residential_key_blanks (lock_id, manufacturer_id, blank_number, brand, keyway, material, notes)
  VALUES (lock_id, mfr_id, 'KW1', 'Brinks', 'KW1', 'nickel silver', 'KW1 keyway physical key backup for Array smart lock. Wi-Fi connected — no hub required. Brinks Home Security ecosystem compatible.');
END $$;


-- ============================================
-- DONE! All tables + seed data loaded.
-- ============================================
