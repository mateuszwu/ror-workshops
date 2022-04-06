include Pagy::Frontend

class HomeController < ApplicationController

def show 

    @pagy, (@round,) = pagy(Round.all, items: 1)
    @users = User.all.filter do |user|
        user.has_bets?(@round)
    end
    
    @users = @users.sort do |user1, user2|
        user2.points(@round) <=>  user1.points(@round)
    end
end

end