require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    alphabets = Array('A'..'Z')
    @letters = alphabets.sample(10)
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    user_serialized = open(url).read
    user = JSON.parse(user_serialized)
    @letters = params[:letters].split(" ") # array
    @found = user["found"]
    @word = params[:word]
    @included = @word.upcase.chars.all? { |letter| @letters.include?(letter) }
  end
end
