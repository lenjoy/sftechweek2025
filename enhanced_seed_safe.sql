-- Enhanced SF Tech Week Events with Comprehensive Labeling
-- Safe version with proper foreign key handling

PRAGMA foreign_keys = OFF;

-- Clear existing data
DELETE FROM event_category_mappings;
DELETE FROM event_speakers;  
DELETE FROM events;

-- Insert comprehensive SF Tech Week events with detailed labeling
INSERT INTO events (
  title, description, event_date, start_time, end_time, location, venue, 
  neighborhood, organizers, event_type, is_invite_only, tags, source_url,
  technical_tags, business_focus, target_audience, difficulty_level, industry_vertical
) VALUES 

-- AI Infrastructure & Generative Media
(
  'AI, Infra, & the Future of Generative Media',
  'Panel discussion on AI infrastructure and generative media with deep-dive into multimodal AI systems, enterprise deployment strategies, and content generation platforms',
  '2024-10-07', '16:00', '18:00', 'San Francisco, CA', 'HSBC Innovation Center', 'SOMA',
  '["HSBC Innovation Banking", "a16z"]',
  'panel', 0, '["AI/ML", "Infrastructure", "Networking"]',
  'https://www.tech-week.com/calendar/sf',
  '["Generative AI", "Multimodal AI", "AI Infrastructure", "MLOps", "Computer Vision"]',
  'Enterprise AI Deployment', 'Technical Leaders, CTOs, AI Engineers', 'intermediate',
  'Media & Entertainment'
),

-- Anthropic AI Technical Deep-dive
(
  'Anthropic AI Founder Salon: Claude & Constitutional AI',
  'Exclusive technical gathering for AI builders focusing on constitutional AI, large language models, AI safety, and enterprise deployment of Claude systems',
  '2024-10-07', '18:00', '21:00', 'San Francisco, CA', 'Anthropic HQ', 'Downtown',
  '["Anthropic"]',
  'salon', 1, '["AI/ML", "Networking", "Enterprise AI"]',
  'https://www.tech-week.com/calendar/sf',
  '["Large Language Models", "Natural Language Processing", "AI Ethics", "Enterprise AI", "AI Safety"]',
  'AI Research & Development', 'AI Researchers, Technical Founders, ML Engineers', 'advanced',
  'AI Research'
),

-- Wellness & Networking
(
  'Founders Wellness Run: Building Resilient Teams',
  '5K networking run focusing on founder mental health, team building strategies, and work-life balance in high-growth startups',
  '2024-10-06', '06:30', '08:00', 'Ferry Building to Crissy Field', 'Ferry Building', 'Embarcadero',
  '["Virio", "Founder Wellness Collective"]',
  'wellness', 0, '["Wellness", "Networking", "Leadership"]',
  'https://www.tech-week.com/calendar/sf',
  '["Team Management", "Leadership Development"]',
  'Founder Wellness & Leadership', 'Founders, CEOs, Team Leaders', 'beginner',
  'Leadership & HR'
),

-- Startup Pitch Competition with AI Focus
(
  'BATTER UP! AI Startup Showcase & Pitch Competition',
  'High-energy pitch competition featuring AI startups across computer vision, NLP, robotics, and enterprise AI solutions with 3-minute pitches and investor feedback',
  '2024-10-09', '10:00', '17:00', 'San Francisco, CA', 'SOMA Innovation Hub', 'SOMA',
  '["Syndicate AI", "Hustle Fund", "Hollo AI", "Alumni Ventures"]',
  'pitch_competition', 0, '["Pitch Competition", "AI/ML", "Venture Capital"]',
  'https://www.tech-week.com/calendar/sf',
  '["Generative AI", "Computer Vision", "Robotics", "Enterprise AI", "Natural Language Processing"]',
  'Startup Investment & Growth', 'Founders, VCs, Angel Investors', 'intermediate',
  'Venture Capital'
),

-- Fintech Innovation
(
  'Mercury Fintech Innovation: Water Cycling & Banking APIs',
  'Unique networking experience combining water cycling with discussions on fintech APIs, embedded banking, AI-powered financial services, and startup banking solutions',
  '2024-10-09', '11:00', '15:00', 'Pier 40, San Francisco Bay', 'Pier 40 Water Sports', 'Embarcadero',
  '["Mercury Bank", "Fintech Founders Alliance"]',
  'networking', 0, '["Networking", "Fintech", "APIs"]',
  'https://www.tech-week.com/calendar/sf',
  '["APIs", "Banking Infrastructure", "Fintech AI", "Financial Data"]',
  'Financial Technology Innovation', 'Fintech Founders, Product Managers, Engineers', 'intermediate',
  'Financial Services'
),

-- Enterprise AI Policy & Legal
(
  'Law Meets Code: AI Regulation & Enterprise Compliance',
  'Critical discussion on AI governance, federal & state AI laws, model deployment compliance, copyright implications, and enterprise risk management strategies',
  '2024-10-08', '14:00', '16:00', 'San Francisco, CA', 'Fenwick Law Offices', 'Union Square',
  '["Fenwick & West", "Databricks", "a16z"]',
  'panel', 0, '["Policy", "Legal Tech", "Enterprise AI", "Compliance"]',
  'https://www.tech-week.com/calendar/sf',
  '["AI Ethics", "Enterprise AI", "Legal Tech", "Compliance Automation"]',
  'AI Governance & Legal Compliance', 'Legal Counsel, Compliance Officers, CTOs', 'advanced',
  'Legal & Regulatory'
),

-- Cybersecurity & AI
(
  'Cyber60: AI-Powered Security Innovation Showcase',
  'Exclusive showcase of top 60 cybersecurity startups leveraging AI for threat detection, zero-trust architecture, and autonomous security response systems',
  '2024-10-08', '17:00', '20:00', 'San Francisco, CA', 'AWS Startup Loft', 'Financial District',
  '["AWS", "Lightspeed Venture Partners", "CyberSecurity Coalition"]',
  'reception', 0, '["Cybersecurity", "Enterprise AI", "Networking"]',
  'https://www.tech-week.com/calendar/sf',
  '["Cybersecurity AI", "Threat Detection", "Zero Trust", "Edge Security"]',
  'AI Security Solutions', 'Security Engineers, CISOs, VCs', 'intermediate',
  'Cybersecurity'
),

-- Quantum Computing & Future Tech
(
  'Unlocking Quantum AI: IBM Research Frontiers',
  'Live podcast recording featuring quantum-classical hybrid algorithms, quantum machine learning, and the intersection of quantum computing with AI systems',
  '2024-10-08', '08:45', '10:30', 'San Francisco, CA', 'IBM Research Lab', 'SOMA',
  '["IBM Research", "iHeartMedia", "Quantum AI Collective"]',
  'panel', 1, '["Quantum Computing", "AI Research", "Future Tech"]',
  'https://www.tech-week.com/calendar/sf',
  '["Quantum Computing", "Quantum Machine Learning", "Advanced Algorithms"]',
  'Quantum AI Research', 'Researchers, Quantum Engineers, Advanced AI Engineers', 'advanced',
  'Quantum Computing'
),

-- Developer Tools & Platform
(
  'Atlassian for Startups: DevOps & AI-Enhanced Development',
  'Platform showcase demonstrating AI-enhanced development workflows, automated testing, intelligent code review, and startup-focused development tools',
  '2024-10-08', '15:00', '18:00', 'San Francisco, CA', 'Atlassian HQ', 'Financial District',
  '["Atlassian", "Developer Community SF"]',
  'networking', 0, '["Developer Tools", "DevOps", "Startup Tools"]',
  'https://www.tech-week.com/calendar/sf',
  '["DevOps", "Developer Tools", "AI-Enhanced Development", "Automation"]',
  'Development Platform & Tools', 'Developers, DevOps Engineers, Engineering Managers', 'intermediate',
  'Developer Tools'
),

-- Multi-day Nordic Innovation Conference
(
  'Mesh San Francisco: Nordic Innovation & Global Expansion',
  'Exclusive 2-day program connecting Nordic tech ecosystem with Silicon Valley featuring AI unicorns, climate tech, and transatlantic venture strategies',
  '2024-10-05', '08:00', '22:00', 'Multiple SF Venues', 'a16z + Shack15', 'Various',
  '["IVP", "Khosla Ventures", "Creandum", "byFounders", "Nordic Innovation"]',
  'conference', 1, '["International Expansion", "Venture Capital", "Climate Tech"]',
  'https://www.tech-week.com/calendar/sf',
  '["International Business", "Climate Tech", "Nordic Innovation", "Global Scaling"]',
  'Global Innovation & Expansion', 'International Founders, Global VCs, Expansion Leaders', 'advanced',
  'International Business'
),

-- Capital Markets & Financial Strategy
(
  'Navigating AI-Era Capital Markets: IPO & M&A Strategies',
  'Strategic session for CFOs on AI company valuations, IPO readiness in the AI era, M&A strategies for AI startups, and financial metrics for AI businesses',
  '2024-10-08', '09:00', '11:00', 'San Francisco, CA', 'PwC Innovation Center', 'Financial District',
  '["PwC", "a16z", "Silicon Valley Bank"]',
  'panel', 0, '["Finance Strategy", "Capital Markets", "AI Valuation"]',
  'https://www.tech-week.com/calendar/sf',
  '["Financial Analytics", "AI Business Metrics", "Valuation Models"]',
  'AI Business Strategy & Finance', 'CFOs, Financial Directors, Investment Bankers', 'advanced',
  'Financial Services'
),

-- Enterprise AI Breakfast & Pitches
(
  'Trust on Toast: Enterprise AI Adoption Breakfast',
  'Enterprise-focused breakfast where Fortune 500 companies meet vetted AI startups. Featured pitches from AI companies solving real enterprise problems with proven ROI',
  '2024-10-08', '08:00', '10:00', 'San Francisco, CA', 'Enterprise AI Hub', 'Downtown',
  '["Assenteo", "Enterprise AI Alliance", "Sensiba"]',
  'workshop', 0, '["Enterprise AI", "B2B Sales", "AI Adoption"]',
  'https://www.tech-week.com/calendar/sf',
  '["Enterprise AI", "B2B Integration", "AI ROI", "Enterprise Sales"]',
  'Enterprise AI Solutions', 'Enterprise Buyers, B2B Founders, Sales Leaders', 'intermediate',
  'Enterprise Software'
),

-- Robotics & Physical AI
(
  'Physical AI Breakfast: Robotics & Embodied Intelligence',
  'Deep technical discussion on embodied AI systems, autonomous robotics, industrial automation, and the convergence of AI with physical systems',
  '2024-10-07', '08:00', '10:00', 'San Francisco, CA', 'Robotics Innovation Lab', 'SOMA',
  '["Schematic Ventures", "Physical AI Collective", "Robotics Founders"]',
  'workshop', 0, '["Robotics", "Physical AI", "Manufacturing"]',
  'https://www.tech-week.com/calendar/sf',
  '["Robotics", "Computer Vision", "Edge Computing", "Industrial AI", "Autonomous Systems"]',
  'Robotics & Manufacturing AI', 'Robotics Engineers, Manufacturing Leaders, Hardware Founders', 'advanced',
  'Manufacturing & Robotics'
),

-- Web3 & Blockchain AI Integration
(
  'Web3 × AI: Decentralized Intelligence Pitch Competition',
  'Innovative pitch competition showcasing startups at the intersection of Web3 and AI: decentralized training, blockchain-verified AI, and crypto-native AI applications',
  '2024-10-08', '10:00', '13:00', 'San Francisco, CA', 'Crypto Innovation Hub', 'Civic Center',
  '["Ga^3in Ventures", "Web3 AI Alliance", "Blockchain Founders Fund"]',
  'pitch_competition', 0, '["Web3", "Blockchain", "Decentralized AI"]',
  'https://www.tech-week.com/calendar/sf',
  '["Blockchain", "Decentralized AI", "Crypto Protocols", "Distributed Computing"]',
  'Blockchain & Decentralized AI', 'Web3 Founders, Crypto VCs, Blockchain Engineers', 'advanced',
  'Blockchain & Crypto'
),

-- Legal Technology & AI
(
  'Term Sheet Mastery: AI-Enhanced Legal Tech Workshop',
  'Comprehensive workshop covering AI-powered contract analysis, automated term sheet generation, legal AI tools, and fundraising documentation for AI startups',
  '2024-10-09', '13:00', '16:00', 'San Francisco, CA', 'Legal Innovation Center', 'Downtown',
  '["Deel", "a16z", "Carta", "Rillet", "Legal AI Collective"]',
  'workshop', 0, '["Legal Tech", "Fundraising", "Contract AI"]',
  'https://www.tech-week.com/calendar/sf',
  '["Legal Tech", "Contract AI", "Document Automation", "Natural Language Processing"]',
  'Legal Technology & Fundraising', 'Founders, Legal Counsel, Finance Leaders', 'intermediate',
  'Legal Technology'
);

-- Insert enhanced speakers
INSERT INTO event_speakers (event_id, name, title, company, role, bio) VALUES
-- AI Infrastructure Panel (Event ID 1)
(1, 'Jennifer Li', 'General Partner', 'a16z', 'panelist', 'Leading AI infrastructure investments at Andreessen Horowitz, former VP Engineering at Datacenter AI'),
(1, 'Gorkem Yurtseven', 'Co-Founder & CTO', 'Fal.ai', 'panelist', 'Building high-performance AI inference infrastructure, former ML Infrastructure at OpenAI'),
(1, 'Adam Brown', 'Co-founder & CEO', 'Mux', 'panelist', 'Video infrastructure expert, scaling media platforms for AI-generated content'),

-- Anthropic Salon (Event ID 2)
(2, 'Ben Mann', 'Co-founder & Chief Scientist', 'Anthropic', 'speaker', 'Constitutional AI researcher, former OpenAI research scientist'),
(2, 'Jeff Wang', 'CEO', 'Windsurf', 'speaker', 'Building AI-powered development environments, former Google AI PM'),
(2, 'Matt McClernan', 'CEO', 'Augment Code', 'speaker', 'AI coding assistant pioneer, former GitHub Enterprise leader'),

-- Legal & Policy Panel (Event ID 6)
(6, 'Tram Phi', 'General Counsel', 'Databricks', 'panelist', 'Leading AI legal strategy for enterprise data and AI platform'),
(6, 'Matt Perault', 'Head of AI Policy', 'a16z', 'panelist', 'Former Facebook policy leader, AI regulation expert'),
(6, 'Dave Bell', 'Partner', 'Fenwick & West', 'panelist', 'Technology law expert specializing in AI and data privacy'),

-- Quantum AI Panel (Event ID 8)
(8, 'Malcolm Gladwell', 'Author & Host', 'Smart Talks with IBM', 'speaker', 'Bestselling author and host exploring technology and society'),
(8, 'Jay Gambetta', 'IBM Fellow & VP', 'IBM Quantum', 'speaker', 'Leading quantum computing research and quantum-classical hybrid algorithms');

PRAGMA foreign_keys = ON;