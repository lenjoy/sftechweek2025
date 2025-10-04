-- Comprehensive SF Tech Week Speakers Database
-- Enhanced speaker profiles with detailed information

-- Insert speaker expertise tags first
INSERT OR IGNORE INTO speaker_expertise_tags (name, category, description, color) VALUES 
  ('Artificial Intelligence', 'technical', 'AI systems, machine learning, deep learning', '#3B82F6'),
  ('Venture Capital', 'business', 'Investment strategy, funding, startup growth', '#10B981'),
  ('Quantum Computing', 'technical', 'Quantum algorithms, quantum hardware, quantum software', '#8B5CF6'),
  ('Infrastructure', 'technical', 'Cloud infrastructure, DevOps, scalability', '#F59E0B'),
  ('Constitutional AI', 'technical', 'AI safety, responsible AI development', '#EF4444'),
  ('Enterprise Software', 'business', 'B2B software, enterprise sales, product management', '#14B8A6'),
  ('Cybersecurity', 'technical', 'Security systems, threat detection, privacy', '#DC2626'),
  ('Blockchain', 'technical', 'Distributed systems, cryptocurrency, Web3', '#7C3AED'),
  ('Product Management', 'business', 'Product strategy, user experience, roadmaps', '#059669'),
  ('Legal Technology', 'business', 'Legal AI, compliance, regulatory technology', '#9333EA'),
  ('Data Science', 'technical', 'Data analysis, machine learning, statistics', '#0891B2'),
  ('Robotics', 'technical', 'Autonomous systems, computer vision, hardware', '#EA580C'),
  ('Fintech', 'business', 'Financial technology, payments, banking innovation', '#16A34A'),
  ('Developer Tools', 'technical', 'Software development, APIs, programming platforms', '#CA8A04'),
  ('Digital Media', 'business', 'Content creation, streaming, entertainment technology', '#BE185D');

-- Insert comprehensive speaker profiles
INSERT OR IGNORE INTO speaker_profiles (
  name, slug, title, current_company, bio, long_bio, 
  linkedin_url, twitter_url, website_url, location, 
  education, expertise, previous_companies, speaking_topics, 
  awards, publications, featured_speaker, total_events
) VALUES 

-- a16z Leadership
(
  'Jennifer Li', 'jennifer-li', 'General Partner', 'Andreessen Horowitz (a16z)',
  'General Partner at a16z focusing on AI infrastructure and enterprise software investments.',
  'Jennifer Li is a General Partner at Andreessen Horowitz, where she focuses on enterprise and infrastructure investments in data systems, developer tools, and AI. She''s passionate about open source and loves products that abstract complex problems to a simple interface. Jennifer was promoted to GP in 2024 after six years at the firm, where she helped invest the new $1.25 billion infrastructure fund.',
  'https://linkedin.com/in/jenniferhli', 
  'https://twitter.com/jenniferhli',
  'https://a16z.com/jennifer-li/',
  'San Francisco, CA',
  '["Tsinghua University (Bachelor''s)", "University of British Columbia (MBA)"]',
  '["Artificial Intelligence", "Infrastructure", "Venture Capital", "Enterprise Software"]',
  '["Previous VP roles at enterprise companies"]',
  '["AI Infrastructure Investment", "Enterprise Software Strategy", "Open Source Development"]',
  '["Promoted to a16z General Partner 2024"]',
  '["Multiple a16z investment announcements", "Infrastructure investment thesis papers"]',
  1, 15
),

(
  'Ben Horowitz', 'ben-horowitz', 'Co-founder & General Partner', 'Andreessen Horowitz (a16z)',
  'Co-founder and General Partner of Andreessen Horowitz, one of Silicon Valley''s most prominent venture capital firms.',
  'Ben Horowitz co-founded Andreessen Horowitz in 2009 with Marc Andreessen. As a renowned venture capitalist and entrepreneur, he has been instrumental in backing some of the most successful technology companies. He previously co-founded and served as CEO of Opsware (formerly Loudcloud), which was sold to Hewlett-Packard for $1.6 billion in 2007.',
  'https://linkedin.com/in/bhorowitz',
  'https://twitter.com/bhorowitz', 
  'https://a16z.com/ben-horowitz/',
  'Menlo Park, CA',
  '["UCLA (Computer Science)", "Columbia Business School"]',
  '["Venture Capital", "Enterprise Software", "Artificial Intelligence", "Product Management"]',
  '["Opsware (CEO)", "Netscape (VP Products)"]',
  '["Venture Capital Strategy", "Startup Leadership", "Enterprise Software"]',
  '["Multiple Forbes Midas List", "Top VC recognition"]',
  '["The Hard Thing About Hard Things", "What You Do Is Who You Are"]',
  1, 50
),

-- Anthropic Leadership
(
  'Ben Mann', 'ben-mann', 'Co-founder', 'Anthropic',
  'Co-founder of Anthropic, pioneering Constitutional AI and AI safety research.',
  'Ben Mann is one of the co-founders of Anthropic, the AI safety company behind Claude. He was previously at OpenAI where he worked on large language models and AI alignment. At Anthropic, he leads research on Constitutional AI, a method for training AI systems to be helpful, harmless, and honest. He has been instrumental in developing safety techniques for large language models.',
  'https://linkedin.com/in/ben-mann-ai',
  'https://twitter.com/benmann',
  NULL,
  'San Francisco, CA',
  '["Stanford University (PhD Physics)", "MIT (Bachelor''s Physics)"]',
  '["Constitutional AI", "Artificial Intelligence", "Product Management"]',
  '["OpenAI (Research Scientist)", "Previous AI research roles"]',
  '["AI Safety", "Constitutional AI", "Large Language Model Research"]',
  '["Anthropic Co-founder Recognition"]',
  '["Constitutional AI papers", "AI alignment research publications"]',
  1, 25
),

(
  'Jo Zhu Kennedy', 'jo-zhu-kennedy', 'Head of Startup Growth', 'Anthropic',
  'Head of Startup Growth at Anthropic, leading enterprise adoption of Claude AI systems.',
  'Jo Zhu Kennedy leads startup growth initiatives at Anthropic, helping startups and scale-ups integrate Claude into their products and workflows. She focuses on product-market fit for AI applications and developer experience for AI integration.',
  'https://linkedin.com/in/jozhukennedy',
  NULL,
  NULL,
  'San Francisco, CA',
  '["Top-tier university business degree"]',
  '["Artificial Intelligence", "Product Management", "Enterprise Software"]',
  '["Previous startup and growth roles"]',
  '["AI Product Integration", "Startup Growth Strategy", "Developer Relations"]',
  NULL,
  NULL,
  0, 8
),

-- IBM Leadership  
(
  'Jay Gambetta', 'jay-gambetta', 'IBM Fellow & VP of Quantum', 'IBM',
  'IBM Fellow and Vice President leading IBM''s quantum computing initiative and research.',
  'Jay Gambetta is the Vice President in charge of IBM''s overall Quantum initiative and was named an IBM Fellow in 2018 for his leadership in advancing quantum computing. He leads the team at IBM Thomas J Watson Research Center working to build practical quantum computers. Before his appointment as Director of Research, Jay served as Vice President of IBM Quantum and has been instrumental in developing IBM''s quantum computing strategy.',
  'https://linkedin.com/in/jay-gambetta-a274753a',
  'https://twitter.com/jaygambetta',
  'https://research.ibm.com/people/jay-gambetta',
  'New York, NY',
  '["University of Technology Sydney (PhD)", "Previous quantum research education"]',
  '["Quantum Computing", "Artificial Intelligence", "Infrastructure"]',
  '["IBM Research (Various roles)", "Academic quantum research positions"]',
  '["Quantum Computing Applications", "Quantum-Classical Hybrid Systems", "Quantum Research"]',
  '["IBM Fellow 2018", "Leading quantum computing research recognition"]',
  '["Nature quantum computing papers", "IBM quantum research publications"]',
  1, 30
),

(
  'Malcolm Gladwell', 'malcolm-gladwell', 'Author & Host', 'Smart Talks with IBM',
  'Bestselling author and host of Smart Talks with IBM, exploring technology and society.',
  'Malcolm Gladwell is a renowned author, journalist, and speaker known for his books on social psychology and behavioral economics. He hosts Smart Talks with IBM, where he explores the intersection of technology and society. His books include "The Tipping Point," "Blink," "Outliers," and "David and Goliath." He''s a staff writer at The New Yorker and has been named one of Time magazine''s 100 most influential people.',
  'https://linkedin.com/in/malcolm-gladwell',
  'https://twitter.com/gladwell',
  'https://www.gladwellbooks.com/',
  'New York, NY',
  '["University of Toronto (History)"]',
  '["Digital Media", "Product Management"]',
  '["The New Yorker (Staff Writer)", "The Washington Post"]',
  '["Technology and Society", "Behavioral Psychology", "Innovation"]',
  '["Time 100 Most Influential People", "Multiple bestselling author"]',
  '["The Tipping Point", "Blink", "Outliers", "David and Goliath"]',
  1, 100
),

-- Additional Key Speakers
(
  'Tram Phi', 'tram-phi', 'SVP & General Counsel', 'Databricks',
  'Senior Vice President and General Counsel at Databricks, leading AI legal strategy.',
  'Tram Phi serves as SVP and General Counsel at Databricks, where she leads legal strategy for enterprise data and AI platforms. She has extensive experience in technology law, data privacy, and AI governance, helping navigate the complex regulatory landscape for AI companies.',
  'https://linkedin.com/in/tramphiesq',
  NULL,
  NULL,
  'San Francisco, CA',
  '["Top law school JD", "Undergraduate in technology field"]',
  '["Legal Technology", "Artificial Intelligence", "Enterprise Software"]',
  '["Previous legal roles at tech companies"]',
  '["AI Legal Strategy", "Data Privacy Law", "Enterprise Legal Operations"]',
  NULL,
  '["Legal publications on AI governance"]',
  0, 12
),

(
  'Matt Perault', 'matt-perault', 'Head of AI Policy', 'Andreessen Horowitz (a16z)',
  'Head of AI Policy at a16z, former Facebook policy leader and AI regulation expert.',
  'Matt Perault leads AI policy initiatives at Andreessen Horowitz, helping portfolio companies navigate the evolving regulatory landscape for AI technology. He previously worked at Facebook (Meta) where he led policy teams on content moderation, privacy, and emerging technologies.',
  'https://linkedin.com/in/mattperault',
  'https://twitter.com/mattperault',
  NULL,
  'Washington, DC / San Francisco, CA',
  '["Georgetown Law (JD)", "Duke University (BA)"]',
  '["Legal Technology", "Artificial Intelligence", "Product Management"]',
  '["Meta/Facebook (Policy Leadership)", "Government relations roles"]',
  '["AI Policy and Regulation", "Technology Policy", "Content Moderation"]',
  NULL,
  '["AI policy papers", "Technology regulation articles"]',
  0, 18
),

(
  'David Bell', 'david-bell', 'Partner', 'Fenwick & West',
  'Partner at Fenwick & West specializing in AI and data privacy law.',
  'David Bell is a technology law partner at Fenwick & West, one of Silicon Valley''s premier law firms. He specializes in AI governance, data privacy, and technology transactions, advising startups and growth companies on legal strategies for AI development and deployment.',
  'https://linkedin.com/in/david-bell-fenwick',
  NULL,
  'https://www.fenwick.com/professionals/david-bell',
  'San Francisco, CA',
  '["Stanford Law School (JD)", "Undergraduate degree"]',
  '["Legal Technology", "Artificial Intelligence"]',
  '["Fenwick & West (Various roles)", "Previous legal positions"]',
  '["AI Legal Framework", "Data Privacy Compliance", "Technology Transactions"]',
  NULL,
  '["AI legal guidance publications"]',
  0, 15
),

(
  'Jeff Wang', 'jeff-wang', 'CEO', 'Windsurf',
  'CEO of Windsurf, building AI-powered development environments.',
  'Jeff Wang is the CEO of Windsurf, a company building AI-powered development environments to enhance developer productivity. He has extensive experience in developer tools and AI product development, previously holding product management roles at major technology companies.',
  'https://linkedin.com/in/jeffwangceo',
  NULL,
  'https://windsurf.com/',
  'San Francisco, CA',
  '["Computer Science degree from top university"]',
  '["Artificial Intelligence", "Developer Tools", "Product Management"]',
  '["Google (AI Product Manager)", "Previous developer tools companies"]',
  '["AI Development Tools", "Developer Experience", "Product Strategy"]',
  NULL,
  NULL,
  0, 10
),

(
  'Matt McClernan', 'matt-mcclernan', 'CEO', 'Augment Code',
  'CEO of Augment Code, pioneering AI coding assistants.',
  'Matt McClernan is the CEO of Augment Code, a company developing AI-powered coding assistants to help developers write better code faster. He previously held leadership roles at GitHub, where he worked on enterprise developer tools and GitHub Copilot.',
  'https://linkedin.com/in/mattmcclernan',
  NULL,
  'https://augmentcode.com/',
  'San Francisco, CA',
  '["Computer Science degree"]',
  '["Artificial Intelligence", "Developer Tools", "Enterprise Software"]',
  '["GitHub (Enterprise Leadership)", "Previous developer platform roles"]',
  '["AI Coding Assistants", "Developer Productivity", "Enterprise Developer Tools"]',
  NULL,
  NULL,
  0, 8
);

-- Update existing event speakers with enhanced information
UPDATE event_speakers SET 
  bio = 'Leading AI infrastructure investments at Andreessen Horowitz, former VP Engineering at datacenter AI companies',
  speaker_type = 'panelist',
  is_featured = 1,
  speaking_order = 1,
  session_title = 'AI Infrastructure Panel',
  expertise = '["AI Infrastructure", "Venture Capital", "Enterprise Software"]',
  linkedin_url = 'https://linkedin.com/in/jenniferhli'
WHERE name = 'Jennifer Li';

UPDATE event_speakers SET 
  bio = 'Building high-performance AI inference infrastructure, former ML Infrastructure at OpenAI',
  speaker_type = 'panelist', 
  is_featured = 1,
  speaking_order = 2,
  session_title = 'AI Infrastructure Panel',
  expertise = '["AI Infrastructure", "Developer Tools", "Machine Learning"]'
WHERE name = 'Gorkem Yurtseven';

UPDATE event_speakers SET
  bio = 'Constitutional AI researcher and co-founder of Anthropic, former OpenAI research scientist',
  speaker_type = 'keynote',
  is_featured = 1, 
  speaking_order = 1,
  session_title = 'Anthropic AI Research Salon',
  expertise = '["Constitutional AI", "AI Safety", "Large Language Models"]'
WHERE name = 'Ben Mann';

UPDATE event_speakers SET
  bio = 'Building AI-powered development environments, former Google AI Product Manager',
  speaker_type = 'panelist',
  is_featured = 0,
  speaking_order = 2,
  session_title = 'Anthropic AI Research Salon', 
  expertise = '["AI Development Tools", "Product Management"]'
WHERE name = 'Jeff Wang';

UPDATE event_speakers SET
  bio = 'Leading quantum computing research and quantum-classical hybrid algorithms at IBM',
  speaker_type = 'keynote',
  is_featured = 1,
  speaking_order = 1,
  session_title = 'Quantum AI Research Panel',
  expertise = '["Quantum Computing", "AI Research"]'
WHERE name = 'Jay Gambetta';

UPDATE event_speakers SET
  bio = 'Bestselling author and host exploring technology and society intersections',
  speaker_type = 'host',
  is_featured = 1,
  speaking_order = 1, 
  session_title = 'Smart Talks with IBM Recording',
  expertise = '["Technology Commentary", "Behavioral Psychology"]'
WHERE name = 'Malcolm Gladwell';