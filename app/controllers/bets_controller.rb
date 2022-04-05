class BetsController < ApplicationController
before_action :set_match_and_round, only: %i[show edit update destroy new create]

def new
    @bet = Bet.new
end

def create
    # binding.break
    @bet = @match.bets.build(bet_params)
    @bet.user_id = current_user.id
    if @bet.save
        redirect_to @round, notice: 'Bet was successfully created.'
    else
        
        render :new, status: :unprocessable_entity
    end
end

private
def set_match_and_round
    @match = Match.find(params[:match_id])
    @round = Round.find(params[:round_id])
end

def bet_params
    params.require(:bet).permit(:home_team_score, :away_team_score, :match_id)
  end

end
