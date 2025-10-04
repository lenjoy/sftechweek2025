-- Simple enhanced seed data for SF Tech Week Events

-- Insert core enhanced events
INSERT INTO events (
  title, description, event_date, start_time, end_time, location, venue, 
  neighborhood, organizers, event_type, is_invite_only, tags, source_url,
  technical_tags, business_focus, target_audience, difficulty_level, industry_vertical
) VALUES 

(
  'AI, Infra, & the Future of Generative Media',
  'Panel on AI infrastructure and multimodal generative media systems with enterprise deployment strategies',
  '2024-10-07', '16:00', '18:00', 'San Francisco, CA', 'HSBC Innovation Center', 'SOMA',
  '["HSBC Innovation Banking", "a16z"]',
  'panel', 0, '["AI/ML", "Infrastructure", "Networking"]',
  'https://www.tech-week.com/calendar/sf',
  '["Generative AI", "Multimodal AI", "AI Infrastructure", "MLOps"]',
  'Enterprise AI Deployment', 'Technical Leaders, CTOs, AI Engineers', 'intermediate',
  'Media & Entertainment'
),

(
  'Anthropic AI Founder Salon: Constitutional AI',
  'Exclusive technical gathering on constitutional AI, large language models, and AI safety',
  '2024-10-07', '18:00', '21:00', 'San Francisco, CA', 'Anthropic HQ', 'Downtown',
  '["Anthropic"]',
  'salon', 1, '["AI/ML", "Enterprise AI"]',
  'https://www.tech-week.com/calendar/sf',
  '["Large Language Models", "Natural Language Processing", "AI Ethics", "Enterprise AI"]',
  'AI Research & Development', 'AI Researchers, Technical Founders, ML Engineers', 'advanced',
  'AI Research'
),

(
  'BATTER UP! AI Startup Pitch Competition',
  'AI startups showcase across computer vision, NLP, robotics, and enterprise AI solutions',
  '2024-10-09', '10:00', '17:00', 'San Francisco, CA', 'SOMA Innovation Hub', 'SOMA',
  '["Syndicate AI", "Hustle Fund", "Hollo AI"]',
  'pitch_competition', 0, '["Pitch Competition", "AI/ML", "Venture Capital"]',
  'https://www.tech-week.com/calendar/sf',
  '["Generative AI", "Computer Vision", "Robotics", "Enterprise AI"]',
  'Startup Investment & Growth', 'Founders, VCs, Angel Investors', 'intermediate',
  'Venture Capital'
),

(
  'Physical AI Breakfast: Robotics & Embodied Intelligence',
  'Technical discussion on embodied AI systems, autonomous robotics, and industrial automation',
  '2024-10-07', '08:00', '10:00', 'San Francisco, CA', 'Robotics Innovation Lab', 'SOMA',
  '["Schematic Ventures", "Physical AI Collective"]',
  'workshop', 0, '["Robotics", "Physical AI", "Manufacturing"]',
  'https://www.tech-week.com/calendar/sf',
  '["Robotics", "Computer Vision", "Edge Computing", "Industrial AI"]',
  'Robotics & Manufacturing AI', 'Robotics Engineers, Hardware Founders', 'advanced',
  'Manufacturing & Robotics'
),

(
  'Web3 × AI: Decentralized Intelligence Pitch',
  'Startups at Web3-AI intersection: decentralized training, blockchain-verified AI',
  '2024-10-08', '10:00', '13:00', 'San Francisco, CA', 'Crypto Innovation Hub', 'Civic Center',
  '["Ga^3in Ventures", "Web3 AI Alliance"]',
  'pitch_competition', 0, '["Web3", "Blockchain", "Decentralized AI"]',
  'https://www.tech-week.com/calendar/sf',
  '["Blockchain", "Decentralized AI", "Crypto Protocols", "Distributed Computing"]',
  'Blockchain & Decentralized AI', 'Web3 Founders, Crypto VCs', 'advanced',
  'Blockchain & Crypto'
),

(
  'Enterprise AI Adoption Breakfast',
  'Fortune 500 companies meet AI startups solving real enterprise problems with proven ROI',
  '2024-10-08', '08:00', '10:00', 'San Francisco, CA', 'Enterprise AI Hub', 'Downtown',
  '["Assenteo", "Enterprise AI Alliance"]',
  'workshop', 0, '["Enterprise AI", "B2B Sales"]',
  'https://www.tech-week.com/calendar/sf',
  '["Enterprise AI", "B2B Integration", "AI ROI", "Enterprise Sales"]',
  'Enterprise AI Solutions', 'Enterprise Buyers, B2B Founders', 'intermediate',
  'Enterprise Software'
),

(
  'Cyber60: AI-Powered Security Innovation',
  'Top cybersecurity startups leveraging AI for threat detection and autonomous security',
  '2024-10-08', '17:00', '20:00', 'San Francisco, CA', 'AWS Startup Loft', 'Financial District',
  '["AWS", "Lightspeed Venture Partners"]',
  'reception', 0, '["Cybersecurity", "Enterprise AI"]',
  'https://www.tech-week.com/calendar/sf',
  '["Cybersecurity AI", "Threat Detection", "Zero Trust", "Edge Security"]',
  'AI Security Solutions', 'Security Engineers, CISOs', 'intermediate',
  'Cybersecurity'
),

(
  'Quantum AI: IBM Research Frontiers',
  'Quantum-classical hybrid algorithms and quantum machine learning intersection',
  '2024-10-08', '08:45', '10:30', 'San Francisco, CA', 'IBM Research Lab', 'SOMA',
  '["IBM Research", "iHeartMedia"]',
  'panel', 1, '["Quantum Computing", "AI Research"]',
  'https://www.tech-week.com/calendar/sf',
  '["Quantum Computing", "Quantum Machine Learning", "Advanced Algorithms"]',
  'Quantum AI Research', 'Researchers, Quantum Engineers', 'advanced',
  'Quantum Computing'
);

-- Insert speakers for key events
INSERT INTO event_speakers (event_id, name, title, company, role) VALUES
(1, 'Jennifer Li', 'General Partner', 'a16z', 'panelist'),
(1, 'Gorkem Yurtseven', 'Co-Founder & CTO', 'Fal.ai', 'panelist'),
(2, 'Ben Mann', 'Co-founder & Chief Scientist', 'Anthropic', 'speaker'),
(2, 'Jeff Wang', 'CEO', 'Windsurf', 'speaker'),
(8, 'Malcolm Gladwell', 'Author & Host', 'Smart Talks with IBM', 'speaker'),
(8, 'Jay Gambetta', 'IBM Fellow & VP', 'IBM Quantum', 'speaker');