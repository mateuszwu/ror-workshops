class BetsController < ApplicationController
    before_action :set_match
    before_action :set_round
    before_action :set_bet, only: %i[edit update]

    
    def new
        @bet = Bet.new
        
    end

    def create
        @bet =  @match.bets.build(bet_params.merge(user_id: current_user.id))
        if @bet.save
          redirect_to @round, notice: 'Bet was successfully created.'
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        
    end
    
  
      # PATCH/PUT /rounds/1/matches/1
    def update
        if @bet.update(bet_params.merge(user_id: current_user.id))
            redirect_to @round, notice: 'Bet was successfully updated.'
        else
            render :edit, status: :unprocessable_entity
        end
    end



    private

    def options_for_team_select
      Team.order(:name).all.map { |team| [team.name, team.id] }
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:match_id])
    end
  
    def set_round
       @round = Round.find(params[:round_id])
    end
    def set_bet
        @bet = Bet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bet_params
      params.require(:bet).permit(:home_team_score, :away_team_score, :match_id)
    end

end
