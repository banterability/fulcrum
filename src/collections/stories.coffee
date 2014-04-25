Backbone = require 'backbone'
StoryModel = require 'models/story'


class StoryCollection extends Backbone.Collection
  model: StoryModel


module.exports = StoryCollection
