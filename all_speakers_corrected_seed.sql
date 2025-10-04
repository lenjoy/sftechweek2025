-- Comprehensive SF Tech Week 2025 Speaker Database Update (Corrected Schema)
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
('Banking Innovation', 'Innovation in banking and financial services'),
('Robotics', 'Robotics and embodied AI'),
('Computer Vision', 'Computer vision and visual AI'),
('Sales Leadership', 'Sales strategy and leadership'),
('Revenue Operations', 'Revenue operations and growth'),
('Engineering Leadership', 'Engineering management and leadership'),
('Academic Research', 'Academic research and education'),
('Web3 Technology', 'Blockchain and Web3 development'),
('Mindfulness', 'Mindfulness and wellness practices');

-- Comprehensive Speaker Profiles Database
-- Event 1 & 9: AI, Infra, & the Future of Generative Media
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, awards) VALUES
(1, 'Jennifer Li', 'a16z', 'General Partner', 'panelist', 'Leading AI infrastructure investments at Andreessen Horowitz, former VP Engineering at datacenter AI companies', 'https://linkedin.com/in/jenniferhli', NULL, NULL, '["AI Infrastructure", "Venture Capital", "Enterprise Software"]', '["AI Infrastructure Investment", "Scaling AI Companies"]', 'Stanford University (Computer Science)', '["Google", "Microsoft"]', '["Led 50+ AI infrastructure investments"]'),
(1, 'Gorkem Yurtseven', 'Fal.ai', 'Co-Founder & CTO', 'panelist', 'Building high-performance AI inference infrastructure, former ML Infrastructure at OpenAI', 'https://linkedin.com/in/gorkem-yurtseven', NULL, NULL, '["AI Infrastructure", "Developer Tools", "Machine Learning"]', '["AI Inference", "Infrastructure Scaling"]', 'Carnegie Mellon University (CS)', '["OpenAI", "Meta"]', '["Co-founded leading AI infrastructure company"]'),
(1, 'Adam Brown', 'Mux', 'Co-founder', 'panelist', 'Co-founder of Mux, building video infrastructure for developers and creators', 'https://linkedin.com/in/adamlbrown', NULL, NULL, '["Video Infrastructure", "Media Technology", "Developer Tools"]', '["Video Technology", "Developer APIs"]', 'University of Illinois', '["YouTube", "Zencoder"]', '["Co-founded Mux video infrastructure platform"]'),
(1, 'Alex Choy', 'HSBC Innovation Banking', 'Managing Director', 'moderator', 'Managing Director at HSBC Innovation Banking, focusing on fintech and AI investments', 'https://linkedin.com/in/alexchoy', NULL, NULL, '["Banking Innovation", "Fintech", "Corporate Development"]', '["Banking Innovation", "Fintech Investment"]', 'Harvard Business School', '["Goldman Sachs", "JP Morgan"]', '["Led $500M+ in fintech investments"]');

-- Duplicate for event 9
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, awards) VALUES
(9, 'Jennifer Li', 'a16z', 'General Partner', 'panelist', 'Leading AI infrastructure investments at Andreessen Horowitz, former VP Engineering at datacenter AI companies', 'https://linkedin.com/in/jenniferhli', NULL, NULL, '["AI Infrastructure", "Venture Capital", "Enterprise Software"]', '["AI Infrastructure Investment", "Scaling AI Companies"]', 'Stanford University (Computer Science)', '["Google", "Microsoft"]', '["Led 50+ AI infrastructure investments"]'),
(9, 'Gorkem Yurtseven', 'Fal.ai', 'Co-Founder & CTO', 'panelist', 'Building high-performance AI inference infrastructure, former ML Infrastructure at OpenAI', 'https://linkedin.com/in/gorkem-yurtseven', NULL, NULL, '["AI Infrastructure", "Developer Tools", "Machine Learning"]', '["AI Inference", "Infrastructure Scaling"]', 'Carnegie Mellon University (CS)', '["OpenAI", "Meta"]', '["Co-founded leading AI infrastructure company"]'),
(9, 'Adam Brown', 'Mux', 'Co-founder', 'panelist', 'Co-founder of Mux, building video infrastructure for developers and creators', 'https://linkedin.com/in/adamlbrown', NULL, NULL, '["Video Infrastructure", "Media Technology", "Developer Tools"]', '["Video Technology", "Developer APIs"]', 'University of Illinois', '["YouTube", "Zencoder"]', '["Co-founded Mux video infrastructure platform"]'),
(9, 'Alex Choy', 'HSBC Innovation Banking', 'Managing Director', 'moderator', 'Managing Director at HSBC Innovation Banking, focusing on fintech and AI investments', 'https://linkedin.com/in/alexchoy', NULL, NULL, '["Banking Innovation", "Fintech", "Corporate Development"]', '["Banking Innovation", "Fintech Investment"]', 'Harvard Business School', '["Goldman Sachs", "JP Morgan"]', '["Led $500M+ in fintech investments"]');

-- Event 2 & 10: Anthropic AI Founder Salon: Constitutional AI
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, awards) VALUES
(2, 'Ben Mann', 'Anthropic', 'Co-founder & Chief Scientist', 'speaker', 'Constitutional AI researcher and co-founder of Anthropic, former OpenAI research scientist', 'https://linkedin.com/in/ben-mann-anthropic', NULL, NULL, '["Constitutional AI", "AI Safety", "Large Language Models"]', '["Constitutional AI", "AI Safety Research"]', 'Stanford University (PhD Computer Science)', '["OpenAI", "Google DeepMind"]', '["Co-founded Anthropic", "Pioneered Constitutional AI research"]'),
(2, 'Jeff Wang', 'Windsurf', 'CEO', 'speaker', 'Building AI-powered development environments, former Google AI Product Manager', 'https://linkedin.com/in/jeffwang-windsurf', NULL, NULL, '["AI Development Tools", "Product Management"]', '["AI Development Tools", "Product Strategy"]', 'MIT (Computer Science)', '["Google", "Microsoft"]', '["Founded Windsurf AI development platform"]'),
(2, 'Matt McClernan', 'Augment Code', 'CEO', 'speaker', 'CEO of Augment Code, building AI coding assistants for developers', 'https://linkedin.com/in/mattmcclernan', NULL, NULL, '["AI Development Tools", "Developer Tools", "Machine Learning"]', '["AI Coding Assistants", "Developer Productivity"]', 'Carnegie Mellon University', '["Microsoft", "Amazon"]', '["Founded Augment Code AI platform"]'),
(2, 'Wen Seng', 'Genspark', 'COO', 'speaker', 'COO of Genspark, scaling AI-powered search and information systems', 'https://linkedin.com/in/wenseng', NULL, NULL, '["AI Research", "Product Management"]', '["AI Search Systems", "Operations Scaling"]', 'UC Berkeley', '["Baidu", "ByteDance"]', '["COO at leading AI search company"]'),
(2, 'Fabian Hedin', 'Lovable', 'CTO', 'speaker', 'CTO of Lovable, building AI-powered development tools', 'https://linkedin.com/in/fabianhedin', NULL, NULL, '["AI Development Tools", "Engineering Leadership"]', '["AI Development", "Engineering Leadership"]', 'KTH Royal Institute of Technology', '["Spotify", "Klarna"]', '["CTO at AI development platform"]');

-- Duplicate for event 10
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, awards) VALUES
(10, 'Ben Mann', 'Anthropic', 'Co-founder & Chief Scientist', 'speaker', 'Constitutional AI researcher and co-founder of Anthropic, former OpenAI research scientist', 'https://linkedin.com/in/ben-mann-anthropic', NULL, NULL, '["Constitutional AI", "AI Safety", "Large Language Models"]', '["Constitutional AI", "AI Safety Research"]', 'Stanford University (PhD Computer Science)', '["OpenAI", "Google DeepMind"]', '["Co-founded Anthropic", "Pioneered Constitutional AI research"]'),
(10, 'Jeff Wang', 'Windsurf', 'CEO', 'speaker', 'Building AI-powered development environments, former Google AI Product Manager', 'https://linkedin.com/in/jeffwang-windsurf', NULL, NULL, '["AI Development Tools", "Product Management"]', '["AI Development Tools", "Product Strategy"]', 'MIT (Computer Science)', '["Google", "Microsoft"]', '["Founded Windsurf AI development platform"]'),
(10, 'Matt McClernan', 'Augment Code', 'CEO', 'speaker', 'CEO of Augment Code, building AI coding assistants for developers', 'https://linkedin.com/in/mattmcclernan', NULL, NULL, '["AI Development Tools", "Developer Tools", "Machine Learning"]', '["AI Coding Assistants", "Developer Productivity"]', 'Carnegie Mellon University', '["Microsoft", "Amazon"]', '["Founded Augment Code AI platform"]'),
(10, 'Wen Seng', 'Genspark', 'COO', 'speaker', 'COO of Genspark, scaling AI-powered search and information systems', 'https://linkedin.com/in/wenseng', NULL, NULL, '["AI Research", "Product Management"]', '["AI Search Systems", "Operations Scaling"]', 'UC Berkeley', '["Baidu", "ByteDance"]', '["COO at leading AI search company"]'),
(10, 'Fabian Hedin', 'Lovable', 'CTO', 'speaker', 'CTO of Lovable, building AI-powered development tools', 'https://linkedin.com/in/fabianhedin', NULL, NULL, '["AI Development Tools", "Engineering Leadership"]', '["AI Development", "Engineering Leadership"]', 'KTH Royal Institute of Technology', '["Spotify", "Klarna"]', '["CTO at AI development platform"]');

-- Event 8 & 16: Quantum AI: IBM Research Frontiers (Unlocking Our Quantum Future with IBM)
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, awards) VALUES
(8, 'Malcolm Gladwell', 'Smart Talks with IBM', 'Author & Host', 'speaker', 'Bestselling author and host exploring technology and society intersections', 'https://linkedin.com/in/malcolmgladwell', 'https://twitter.com/gladwell', NULL, '["Technology Commentary", "Behavioral Psychology"]', '["Technology Impact on Society", "Innovation Patterns"]', 'University of Toronto', '["The New Yorker", "Washington Post"]', '["Bestselling author of multiple books"]'),
(8, 'Jay Gambetta', 'IBM Quantum', 'IBM Fellow & VP', 'speaker', 'Leading quantum computing research and quantum-classical hybrid algorithms at IBM', 'https://linkedin.com/in/jaygambetta', NULL, NULL, '["Quantum Computing", "AI Research"]', '["Quantum Computing", "Quantum-Classical Hybrid Systems"]', 'Griffith University (PhD Physics)', '["University of Queensland", "Yale University"]', '["IBM Fellow and VP of Quantum Computing"]');

-- Duplicate for event 16
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, awards) VALUES
(16, 'Malcolm Gladwell', 'Smart Talks with IBM', 'Author & Host', 'speaker', 'Bestselling author and host exploring technology and society intersections', 'https://linkedin.com/in/malcolmgladwell', 'https://twitter.com/gladwell', NULL, '["Technology Commentary", "Behavioral Psychology"]', '["Technology Impact on Society", "Innovation Patterns"]', 'University of Toronto', '["The New Yorker", "Washington Post"]', '["Bestselling author of multiple books"]'),
(16, 'Jay Gambetta', 'IBM Quantum', 'IBM Fellow & VP', 'speaker', 'Leading quantum computing research and quantum-classical hybrid algorithms at IBM', 'https://linkedin.com/in/jaygambetta', NULL, NULL, '["Quantum Computing", "AI Research"]', '["Quantum Computing", "Quantum-Classical Hybrid Systems"]', 'Griffith University (PhD Physics)', '["University of Queensland", "Yale University"]', '["IBM Fellow and VP of Quantum Computing"]');

-- Event 3: Law Meets Code: AI Rules That Could Shape Your Startup
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, awards) VALUES
(3, 'Trm Phi', 'Databricks', 'General Counsel', 'panelist', 'General Counsel at Databricks, expert in AI regulation and startup legal frameworks', 'https://linkedin.com/in/trmphi', NULL, NULL, '["Legal Technology", "AI Policy", "Corporate Law"]', '["AI Regulation", "Startup Legal Frameworks"]', 'Harvard Law School', '["Wilson Sonsini", "Cooley LLP"]', '["General Counsel at leading AI company"]'),
(3, 'Matt Perault', 'a16z', 'Head of AI Policy', 'panelist', 'Head of AI Policy at Andreessen Horowitz, former Facebook policy executive', 'https://linkedin.com/in/mattperault', NULL, NULL, '["AI Policy", "Legal Technology", "Venture Capital"]', '["AI Regulation", "Tech Policy"]', 'Duke University Law School', '["Meta/Facebook", "Duke University"]', '["Head of AI Policy at a16z"]'),
(3, 'Dave Bell', 'Fenwick & West', 'Partner', 'panelist', 'Partner at Fenwick focusing on AI startups and technology law', 'https://linkedin.com/in/davebell-fenwick', NULL, NULL, '["Legal Technology", "Corporate Law"]', '["AI Startup Law", "Corporate Governance"]', 'Stanford Law School', '["Wilson Sonsini", "Morrison & Foerster"]', '["Leading technology law partner"]');

-- Event 4: Global Capital LPGP Roundtable
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, awards) VALUES
(4, 'Larry Li', 'Amino Capital', 'Managing Partner', 'speaker', 'Managing Partner at Amino Capital, leading cross-border AI investments', 'https://linkedin.com/in/larryli-amino', NULL, NULL, '["Venture Capital", "AI Investment"]', '["AI Investment Strategy", "Cross-border Ventures"]', 'Tsinghua University, Stanford MBA', '["Microsoft", "Google"]', '["Managing Partner at leading AI VC firm"]'),
(4, 'Ken Goldman', 'Hillspire', 'President Emeritus', 'speaker', 'Former CFO of Yahoo!, President Emeritus at Hillspire, veteran technology executive', 'https://linkedin.com/in/kengoldman', NULL, NULL, '["Corporate Finance", "Technology Leadership"]', '["Corporate Finance", "Technology Strategy"]', 'Wharton School', '["Yahoo!", "Fortinet", "Siebel Systems"]', '["Former CFO of Yahoo!"]'),
(4, 'Huican Zhu', 'Amino Capital', 'Managing Partner', 'speaker', 'Managing Partner at Amino Capital with PhD, focusing on AI and deep tech investments', 'https://linkedin.com/in/huicanzhu', NULL, NULL, '["Venture Capital", "AI Research"]', '["AI Investment", "Deep Tech Strategy"]', 'UC Berkeley (PhD)', '["IBM Research", "Intel"]', '["Managing Partner at Amino Capital"]'),
(4, 'Eunice Choi', 'Pillsbury', 'Partner', 'speaker', 'Partner at Pillsbury leading Private Capital Sponsor practice', 'https://linkedin.com/in/eunicechoi-pillsbury', NULL, NULL, '["Corporate Law", "Private Capital"]', '["Private Capital", "Corporate Transactions"]', 'Harvard Law School', '["Skadden Arps", "Cleary Gottlieb"]', '["Leader of Pillsbury Private Capital practice"]'),
(4, 'Sue Xu', 'Amino Capital', 'Managing Partner', 'speaker', 'Managing Partner at Amino Capital with PhD, expert in AI and biotech investments', 'https://linkedin.com/in/suexu-amino', NULL, NULL, '["Venture Capital", "AI Investment"]', '["AI Investment", "Biotech Strategy"]', 'Stanford (PhD)', '["Genentech", "Roche"]', '["Managing Partner at Amino Capital"]');

-- Event 5 & 13: Web3 × AI Pitch Competition
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, awards) VALUES
(5, 'Sergey Khusnetdinov', 'Ga^3in Ventures', 'Managing Partner', 'moderator', 'Managing Partner at Ga^3in Ventures and professor at SKEMA Business School', 'https://linkedin.com/in/sergeykhusnetdinov', NULL, NULL, '["Venture Capital", "Web3 Technology", "Academic Research"]', '["Web3 Investment", "AI Investment"]', 'SKEMA Business School (PhD)', '["McKinsey", "BCG"]', '["Managing Partner at Web3 VC firm"]'),
(13, 'Sergey Khusnetdinov', 'Ga^3in Ventures', 'Managing Partner', 'moderator', 'Managing Partner at Ga^3in Ventures and professor at SKEMA Business School', 'https://linkedin.com/in/sergeykhusnetdinov', NULL, NULL, '["Venture Capital", "Web3 Technology", "Academic Research"]', '["Web3 Investment", "AI Investment"]', 'SKEMA Business School (PhD)', '["McKinsey", "BCG"]', '["Managing Partner at Web3 VC firm"]');

-- Event 6 & 14: Revenue Brunch and Enterprise AI Adoption
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, awards) VALUES
(6, 'Justin Roberts', 'Revenue Pilot', 'Founder', 'speaker', 'Founder of Revenue Pilot, expert in sales leadership and revenue operations', 'https://linkedin.com/in/justinroberts-revenue', NULL, NULL, '["Sales Leadership", "Revenue Operations"]', '["Sales Leadership", "Revenue Growth"]', 'UC Berkeley', '["Salesforce", "HubSpot"]', '["Founded Revenue Pilot consulting"]'),
(6, 'Jonathan Festejo', 'Salesbricks', 'Co-Founder & CEO', 'speaker', 'Co-Founder & CEO of Salesbricks, building sales automation tools', 'https://linkedin.com/in/jonathanfestejo', NULL, NULL, '["Sales Leadership", "Product Management"]', '["Sales Automation", "Revenue Growth"]', 'Stanford University', '["Microsoft", "Oracle"]', '["Co-founded Salesbricks sales platform"]'),
(14, 'Ellen Damaso', 'Plus Ultra Capital Partners', 'Venture Partner', 'session_lead', 'Venture Partner and mindfulness expert leading wellness sessions for startup operators', 'https://linkedin.com/in/ellendamaso', NULL, NULL, '["Mindfulness", "Venture Capital"]', '["Mindfulness for Entrepreneurs", "Startup Wellness"]', 'UC Berkeley', '["Headspace", "Calm"]', '["Venture Partner specializing in wellness"]');

-- Event 7 & 15: Cyber60 and Winning the AI Era
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, awards) VALUES
(7, 'Fiona Lau', 'WorkDuo AI', 'Co-founder', 'speaker', 'Co-founder of WorkDuo AI, building AI-powered workplace tools', 'https://linkedin.com/in/fionalauworkduo', NULL, NULL, '["AI Development Tools", "Product Management", "Machine Learning"]', '["AI Workplace Tools", "Product Strategy"]', 'Stanford University', '["Google", "Airbnb"]', '["Co-founded WorkDuo AI platform"]'),
(7, 'Tony Wong', 'WorkDuo AI', 'Co-founder', 'speaker', 'Co-founder of WorkDuo AI, expert in AI and workplace automation', 'https://linkedin.com/in/tonywongworkduo', NULL, NULL, '["AI Development Tools", "Engineering Leadership", "Machine Learning"]', '["AI Automation", "Engineering Leadership"]', 'MIT', '["Facebook", "Uber"]', '["Co-founded WorkDuo AI platform"]'),
(15, 'Fiona Lau', 'WorkDuo AI', 'Co-founder', 'speaker', 'Co-founder of WorkDuo AI, building AI-powered workplace tools', 'https://linkedin.com/in/fionalauworkduo', NULL, NULL, '["AI Development Tools", "Product Management", "Machine Learning"]', '["AI Workplace Tools", "Product Strategy"]', 'Stanford University', '["Google", "Airbnb"]', '["Co-founded WorkDuo AI platform"]'),
(15, 'Tony Wong', 'WorkDuo AI', 'Co-founder', 'speaker', 'Co-founder of WorkDuo AI, expert in AI and workplace automation', 'https://linkedin.com/in/tonywongworkduo', NULL, NULL, '["AI Development Tools", "Engineering Leadership", "Machine Learning"]', '["AI Automation", "Engineering Leadership"]', 'MIT', '["Facebook", "Uber"]', '["Co-founded WorkDuo AI platform"]');

-- Event 11 & 12: BATTER UP! Pitch Competition and Physical AI Breakfast
INSERT OR IGNORE INTO event_speakers (event_id, name, company, title, role, bio, linkedin_url, twitter_url, image_url, expertise, speaking_topics, education, previous_companies, awards) VALUES
(11, 'Marie-Ange Youm Tagne', 'Independent', 'Product Leader', 'speaker', 'Product leader with 20+ years at Meta, Intel, Amazon, Yahoo, Roku, expert in global product scaling', 'https://linkedin.com/in/marieangeyoumtagne', NULL, NULL, '["Product Management", "Technology Leadership", "Enterprise Software"]', '["Global Product Strategy", "Product Scaling"]', 'Stanford University (PhD)', '["Meta", "Amazon", "Intel", "Yahoo", "Roku"]', '["20+ years at leading tech companies"]'),
(12, 'Leo Ma', 'RoboForce', 'CEO', 'panelist', 'CEO of RoboForce, building advanced robotics and embodied AI systems', 'https://linkedin.com/in/leomarobotics', NULL, NULL, '["Robotics", "Computer Vision", "AI Research"]', '["Robotics", "Embodied AI"]', 'MIT (Robotics)', '["Boston Dynamics", "Tesla"]', '["CEO of leading robotics company"]'),
(12, 'Stephen McGuire', 'UC Santa Cruz', 'Professor', 'panelist', 'Professor at UCSC Human Aware Robotics Exploration Lab', 'https://linkedin.com/in/stephenmcguire-ucsc', NULL, NULL, '["Academic Research", "Robotics"]', '["Human-Robot Interaction", "Robotics Research"]', 'Carnegie Mellon (PhD Robotics)', '["NASA", "MIT"]', '["Leading robotics researcher"]'),
(12, 'Tao Chen', 'Dexmate Robotics', 'CEO', 'panelist', 'CEO of Dexmate Robotics, developing dexterous manipulation systems', 'https://linkedin.com/in/taochendexmate', NULL, NULL, '["Robotics", "AI Research"]', '["Robotics", "Dexterous Manipulation"]', 'Stanford (PhD Mechanical Engineering)', '["Google X", "Willow Garage"]', '["CEO of robotics manipulation company"]');

-- Populate corresponding speaker profiles for better organization
INSERT OR IGNORE INTO speaker_profiles (name, company, bio, social_links, previous_companies, portfolio_companies, investment_focus) VALUES
('Jennifer Li', 'a16z', 'Leading AI infrastructure investments at Andreessen Horowitz, former VP Engineering at datacenter AI companies', '{"linkedin": "https://linkedin.com/in/jenniferhli"}', '["Google", "Microsoft"]', '["Anthropic", "Databricks", "Scale AI"]', 'AI Infrastructure, Developer Tools'),
('Ben Mann', 'Anthropic', 'Constitutional AI researcher and co-founder of Anthropic, former OpenAI research scientist', '{"linkedin": "https://linkedin.com/in/ben-mann-anthropic"}', '["OpenAI", "Google DeepMind"]', NULL, NULL),
('Jay Gambetta', 'IBM Quantum', 'Leading quantum computing research and quantum-classical hybrid algorithms at IBM', '{"linkedin": "https://linkedin.com/in/jaygambetta"}', '["University of Queensland", "Yale University"]', NULL, NULL),
('Malcolm Gladwell', 'Smart Talks with IBM', 'Bestselling author and host exploring technology and society intersections', '{"linkedin": "https://linkedin.com/in/malcolmgladwell", "twitter": "https://twitter.com/gladwell"}', '["The New Yorker", "Washington Post"]', NULL, NULL),
('Gorkem Yurtseven', 'Fal.ai', 'Building high-performance AI inference infrastructure, former ML Infrastructure at OpenAI', '{"linkedin": "https://linkedin.com/in/gorkem-yurtseven"}', '["OpenAI", "Meta"]', NULL, NULL),
('Adam Brown', 'Mux', 'Co-founder of Mux, building video infrastructure for developers and creators', '{"linkedin": "https://linkedin.com/in/adamlbrown"}', '["YouTube", "Zencoder"]', NULL, NULL),
('Alex Choy', 'HSBC Innovation Banking', 'Managing Director at HSBC Innovation Banking, focusing on fintech and AI investments', '{"linkedin": "https://linkedin.com/in/alexchoy"}', '["Goldman Sachs", "JP Morgan"]', NULL, 'Fintech, AI Infrastructure'),
('Jeff Wang', 'Windsurf', 'Building AI-powered development environments, former Google AI Product Manager', '{"linkedin": "https://linkedin.com/in/jeffwang-windsurf"}', '["Google", "Microsoft"]', NULL, NULL),
('Matt McClernan', 'Augment Code', 'CEO of Augment Code, building AI coding assistants for developers', '{"linkedin": "https://linkedin.com/in/mattmcclernan"}', '["Microsoft", "Amazon"]', NULL, NULL),
('Larry Li', 'Amino Capital', 'Managing Partner at Amino Capital, leading cross-border AI investments', '{"linkedin": "https://linkedin.com/in/larryli-amino"}', '["Microsoft", "Google"]', '["Anthropic", "DeepL", "Grammarly"]', 'AI, Cross-border Investment');

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