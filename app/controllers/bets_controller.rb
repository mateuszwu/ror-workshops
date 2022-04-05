class BetsController < ApplicationController
  before_action :set_match
  before_action :set_round


  def new
    @bet = Bet.new
  end

  def create
    @bet = @match.bets.build(bet_params)
    @bet.user_id = current_user.id
    if @bet.save
      redirect_to @round, notice: 'Bet was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end



  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def set_round
    @round = Round.find(params[:round_id])
  end

  def set_user
    @user = current_user
  end

  def set_bet
    @bet = Bet.find(params[])
  end

  def bet_params
    params.require(:bet).permit(:home_team_score, :away_team_score, :match_id)
  end
end