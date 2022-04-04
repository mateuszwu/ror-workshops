module Admin
  class TeamsController < BaseController
    before_action :set_team, only: %i[show edit update destroy]

    # GET /teams
    def index
      @teams = Team.all
    end

    # GET /teams/1
    def show
    end

    # GET /teams/new
    def new
      @team = Team.new
    end

    # GET /teams/1/edit
    def edit
    end

    # POST /teams
    def create
      @team = Team.new(team_params)

      if @team.save
        redirect_to admin_team_url(@team), notice: 'Team was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /teams/1
    def update
      if @team.update(team_params)
        redirect_to admin_team_url(@team), notice: 'Team was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /teams/1
    def destroy
      @team.destroy

      redirect_to admin_teams_url, notice: 'Team was successfully destroyed.', status: :see_other
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, :avatar)
    end
  end
end