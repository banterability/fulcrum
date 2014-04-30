{extend, pick} = require 'underscore'
Backbone = require 'backbone'
{timeFromNow} = require 'helpers/time'

class StoryModel extends Backbone.Model
  age: ->
    timeFromNow @get 'updatedAt'

  points: ->
    estimate = @get('estimate')?.toString()
    "#{estimate} pt." if estimate

  toJSON: ->
    presentableAttributes = pick @attributes, 'author', 'title', 'type', 'url'
    extend {}, presentableAttributes,
      age: @age()
      points: @points()

module.exports = StoryModel
