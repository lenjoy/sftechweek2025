import { Hono } from 'hono'
import { cors } from 'hono/cors'
import { serveStatic } from 'hono/cloudflare-workers'

type Bindings = {
  DB: D1Database;
}

const app = new Hono<{ Bindings: Bindings }>()

// Enable CORS for API routes
app.use('/api/*', cors())

// Serve static files
app.use('/static/*', serveStatic({ root: './public' }))

// API Routes for Events
app.get('/api/events', async (c) => {
  const { DB } = c.env
  const { search, category, type, date, difficulty, vertical, audience } = c.req.query()
  
  let query = `
    SELECT e.*, 
           GROUP_CONCAT(DISTINCT s.name || ' (' || COALESCE(s.title, s.role) || ' at ' || s.company || ')') as speakers,
           GROUP_CONCAT(DISTINCT cat.name) as categories,
           COUNT(DISTINCT s.id) as speakers_count
    FROM events e
    LEFT JOIN event_speakers s ON e.id = s.event_id
    LEFT JOIN event_category_mappings ecm ON e.id = ecm.event_id
    LEFT JOIN event_categories cat ON ecm.category_id = cat.id
    WHERE 1=1
  `
  
  const params = []
  
  if (search) {
    query += ` AND (e.title LIKE ? OR e.description LIKE ? OR e.location LIKE ? OR e.technical_tags LIKE ? OR e.business_focus LIKE ?)`
    const searchTerm = `%${search}%`
    params.push(searchTerm, searchTerm, searchTerm, searchTerm, searchTerm)
  }
  
  if (category) {
    query += ` AND cat.name = ?`
    params.push(category)
  }
  
  if (type) {
    query += ` AND e.event_type = ?`
    params.push(type)
  }
  
  if (date) {
    query += ` AND e.event_date = ?`
    params.push(date)
  }
  
  if (difficulty) {
    query += ` AND e.difficulty_level = ?`
    params.push(difficulty)
  }
  
  if (vertical) {
    query += ` AND e.industry_vertical = ?`
    params.push(vertical)
  }
  
  if (audience) {
    query += ` AND e.target_audience LIKE ?`
    params.push(`%${audience}%`)
  }
  
  query += ` GROUP BY e.id ORDER BY e.event_date ASC, e.start_time ASC`
  
  try {
    const stmt = DB.prepare(query)
    const result = await stmt.bind(...params).all()
    return c.json(result)
  } catch (error) {
    console.error('Database error:', error)
    return c.json({ error: 'Failed to fetch events' }, 500)
  }
})

app.get('/api/events/:id', async (c) => {
  const { DB } = c.env
  const id = c.req.param('id')
  
  try {
    // Get event details
    const event = await DB.prepare(`
      SELECT * FROM events WHERE id = ?
    `).bind(id).first()
    
    if (!event) {
      return c.json({ error: 'Event not found' }, 404)
    }
    
    // Get speakers with enhanced details
    const speakers = await DB.prepare(`
      SELECT * FROM event_speakers WHERE event_id = ? ORDER BY role ASC
    `).bind(id).all()
    
    // Get categories
    const categories = await DB.prepare(`
      SELECT cat.* FROM event_categories cat
      JOIN event_category_mappings ecm ON cat.id = ecm.category_id
      WHERE ecm.event_id = ?
    `).bind(id).all()
    
    return c.json({
      ...event,
      speakers: speakers.results || [],
      categories: categories.results || []
    })
  } catch (error) {
    console.error('Database error:', error)
    return c.json({ error: 'Failed to fetch event details' }, 500)
  }
})

app.get('/api/categories', async (c) => {
  const { DB } = c.env
  
  try {
    const result = await DB.prepare(`
      SELECT cat.*, COUNT(ecm.event_id) as event_count
      FROM event_categories cat
      LEFT JOIN event_category_mappings ecm ON cat.id = ecm.category_id
      GROUP BY cat.id
      ORDER BY cat.name
    `).all()
    
    return c.json(result)
  } catch (error) {
    console.error('Database error:', error)
    return c.json({ error: 'Failed to fetch categories' }, 500)
  }
})

app.get('/api/speakers', async (c) => {
  const { DB } = c.env
  const { search, expertise, company } = c.req.query()
  
  let query = `
    SELECT DISTINCT
      s.name,
      s.company,
      s.title,
      s.role,
      s.bio,
      s.linkedin_url,
      s.twitter_url,
      s.image_url,
      s.expertise,
      s.speaking_topics,
      COUNT(DISTINCT s.event_id) as events_count
    FROM event_speakers s
    WHERE 1=1
  `
  
  const params = []
  
  if (search) {
    query += ` AND (s.name LIKE ? OR s.company LIKE ? OR s.title LIKE ? OR s.bio LIKE ?)`
    const searchTerm = `%${search}%`
    params.push(searchTerm, searchTerm, searchTerm, searchTerm)
  }
  
  if (expertise) {
    query += ` AND s.expertise LIKE ?`
    params.push(`%${expertise}%`)
  }
  
  if (company) {
    query += ` AND s.company LIKE ?`
    params.push(`%${company}%`)
  }
  
  query += ` GROUP BY s.name, s.company ORDER BY events_count DESC, s.name ASC`
  
  try {
    const stmt = DB.prepare(query)
    const result = await stmt.bind(...params).all()
    return c.json(result)
  } catch (error) {
    console.error('Database error:', error)
    return c.json({ error: 'Failed to fetch speakers' }, 500)
  }
})

app.get('/api/stats', async (c) => {
  const { DB } = c.env
  
  try {
    const totalEvents = await DB.prepare('SELECT COUNT(*) as count FROM events').first()
    const totalCategories = await DB.prepare('SELECT COUNT(*) as count FROM event_categories').first()
    const totalSpeakers = await DB.prepare('SELECT COUNT(DISTINCT name || company) as count FROM event_speakers').first()
    const eventsByType = await DB.prepare(`
      SELECT event_type, COUNT(*) as count 
      FROM events 
      WHERE event_type IS NOT NULL 
      GROUP BY event_type 
      ORDER BY count DESC
    `).all()
    
    const topCompanies = await DB.prepare(`
      SELECT company, COUNT(DISTINCT event_id) as events_count
      FROM event_speakers 
      WHERE company IS NOT NULL AND company != ''
      GROUP BY company 
      ORDER BY events_count DESC, company ASC
      LIMIT 10
    `).all()
    
    return c.json({
      totalEvents: totalEvents?.count || 0,
      totalCategories: totalCategories?.count || 0,
      totalSpeakers: totalSpeakers?.count || 0,
      eventsByType: eventsByType.results || [],
      topCompanies: topCompanies.results || []
    })
  } catch (error) {
    console.error('Database error:', error)
    return c.json({ error: 'Failed to fetch stats' }, 500)
  }
})

// Main page
app.get('/', (c) => {
  return c.html(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SF Tech Week Events</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.0/css/all.min.css" rel="stylesheet">
        <link href="/static/style.css" rel="stylesheet">
    </head>
    <body class="bg-gray-50 min-h-screen">
        <div class="container mx-auto px-4 py-8">
            <header class="text-center mb-8">
                <h1 class="text-4xl font-bold text-gray-800 mb-4">
                    <i class="fas fa-calendar-alt mr-3 text-blue-600"></i>
                    SF Tech Week Events
                </h1>
                <p class="text-xl text-gray-600">Navigate and discover all events from San Francisco Tech Week</p>
            </header>
            
            <!-- Search and Filters -->
            <div class="bg-white rounded-lg shadow-md p-6 mb-8">
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-4">
                    <div class="md:col-span-2 lg:col-span-2">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Search Events</label>
                        <input type="text" id="searchInput" placeholder="Search by title, tech stack, business focus..." 
                               class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Event Type</label>
                        <select id="typeFilter" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="">All Types</option>
                            <option value="panel">Panel</option>
                            <option value="networking">Networking</option>
                            <option value="workshop">Workshop</option>
                            <option value="wellness">Wellness</option>
                            <option value="pitch_competition">Pitch Competition</option>
                            <option value="salon">Salon</option>
                            <option value="conference">Conference</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Difficulty</label>
                        <select id="difficultyFilter" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="">All Levels</option>
                            <option value="beginner">Beginner</option>
                            <option value="intermediate">Intermediate</option>
                            <option value="advanced">Advanced</option>
                        </select>
                    </div>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Category</label>
                        <select id="categoryFilter" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="">All Categories</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Industry</label>
                        <select id="verticalFilter" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="">All Industries</option>
                            <option value="AI Research">AI Research</option>
                            <option value="Enterprise Software">Enterprise Software</option>
                            <option value="Financial Services">Financial Services</option>
                            <option value="Healthcare">Healthcare</option>
                            <option value="Manufacturing & Robotics">Manufacturing</option>
                            <option value="Media & Entertainment">Media</option>
                            <option value="Cybersecurity">Cybersecurity</option>
                            <option value="Legal Technology">Legal Tech</option>
                            <option value="Developer Tools">Developer Tools</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Audience</label>
                        <select id="audienceFilter" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="">All Audiences</option>
                            <option value="Founders">Founders</option>
                            <option value="Engineers">Engineers</option>
                            <option value="VCs">VCs & Investors</option>
                            <option value="Researchers">Researchers</option>
                            <option value="Technical Leaders">Tech Leaders</option>
                            <option value="Product Managers">Product Managers</option>
                        </select>
                    </div>
                </div>
                
                <div class="flex justify-between items-center mt-6">
                    <button id="clearFilters" class="px-4 py-2 text-gray-600 hover:text-gray-800 transition-colors">
                        <i class="fas fa-times mr-2"></i>Clear All Filters
                    </button>
                    <div class="flex items-center gap-4">
                        <button id="advancedToggle" class="text-blue-600 hover:text-blue-800 text-sm">
                            <i class="fas fa-cog mr-1"></i>Advanced Filters
                        </button>
                        <div id="searchStats" class="text-sm text-gray-500"></div>
                    </div>
                </div>
            </div>
            
            <!-- Stats Cards -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8" id="statsCards">
                <!-- Stats will be populated by JavaScript -->
            </div>
            
            <!-- Events Grid -->
            <div id="eventsContainer" class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <!-- Events will be populated by JavaScript -->
            </div>
            
            <!-- Loading State -->
            <div id="loadingState" class="text-center py-12">
                <i class="fas fa-spinner fa-spin text-4xl text-blue-600 mb-4"></i>
                <p class="text-gray-600">Loading events...</p>
            </div>
            
            <!-- Empty State -->
            <div id="emptyState" class="text-center py-12 hidden">
                <i class="fas fa-calendar-times text-6xl text-gray-400 mb-4"></i>
                <h3 class="text-xl font-semibold text-gray-700 mb-2">No events found</h3>
                <p class="text-gray-500">Try adjusting your search filters</p>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/axios@1.6.0/dist/axios.min.js"></script>
        <script src="/static/app.js"></script>
    </body>
    </html>
  `)
})

export default app
