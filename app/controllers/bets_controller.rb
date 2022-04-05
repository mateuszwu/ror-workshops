class BetsController < ApplicationController
  before_action :require_admin_role
  before_action :set_round, only: %i[new create show edit update destroy]
  before_action :set_match, only: %i[new create show edit update destroy]
  before_action :set_bet, only: %i[show edit update destroy]
  
  # GET /rounds/1/matches/new
  def new
    @bet=Bet.new
  end

  # GET /rounds/1/matches/1/edit
  def edit
    #@teams = options_for_team_select
  end

  # POST /rounds/1/matches
  def create
    @bet = @match.bets.build(bet_params)
    @bet.user_id=current_user.id
    if @bet.save
      redirect_to @round, notice: 'Match was successfully bet.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rounds/1/matches/1
  def update
    if @bet.update(bet_params)
      redirect_to @round, notice: 'Match was successfully updated.'
    else
      @teams = options_for_team_select
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /rounds/1/matches/1
  def destroy
    @bet.destroy

    redirect_to @round, notice: 'Match was successfully destroyed.', status: :see_other
  end

  private

  def options_for_team_select
    Team.order(:name).all.map { |team| [team.name, team.id] }
  end

  def set_bet
    @bet = Bet.find(params[:id])
  end
  def set_match
    @match = Match.find(params[:match_id])
  end

  def set_round
    @round = Round.find(params[:round_id])
  end
  # Only allow a list of trusted parameters through.
  def bet_params
    params.require(:bet).permit(:home_team_score,:away_team_score, :match_id, :user_id)
  end
end
