class HomeController < ApplicationController
    def show 
        #@users = User.order(:last_name)
        #@users = User.all.sort_by(&:points).reverse
        @pagy, rounds = pagy(Round.order(id: :desc), items: 1)
        @rounds = Round.first
        @matches = Match.all

        @users = User.all.includes(:bets).sort_by(&:total_points).reverse.filter do |user|
            user.bets.any? do |bet|
                bet.match.round == @round
            end
        end
        
    end
end
