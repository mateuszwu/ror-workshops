class BetsController < ApplicationController
    before_action :set_bet, only: %i[show edit update destroy]
    before_action :set_round, only: %i[new create show edit update destroy]
    before_action :set_match, only: %i[new create show edit update destroy]

    # GET /bets/new
    def new
      @bet = Bet.new
    end

    # GET /bets/1/edit
    def edit
    end

    # POST /bets
    def create
      @bet = @match.bets.build(bet_params.merge(user_id: current_user.id))

      if @bet.save
        redirect_to rounds_path, notice: 'Bet was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
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
      params.require(:bet).permit(
        :match_id,
        :user_id,
        :home_team_score,
        :away_team_score,
        :points
      )
    end
  end