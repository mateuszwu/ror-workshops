class BetsController < ApplicationController
  def new
    @bet = Bet.new
    @round = set_round
    @match = set_match
  end

  def bet_url()

  end

  def create
    @bet= Bet.new(bet_params)

    if @bet.save
      redirect_to bet_url(@bet), notice: 'Bet was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def bet_params
    params.require(:match).permit(:home_team_score, :away_team_score, :match_id, :round_id)
  end

  def set_match
    @match = Match.find(params[:match_id])
  end

  def set_round
    @round = Round.find(params[:round_id])
  end

  def options_for_match_select
    Match.select(:match_id)
  end

  def options_for_team_select
    Team.order(:name).all.map { |team| [team.name, team.id] }
  end
end