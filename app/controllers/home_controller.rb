class HomeController < ApplicationController
  include Pagy::Backend
  def show
    @sorted_rounds = Round.order("year DESC, number DESC")
    @pagy, @records = pagy(@sorted_rounds)
    @round = @records.first
    @matches = @round.matches
    @users = @round.users.distinct
  end
end
