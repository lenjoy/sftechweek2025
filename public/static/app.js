// SF Tech Week Events Frontend Application - Enhanced with Technical Labels

class EventsApp {
  constructor() {
    this.events = []
    this.categories = []
    this.filteredEvents = []
    this.searchTimeout = null
    
    this.init()
  }
  
  async init() {
    await this.loadCategories()
    await this.loadStats()
    await this.loadEvents()
    this.setupEventListeners()
    this.hideLoading()
  }
  
  async loadCategories() {
    try {
      const response = await axios.get('/api/categories')
      this.categories = response.data.results || []
      this.populateCategories()
    } catch (error) {
      console.error('Failed to load categories:', error)
    }
  }
  
  async loadStats() {
    try {
      const response = await axios.get('/api/stats')
      const stats = response.data
      this.renderStats(stats)
    } catch (error) {
      console.error('Failed to load stats:', error)
    }
  }
  
  async loadEvents() {
    try {
      const response = await axios.get('/api/events')
      this.events = response.data.results || []
      this.filteredEvents = [...this.events]
      this.renderEvents()
      this.updateSearchStats()
    } catch (error) {
      console.error('Failed to load events:', error)
      this.showError('Failed to load events. Please try again later.')
    }
  }
  
  populateCategories() {
    const categorySelect = document.getElementById('categoryFilter')
    this.categories.forEach(category => {
      const option = document.createElement('option')
      option.value = category.name
      option.textContent = `${category.name} (${category.event_count || 0})`
      categorySelect.appendChild(option)
    })
  }
  
  renderStats(stats) {
    const statsContainer = document.getElementById('statsCards')
    statsContainer.innerHTML = `
      <div class="bg-white rounded-lg shadow-md p-6">
        <div class="flex items-center">
          <div class="flex-shrink-0">
            <i class="fas fa-calendar-check text-3xl text-blue-600"></i>
          </div>
          <div class="ml-4">
            <p class="text-sm font-medium text-gray-500">Total Events</p>
            <p class="text-2xl font-bold text-gray-900">${stats.totalEvents}</p>
          </div>
        </div>
      </div>
      
      <div class="bg-white rounded-lg shadow-md p-6">
        <div class="flex items-center">
          <div class="flex-shrink-0">
            <i class="fas fa-microphone-alt text-3xl text-green-600"></i>
          </div>
          <div class="ml-4">
            <p class="text-sm font-medium text-gray-500">Total Speakers</p>
            <p class="text-2xl font-bold text-gray-900">${stats.totalSpeakers || 0}</p>
          </div>
        </div>
      </div>
      
      <div class="bg-white rounded-lg shadow-md p-6">
        <div class="flex items-center">
          <div class="flex-shrink-0">
            <i class="fas fa-building text-3xl text-purple-600"></i>
          </div>
          <div class="ml-4">
            <p class="text-sm font-medium text-gray-500">Top Company</p>
            <p class="text-lg font-bold text-gray-900">${stats.topCompanies?.[0]?.company || 'N/A'}</p>
            <p class="text-xs text-gray-500">${stats.topCompanies?.[0]?.events_count || 0} events</p>
          </div>
        </div>
      </div>
    `
  }
  
  renderEvents() {
    const container = document.getElementById('eventsContainer')
    const emptyState = document.getElementById('emptyState')
    
    if (this.filteredEvents.length === 0) {
      container.innerHTML = ''
      emptyState.classList.remove('hidden')
      return
    }
    
    emptyState.classList.add('hidden')
    
    container.innerHTML = this.filteredEvents.map(event => this.renderEventCard(event)).join('')
    
    // Add click listeners to event cards
    container.querySelectorAll('.event-card').forEach((card, index) => {
      card.style.cursor = 'pointer'
      card.addEventListener('click', () => {
        this.showEventDetails(this.filteredEvents[index])
      })
    })
  }
  
  renderEventCard(event) {
    const organizersArray = this.parseJSON(event.organizers) || []
    const tagsArray = this.parseJSON(event.tags) || []
    const technicalTags = this.parseJSON(event.technical_tags) || []
    
    const dateStr = event.event_date ? new Date(event.event_date).toLocaleDateString() : 'TBD'
    const timeStr = event.start_time ? `${event.start_time}${event.end_time ? ` - ${event.end_time}` : ''}` : 'Time TBD'
    
    const typeIcon = this.getTypeIcon(event.event_type)
    const typeColor = this.getTypeColor(event.event_type)
    const difficultyColor = this.getDifficultyColor(event.difficulty_level)
    
    return `
      <div class="bg-white rounded-lg shadow-md hover:shadow-lg transition-all duration-300 hover:-translate-y-1 event-card">
        <div class="p-6">
          <div class="flex items-start justify-between mb-4">
            <div class="flex-1">
              <h3 class="text-xl font-bold text-gray-900 mb-2">${this.escapeHtml(event.title)}</h3>
              <div class="flex items-center text-sm text-gray-600 mb-2 flex-wrap gap-2">
                <div class="flex items-center">
                  <i class="fas fa-calendar mr-1"></i>
                  <span>${dateStr}</span>
                </div>
                <div class="flex items-center">
                  <i class="fas fa-clock mr-1"></i>
                  <span>${timeStr}</span>
                </div>
                ${event.difficulty_level ? `<span class="inline-flex items-center px-2 py-1 rounded text-xs font-medium ${difficultyColor}"><i class="fas fa-signal mr-1"></i>${this.escapeHtml(event.difficulty_level)}</span>` : ''}
              </div>
            </div>
            ${event.is_invite_only ? '<div class="ml-4"><span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-red-100 text-red-800 invite-only-badge"><i class="fas fa-lock mr-1"></i>Invite Only</span></div>' : ''}
          </div>
          
          ${event.description ? `<p class="text-gray-700 mb-4 line-clamp-3">${this.escapeHtml(event.description)}</p>` : ''}
          
          <div class="grid grid-cols-1 md:grid-cols-2 gap-2 text-sm text-gray-600 mb-4">
            ${event.location ? `<div class="flex items-center"><i class="fas fa-map-marker-alt mr-2 text-gray-400"></i><span>${this.escapeHtml(event.location)}</span></div>` : ''}
            ${event.neighborhood ? `<div class="flex items-center"><i class="fas fa-building mr-2 text-gray-400"></i><span>${this.escapeHtml(event.neighborhood)}</span></div>` : ''}
            ${event.business_focus ? `<div class="flex items-center"><i class="fas fa-bullseye mr-2 text-gray-400"></i><span>${this.escapeHtml(event.business_focus)}</span></div>` : ''}
            ${event.industry_vertical ? `<div class="flex items-center"><i class="fas fa-industry mr-2 text-gray-400"></i><span>${this.escapeHtml(event.industry_vertical)}</span></div>` : ''}
          </div>
          
          ${event.target_audience ? `<div class="mb-3 text-sm"><span class="inline-flex items-center px-2 py-1 rounded-full bg-purple-100 text-purple-800 text-xs"><i class="fas fa-users mr-1"></i>${this.escapeHtml(event.target_audience)}</span></div>` : ''}
          
          ${event.speakers ? `
            <div class="mb-4 p-3 bg-gray-50 rounded-lg">
              <div class="flex items-center mb-2">
                <i class="fas fa-microphone mr-2 text-blue-600"></i>
                <strong class="text-sm font-medium text-gray-700">Speakers (${event.speakers_count || 1})</strong>
              </div>
              <p class="text-sm text-gray-600 leading-relaxed">${this.escapeHtml(event.speakers)}</p>
            </div>
          ` : ''}
          
          <div class="flex items-center justify-between mb-4">
            <div class="flex flex-wrap gap-2">
              <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium ${typeColor}">
                <i class="${typeIcon} mr-1"></i>
                ${this.formatEventType(event.event_type)}
              </span>
              ${organizersArray.slice(0, 2).map(org => 
                `<span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-gray-100 text-gray-800">${this.escapeHtml(org)}</span>`
              ).join('')}
              ${organizersArray.length > 2 ? `<span class="text-xs text-gray-500">+${organizersArray.length - 2} more</span>` : ''}
            </div>
          </div>
          
          ${technicalTags.length > 0 ? `
            <div class="mb-4 pt-3 border-t border-gray-100">
              <div class="text-xs font-medium text-gray-500 mb-2"><i class="fas fa-code mr-1"></i>Technical Focus</div>
              <div class="flex flex-wrap gap-1">
                ${technicalTags.slice(0, 4).map(tag => 
                  `<span class="tag bg-emerald-100 text-emerald-800">${this.escapeHtml(tag)}</span>`
                ).join('')}
                ${technicalTags.length > 4 ? `<span class="text-xs text-gray-500">+${technicalTags.length - 4} more</span>` : ''}
              </div>
            </div>
          ` : ''}
          
          ${tagsArray.length > 0 ? `
            <div class="pt-3 border-t border-gray-100">
              <div class="text-xs font-medium text-gray-500 mb-2"><i class="fas fa-tags mr-1"></i>Categories</div>
              <div class="flex flex-wrap gap-1">
                ${tagsArray.map(tag => 
                  `<span class="tag bg-blue-100 text-blue-800">${this.escapeHtml(tag)}</span>`
                ).join('')}
              </div>
            </div>
          ` : ''}
        </div>
      </div>
    `
  }
  
  setupEventListeners() {
    const searchInput = document.getElementById('searchInput')
    const categoryFilter = document.getElementById('categoryFilter')
    const typeFilter = document.getElementById('typeFilter')
    const difficultyFilter = document.getElementById('difficultyFilter')
    const verticalFilter = document.getElementById('verticalFilter')
    const audienceFilter = document.getElementById('audienceFilter')
    const clearFilters = document.getElementById('clearFilters')
    
    const applyFiltersDebounced = () => {
      clearTimeout(this.searchTimeout)
      this.searchTimeout = setTimeout(() => {
        this.applyFilters()
      }, 300)
    }
    
    searchInput.addEventListener('input', applyFiltersDebounced)
    categoryFilter.addEventListener('change', () => this.applyFilters())
    typeFilter.addEventListener('change', () => this.applyFilters())
    difficultyFilter.addEventListener('change', () => this.applyFilters())
    verticalFilter.addEventListener('change', () => this.applyFilters())
    audienceFilter.addEventListener('change', () => this.applyFilters())
    
    clearFilters.addEventListener('click', () => {
      searchInput.value = ''
      categoryFilter.value = ''
      typeFilter.value = ''
      difficultyFilter.value = ''
      verticalFilter.value = ''
      audienceFilter.value = ''
      this.applyFilters()
    })
  }
  
  applyFilters() {
    const search = document.getElementById('searchInput').value.toLowerCase()
    const category = document.getElementById('categoryFilter').value
    const type = document.getElementById('typeFilter').value
    const difficulty = document.getElementById('difficultyFilter').value
    const vertical = document.getElementById('verticalFilter').value
    const audience = document.getElementById('audienceFilter').value
    
    this.filteredEvents = this.events.filter(event => {
      const matchesSearch = !search || 
        event.title.toLowerCase().includes(search) || 
        (event.description && event.description.toLowerCase().includes(search)) ||
        (event.location && event.location.toLowerCase().includes(search)) ||
        (event.technical_tags && event.technical_tags.toLowerCase().includes(search)) ||
        (event.business_focus && event.business_focus.toLowerCase().includes(search))
      
      const matchesCategory = !category || 
        (event.categories && event.categories.toLowerCase().includes(category.toLowerCase()))
      
      const matchesType = !type || event.event_type === type
      
      const matchesDifficulty = !difficulty || event.difficulty_level === difficulty
      
      const matchesVertical = !vertical || 
        (event.industry_vertical && event.industry_vertical.includes(vertical))
      
      const matchesAudience = !audience || 
        (event.target_audience && event.target_audience.includes(audience))
      
      return matchesSearch && matchesCategory && matchesType && matchesDifficulty && matchesVertical && matchesAudience
    })
    
    this.renderEvents()
    this.updateSearchStats()
  }
  
  updateSearchStats() {
    const statsEl = document.getElementById('searchStats')
    const total = this.events.length
    const filtered = this.filteredEvents.length
    
    if (filtered === total) {
      statsEl.textContent = `Showing all ${total} events`
    } else {
      statsEl.textContent = `Showing ${filtered} of ${total} events`
    }
  }
  
  parseJSON(str) {
    try {
      return JSON.parse(str)
    } catch (e) {
      return null
    }
  }
  
  escapeHtml(unsafe) {
    return unsafe
         .replace(/&/g, "&amp;")
         .replace(/</g, "&lt;")
         .replace(/>/g, "&gt;")
         .replace(/"/g, "&quot;")
         .replace(/'/g, "&#039;");
  }
  
  getTypeIcon(type) {
    const icons = {
      'panel': 'fas fa-users',
      'networking': 'fas fa-handshake',
      'workshop': 'fas fa-tools',
      'wellness': 'fas fa-heart',
      'pitch_competition': 'fas fa-trophy',
      'salon': 'fas fa-comments',
      'conference': 'fas fa-building',
      'reception': 'fas fa-glass-cheers'
    }
    return icons[type] || 'fas fa-calendar'
  }
  
  getTypeColor(type) {
    const colors = {
      'panel': 'bg-purple-100 text-purple-800',
      'networking': 'bg-green-100 text-green-800',
      'workshop': 'bg-yellow-100 text-yellow-800',
      'wellness': 'bg-pink-100 text-pink-800',
      'pitch_competition': 'bg-red-100 text-red-800',
      'salon': 'bg-indigo-100 text-indigo-800',
      'conference': 'bg-blue-100 text-blue-800',
      'reception': 'bg-orange-100 text-orange-800'
    }
    return colors[type] || 'bg-gray-100 text-gray-800'
  }
  
  getDifficultyColor(difficulty) {
    const colors = {
      'beginner': 'bg-green-100 text-green-700',
      'intermediate': 'bg-yellow-100 text-yellow-700',
      'advanced': 'bg-red-100 text-red-700'
    }
    return colors[difficulty] || 'bg-gray-100 text-gray-700'
  }
  
  formatEventType(type) {
    if (!type) return 'Event'
    return type.split('_').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ')
  }
  
  hideLoading() {
    document.getElementById('loadingState').classList.add('hidden')
  }
  
  async showEventDetails(event) {
    try {
      const response = await axios.get(`/api/events/${event.id}`)
      const eventDetails = response.data
      this.renderEventModal(eventDetails)
    } catch (error) {
      console.error('Failed to load event details:', error)
      alert('Failed to load event details. Please try again.')
    }
  }
  
  renderEventModal(event) {
    const modalHtml = `
      <div id="eventModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
        <div class="bg-white rounded-lg max-w-4xl w-full max-h-[90vh] overflow-y-auto">
          <div class="p-6">
            <div class="flex justify-between items-start mb-4">
              <h2 class="text-2xl font-bold text-gray-900">${this.escapeHtml(event.title)}</h2>
              <button id="closeModal" class="text-gray-400 hover:text-gray-600 text-2xl">&times;</button>
            </div>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <h3 class="text-lg font-semibold text-gray-800 mb-3">Event Details</h3>
                <div class="space-y-2 text-sm">
                  <div class="flex items-center">
                    <i class="fas fa-calendar mr-2 text-gray-500"></i>
                    <span>${event.event_date ? new Date(event.event_date).toLocaleDateString() : 'TBD'}</span>
                  </div>
                  <div class="flex items-center">
                    <i class="fas fa-clock mr-2 text-gray-500"></i>
                    <span>${event.start_time || 'Time TBD'}${event.end_time ? ` - ${event.end_time}` : ''}</span>
                  </div>
                  ${event.location ? `<div class="flex items-center"><i class="fas fa-map-marker-alt mr-2 text-gray-500"></i><span>${this.escapeHtml(event.location)}</span></div>` : ''}
                  ${event.event_type ? `<div class="flex items-center"><i class="fas fa-tag mr-2 text-gray-500"></i><span>${this.formatEventType(event.event_type)}</span></div>` : ''}
                  ${event.difficulty_level ? `<div class="flex items-center"><i class="fas fa-signal mr-2 text-gray-500"></i><span>${this.escapeHtml(event.difficulty_level)}</span></div>` : ''}
                </div>
                
                ${event.description ? `
                  <div class="mt-4">
                    <h4 class="font-semibold text-gray-800 mb-2">Description</h4>
                    <p class="text-gray-700 text-sm">${this.escapeHtml(event.description)}</p>
                  </div>
                ` : ''}
              </div>
              
              <div>
                ${event.speakers && event.speakers.length > 0 ? `
                  <h3 class="text-lg font-semibold text-gray-800 mb-3">Speakers & Panelists</h3>
                  <div class="space-y-4">
                    ${event.speakers.map(speaker => this.renderSpeakerCard(speaker)).join('')}
                  </div>
                ` : ''}
              </div>
            </div>
            
            ${event.technical_tags || event.business_focus || event.industry_vertical ? `
              <div class="mt-6 pt-4 border-t border-gray-200">
                <h3 class="text-lg font-semibold text-gray-800 mb-3">Additional Information</h3>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm">
                  ${event.technical_tags ? `<div><strong>Technical Focus:</strong><br/><span class="text-gray-600">${this.escapeHtml(event.technical_tags)}</span></div>` : ''}
                  ${event.business_focus ? `<div><strong>Business Focus:</strong><br/><span class="text-gray-600">${this.escapeHtml(event.business_focus)}</span></div>` : ''}
                  ${event.industry_vertical ? `<div><strong>Industry:</strong><br/><span class="text-gray-600">${this.escapeHtml(event.industry_vertical)}</span></div>` : ''}
                </div>
              </div>
            ` : ''}
          </div>
        </div>
      </div>
    `
    
    document.body.insertAdjacentHTML('beforeend', modalHtml)
    document.getElementById('closeModal').addEventListener('click', this.closeEventModal)
    document.getElementById('eventModal').addEventListener('click', (e) => {
      if (e.target.id === 'eventModal') this.closeEventModal()
    })
  }
  
  renderSpeakerCard(speaker) {
    const expertise = this.parseJSON(speaker.expertise) || []
    const speakingTopics = this.parseJSON(speaker.speaking_topics) || []
    
    return `
      <div class="bg-gray-50 rounded-lg p-4">
        <div class="flex items-start space-x-3">
          ${speaker.image_url ? `
            <img src="${speaker.image_url}" alt="${this.escapeHtml(speaker.name)}" 
                 class="w-12 h-12 rounded-full object-cover flex-shrink-0">
          ` : `
            <div class="w-12 h-12 rounded-full bg-gray-300 flex items-center justify-center flex-shrink-0">
              <i class="fas fa-user text-gray-600"></i>
            </div>
          `}
          <div class="flex-1 min-w-0">
            <h4 class="text-sm font-semibold text-gray-900">${this.escapeHtml(speaker.name)}</h4>
            ${speaker.title && speaker.company ? `
              <p class="text-sm text-gray-600">${this.escapeHtml(speaker.title)} at ${this.escapeHtml(speaker.company)}</p>
            ` : speaker.role ? `
              <p class="text-sm text-gray-600">${this.escapeHtml(speaker.role)}</p>
            ` : ''}
            
            ${speaker.bio ? `
              <p class="text-xs text-gray-500 mt-2 line-clamp-2">${this.escapeHtml(speaker.bio)}</p>
            ` : ''}
            
            ${expertise.length > 0 ? `
              <div class="mt-2">
                <div class="flex flex-wrap gap-1">
                  ${expertise.slice(0, 3).map(exp => 
                    `<span class="inline-block px-2 py-1 text-xs bg-blue-100 text-blue-800 rounded">${this.escapeHtml(exp)}</span>`
                  ).join('')}
                </div>
              </div>
            ` : ''}
            
            <div class="flex items-center space-x-2 mt-2">
              ${speaker.linkedin_url ? `
                <a href="${speaker.linkedin_url}" target="_blank" rel="noopener noreferrer" 
                   class="text-blue-600 hover:text-blue-800">
                  <i class="fab fa-linkedin text-sm"></i>
                </a>
              ` : ''}
              ${speaker.twitter_url ? `
                <a href="${speaker.twitter_url}" target="_blank" rel="noopener noreferrer" 
                   class="text-blue-400 hover:text-blue-600">
                  <i class="fab fa-twitter text-sm"></i>
                </a>
              ` : ''}
            </div>
          </div>
        </div>
      </div>
    `
  }
  
  closeEventModal() {
    const modal = document.getElementById('eventModal')
    if (modal) {
      modal.remove()
    }
  }

  showError(message) {
    const container = document.getElementById('eventsContainer')
    container.innerHTML = `
      <div class="col-span-full bg-red-50 border border-red-200 rounded-lg p-6 text-center">
        <i class="fas fa-exclamation-triangle text-3xl text-red-600 mb-4"></i>
        <p class="text-red-800">${message}</p>
      </div>
    `
    this.hideLoading()
  }
}

// Initialize the app when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
  new EventsApp()
})