class HomeController < ApplicationController

def show 
#     @users = User.all.sort_by(&:points(Round.last)).reverse
    @round = Round.last
    @users = User.all.filter do |user|
        user.has_bets?(@round)
    end
    
    @users = @users.sort do |user1, user2|
        user2.points(@round) <=>  user1.points(@round)
    end
end

end