class HomeController < ApplicationController
  def show
    @users = User.all.includes(:bets).sort_by(&:total_points).reverse
    @pagy, (@round,) = pagy(Round.order(id: :desc), items: 1)
  end
end
