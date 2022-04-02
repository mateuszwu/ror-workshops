class PlayersController < ApplicationController
  before_action :set_team
  before_action :set_player, only: %i[show edit update destroy]
  before_action :user_is_admin, only: %i[new create edit update destroy]

  # GET /players
  def index
    @players = @team.players
  end

  # GET /players/1
  def show
  end

  # GET /players/new
  def new
    @player = @team.players.build
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  def create
    @player = @team.players.build(player_params)

    if @player.save
      redirect_to (@player.team), notice: 'Player was successfully created.'
    else
      render action: 'edit'
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      redirect_to (@player.team), notice: 'Player was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy

    redirect_to @team, notice: 'Player was successfully destroyed.', status: :see_other
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def user_is_admin
    redirect_to root_path, notice: "Only Admin" unless current_user.admin_profile?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = @team.players.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def player_params
    params.require(:player).permit(:player_name, :player_date_of_birth, :team_id, :photo)
  end
end