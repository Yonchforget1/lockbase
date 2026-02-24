export interface Database {
  public: {
    Tables: {
      profiles: {
        Row: Profile;
        Insert: Omit<Profile, 'created_at' | 'updated_at'>;
        Update: Partial<Omit<Profile, 'id'>>;
      };
      manufacturers: {
        Row: Manufacturer;
        Insert: Omit<Manufacturer, 'id' | 'created_at'>;
        Update: Partial<Omit<Manufacturer, 'id'>>;
      };
      vehicle_models: {
        Row: VehicleModel;
        Insert: Omit<VehicleModel, 'id' | 'created_at'>;
        Update: Partial<Omit<VehicleModel, 'id'>>;
      };
      vehicle_years: {
        Row: VehicleYear;
        Insert: Omit<VehicleYear, 'id' | 'created_at'>;
        Update: Partial<Omit<VehicleYear, 'id'>>;
      };
      automotive_keys: {
        Row: AutomotiveKey;
        Insert: Omit<AutomotiveKey, 'id' | 'created_at'>;
        Update: Partial<Omit<AutomotiveKey, 'id'>>;
      };
      residential_locks: {
        Row: ResidentialLock;
        Insert: Omit<ResidentialLock, 'id' | 'created_at'>;
        Update: Partial<Omit<ResidentialLock, 'id'>>;
      };
      residential_key_blanks: {
        Row: ResidentialKeyBlank;
        Insert: Omit<ResidentialKeyBlank, 'id' | 'created_at'>;
        Update: Partial<Omit<ResidentialKeyBlank, 'id'>>;
      };
      posts: {
        Row: Post;
        Insert: Omit<Post, 'id' | 'created_at' | 'updated_at' | 'vote_count'>;
        Update: Partial<Omit<Post, 'id'>>;
      };
      comments: {
        Row: Comment;
        Insert: Omit<Comment, 'id' | 'created_at' | 'updated_at' | 'vote_count'>;
        Update: Partial<Omit<Comment, 'id'>>;
      };
      votes: {
        Row: Vote;
        Insert: Omit<Vote, 'id' | 'created_at'>;
        Update: Partial<Omit<Vote, 'id'>>;
      };
      bookmarks: {
        Row: Bookmark;
        Insert: Omit<Bookmark, 'id' | 'created_at'>;
        Update: Partial<Omit<Bookmark, 'id'>>;
      };
    };
    Functions: {
      search_all: {
        Args: { query: string };
        Returns: SearchResult[];
      };
    };
  };
}

export interface Profile {
  id: string;
  username: string;
  display_name: string | null;
  avatar_url: string | null;
  bio: string | null;
  reputation: number;
  role: 'user' | 'moderator' | 'admin';
  created_at: string;
  updated_at: string;
}

export interface Manufacturer {
  id: string;
  name: string;
  slug: string;
  type: 'automotive' | 'residential' | 'both';
  logo_url: string | null;
  country: string | null;
  created_at: string;
}

export interface VehicleModel {
  id: string;
  manufacturer_id: string;
  name: string;
  slug: string;
  created_at: string;
}

export interface VehicleYear {
  id: string;
  model_id: string;
  year_start: number;
  year_end: number;
  created_at: string;
}

export interface AutomotiveKey {
  id: string;
  year_id: string;
  manufacturer_id: string;
  model_name: string;
  key_blank: string;
  transponder_type: string | null;
  chip_type: string | null;
  remote_frequency: string | null;
  key_type: 'standard' | 'transponder' | 'smart_key' | 'proximity';
  fcc_id: string | null;
  programming_notes: string | null;
  pin_code_required: boolean;
  obd_programmable: boolean;
  emergency_key_blank: string | null;
  year_start: number;
  year_end: number;
  created_at: string;
}

export interface ResidentialLock {
  id: string;
  manufacturer_id: string;
  name: string;
  slug: string;
  lock_type: 'deadbolt' | 'knob' | 'lever' | 'padlock' | 'smart_lock' | 'mortise';
  keyway: string;
  num_pins: number;
  security_pins: string | null;
  bump_resistant: boolean;
  pick_resistant: boolean;
  drill_resistant: boolean;
  ansi_grade: string | null;
  smart_features: string | null;
  created_at: string;
}

export interface ResidentialKeyBlank {
  id: string;
  lock_id: string;
  manufacturer_id: string;
  blank_number: string;
  brand: string;
  keyway: string;
  material: string;
  depth_spec: string | null;
  spacing_spec: string | null;
  pinning_chart: Record<string, unknown> | null;
  notes: string | null;
  created_at: string;
}

export interface Post {
  id: string;
  author_id: string;
  title: string;
  body: string;
  category: 'automotive' | 'residential' | 'general' | 'tips';
  reference_type: 'automotive_key' | 'residential_lock' | null;
  reference_id: string | null;
  vote_count: number;
  created_at: string;
  updated_at: string;
  author?: Profile;
}

export interface Comment {
  id: string;
  post_id: string;
  author_id: string;
  parent_id: string | null;
  body: string;
  vote_count: number;
  created_at: string;
  updated_at: string;
  author?: Profile;
}

export interface Vote {
  id: string;
  user_id: string;
  votable_type: 'post' | 'comment';
  votable_id: string;
  value: 1 | -1;
  created_at: string;
}

export interface Bookmark {
  id: string;
  user_id: string;
  bookmarkable_type: 'automotive_key' | 'residential_lock' | 'residential_blank' | 'post';
  bookmarkable_id: string;
  created_at: string;
}

export interface SearchResult {
  id: string;
  type: 'automotive_key' | 'residential_lock' | 'post';
  title: string;
  subtitle: string;
  match_text: string;
}
