class RoundsController < ApplicationController
  before_action :set_round, only: %i[show edit update destroy]

  # GET /teams
  def index
    @rounds = Round.all
  end

  # GET /teams/1
  def show
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