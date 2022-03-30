class TeamsController < ApplicationController

    def index
        @teams = Team.all
    end

    def new
        @team = Team.new
    end

    def create
        @team = Team.new(team_params)
        if @team.save
            redirect_to teams_path
        else
            "duppppa"
        end

    
    end

    private
    def team_params
        params.required(:team).permit(:name)
    end



end
