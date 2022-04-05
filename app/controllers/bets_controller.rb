class BetsController < ApplicationController
  before_action :set_round, only: %i[new create edit update]
  before_action :set_match, only: %i[new create edit update]
  before_action :set_bet, only: %i[edit update]

  def new
    @bet = Bet.new
  end

  def edit

  end

  def create
    @bet =  @match.bets.build(bet_params.merge(user_id: current_user.id))
    if @bet.save
      redirect_to @round, notice: 'Bet was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bet.update(bet_params)
      redirect_to @round, notice: 'Bet was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def set_round
    @round = Round.find(params[:round_id])
  end

  def set_bet
    @bet = Bet.find(params[:id])
  end

  def bet_params
    params.require(:bet).permit(:home_team_score, :away_team_score)
  end
end
