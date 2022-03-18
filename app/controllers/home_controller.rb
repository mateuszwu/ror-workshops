class HomeController < ApplicationController
  def show
    @users = User.all.includes(:bets).sort_by(&:total_points).reverse
  end
end
