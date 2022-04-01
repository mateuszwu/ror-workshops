class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]
  before_action :check_admin

  # GET /teams
  def index
    @teams = Team.all
  end

  def index_search
    
    if params[:query].blank?
      redirect_to teams_path, notice: 'Nothing was type in.'
    else
      @teams = Team.where("lower(name) LIKE ?", "%#{params[:query]}%")
      render :index
    end
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

  def check_admin
    if !current_user.admin?
      redirect_to root_path, notice: "Nie ma masz uprawien"
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def team_params
    params.require(:team).permit(:name, :logo)
  end
end
