{extend, pick} = require 'underscore'
Backbone = require 'backbone'
{timeBetween, timeBetweenInWords} = require 'helpers/time'

class StoryModel extends Backbone.Model
  ageInWords: (relativeToDate = new Date()) ->
    timeBetweenInWords relativeToDate, @get 'updatedAt'

  age: (relativeToDate = new Date()) ->
    timeBetween relativeToDate, @get 'updatedAt'

  points: ->
    estimate = @get('estimate')?.toString()
    "#{estimate} pt." if estimate

  toJSON: ->
    presentableAttributes = pick @attributes, 'author', 'title', 'type', 'url'
    extend {}, presentableAttributes,
      age: @ageInWords()
      points: @points()

module.exports = StoryModel
