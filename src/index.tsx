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
  const { search, category, type, date } = c.req.query()
  
  let query = `
    SELECT e.*, 
           GROUP_CONCAT(DISTINCT s.name || ' (' || s.role || ')') as speakers,
           GROUP_CONCAT(DISTINCT cat.name) as categories
    FROM events e
    LEFT JOIN event_speakers s ON e.id = s.event_id
    LEFT JOIN event_category_mappings ecm ON e.id = ecm.event_id
    LEFT JOIN event_categories cat ON ecm.category_id = cat.id
    WHERE 1=1
  `
  
  const params = []
  
  if (search) {
    query += ` AND (e.title LIKE ? OR e.description LIKE ? OR e.location LIKE ?)`
    const searchTerm = `%${search}%`
    params.push(searchTerm, searchTerm, searchTerm)
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
    
    // Get speakers
    const speakers = await DB.prepare(`
      SELECT * FROM event_speakers WHERE event_id = ?
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

app.get('/api/stats', async (c) => {
  const { DB } = c.env
  
  try {
    const totalEvents = await DB.prepare('SELECT COUNT(*) as count FROM events').first()
    const totalCategories = await DB.prepare('SELECT COUNT(*) as count FROM event_categories').first()
    const eventsByType = await DB.prepare(`
      SELECT event_type, COUNT(*) as count 
      FROM events 
      WHERE event_type IS NOT NULL 
      GROUP BY event_type 
      ORDER BY count DESC
    `).all()
    
    return c.json({
      totalEvents: totalEvents?.count || 0,
      totalCategories: totalCategories?.count || 0,
      eventsByType: eventsByType.results || []
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
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div class="md:col-span-2">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Search Events</label>
                        <input type="text" id="searchInput" placeholder="Search by title, description, or location..." 
                               class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Category</label>
                        <select id="categoryFilter" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="">All Categories</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Type</label>
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
                </div>
                <div class="flex justify-between items-center mt-4">
                    <button id="clearFilters" class="px-4 py-2 text-gray-600 hover:text-gray-800">
                        <i class="fas fa-times mr-2"></i>Clear Filters
                    </button>
                    <div id="searchStats" class="text-sm text-gray-500"></div>
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
