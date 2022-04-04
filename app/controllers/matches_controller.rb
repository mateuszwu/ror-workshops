class MatchesController < ApplicationController

    def new
        @match = Match.new
    end
end