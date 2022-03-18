class RoundsController < ApplicationController
  before_action :require_admin_role
  before_action :set_round, only: %i[show edit update destroy]

  # GET /rounds
  def index
    @rounds = Round.all
  end

  # GET /rounds/1
  def show
    @matches = @round.matches.includes(:home_team, :away_team)
  end

  # GET /rounds/new
  def new
    @round = Round.new
  end

  # GET /rounds/1/edit
  def edit
  end

  # POST /rounds
  def create
    @round = Round.new(round_params)

    if @round.save
      redirect_to round_url(@round), notice: 'Round was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rounds/1
  def update
    if @round.update(round_params)
      redirect_to round_url(@round), notice: 'Round was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /rounds/1
  def destroy
    @round.destroy

    redirect_to rounds_url, notice: 'Round was successfully destroyed.', status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_round
    @round = Round.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def round_params
    params.require(:round).permit(:year, :number)
  end
end
