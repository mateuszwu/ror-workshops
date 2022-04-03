class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]
  def index
    @rounds = Round.all
  end

  def new
    @round = authorize Round.new
  end

  def create
    @round = Round.new(round_params)
    if @round.save
      redirect_to round_url(@round), notice: "Round created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @round = Round.new(round_params)
    if @round.save
      redirect_to round_url(@round), notice: "Round updated successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @team.destroy

    redirect_to teams_url, notice: 'Team was successfully destroyed.', status: :see_other
  end

  private

  def set_round
    @round = Round.find(params[:id])
  end

  def round_params
    params.require(:round).permit(:year, :number)
  end

end
