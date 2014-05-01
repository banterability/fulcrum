{extend, pick} = require 'underscore'
Backbone = require 'backbone'
{timeBetween, timeBetweenInWords} = require 'helpers/time'

class StoryModel extends Backbone.Model
  ageInWords: (relativeToDate = new Date()) ->
    timeBetweenInWords relativeToDate, @get 'updatedAt'

  staleClass: (relativeToDate = new Date()) ->
    sinceUpdate = timeBetween relativeToDate, @get 'updatedAt'
    days = Math.round sinceUpdate / (1000 * 60 * 60 * 24)
    days = 7 if days > 7
    days = 0 if days < 0
    "stale_for_#{days}_days"

  points: ->
    estimate = @get('estimate')?.toString()
    "#{estimate} pt." if estimate

  toJSON: ->
    presentableAttributes = pick @attributes, 'author', 'title', 'type', 'url'
    extend {}, presentableAttributes,
      age: @ageInWords()
      points: @points()
      staleClass: @staleClass()

module.exports = StoryModel
