class HomeController < ApplicationController
  include Pagy::Backend
  def show
    @user = User.all


    @pagy, @rounds = pagy(Round.order(created_at: :desc), items: 1)
    @round = @rounds.first


  end



end
