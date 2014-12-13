class MovieSearchController < ApplicationController

  def results
    raw_data = RestClient.get "http://www.omdbapi.com/?s=#{(params[:movie_title]).gsub(" ", "+")}"
    @search_hash = JSON.parse(raw_data.body)
  end

  def title
    raw_data = RestClient.get "http://www.omdbapi.com/?i=#{(params[:imdbID])}"
    @movie_hash = JSON.parse(raw_data.body)
  end
end
