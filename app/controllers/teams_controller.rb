class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]

  # GET /teams
  def index
    if params[:search_phrase]
      @teams = Team.where('name LIKE ?', "%#{params[:search_phrase]}%")
    else
      @teams = Team.all
    end
    authorize @teams
  end

  # GET /teams/1
  def show
  end

  # GET /teams/new
  def new
    @team = authorize Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  def create
    @team = authorize Team.new(team_params)

    if @team.save
      redirect_to team_url(@team), notice: 'Team was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      redirect_to team_url(@team), notice: 'Team was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy

    redirect_to teams_url, notice: 'Team was successfully destroyed.', status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
    authorize @team
  end

  # Only allow a list of trusted parameters through.
  def team_params
    params.require(:team).permit(:name, :logo, :search_phrase)
  end
end
