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

-- Insert SF Tech Week events
INSERT OR IGNORE INTO events (
  title, description, event_date, start_time, end_time, location, venue, 
  neighborhood, organizers, event_type, is_invite_only, tags, source_url
) VALUES 

-- AI/Infrastructure Events
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

-- Anthropic Event
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

-- Policy Discussion
(
  'Law Meets Code: AI Rules That Could Shape Your Startup',
  'Discussion on legal and regulatory issues for high-growth startups: federal & state laws, legislative proposals on model development and deployment',
  '2024-10-08', NULL, NULL, 'San Francisco, CA', NULL, 'Union Square',
  '["Fenwick", "Databricks", "a16z"]',
  'panel',
  0,
  '["Policy", "AI/ML"]',
  'https://www.tech-week.com/calendar/sf'
),

-- Cybersecurity Event
(
  'Celebrating the Cyber60: Where Cybersecurity Innovation Meets Investment',
  'Celebration event for cybersecurity startups and investors',
  '2024-10-08', NULL, NULL, 'San Francisco, CA', NULL, 'Financial District',
  '["AWS", "Lightspeed Venture Partners"]',
  'reception',
  0,
  '["Cybersecurity", "Networking"]',
  'https://www.tech-week.com/calendar/sf'
),

-- Wellness Activities
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
  'Delphi x D.E. Shaw Ventures Biking & Coffee',
  'Bike ride followed by coffee & networking. Hawk Hill route starting from Equator Coffee',
  '2024-10-06', '07:00', '08:00', '2 Marina Blvd, San Francisco, CA 94123', 'Equator Coffee', 'Marina',
  '["Delphi", "D.E. Shaw Ventures"]',
  'wellness',
  0,
  '["Wellness", "Networking"]',
  'https://www.tech-week.com/calendar/sf'
),

(
  'Founders Cold Plunge',
  'Guided cold plunge into the water with breathing techniques, followed by recovery over coffee',
  '2024-10-07', NULL, NULL, 'Aquatic Park Cove', 'Aquatic Park Cove', 'Fishermans Wharf',
  '["Team Atlas"]',
  'wellness',
  0,
  '["Wellness", "Networking"]',
  'https://www.tech-week.com/calendar/sf'
),

-- Capital Markets & Finance
(
  'Navigating Capital Markets: Insights, Strategies, and Leadership',
  'Panel and conversation for CFOs/financial leaders covering IPOs, M&A, exit opportunities, strategic capital planning',
  '2024-10-08', NULL, NULL, 'San Francisco, CA', NULL, NULL,
  '["PwC", "a16z"]',
  'panel',
  0,
  '["Fintech", "Networking"]',
  'https://www.tech-week.com/calendar/sf'
),

-- Pitch Competitions
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
  'Web3 & AI Pitch Competition',
  'Web3 + AI pitch competition and VC networking. 3-minute presentations + 4-minute Q&A',
  '2024-10-08', '10:00', '13:00', 'San Francisco, CA', NULL, 'Civic Center',
  '["Ga^3in Ventures"]',
  'pitch_competition',
  0,
  '["Pitch Competition", "AI/ML", "Web3"]',
  'https://www.tech-week.com/calendar/sf'
),

-- Workshops & Learning
(
  'Trust on Toast: AI Breakfast',
  'Breakfast where enterprises meet curated AI startups. Startups will pitch on the floor',
  '2024-10-08', '08:00', '10:00', 'San Francisco, CA', NULL, 'Downtown',
  '["Assenteo"]',
  'workshop',
  0,
  '["AI/ML", "Networking", "Workshop"]',
  'https://www.tech-week.com/calendar/sf'
),

(
  'Best Practices for Term Sheets for Founders',
  'Workshop covering financing structures, critical term sheet provisions, strategic fundraising positioning',
  '2024-10-09', NULL, NULL, 'San Francisco, CA', NULL, 'Downtown',
  '["Deel", "a16z", "Carta", "Rillet"]',
  'workshop',
  0,
  '["Workshop", "Fintech"]',
  'https://www.tech-week.com/calendar/sf'
),

-- Networking Events
(
  'Mercury Brunch & Water Cycling on the Bay',
  'Guided water cycling rides departing from Pier 40 every 20 minutes with lawn games, merch, and brunch',
  '2024-10-09', NULL, NULL, 'Pier 40, San Francisco Bay', 'Pier 40', 'Embarcadero',
  '["Mercury"]',
  'networking',
  0,
  '["Networking", "Wellness"]',
  'https://www.tech-week.com/calendar/sf'
),

(
  'Atlassian: Unleash Every Startup',
  'Celebration of Atlassian for Startups. Meet founders, investors, Atlassian team with bites & beverages',
  '2024-10-08', NULL, NULL, 'San Francisco, CA', NULL, 'Financial District',
  '["Atlassian"]',
  'networking',
  0,
  '["Networking"]',
  'https://www.tech-week.com/calendar/sf'
),

-- Multi-day Events
(
  'Mesh San Francisco',
  'High-level gathering for ~100 Nordic founders, 25 Nordic VCs, 25 US VCs. Includes runs, surfing, hikes, panels, and social events',
  '2024-10-05', NULL, NULL, 'Multiple locations across SF', NULL, 'Various',
  '["IVP", "Khosla Ventures", "Creandum", "byFounders"]',
  'conference',
  1,
  '["Networking", "Panel"]',
  'https://www.tech-week.com/calendar/sf'
),

-- Tech Talks
(
  'Unlocking Our Quantum Future with IBM',
  'Live Smart Talks with IBM podcast recording featuring Malcolm Gladwell and Jay Gambetta',
  '2024-10-08', '08:45', NULL, 'San Francisco, CA', NULL, NULL,
  '["iHeartMedia", "IBM"]',
  'panel',
  1,
  '["AI/ML", "Infrastructure"]',
  'https://www.tech-week.com/calendar/sf'
),

(
  'AI Frontier: Data, Agents & Robots',
  'Large SF Tech Week event with panels on embodied AI, agentic AI, data/infra/security, startup announcements',
  '2024-10-09', '11:00', '15:00', 'San Mateo', NULL, 'San Mateo',
  '["Silicon Valley AI Pioneer Club", "UC Santa Cruz GenAI Center"]',
  'conference',
  0,
  '["AI/ML", "Infrastructure"]',
  'https://www.tech-week.com/calendar/sf'
);

-- Insert some speakers for key events
INSERT OR IGNORE INTO event_speakers (event_id, name, title, company, role) VALUES
-- AI Infrastructure Panel speakers
(1, 'Jennifer Li', 'General Partner', 'a16z', 'panelist'),
(1, 'Gorkem Yurtseven', 'Co-Founder', 'Fal.ai', 'panelist'),
(1, 'Adam Brown', 'Co-founder', 'Mux', 'panelist'),
(1, 'Alex Choy', 'Managing Director', 'HSBC Innovation Banking', 'moderator'),

-- Anthropic Salon speakers
(2, 'Ben Mann', 'Co-founder', 'Anthropic', 'speaker'),
(2, 'Jeff Wang', 'CEO', 'Windsurf', 'speaker'),
(2, 'Matt McClernan', 'CEO', 'Augment Code', 'speaker'),
(2, 'Wen Seng', 'COO', 'Genspark', 'speaker'),

-- Law & Policy Panel speakers
(3, 'Tram Phi', 'General Counsel', 'Databricks', 'panelist'),
(3, 'Matt Perault', 'Head of AI Policy', 'a16z', 'panelist'),
(3, 'Dave Bell', 'Partner', 'Fenwick', 'panelist'),

-- Quantum Future speakers
(15, 'Malcolm Gladwell', 'Author & Host', 'Smart Talks with IBM', 'speaker'),
(15, 'Jay Gambetta', 'IBM Fellow & Director', 'IBM Research', 'speaker');

-- Map events to categories
INSERT OR IGNORE INTO event_category_mappings (event_id, category_id) 
SELECT e.id, c.id 
FROM events e, event_categories c 
WHERE 
  (e.title LIKE '%AI%' OR e.description LIKE '%AI%' OR e.description LIKE '%artificial intelligence%') 
  AND c.name = 'AI/ML'
UNION
SELECT e.id, c.id 
FROM events e, event_categories c 
WHERE 
  (e.event_type = 'panel' OR e.title LIKE '%Panel%') 
  AND c.name = 'Panel'
UNION
SELECT e.id, c.id 
FROM events e, event_categories c 
WHERE 
  (e.event_type = 'networking' OR e.event_type = 'reception' OR e.description LIKE '%networking%') 
  AND c.name = 'Networking'
UNION
SELECT e.id, c.id 
FROM events e, event_categories c 
WHERE 
  (e.event_type = 'wellness' OR e.title LIKE '%Run%' OR e.title LIKE '%Plunge%' OR e.title LIKE '%Cycling%') 
  AND c.name = 'Wellness'
UNION
SELECT e.id, c.id 
FROM events e, event_categories c 
WHERE 
  (e.event_type = 'pitch_competition' OR e.title LIKE '%Pitch%' OR e.title LIKE '%Competition%') 
  AND c.name = 'Pitch Competition'
UNION
SELECT e.id, c.id 
FROM events e, event_categories c 
WHERE 
  (e.title LIKE '%Finance%' OR e.title LIKE '%Capital%' OR e.description LIKE '%fintech%' OR e.description LIKE '%CFO%') 
  AND c.name = 'Fintech';