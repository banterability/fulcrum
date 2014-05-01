{extend, pick} = require 'underscore'
Backbone = require 'backbone'
{timeBetween, timeBetweenInWords} = require 'helpers/time'

class StoryModel extends Backbone.Model
  ageInWords: (relativeToDate = new Date()) ->
    timeBetweenInWords relativeToDate, @get 'updatedAt'

  staleness: (relativeToDate = new Date()) ->
    staleAfter = 1000 * 60 * 60 * 24 * 7 # 7 days
    age = timeBetween relativeToDate, @get 'updatedAt'
    staleness = age / staleAfter
    if staleness > 1
      return 1
    else if staleness < 0
      return 0
    else
      return staleness

  points: ->
    estimate = @get('estimate')?.toString()
    "#{estimate} pt." if estimate

  toJSON: ->
    presentableAttributes = pick @attributes, 'author', 'title', 'type', 'url'
    extend {}, presentableAttributes,
      age: @ageInWords()
      points: @points()
      staleness: @staleness()

module.exports = StoryModel
