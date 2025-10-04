-- Enhanced Speakers Database Schema Migration
-- Adding comprehensive speaker information fields and social links

-- Add enhanced columns to event_speakers table
ALTER TABLE event_speakers ADD COLUMN linkedin_url TEXT;
ALTER TABLE event_speakers ADD COLUMN twitter_url TEXT;
ALTER TABLE event_speakers ADD COLUMN website_url TEXT;
ALTER TABLE event_speakers ADD COLUMN image_url TEXT;
ALTER TABLE event_speakers ADD COLUMN education TEXT; -- JSON array for education background
ALTER TABLE event_speakers ADD COLUMN expertise TEXT; -- JSON array for areas of expertise
ALTER TABLE event_speakers ADD COLUMN previous_companies TEXT; -- JSON array for work history
ALTER TABLE event_speakers ADD COLUMN speaking_topics TEXT; -- JSON array for speaking focus areas
ALTER TABLE event_speakers ADD COLUMN awards TEXT; -- JSON array for awards and recognition
ALTER TABLE event_speakers ADD COLUMN publications TEXT; -- JSON array for key publications/research
ALTER TABLE event_speakers ADD COLUMN speaker_type TEXT; -- keynote, panelist, moderator, host, etc.
ALTER TABLE event_speakers ADD COLUMN is_featured BOOLEAN DEFAULT 0; -- highlight key speakers
ALTER TABLE event_speakers ADD COLUMN speaking_order INTEGER; -- order of appearance
ALTER TABLE event_speakers ADD COLUMN session_title TEXT; -- specific session they're speaking in

-- Create speaker profiles table for reusable speaker information
CREATE TABLE IF NOT EXISTS speaker_profiles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  slug TEXT UNIQUE, -- URL-friendly name
  title TEXT,
  current_company TEXT,
  bio TEXT,
  long_bio TEXT, -- extended biography
  linkedin_url TEXT,
  twitter_url TEXT,
  website_url TEXT,
  image_url TEXT,
  location TEXT,
  education TEXT, -- JSON array
  expertise TEXT, -- JSON array  
  previous_companies TEXT, -- JSON array
  speaking_topics TEXT, -- JSON array
  awards TEXT, -- JSON array
  publications TEXT, -- JSON array
  media_mentions TEXT, -- JSON array
  total_events INTEGER DEFAULT 0, -- count of events spoken at
  featured_speaker BOOLEAN DEFAULT 0, -- VIP/celebrity speaker status
  speaker_fee_range TEXT, -- speaking fee category
  availability_status TEXT, -- active, retired, limited, etc.
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create speaker social media and contact table
CREATE TABLE IF NOT EXISTS speaker_contacts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  speaker_profile_id INTEGER,
  contact_type TEXT, -- linkedin, twitter, website, email, phone, etc.
  contact_value TEXT,
  is_public BOOLEAN DEFAULT 1,
  is_primary BOOLEAN DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (speaker_profile_id) REFERENCES speaker_profiles(id) ON DELETE CASCADE
);

-- Create speaker topics/expertise taxonomy
CREATE TABLE IF NOT EXISTS speaker_expertise_tags (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL,
  category TEXT, -- technical, business, industry, etc.
  description TEXT,
  color TEXT, -- hex color for UI
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Junction table for speaker-expertise relationships
CREATE TABLE IF NOT EXISTS speaker_expertise_mappings (
  speaker_profile_id INTEGER,
  expertise_tag_id INTEGER,
  proficiency_level TEXT, -- beginner, intermediate, expert, thought_leader
  years_experience INTEGER,
  PRIMARY KEY (speaker_profile_id, expertise_tag_id),
  FOREIGN KEY (speaker_profile_id) REFERENCES speaker_profiles(id) ON DELETE CASCADE,
  FOREIGN KEY (expertise_tag_id) REFERENCES speaker_expertise_tags(id) ON DELETE CASCADE
);

-- Link event speakers to speaker profiles for consistency
ALTER TABLE event_speakers ADD COLUMN speaker_profile_id INTEGER;
-- Note: This allows linking to centralized speaker profiles while maintaining event-specific data

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_speakers_profile_id ON event_speakers(speaker_profile_id);
CREATE INDEX IF NOT EXISTS idx_speakers_featured ON event_speakers(is_featured);
CREATE INDEX IF NOT EXISTS idx_speakers_type ON event_speakers(speaker_type);
CREATE INDEX IF NOT EXISTS idx_speakers_order ON event_speakers(speaking_order);
CREATE INDEX IF NOT EXISTS idx_speaker_profiles_slug ON speaker_profiles(slug);
CREATE INDEX IF NOT EXISTS idx_speaker_profiles_company ON speaker_profiles(current_company);
CREATE INDEX IF NOT EXISTS idx_speaker_profiles_featured ON speaker_profiles(featured_speaker);
CREATE INDEX IF NOT EXISTS idx_speaker_contacts_profile ON speaker_contacts(speaker_profile_id);
CREATE INDEX IF NOT EXISTS idx_speaker_contacts_type ON speaker_contacts(contact_type);
CREATE INDEX IF NOT EXISTS idx_expertise_mappings_speaker ON speaker_expertise_mappings(speaker_profile_id);
CREATE INDEX IF NOT EXISTS idx_expertise_mappings_tag ON speaker_expertise_mappings(expertise_tag_id);