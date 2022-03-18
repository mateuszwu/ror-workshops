class BetsController < ApplicationController
  before_action :set_round, only: %i[new create edit update]
  before_action :set_match, only: %i[new create edit update]
  before_action :set_bet, only: %i[edit update]

  # GET /rounds/1/matches/1/bets/new
  def new
    @bet = Bet.new
  end

  # GET /rounds/1/matches/1/bets/1/edit
  def edit
  end

  # POST /rounds/1/matches/1/bets
  def create
    @bet = @match.bets.build(bet_params.merge(user_id: current_user.id))

    if @bet.save
      redirect_to round_path(@round), notice: 'Bet was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rounds/1/matches/1/bets/1
  def update
    if @bet.update(bet_params)
      redirect_to round_path(@round), notice: 'Bet was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_bet
    @bet = Bet.find(params[:id])
  end

  def set_round
    @round = Round.find(params[:round_id])
  end

  def set_match
    @match = Match.find(params[:match_id])
  end

  # Only allow a list of trusted parameters through.
  def bet_params
    params.require(:bet).permit(:home_team_score, :away_team_score)
  end
end
