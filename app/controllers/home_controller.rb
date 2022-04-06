class HomeController < ApplicationController
  def show
    @users = User.all.sort_by(&:points).reverse
    # @rounds = Round.all
    @pagy, @rounds = pagy(Round.all)
  end
end
