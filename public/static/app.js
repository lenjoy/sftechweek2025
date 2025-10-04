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
            <i class="fas fa-tags text-3xl text-green-600"></i>
          </div>
          <div class="ml-4">
            <p class="text-sm font-medium text-gray-500">Categories</p>
            <p class="text-2xl font-bold text-gray-900">${stats.totalCategories}</p>
          </div>
        </div>
      </div>
      
      <div class="bg-white rounded-lg shadow-md p-6">
        <div class="flex items-center">
          <div class="flex-shrink-0">
            <i class="fas fa-chart-bar text-3xl text-purple-600"></i>
          </div>
          <div class="ml-4">
            <p class="text-sm font-medium text-gray-500">Most Popular</p>
            <p class="text-lg font-bold text-gray-900">${stats.eventsByType?.[0]?.event_type || 'N/A'}</p>
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
          
          ${event.speakers ? `<div class="mb-4"><p class="text-sm text-gray-600"><i class="fas fa-microphone mr-2"></i><strong>Speakers:</strong> ${this.escapeHtml(event.speakers)}</p></div>` : ''}
          
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