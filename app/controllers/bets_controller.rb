class BetsController < ApplicationController
  before_action :set_round, only: %i[show edit update destroy new create]
  before_action :set_match, only: %i[show edit update destroy new create]
  def index
    @bets = Bet.all
  end

  def show
    @bet = Bet.find(params[:id])
  end

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_params)
     @bet.user_id=current_user.id
    @bet.match_id=@match.id
    if @bet.save
      flash[:notice] = "Successfully created bet."
      redirect_to @round
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bet = Bet.find(params[:id])
  end

  def update
    @bet = Bet.find(params[:id])
    if @bet.update_attributes(params[:bet])
      flash[:notice] = "Successfully updated bet."
      redirect_to @bet
    else
      render :action => 'edit'
    end
  end

  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
    flash[:notice] = "Successfully destroyed bet."
    redirect_to bets_url
  end

  private
  def bet_params
    params.require(:bet).permit(:away_team_score, :home_team_score)
  end
  def set_bet
    @bet = Bet.find(params[:id])
  end

  def set_round
    @round = Round.find(params[:round_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_match
    @match = Match.find(params[:match_id])
  end

end
