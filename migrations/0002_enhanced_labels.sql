-- Enhanced Event Labels and Tags Migration
-- Adding more specific technical and business labels

-- Add new columns for enhanced labeling
ALTER TABLE events ADD COLUMN technical_tags TEXT; -- JSON array for technical labels
ALTER TABLE events ADD COLUMN business_focus TEXT; -- Business focus area
ALTER TABLE events ADD COLUMN target_audience TEXT; -- Primary audience
ALTER TABLE events ADD COLUMN difficulty_level TEXT; -- beginner, intermediate, advanced
ALTER TABLE events ADD COLUMN industry_vertical TEXT; -- specific industry focus

-- Insert more specific categories for enhanced filtering
INSERT OR IGNORE INTO event_categories (name, description, color) VALUES 
  ('Enterprise AI', 'Enterprise artificial intelligence solutions', '#1F2937'),
  ('Multimodal AI', 'AI systems processing multiple data types', '#7C3AED'),
  ('Generative AI', 'AI content and media generation', '#EC4899'),
  ('AI Infrastructure', 'AI compute, deployment, and scaling', '#059669'),
  ('Computer Vision', 'Visual AI and image processing', '#DC2626'),
  ('Natural Language Processing', 'Text and language AI systems', '#2563EB'),
  ('Edge Computing', 'Edge deployment and processing', '#9333EA'),
  ('MLOps', 'Machine learning operations and deployment', '#0891B2'),
  ('AI Ethics', 'Responsible AI and bias considerations', '#7C2D12'),
  ('Robotics', 'Physical AI and autonomous systems', '#EA580C'),
  ('Venture Capital', 'Investment and funding discussions', '#16A34A'),
  ('Product Management', 'AI product strategy and development', '#CA8A04'),
  ('Data Engineering', 'Data pipelines and infrastructure', '#4338CA'),
  ('Startup Ecosystem', 'Entrepreneurship and startup culture', '#BE185D'),
  ('Developer Tools', 'AI development and debugging tools', '#0F766E'),
  ('Healthcare AI', 'Medical and health technology', '#DC2626'),
  ('Fintech AI', 'Financial technology and AI', '#059669'),
  ('Climate Tech', 'Environmental and sustainability technology', '#16A34A'),
  ('Quantum Computing', 'Quantum algorithms and hardware', '#7C3AED'),
  ('Blockchain', 'Distributed systems and crypto', '#F59E0B'),
  ('Cybersecurity AI', 'AI-powered security solutions', '#991B1B'),
  ('Sales & Marketing', 'Revenue and growth strategies', '#0369A1'),
  ('Legal Tech', 'Legal technology and compliance', '#6B21A8'),
  ('HR Tech', 'Human resources and talent technology', '#BE123C'),
  ('DevOps', 'Development operations and automation', '#0F766E');

-- Create indexes for new columns
CREATE INDEX IF NOT EXISTS idx_events_technical_tags ON events(technical_tags);
CREATE INDEX IF NOT EXISTS idx_events_business_focus ON events(business_focus);
CREATE INDEX IF NOT EXISTS idx_events_target_audience ON events(target_audience);
CREATE INDEX IF NOT EXISTS idx_events_difficulty_level ON events(difficulty_level);
CREATE INDEX IF NOT EXISTS idx_events_industry_vertical ON events(industry_vertical);