Backbone = require 'backbone'
{timeFromNow} = require 'helpers/time'

class StoryModel extends Backbone.Model
  age: ->
    timeFromNow @get 'updatedAt'


module.exports = StoryModel
