fs = require 'fs'
http = require 'http'
request = require 'request'

config = JSON.parse fs.readFileSync './server/config.json', encoding: 'utf-8'

getPivotalData = (config, cb) ->
  {apiToken, projectId} = config

  requestOptions =
    headers:
      'X-TrackerToken': apiToken
    qs:
      with_state: 'started'
      fields: [
        'name'
        'url'
        'story_type'
        'owners'
        'labels'
      ].join(',')
    url: "https://www.pivotaltracker.com/services/v5/projects/#{projectId}/stories"

  request requestOptions, (err, res, body) ->
    cb err, body

server = http.createServer (req, res) ->
  if req.url == '/tracker'
    res.writeHead 200, 'Content-Type': 'application/json'
    getPivotalData config, (err, data) ->
      res.end data
  else
    res.writeHead 404, 'Content-Type': 'text/plain'
    res.end 'nothing here :('
  res.writeHead 404 unless req.url == '/tracker'

server.listen 5678
console.log 'server up on 5678…'
