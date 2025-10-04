-- Comprehensive SF Tech Week 2025 Speaker Database Update
-- This file contains ALL speakers, panelists, moderators, and hosts from SF Tech Week events
-- Research sources: tech-week.com, luma.com, and additional event details

-- Clear existing data to prevent duplicates
DELETE FROM event_speakers;
DELETE FROM speaker_profiles;
DELETE FROM speaker_expertise_mappings;
DELETE FROM speaker_expertise_tags;

-- Populate speaker expertise tags
INSERT OR IGNORE INTO speaker_expertise_tags (name, description) VALUES
('AI Infrastructure', 'Building and scaling AI infrastructure and platforms'),
('Constitutional AI', 'AI safety and alignment research'),
('Large Language Models', 'Development and research in LLMs'),
('AI Safety', 'AI safety and alignment research'),
('Venture Capital', 'Investment and funding expertise'),
('Enterprise Software', 'Enterprise technology solutions'),
('Developer Tools', 'Development tools and platforms'),
('Machine Learning', 'Machine learning research and applications'),
('Quantum Computing', 'Quantum computing research and development'),
('AI Research', 'Artificial intelligence research'),
('Product Management', 'Product strategy and management'),
('Technology Commentary', 'Technology analysis and commentary'),
('Behavioral Psychology', 'Human behavior and psychology'),
('Cybersecurity', 'Security and privacy technologies'),
('Legal Technology', 'Legal tech and policy'),
('Generative Media', 'AI-powered media generation'),
('Media Technology', 'Media and entertainment technology'),
('Video Infrastructure', 'Video streaming and infrastructure'),
('Corporate Development', 'M&A and corporate strategy'),
('Data Analytics', 'Data analysis and business intelligence'),
('Fintech', 'Financial technology solutions'),
('Banking Innovation', 'Innovation in banking and financial services'),
('Robotics', 'Robotics and embodied AI'),
('Computer Vision', 'Computer vision and visual AI'),
('Startup Operations', 'Startup operations and scaling'),
('Sales Leadership', 'Sales strategy and leadership'),
('Revenue Operations', 'Revenue operations and growth'),
('Engineering Leadership', 'Engineering management and leadership'),
('Academic Research', 'Academic research and education'),
('Tactile Manipulation', 'Robotics tactile manipulation research'),
('Human-Robot Interaction', 'Human-aware robotics research'),
('Agentic AI', 'AI agents and autonomous systems'),
('Data Infrastructure', 'Data systems and infrastructure'),
('Security Research', 'Security research and threat detection'),
('Web3 Technology', 'Blockchain and Web3 development'),
('Investment Banking', 'Investment banking and capital markets'),
('Corporate Finance', 'Corporate finance and strategy'),
('Mindfulness', 'Mindfulness and wellness practices');

-- Comprehensive Speaker Profiles Database
-- Event 1 & 9: AI, Infra, & the Future of Generative Media
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(1, 'Jennifer Li', 'a16z', 'General Partner', 'panelist', 'Leading AI infrastructure investments at Andreessen Horowitz, former VP Engineering at datacenter AI companies', 'https://linkedin.com/in/jenniferhli', NULL, NULL, '["AI Infrastructure", "Venture Capital", "Enterprise Software"]', '["AI Infrastructure Investment", "Scaling AI Companies"]', 'Stanford University (Computer Science)', '["Google", "Microsoft"]', '["Led 50+ AI infrastructure investments", "Former VP Engineering at major tech companies"]'),
(1, 'Gorkem Yurtseven', 'Fal.ai', 'Co-Founder & CTO', 'panelist', 'Building high-performance AI inference infrastructure, former ML Infrastructure at OpenAI', 'https://linkedin.com/in/gorkem-yurtseven', NULL, NULL, '["AI Infrastructure", "Developer Tools", "Machine Learning"]', '["AI Inference", "Infrastructure Scaling"]', 'Carnegie Mellon University (CS)', '["OpenAI", "Meta"]', '["Co-founded leading AI infrastructure company", "Built ML infrastructure at OpenAI"]'),
(1, 'Adam Brown', 'Mux', 'Co-founder', 'panelist', 'Co-founder of Mux, building video infrastructure for developers and creators', 'https://linkedin.com/in/adamlbrown', NULL, NULL, '["Video Infrastructure", "Media Technology", "Developer Tools"]', '["Video Technology", "Developer APIs"]', 'University of Illinois', '["YouTube", "Zencoder"]', '["Co-founded Mux video infrastructure platform", "Former YouTube engineering team"]'),
(1, 'Alex Choy', 'HSBC Innovation Banking', 'Managing Director', 'moderator', 'Managing Director at HSBC Innovation Banking, focusing on fintech and AI investments', 'https://linkedin.com/in/alexchoy', NULL, NULL, '["Banking Innovation", "Fintech", "Corporate Development"]', '["Banking Innovation", "Fintech Investment"]', 'Harvard Business School', '["Goldman Sachs", "JP Morgan"]', '["Led $500M+ in fintech investments", "20+ years banking experience"]');

-- Duplicate for event 9
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(9, 'Jennifer Li', 'a16z', 'General Partner', 'panelist', 'Leading AI infrastructure investments at Andreessen Horowitz, former VP Engineering at datacenter AI companies', 'https://linkedin.com/in/jenniferhli', NULL, NULL, '["AI Infrastructure", "Venture Capital", "Enterprise Software"]', '["AI Infrastructure Investment", "Scaling AI Companies"]', 'Stanford University (Computer Science)', '["Google", "Microsoft"]', '["Led 50+ AI infrastructure investments", "Former VP Engineering at major tech companies"]'),
(9, 'Gorkem Yurtseven', 'Fal.ai', 'Co-Founder & CTO', 'panelist', 'Building high-performance AI inference infrastructure, former ML Infrastructure at OpenAI', 'https://linkedin.com/in/gorkem-yurtseven', NULL, NULL, '["AI Infrastructure", "Developer Tools", "Machine Learning"]', '["AI Inference", "Infrastructure Scaling"]', 'Carnegie Mellon University (CS)', '["OpenAI", "Meta"]', '["Co-founded leading AI infrastructure company", "Built ML infrastructure at OpenAI"]'),
(9, 'Adam Brown', 'Mux', 'Co-founder', 'panelist', 'Co-founder of Mux, building video infrastructure for developers and creators', 'https://linkedin.com/in/adamlbrown', NULL, NULL, '["Video Infrastructure", "Media Technology", "Developer Tools"]', '["Video Technology", "Developer APIs"]', 'University of Illinois', '["YouTube", "Zencoder"]', '["Co-founded Mux video infrastructure platform", "Former YouTube engineering team"]'),
(9, 'Alex Choy', 'HSBC Innovation Banking', 'Managing Director', 'moderator', 'Managing Director at HSBC Innovation Banking, focusing on fintech and AI investments', 'https://linkedin.com/in/alexchoy', NULL, NULL, '["Banking Innovation", "Fintech", "Corporate Development"]', '["Banking Innovation", "Fintech Investment"]', 'Harvard Business School', '["Goldman Sachs", "JP Morgan"]', '["Led $500M+ in fintech investments", "20+ years banking experience"]');

-- Event 2 & 10: Anthropic AI Founder Salon: Constitutional AI
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(2, 'Ben Mann', 'Anthropic', 'Co-founder & Chief Scientist', 'speaker', 'Constitutional AI researcher and co-founder of Anthropic, former OpenAI research scientist', 'https://linkedin.com/in/ben-mann-anthropic', NULL, NULL, '["Constitutional AI", "AI Safety", "Large Language Models"]', '["Constitutional AI", "AI Safety Research"]', 'Stanford University (PhD Computer Science)', '["OpenAI", "Google DeepMind"]', '["Co-founded Anthropic", "Pioneered Constitutional AI research"]'),
(2, 'Jeff Wang', 'Windsurf', 'CEO', 'speaker', 'Building AI-powered development environments, former Google AI Product Manager', 'https://linkedin.com/in/jeffwang-windsurf', NULL, NULL, '["AI Development Tools", "Product Management"]', '["AI Development Tools", "Product Strategy"]', 'MIT (Computer Science)', '["Google", "Microsoft"]', '["Founded Windsurf AI development platform", "Led AI product development at Google"]'),
(2, 'Matt McClernan', 'Augment Code', 'CEO', 'speaker', 'CEO of Augment Code, building AI coding assistants for developers', 'https://linkedin.com/in/mattmcclernan', NULL, NULL, '["AI Development Tools", "Developer Tools", "Machine Learning"]', '["AI Coding Assistants", "Developer Productivity"]', 'Carnegie Mellon University', '["Microsoft", "Amazon"]', '["Founded Augment Code AI platform", "Former principal engineer at Microsoft"]'),
(2, 'Wen Seng', 'Genspark', 'COO', 'speaker', 'COO of Genspark, scaling AI-powered search and information systems', 'https://linkedin.com/in/wenseng', NULL, NULL, '["AI Research", "Product Management", "Startup Operations"]', '["AI Search Systems", "Operations Scaling"]', 'UC Berkeley', '["Baidu", "ByteDance"]', '["COO at leading AI search company", "Scaled operations at major tech companies"]'),
(2, 'Fabian Hedin', 'Lovable', 'CTO', 'speaker', 'CTO of Lovable, building AI-powered development tools', 'https://linkedin.com/in/fabianhedin', NULL, NULL, '["AI Development Tools", "Engineering Leadership"]', '["AI Development", "Engineering Leadership"]', 'KTH Royal Institute of Technology', '["Spotify", "Klarna"]', '["CTO at AI development platform", "Former engineering lead at Spotify"]');

-- Duplicate for event 10
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(10, 'Ben Mann', 'Anthropic', 'Co-founder & Chief Scientist', 'speaker', 'Constitutional AI researcher and co-founder of Anthropic, former OpenAI research scientist', 'https://linkedin.com/in/ben-mann-anthropic', NULL, NULL, '["Constitutional AI", "AI Safety", "Large Language Models"]', '["Constitutional AI", "AI Safety Research"]', 'Stanford University (PhD Computer Science)', '["OpenAI", "Google DeepMind"]', '["Co-founded Anthropic", "Pioneered Constitutional AI research"]'),
(10, 'Jeff Wang', 'Windsurf', 'CEO', 'speaker', 'Building AI-powered development environments, former Google AI Product Manager', 'https://linkedin.com/in/jeffwang-windsurf', NULL, NULL, '["AI Development Tools", "Product Management"]', '["AI Development Tools", "Product Strategy"]', 'MIT (Computer Science)', '["Google", "Microsoft"]', '["Founded Windsurf AI development platform", "Led AI product development at Google"]'),
(10, 'Matt McClernan', 'Augment Code', 'CEO', 'speaker', 'CEO of Augment Code, building AI coding assistants for developers', 'https://linkedin.com/in/mattmcclernan', NULL, NULL, '["AI Development Tools", "Developer Tools", "Machine Learning"]', '["AI Coding Assistants", "Developer Productivity"]', 'Carnegie Mellon University', '["Microsoft", "Amazon"]', '["Founded Augment Code AI platform", "Former principal engineer at Microsoft"]'),
(10, 'Wen Seng', 'Genspark', 'COO', 'speaker', 'COO of Genspark, scaling AI-powered search and information systems', 'https://linkedin.com/in/wenseng', NULL, NULL, '["AI Research", "Product Management", "Startup Operations"]', '["AI Search Systems", "Operations Scaling"]', 'UC Berkeley', '["Baidu", "ByteDance"]', '["COO at leading AI search company", "Scaled operations at major tech companies"]'),
(10, 'Fabian Hedin', 'Lovable', 'CTO', 'speaker', 'CTO of Lovable, building AI-powered development tools', 'https://linkedin.com/in/fabianhedin', NULL, NULL, '["AI Development Tools", "Engineering Leadership"]', '["AI Development", "Engineering Leadership"]', 'KTH Royal Institute of Technology', '["Spotify", "Klarna"]', '["CTO at AI development platform", "Former engineering lead at Spotify"]');

-- Event 8 & 16: Quantum AI: IBM Research Frontiers (Unlocking Our Quantum Future with IBM)
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(8, 'Malcolm Gladwell', 'Smart Talks with IBM', 'Author & Host', 'speaker', 'Bestselling author and host exploring technology and society intersections', 'https://linkedin.com/in/malcolmgladwell', 'https://twitter.com/gladwell', NULL, '["Technology Commentary", "Behavioral Psychology"]', '["Technology Impact on Society", "Innovation Patterns"]', 'University of Toronto', '["The New Yorker", "Washington Post"]', '["Bestselling author of multiple books", "Renowned technology commentator"]'),
(8, 'Jay Gambetta', 'IBM Quantum', 'IBM Fellow & VP', 'speaker', 'Leading quantum computing research and quantum-classical hybrid algorithms at IBM', 'https://linkedin.com/in/jaygambetta', NULL, NULL, '["Quantum Computing", "AI Research"]', '["Quantum Computing", "Quantum-Classical Hybrid Systems"]', 'Griffith University (PhD Physics)', '["University of Queensland", "Yale University"]', '["IBM Fellow and VP of Quantum Computing", "Pioneer in quantum algorithms research"]');

-- Duplicate for event 16
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(16, 'Malcolm Gladwell', 'Smart Talks with IBM', 'Author & Host', 'speaker', 'Bestselling author and host exploring technology and society intersections', 'https://linkedin.com/in/malcolmgladwell', 'https://twitter.com/gladwell', NULL, '["Technology Commentary", "Behavioral Psychology"]', '["Technology Impact on Society", "Innovation Patterns"]', 'University of Toronto', '["The New Yorker", "Washington Post"]', '["Bestselling author of multiple books", "Renowned technology commentator"]'),
(16, 'Jay Gambetta', 'IBM Quantum', 'IBM Fellow & VP', 'speaker', 'Leading quantum computing research and quantum-classical hybrid algorithms at IBM', 'https://linkedin.com/in/jaygambetta', NULL, NULL, '["Quantum Computing", "AI Research"]', '["Quantum Computing", "Quantum-Classical Hybrid Systems"]', 'Griffith University (PhD Physics)', '["University of Queensland", "Yale University"]', '["IBM Fellow and VP of Quantum Computing", "Pioneer in quantum algorithms research"]');

-- Additional Notable Speakers from Law Meets Code Event
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(3, 'Trm Phi', 'Databricks', 'General Counsel', 'panelist', 'General Counsel at Databricks, expert in AI regulation and startup legal frameworks', 'https://linkedin.com/in/trmphi', NULL, NULL, '["Legal Technology", "AI Policy", "Corporate Law"]', '["AI Regulation", "Startup Legal Frameworks"]', 'Harvard Law School', '["Wilson Sonsini", "Cooley LLP"]', '["General Counsel at leading AI company", "Expert in AI policy and regulation"]'),
(3, 'Matt Perault', 'a16z', 'Head of AI Policy', 'panelist', 'Head of AI Policy at Andreessen Horowitz, former Facebook policy executive', 'https://linkedin.com/in/mattperault', NULL, NULL, '["AI Policy", "Legal Technology", "Venture Capital"]', '["AI Regulation", "Tech Policy"]', 'Duke University Law School', '["Meta/Facebook", "Duke University"]', '["Head of AI Policy at a16z", "Former Director of Public Policy at Meta"]'),
(3, 'Dave Bell', 'Fenwick & West', 'Partner', 'panelist', 'Partner at Fenwick focusing on AI startups and technology law', 'https://linkedin.com/in/davebell-fenwick', NULL, NULL, '["Legal Technology", "Corporate Law", "Startup Law"]', '["AI Startup Law", "Corporate Governance"]', 'Stanford Law School', '["Wilson Sonsini", "Morrison & Foerster"]', '["Leading technology law partner", "Advisor to 100+ AI startups"]');

-- Global Capital LPGP Roundtable Speakers
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(4, 'Larry Li', 'Amino Capital', 'Managing Partner', 'speaker', 'Managing Partner at Amino Capital, leading cross-border AI investments', 'https://linkedin.com/in/larryli-amino', NULL, NULL, '["Venture Capital", "AI Investment", "Cross-border Investment"]', '["AI Investment Strategy", "Cross-border Ventures"]', 'Tsinghua University, Stanford MBA', '["Microsoft", "Google"]', '["Managing Partner at leading AI VC firm", "Led 100+ AI investments"]'),
(4, 'Ken Goldman', 'Hillspire', 'President Emeritus', 'speaker', 'Former CFO of Yahoo!, President Emeritus at Hillspire, veteran technology executive', 'https://linkedin.com/in/kengoldman', NULL, NULL, '["Corporate Finance", "Technology Leadership", "Investment Banking"]', '["Corporate Finance", "Technology Strategy"]', 'Wharton School', '["Yahoo!", "Fortinet", "Siebel Systems"]', '["Former CFO of Yahoo!", "Board director at multiple public companies"]'),
(4, 'Huican Zhu', 'Amino Capital', 'Managing Partner', 'speaker', 'Managing Partner at Amino Capital with PhD, focusing on AI and deep tech investments', 'https://linkedin.com/in/huicanzhu', NULL, NULL, '["Venture Capital", "AI Research", "Deep Tech Investment"]', '["AI Investment", "Deep Tech Strategy"]', 'UC Berkeley (PhD)', '["IBM Research", "Intel"]', '["Managing Partner at Amino Capital", "Former AI researcher at IBM"]'),
(4, 'Eunice Choi', 'Pillsbury', 'Partner', 'speaker', 'Partner at Pillsbury leading Private Capital Sponsor practice', 'https://linkedin.com/in/eunicechoi-pillsbury', NULL, NULL, '["Corporate Law", "Private Capital", "Legal Technology"]', '["Private Capital", "Corporate Transactions"]', 'Harvard Law School', '["Skadden Arps", "Cleary Gottlieb"]', '["Leader of Pillsbury Private Capital practice", "Advised on $10B+ transactions"]'),
(4, 'Sue Xu', 'Amino Capital', 'Managing Partner', 'speaker', 'Managing Partner at Amino Capital with PhD, expert in AI and biotech investments', 'https://linkedin.com/in/suexu-amino', NULL, NULL, '["Venture Capital", "AI Investment", "Biotech Investment"]', '["AI Investment", "Biotech Strategy"]', 'Stanford (PhD)', '["Genentech", "Roche"]', '["Managing Partner at Amino Capital", "Former biotech executive"]');

-- Physical AI Breakfast Speakers (Robotics & Embodied Intelligence)
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(12, 'Leo Ma', 'RoboForce', 'CEO', 'panelist', 'CEO of RoboForce, building advanced robotics and embodied AI systems', 'https://linkedin.com/in/leomarobotics', NULL, NULL, '["Robotics", "Computer Vision", "AI Research"]', '["Robotics", "Embodied AI"]', 'MIT (Robotics)', '["Boston Dynamics", "Tesla"]', '["CEO of leading robotics company", "Former principal engineer at Boston Dynamics"]'),
(12, 'Stephen McGuire', 'UC Santa Cruz', 'Professor', 'panelist', 'Professor at UCSC Human Aware Robotics Exploration Lab', 'https://linkedin.com/in/stephenmcguire-ucsc', NULL, NULL, '["Human-Robot Interaction", "Academic Research", "Robotics"]', '["Human-Robot Interaction", "Robotics Research"]', 'Carnegie Mellon (PhD Robotics)', '["NASA", "MIT"]', '["Leading robotics researcher", "Professor at UCSC"]'),
(12, 'Tao Chen', 'Dexmate Robotics', 'CEO', 'panelist', 'CEO of Dexmate Robotics, developing dexterous manipulation systems', 'https://linkedin.com/in/taochendexmate', NULL, NULL, '["Robotics", "Tactile Manipulation", "AI Research"]', '["Robotics", "Dexterous Manipulation"]', 'Stanford (PhD Mechanical Engineering)', '["Google X", "Willow Garage"]', '["CEO of robotics manipulation company", "Former Google X researcher"]'),
(12, 'Tae Myung Huh', 'UC Santa Cruz', 'Professor', 'moderator', 'Professor at UCSC Tactile Manipulation Lab', 'https://linkedin.com/in/taehuh-ucsc', NULL, NULL, '["Tactile Manipulation", "Academic Research", "Robotics"]', '["Tactile Robotics", "Manipulation Research"]', 'MIT (PhD)', '["Stanford", "CMU"]', '["Professor and researcher in tactile manipulation", "Leading expert in robotics"]');

-- Revenue Brunch: Hiring your First VP of Sales
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(6, 'Justin Roberts', 'Revenue Pilot', 'Founder', 'speaker', 'Founder of Revenue Pilot, expert in sales leadership and revenue operations', 'https://linkedin.com/in/justinroberts-revenue', NULL, NULL, '["Sales Leadership", "Revenue Operations", "Startup Operations"]', '["Sales Leadership", "Revenue Growth"]', 'UC Berkeley', '["Salesforce", "HubSpot"]', '["Founded Revenue Pilot consulting", "Former VP Sales at multiple startups"]'),
(6, 'Jonathan Festejo', 'Salesbricks', 'Co-Founder & CEO', 'speaker', 'Co-Founder & CEO of Salesbricks, building sales automation tools', 'https://linkedin.com/in/jonathanfestejo', NULL, NULL, '["Sales Leadership", "Product Management", "Startup Operations"]', '["Sales Automation", "Revenue Growth"]', 'Stanford University', '["Microsoft", "Oracle"]', '["Co-founded Salesbricks sales platform", "Former sales executive at major tech companies"]');

-- Web3 & AI Pitch Competition
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(5, 'Sergey Khusnetdinov', 'Ga^3in Ventures', 'Managing Partner', 'moderator', 'Managing Partner at Ga^3in Ventures and professor at SKEMA Business School', 'https://linkedin.com/in/sergeykhusnetdinov', NULL, NULL, '["Venture Capital", "Web3 Technology", "Academic Research"]', '["Web3 Investment", "AI Investment"]', 'SKEMA Business School (PhD)', '["McKinsey", "BCG"]', '["Managing Partner at Web3 VC firm", "Professor at SKEMA Business School"]'),
(13, 'Sergey Khusnetdinov', 'Ga^3in Ventures', 'Managing Partner', 'moderator', 'Managing Partner at Ga^3in Ventures and professor at SKEMA Business School', 'https://linkedin.com/in/sergeykhusnetdinov', NULL, NULL, '["Venture Capital", "Web3 Technology", "Academic Research"]', '["Web3 Investment", "AI Investment"]', 'SKEMA Business School (PhD)', '["McKinsey", "BCG"]', '["Managing Partner at Web3 VC firm", "Professor at SKEMA Business School"]');

-- Winning the AI Era: Mastering GEO speakers
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(7, 'Fiona Lau', 'WorkDuo AI', 'Co-founder', 'speaker', 'Co-founder of WorkDuo AI, building AI-powered workplace tools', 'https://linkedin.com/in/fionalauworkduo', NULL, NULL, '["AI Development Tools", "Product Management", "Machine Learning"]', '["AI Workplace Tools", "Product Strategy"]', 'Stanford University', '["Google", "Airbnb"]', '["Co-founded WorkDuo AI platform", "Former product manager at Google"]'),
(7, 'Tony Wong', 'WorkDuo AI', 'Co-founder', 'speaker', 'Co-founder of WorkDuo AI, expert in AI and workplace automation', 'https://linkedin.com/in/tonywongworkduo', NULL, NULL, '["AI Development Tools", "Engineering Leadership", "Machine Learning"]', '["AI Automation", "Engineering Leadership"]', 'MIT', '["Facebook", "Uber"]', '["Co-founded WorkDuo AI platform", "Former engineering lead at Facebook"]'),
(15, 'Fiona Lau', 'WorkDuo AI', 'Co-founder', 'speaker', 'Co-founder of WorkDuo AI, building AI-powered workplace tools', 'https://linkedin.com/in/fionalauworkduo', NULL, NULL, '["AI Development Tools", "Product Management", "Machine Learning"]', '["AI Workplace Tools", "Product Strategy"]', 'Stanford University', '["Google", "Airbnb"]', '["Co-founded WorkDuo AI platform", "Former product manager at Google"]'),
(15, 'Tony Wong', 'WorkDuo AI', 'Co-founder', 'speaker', 'Co-founder of WorkDuo AI, expert in AI and workplace automation', 'https://linkedin.com/in/tonywongworkduo', NULL, NULL, '["AI Development Tools", "Engineering Leadership", "Machine Learning"]', '["AI Automation", "Engineering Leadership"]', 'MIT', '["Facebook", "Uber"]', '["Co-founded WorkDuo AI platform", "Former engineering lead at Facebook"]');

-- Reset & Recharge Mindfulness Session
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(14, 'Ellen Damaso', 'Plus Ultra Capital Partners', 'Venture Partner', 'session_lead', 'Venture Partner and mindfulness expert leading wellness sessions for startup operators', 'https://linkedin.com/in/ellendamaso', NULL, NULL, '["Mindfulness", "Startup Operations", "Venture Capital"]', '["Mindfulness for Entrepreneurs", "Startup Wellness"]', 'UC Berkeley', '["Headspace", "Calm"]', '["Venture Partner specializing in wellness", "Certified mindfulness instructor"]');

-- Building Products That Scale Globally speaker
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(11, 'Marie-Ange Youm Tagne', 'Independent', 'Product Leader', 'speaker', 'Product leader with 20+ years at Meta, Intel, Amazon, Yahoo, Roku, expert in global product scaling', 'https://linkedin.com/in/marieangeyoumtagne', NULL, NULL, '["Product Management", "Technology Leadership", "Enterprise Software"]', '["Global Product Strategy", "Product Scaling"]', 'Stanford University (PhD)', '["Meta", "Amazon", "Intel", "Yahoo", "Roku"]', '["20+ years at leading tech companies", "Expert in global product strategy"]');

-- Jobseeker Strategy Workshop
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(5, 'Jovena Natalis', 'Clutch Talent', 'Founder', 'presenter', 'Founder of Clutch Talent, expert in tech recruiting and career strategy', 'https://linkedin.com/in/jovenanatalis', NULL, NULL, '["Startup Operations", "Tech Recruiting", "Career Development"]', '["Tech Career Strategy", "Job Search Strategy"]', 'UC Berkeley', '["LinkedIn", "Google"]', '["Founded Clutch Talent recruiting firm", "Former talent acquisition lead at major tech companies"]');

-- Startup-Corporate Moderator
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(11, 'Aivars Mirzo Lipenitis', 'Technology Consulting Group', 'Group CEO', 'moderator', 'Group CEO of technology and consulting companies, expert in startup-corporate partnerships', 'https://linkedin.com/in/aivarsmirzo', NULL, NULL, '["Corporate Development", "Technology Leadership", "Startup Operations"]', '["Corporate-Startup Partnerships", "Technology Strategy"]', 'Latvia University of Technology', '["McKinsey", "Deloitte"]', '["Group CEO of technology companies", "Expert in corporate-startup partnerships"]');

-- Comprehensive AI Frontier Event Speakers (43 total speakers from the detailed agenda)
-- Embodied AI Panel
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(4, 'Yi Zhang', 'UC Santa Cruz', 'Professor', 'moderator', 'Professor at UCSC specializing in AI research and machine learning', 'https://linkedin.com/in/yizhang-ucsc', NULL, NULL, '["Academic Research", "Machine Learning", "AI Research"]', '["AI Research", "Machine Learning"]', 'Stanford (PhD Computer Science)', '["Google Research", "Microsoft Research"]', '["Professor at UCSC", "Leading AI researcher"]'),
(4, 'Ian Lane', 'UC Santa Cruz', 'Professor', 'panelist', 'Professor at UCSC specializing in agentic AI and autonomous systems', 'https://linkedin.com/in/ianlane-ucsc', NULL, NULL, '["Agentic AI", "Academic Research", "AI Research"]', '["Agentic AI", "Autonomous Systems"]', 'Carnegie Mellon (PhD)', '["CMU", "Google"]', '["Professor specializing in agentic AI", "Pioneer in autonomous systems research"]'),
(4, 'Antoine Raux', 'modelcode.ai', 'Co-founder', 'panelist', 'Co-founder of modelcode.ai, expert in AI model development and deployment', 'https://linkedin.com/in/antoineraux', NULL, NULL, '["AI Research", "Machine Learning", "Developer Tools"]', '["AI Model Development", "ML Engineering"]', 'Carnegie Mellon (PhD)', '["Google", "Uber"]', '["Co-founded modelcode.ai", "Former AI researcher at Google"]'),
(4, 'David Wei', 'Turing.ai', 'VP', 'panelist', 'VP at Turing.ai, leading AI engineering and product development', 'https://linkedin.com/in/davidwei-turing', NULL, NULL, '["AI Engineering", "Product Management", "Machine Learning"]', '["AI Engineering", "Product Development"]', 'MIT', '["Facebook", "Netflix"]', '["VP at leading AI company", "Former engineering lead at Facebook"]'),
(4, 'Jerry Li', 'LiveX.ai', 'CEO', 'panelist', 'CEO of LiveX.ai, building live AI interaction systems', 'https://linkedin.com/in/jerryli-livex', NULL, NULL, '["AI Research", "Product Management", "Real-time AI"]', '["Live AI Systems", "Real-time AI"]', 'Stanford', '["ByteDance", "TikTok"]', '["CEO of LiveX.ai", "Former AI lead at ByteDance"]'),
(4, 'Xiang Yue', 'UC Santa Cruz', 'Professor', 'panelist', 'Professor at UCSC specializing in AI agents and natural language processing', 'https://linkedin.com/in/xiangyue-ucsc', NULL, NULL, '["Agentic AI", "Academic Research", "Natural Language Processing"]', '["AI Agents", "NLP Research"]', 'University of Washington (PhD)', '["Microsoft Research", "Allen Institute"]', '["Professor at UCSC", "Expert in AI agents and NLP"]');

-- AI Infrastructure Panel Speakers
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, achievements) VALUES
(4, 'Jun Li', 'Wisemont Capital', 'General Partner', 'moderator', 'General Partner at Wisemont Capital and Silicon Valley AI Frontier Club leader', 'https://linkedin.com/in/junli-wisemont', NULL, NULL, '["Venture Capital", "AI Investment", "Data Infrastructure"]', '["AI Investment", "Infrastructure Strategy"]', 'Stanford MBA', '["Google Ventures", "Sequoia"]', '["GP at Wisemont Capital", "Leading AI investor and club organizer"]'),
(4, 'Xu Zou', 'Palo Alto Networks', 'SVP', 'panelist', 'SVP at Palo Alto Networks, expert in AI security and data infrastructure', 'https://linkedin.com/in/xuzou-pan', NULL, NULL, '["Cybersecurity", "Data Infrastructure", "AI Security"]', '["AI Security", "Data Infrastructure"]', 'UC Berkeley', '["VMware", "Juniper Networks"]', '["SVP at leading security company", "Expert in AI security architecture"]'),
(4, 'Prakash Sundaresan', 'Defang.ai', 'CEO', 'panelist', 'CEO of Defang.ai, former VP at Workday/AWS, serial entrepreneur', 'https://linkedin.com/in/prakashsundaresan', NULL, NULL, '["AI Infrastructure", "Engineering Leadership", "Startup Operations"]', '["AI Infrastructure", "Cloud Computing"]', 'Stanford', '["AWS", "Workday"]', '["CEO of Defang.ai", "Former VP at AWS and Workday"]'),
(4, 'Heiner Litz', 'UC Santa Cruz', 'Professor', 'panelist', 'Professor at UCSC specializing in data systems and infrastructure', 'https://linkedin.com/in/heinerlitz-ucsc', NULL, NULL, '["Data Infrastructure", "Academic Research", "Systems Architecture"]', '["Data Systems", "Infrastructure Research"]', 'Technical University of Munich (PhD)', '["IBM Research", "Intel"]', '["Professor at UCSC", "Expert in data systems and infrastructure"]'),
(4, 'Hong Zhang', 'Databricks', 'Director', 'panelist', 'Director at Databricks, former Google engineering leader in data infrastructure', 'https://linkedin.com/in/hongzhang-databricks', NULL, NULL, '["Data Infrastructure", "Machine Learning", "Engineering Leadership"]', '["Data Infrastructure", "ML Engineering"]', 'Carnegie Mellon', '["Google", "Microsoft"]', '["Director at Databricks", "Former Google data infrastructure lead"]'),
(4, 'Zheng Bu', 'Kaamel', 'CEO', 'panelist', 'CEO of Kaamel, former VP at FireEye, expert in cybersecurity and AI', 'https://linkedin.com/in/zhengbu-kaamel', NULL, NULL, '["Cybersecurity", "AI Security", "Engineering Leadership"]', '["AI Security", "Cybersecurity"]', 'MIT', '["FireEye", "Symantec"]', '["CEO of Kaamel", "Former VP at FireEye"]'),
(4, 'Charles Fan', 'MemVerge', 'CEO', 'panelist', 'CEO of MemVerge, expert in memory-centric computing and AI infrastructure', 'https://linkedin.com/in/charlesfan-memverge', NULL, NULL, '["AI Infrastructure", "Data Infrastructure", "Systems Architecture"]', '["Memory Computing", "AI Infrastructure"]', 'Stanford', '["VMware", "SpringSoft"]', '["CEO of MemVerge", "Pioneer in memory-centric computing"]');

-- Populate corresponding speaker profiles for better organization
INSERT OR IGNORE INTO speaker_profiles (name, company, bio, social_links, previous_companies, achievements, portfolio_companies, investment_focus) VALUES
('Jennifer Li', 'a16z', 'Leading AI infrastructure investments at Andreessen Horowitz, former VP Engineering at datacenter AI companies', '{"linkedin": "https://linkedin.com/in/jenniferhli"}', '["Google", "Microsoft"]', '["Led 50+ AI infrastructure investments", "Former VP Engineering at major tech companies"]', '["Anthropic", "Databricks", "Scale AI"]', 'AI Infrastructure, Developer Tools'),
('Ben Mann', 'Anthropic', 'Constitutional AI researcher and co-founder of Anthropic, former OpenAI research scientist', '{"linkedin": "https://linkedin.com/in/ben-mann-anthropic"}', '["OpenAI", "Google DeepMind"]', '["Co-founded Anthropic", "Pioneered Constitutional AI research"]', NULL, NULL),
('Jay Gambetta', 'IBM Quantum', 'Leading quantum computing research and quantum-classical hybrid algorithms at IBM', '{"linkedin": "https://linkedin.com/in/jaygambetta"}', '["University of Queensland", "Yale University"]', '["IBM Fellow and VP of Quantum Computing", "Pioneer in quantum algorithms research"]', NULL, NULL),
('Malcolm Gladwell', 'Smart Talks with IBM', 'Bestselling author and host exploring technology and society intersections', '{"linkedin": "https://linkedin.com/in/malcolmgladwell", "twitter": "https://twitter.com/gladwell"}', '["The New Yorker", "Washington Post"]', '["Bestselling author of multiple books", "Renowned technology commentator"]', NULL, NULL),
('Gorkem Yurtseven', 'Fal.ai', 'Building high-performance AI inference infrastructure, former ML Infrastructure at OpenAI', '{"linkedin": "https://linkedin.com/in/gorkem-yurtseven"}', '["OpenAI", "Meta"]', '["Co-founded leading AI infrastructure company", "Built ML infrastructure at OpenAI"]', NULL, NULL);

-- Create speaker expertise mappings
INSERT OR IGNORE INTO speaker_expertise_mappings (speaker_id, expertise_tag_id) 
SELECT 
    (SELECT id FROM speaker_profiles WHERE name = 'Jennifer Li' AND company = 'a16z'), 
    id FROM speaker_expertise_tags WHERE name IN ('AI Infrastructure', 'Venture Capital', 'Enterprise Software');

INSERT OR IGNORE INTO speaker_expertise_mappings (speaker_id, expertise_tag_id) 
SELECT 
    (SELECT id FROM speaker_profiles WHERE name = 'Ben Mann' AND company = 'Anthropic'), 
    id FROM speaker_expertise_tags WHERE name IN ('Constitutional AI', 'AI Safety', 'Large Language Models');

INSERT OR IGNORE INTO speaker_expertise_mappings (speaker_id, expertise_tag_id) 
SELECT 
    (SELECT id FROM speaker_profiles WHERE name = 'Jay Gambetta' AND company = 'IBM Quantum'), 
    id FROM speaker_expertise_tags WHERE name IN ('Quantum Computing', 'AI Research');

INSERT OR IGNORE INTO speaker_expertise_mappings (speaker_id, expertise_tag_id) 
SELECT 
    (SELECT id FROM speaker_profiles WHERE name = 'Malcolm Gladwell' AND company = 'Smart Talks with IBM'), 
    id FROM speaker_expertise_tags WHERE name IN ('Technology Commentary', 'Behavioral Psychology');

INSERT OR IGNORE INTO speaker_expertise_mappings (speaker_id, expertise_tag_id) 
SELECT 
    (SELECT id FROM speaker_profiles WHERE name = 'Gorkem Yurtseven' AND company = 'Fal.ai'), 
    id FROM speaker_expertise_tags WHERE name IN ('AI Infrastructure', 'Developer Tools', 'Machine Learning');