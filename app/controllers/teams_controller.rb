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

    def show
        @team = Team.find(params[:id])
    end

    def edit
        @team = Team.find(params[:id])

    end

    def update
        @team = Team.find(params[:id])
    
        if @team.update(team_params)
          redirect_to @team
        else
          render :edit, status: :unprocessable_entity
        end
      end

    def destroy
        @team = Team.find(params[:id])
    end

    private
    def team_params
        params.required(:team).permit(:name)
    end



end
