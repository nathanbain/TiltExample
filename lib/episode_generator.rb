require 'erb'
require 'tilt'
require 'json'

class EpisodeGenerator
  template = Tilt.new('templates/episodes.erb')

  episodes = '[{"id":"1","name":"Episode 1","length":"1h 02m"},{"id":"2","name":"Episode 2","length":"1h 03m"},{"id":"3","name":"Episode 3","length":"1h 04m"}]'

  ratings = '[{"id":"1","rating":"3/5"},{"id":"2","rating":"4/5"},{"id":"3","rating":"5/5"}]'

  json_episodes = JSON.parse(episodes)
  json_ratings = JSON.parse(ratings)
  episodes_with_ratings = []

  json_episodes.each do |e|
    rating = json_ratings.select { |r| r["id"] == e["id"]}
    item = Hash["id", e["id"], "name", e["name"], "length", e["length"], "rating", rating[0]["rating"]]
    episodes_with_ratings << item
  end

  output = template.render(Object.new, episodes:episodes_with_ratings)
  puts output
end