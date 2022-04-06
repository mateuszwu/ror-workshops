class HomeController < ApplicationController


def show 
    @users = User.all.sort_by(&:points).reverse
end

end