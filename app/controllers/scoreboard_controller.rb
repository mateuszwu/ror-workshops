class ScoreboardController < ApplicationController
  def index
    @users = User.all
    @rounds = Round.all
  end
end