class HomeController < ApplicationController
    def show 
        #@users = User.order(:last_name)
        @users = User.all.sort_by(&:points).reverse
        @rounds = Round.all
        @matches = Match.all
    end
end
