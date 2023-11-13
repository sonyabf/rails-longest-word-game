require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').to_a.sample(10).join
  end

  def score
    mots = params[:mot]
    url = "https://wagon-dictionary.herokuapp.com/#{mots}"
    response = JSON.parse(URI.open(url).read)
    mots.chars.each do |mot|
      mot.include?(params[:letters]) == true
        if response["found"]
          @answer = "Congratulations! #{mots} is a valid English word!"
        else
          @answer = "sorry but #{mots} does not seem to be a valid English word.."
        end
      end
    end
end
