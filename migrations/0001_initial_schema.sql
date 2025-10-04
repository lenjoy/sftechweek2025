-- SF Tech Week Events Database Schema

-- Events table
CREATE TABLE IF NOT EXISTS events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  description TEXT,
  event_date DATE,
  start_time TEXT,
  end_time TEXT,
  location TEXT,
  venue TEXT,
  neighborhood TEXT,
  organizers TEXT, -- JSON array as text
  event_type TEXT, -- panel, networking, workshop, etc.
  registration_url TEXT,
  is_invite_only BOOLEAN DEFAULT 0,
  capacity INTEGER,
  tags TEXT, -- JSON array as text for topics/categories
  source_url TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Event speakers/hosts table
CREATE TABLE IF NOT EXISTS event_speakers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  event_id INTEGER,
  name TEXT NOT NULL,
  title TEXT,
  company TEXT,
  role TEXT, -- speaker, moderator, host, etc.
  bio TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
);

-- Event categories/topics table
CREATE TABLE IF NOT EXISTS event_categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL,
  description TEXT,
  color TEXT, -- hex color for UI
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Junction table for event-category relationships
CREATE TABLE IF NOT EXISTS event_category_mappings (
  event_id INTEGER,
  category_id INTEGER,
  PRIMARY KEY (event_id, category_id),
  FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES event_categories(id) ON DELETE CASCADE
);

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_events_date ON events(event_date);
CREATE INDEX IF NOT EXISTS idx_events_type ON events(event_type);
CREATE INDEX IF NOT EXISTS idx_events_location ON events(location);
CREATE INDEX IF NOT EXISTS idx_events_neighborhood ON events(neighborhood);
CREATE INDEX IF NOT EXISTS idx_speakers_event_id ON event_speakers(event_id);
CREATE INDEX IF NOT EXISTS idx_category_mappings_event ON event_category_mappings(event_id);
CREATE INDEX IF NOT EXISTS idx_category_mappings_category ON event_category_mappings(category_id);