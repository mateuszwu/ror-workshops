class MatchesController < ApplicationController
  before_action :set_match, only: %i[show edit update destroy]
  before_action :set_round, only: %i[new create show edit update destroy]

  # GET /matches
  def index
    @matches = Match.all
  end

  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_match
    @match = Match.find(params[:id])
  end

  def set_round
    @round = Round.find(params[:round_id])
  end

  # Only allow a list of trusted parameters through.
  def match_params
    params.require(:match).permit(
      :away_team_id,
      :home_team_id,
      :away_team_score,
      :home_team_score,
      :match_date,
      :round_id
    )
  end
end