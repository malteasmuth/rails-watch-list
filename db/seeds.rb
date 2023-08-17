# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

url = "http://tmdb.lewagon.com/movie/top_rated?"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

Movie.destroy_all

movies["results"].each do | movie |

  poster_url = movie["poster_path"]

  new_movie = Movie.new(
    title: movie["original_title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{poster_url}"
  )
  new_movie.save
end
