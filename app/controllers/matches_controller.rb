class MatchesController < ApplicationController
    before_action :set_round
    before_action :set_match, only: %i[show edit update destroy]

    def new
        @match = @round.matches.new
    end

    def show
        @matches = @round.matches
    end

    def edit
    end

    def create
        @match = @round.matches.build(match_params)

        if @match.save
        redirect_to round_url(@round), notice: 'Round was successfully created.'
        else
        render :new, status: :unprocessable_entity
        end
    end
    private

    def match_params
        params.require(:match).permit(:date)
    end

    def set_match
        @match = Match.find(params[:id])
      end

    def set_round
        @round = Round.find(params[:round_id])
      end
end