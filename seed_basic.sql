-- Insert event categories
INSERT OR IGNORE INTO event_categories (name, description, color) VALUES 
  ('AI/ML', 'Artificial Intelligence and Machine Learning', '#3B82F6'),
  ('Networking', 'Professional networking and social events', '#10B981'),
  ('Panel', 'Panel discussions and talks', '#8B5CF6'),
  ('Workshop', 'Hands-on workshops and learning sessions', '#F59E0B'),
  ('Pitch Competition', 'Startup pitch competitions', '#EF4444'),
  ('Wellness', 'Health, wellness and outdoor activities', '#14B8A6'),
  ('Fintech', 'Financial technology and services', '#06B6D4'),
  ('Infrastructure', 'Technical infrastructure and DevOps', '#6B7280'),
  ('Policy', 'Legal and regulatory discussions', '#9333EA'),
  ('Cybersecurity', 'Security and privacy topics', '#DC2626');

-- Insert a few key SF Tech Week events
INSERT OR IGNORE INTO events (
  title, description, event_date, start_time, end_time, location, venue, 
  neighborhood, organizers, event_type, is_invite_only, tags, source_url
) VALUES 

(
  'AI, Infra, & the Future of Generative Media',
  'Panel discussion on AI infrastructure and generative media with networking reception',
  '2024-10-07', '16:00', '18:00', 'San Francisco, CA', NULL, 'SOMA',
  '["HSBC Innovation Banking", "a16z"]',
  'panel',
  0,
  '["AI/ML", "Infrastructure", "Networking"]',
  'https://www.tech-week.com/calendar/sf'
),

(
  'Anthropic AI Founder Salon',
  'Exclusive gathering for technical decision-makers and AI builders. Deep-dive sessions on Claude, research updates, access to Anthropic teams',
  '2024-10-07', NULL, NULL, 'San Francisco, CA', NULL, 'Downtown',
  '["Anthropic"]',
  'salon',
  1,
  '["AI/ML", "Networking"]',
  'https://www.tech-week.com/calendar/sf'
),

(
  'Virio Run Club',
  '5K run/walk along the trail for founders, CMOs, CROs, directors of sales/marketing of Series A startups',
  '2024-10-06', '06:30', NULL, 'Ferry Building', 'Ferry Building', 'Embarcadero',
  '["Virio"]',
  'wellness',
  0,
  '["Wellness", "Networking"]',
  'https://www.tech-week.com/calendar/sf'
),

(
  'BATTER UP! REGIONAL PITCH COMPETITION 2025',
  'Fast-pitch competition with three-minute pitches and investor feedback, includes all-day startup showcase',
  '2024-10-09', NULL, NULL, 'San Francisco, CA', NULL, 'SOMA',
  '["Syndicate AI", "Hustle Fund", "Hollo AI"]',
  'pitch_competition',
  0,
  '["Pitch Competition", "AI/ML"]',
  'https://www.tech-week.com/calendar/sf'
),

(
  'Mercury Brunch & Water Cycling on the Bay',
  'Guided water cycling rides departing from Pier 40 every 20 minutes with lawn games, merch, and brunch',
  '2024-10-09', NULL, NULL, 'Pier 40, San Francisco Bay', 'Pier 40', 'Embarcadero',
  '["Mercury"]',
  'networking',
  0,
  '["Networking", "Wellness"]',
  'https://www.tech-week.com/calendar/sf'
);

-- Insert some speakers
INSERT OR IGNORE INTO event_speakers (event_id, name, title, company, role) VALUES
(1, 'Jennifer Li', 'General Partner', 'a16z', 'panelist'),
(1, 'Gorkem Yurtseven', 'Co-Founder', 'Fal.ai', 'panelist'),
(2, 'Ben Mann', 'Co-founder', 'Anthropic', 'speaker'),
(2, 'Jeff Wang', 'CEO', 'Windsurf', 'speaker');