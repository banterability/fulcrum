{uniq} = require 'underscore'
StoryCollection = require 'collections/stories'

container = null
parentEl = null
FILTERABLE_ATTRIBUTES = ['author', 'type']

App = {
  init: (data) ->
    container = document.createElement 'div'
    container.classList.add 'story-list'
    parentEl = document.getElementById 'stories'

    @stories = new StoryCollection

    for story in data.stories
      @stories.add
        id: story.id
        title: story.title
        type: story.type
        author: story.author.name
        authorId: story.author.id

  filterBy: (key, value) ->
    criteria = {}
    criteria[key] = value
    @render @stories.where(criteria), "Stories where #{key} = #{value}"

  render: (collection=@stories.models, title)->
    parentEl.appendChild buildList(collection, title)
    return this

  renderFilters: ->
    filterList = document.getElementById 'filters'
    for attribute in FILTERABLE_ATTRIBUTES
      selections = uniq @stories.pluck(attribute)
      filterList.appendChild buildFilter(attribute, selections)
}

buildList = (stories, title="All Stories") ->
  header = document.createElement 'h2'
  header.textContent = title

  list = document.createElement 'ul'
  stories.forEach (story) ->
    listItem = document.createElement 'li'
    listItem.classList.add story.get('type')
    listItem.textContent = story.get('title')
    list.appendChild listItem

  container.innerHTML = ""
  container.appendChild header
  container.appendChild list

  container

buildFilter = (type, selections) ->
  filterContainer = document.createElement 'div'
  filterContainer.classList.add 'filter-list'

  header = document.createElement 'h3'
  header.textContent = "Filter by #{type}"

  list = document.createElement 'ul'
  selections.forEach (option) ->
    link = document.createElement 'a'
    link.href = "javascript:App.filterBy('#{type}','#{option}');"
    link.textContent = option

    listItem = document.createElement 'li'
    listItem.appendChild link

    list.appendChild listItem

  filterContainer.appendChild header
  filterContainer.appendChild list

  filterContainer


module.exports = App
