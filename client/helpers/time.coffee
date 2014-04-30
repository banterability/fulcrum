SECOND = 1000
MINUTE = SECOND * 60
HOUR = MINUTE * 60
DAY = HOUR * 24

timeBetween = (originDate, relativeDate) ->
  Math.abs(relativeDate - originDate)

timeBetweenInWords = (originDate, relativeDate) ->
  diff = timeBetween relativeDate, originDate

  if diff > DAY
    difference = Math.floor(diff / DAY)
    numString = "About #{difference} day#{if difference != 1 then 's' else ''}"
  else if diff > HOUR
    difference = Math.floor(diff / HOUR)
    numString = "About #{difference} hour#{if difference != 1 then 's' else ''}"
  else if diff > MINUTE
    difference = Math.floor(diff / MINUTE)
    numString = "#{difference} minute#{if difference != 1 then 's' else ''}"
  else
    numString = 'less than a minute'

  if relativeDate > originDate
    "in #{numString}"
  else
    "#{numString} ago"

module.exports = {timeBetween, timeBetweenInWords}
