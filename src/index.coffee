{uniq} = require 'underscore'
Hogan = require 'hogan.js'
StoryCollection = require 'collections/stories'
templates = require 'templates/index'

container = null
parentEl = null
FILTERABLE_ATTRIBUTES = ['author', 'type']

Hogan = Hogan

App = {
  init: (data) ->
    container = document.createElement 'div'
    container.classList.add 'story-list'
    parentEl = document.getElementById 'stories'

    @stories = new StoryCollection

    for story in data
      @stories.add
        id: story.id
        title: story.name
        type: story.story_type
        author: story.owners[0].name
        authorId: story.owners[0].id
        updatedAt: new Date(story.updated_at)
        url: story.url
        estimate: story.estimate

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
      attributeValues = uniq @stories.pluck(attribute)
      selections = []
      for value in attributeValues
        criteria = {}
        criteria[attribute] = value
        selections.push name: value, count: @stories.where(criteria).length
      filterList.appendChild buildFilter(attribute, selections)
}

App.Templates = {}

for key, value of templates
  App.Templates[key] = Hogan.compile(value)

buildList = (stories, title="All Stories") ->
  header = document.createElement 'h2'
  header.textContent = title

  list = document.createElement 'ul'
  listContents = []
  listContents.push App.Templates.story.render story.toJSON() for story in stories
  list.innerHTML = listContents.join ""

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
  listContents = []
  for option in selections
    {name, count} = option
    listContents.push App.Templates.filterItem.render
      key: type
      value: name
      count: count
  list.innerHTML = listContents.join ""

  filterContainer.appendChild header
  filterContainer.appendChild list

  filterContainer


module.exports = App
