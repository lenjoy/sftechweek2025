# SF Tech Week Events

## Project Overview
- **Name**: SF Tech Week Events
- **Goal**: A comprehensive web application to navigate and discover all events from San Francisco Tech Week
- **Features**: Event browsing, search & filtering, categorization, responsive design, D1 database storage

## URLs
- **Local Development**: https://3000-ig5bos8o6dzzjcxzloivq-6532622b.e2b.dev
- **API Health Check**: https://3000-ig5bos8o6dzzjcxzloivq-6532622b.e2b.dev/api/stats
- **GitHub**: (To be configured)

## Data Architecture
- **Data Models**: 
  - Events (title, description, date/time, location, organizers, type)
  - Event Speakers (name, title, company, role)
  - Event Categories (AI/ML, Networking, Panel, Workshop, etc.)
  - Category Mappings (many-to-many relationships)
- **Storage Services**: 
  - Cloudflare D1 SQLite database for events data
  - Local development using `--local` flag for fast iteration
- **Data Flow**: 
  - Frontend → Hono API endpoints → D1 Database
  - Real-time search and filtering via API calls
  - Structured data with proper relationships and indexes

## Currently Completed Features
✅ **Event Data Collection**: Comprehensive SF Tech Week events from multiple sources  
✅ **D1 Database Setup**: Complete schema with events, speakers, categories, and mappings  
✅ **RESTful API**: Full CRUD operations with search, filtering, and stats endpoints  
✅ **Responsive Frontend**: Modern UI with Tailwind CSS, FontAwesome icons  
✅ **Real-time Search**: Live filtering by text, category, and event type  
✅ **Event Categories**: AI/ML, Networking, Panel, Workshop, Wellness, Fintech, etc.  
✅ **Event Details**: Comprehensive information including speakers, organizers, locations  
✅ **Statistics Dashboard**: Event counts, categories, and type distributions  
✅ **Local Development**: PM2 process management with hot reloading  

## Functional Entry URIs
### API Endpoints
- **GET /api/events** - Retrieve all events with optional filtering
  - Query parameters: `search`, `category`, `type`, `date`
  - Returns: Events with speakers and category information
- **GET /api/events/:id** - Get detailed event information
  - Returns: Event details with speakers and categories arrays
- **GET /api/categories** - List all event categories with counts
  - Returns: Categories with event counts for each
- **GET /api/stats** - Get application statistics
  - Returns: Total events, categories, and event type distribution

### Frontend Pages
- **GET /** - Main events browser interface
  - Interactive search and filtering
  - Responsive grid layout with event cards
  - Real-time statistics and category selection

## User Guide
1. **Browse Events**: Visit the main page to see all SF Tech Week events in a responsive grid
2. **Search**: Use the search box to find events by title, description, or location
3. **Filter by Category**: Select from categories like AI/ML, Networking, Panel, Workshop
4. **Filter by Type**: Choose specific event types (panel, networking, wellness, etc.)
5. **View Details**: Each event card shows comprehensive information including:
   - Date, time, and location details
   - Event description and organizers
   - Speaker information where available
   - Event type and invitation status
   - Relevant tags and categories
6. **Clear Filters**: Use the "Clear Filters" button to reset all search criteria

## Deployment
- **Platform**: Cloudflare Pages (ready for deployment)
- **Status**: ✅ Active (Local Development)
- **Tech Stack**: Hono + TypeScript + TailwindCSS + D1 Database + Cloudflare Workers
- **Last Updated**: 2025-10-04

## Database Schema
- **events**: Main events table with all event details
- **event_speakers**: Speaker information linked to events
- **event_categories**: Predefined categories for classification
- **event_category_mappings**: Many-to-many relationships between events and categories

## Development Commands
```bash
npm run build              # Build the application
npm run dev:sandbox        # Start development server
npm run db:migrate:local   # Apply database migrations locally
npm run db:seed           # Populate with sample data
npm run db:reset          # Reset and reseed database
npm test                  # Test application endpoint
```

## Next Steps for Development
1. **Enhanced Event Data**: Add more comprehensive event details from additional sources
2. **Event Registration**: Integrate with event registration platforms
3. **User Favorites**: Allow users to save and track favorite events
4. **Calendar Integration**: Add calendar export functionality (.ics files)
5. **Map Integration**: Show event locations on an interactive map
6. **Social Features**: Add sharing capabilities and social media integration
7. **Real-time Updates**: Implement WebSocket connections for live event updates
8. **Mobile App**: Consider React Native mobile application
9. **Admin Panel**: Create admin interface for event management
10. **Analytics**: Add usage analytics and event popularity tracking

## Event Categories Implemented
- **AI/ML**: Artificial Intelligence and Machine Learning events
- **Networking**: Professional networking and social events  
- **Panel**: Panel discussions and expert talks
- **Workshop**: Hands-on workshops and learning sessions
- **Pitch Competition**: Startup pitch competitions and showcases
- **Wellness**: Health, wellness, and outdoor activities
- **Fintech**: Financial technology and services
- **Infrastructure**: Technical infrastructure and DevOps
- **Policy**: Legal and regulatory discussions
- **Cybersecurity**: Security and privacy focused events

## Sample Events Included
- AI, Infra, & the Future of Generative Media (HSBC + a16z)
- Anthropic AI Founder Salon (Invite-only technical gathering)
- Virio Run Club (Wellness networking event)
- BATTER UP! Regional Pitch Competition (Startup showcase)
- Mercury Brunch & Water Cycling on the Bay (Networking activity)

The application successfully demonstrates a complete full-stack web application with modern architecture, real-time search capabilities, and comprehensive event management suitable for any tech conference or event directory.