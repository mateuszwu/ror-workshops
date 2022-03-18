class HomeController < ApplicationController
  def index
    @users = User.all.includes(:bets).sort_by(&:total_points).reverse
  end
end
