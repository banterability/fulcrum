{extend, pick} = require 'underscore'
Backbone = require 'backbone'
{timeFromNow} = require 'helpers/time'

class StoryModel extends Backbone.Model
  age: ->
    timeFromNow @get 'updatedAt'

  toJSON: ->
    presentableAttributes = pick @attributes, 'author', 'title', 'type', 'url'
    extend {}, presentableAttributes, age: @age().toLowerCase()

module.exports = StoryModel
