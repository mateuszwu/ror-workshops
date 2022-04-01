class RoundsController < ApplicationController
  before_action :set_round, only: %i[show edit update destroy]
  before_action :user_is_admin

  # GET /teams
  def index
      @rounds = Round.all
  end

  # GET /teeams/1
  def show
  end

  # GET /teams/new
  def new
    @round = Round.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  def create
    @round = Round.new(team_params)

    if @round.save
      redirect_to team_url(@round), notice: 'Round was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  def update
    if @round.update(team_params)
      redirect_to team_url(@round), notice: 'Round was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @round.destroy

    redirect_to rounds_url, notice: 'Round was successfully destroyed.', status: :see_other
  end

  private

  def user_is_admin
    redirect_to root_path, notice: "Only Admin" unless current_user.admin_profile?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @round = Round.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def team_params
    params.require(:round).permit(:year, :number)
  end
end
