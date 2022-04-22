class ScoreboardController < ApplicationController
  def index
    @users = User.all
  end
end