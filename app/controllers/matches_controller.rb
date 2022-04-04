class MatchesController < ApplicationController
    before_action :set_round
    before_action :set_match, only: [:edit, :update]

    def new
        @match= @round.matches.new
    end
    def create
        @match = @round.matches.build(match_params)
    
        if @match.save
            redirect_to round_url(@round), notice: 'match was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit  
    end

    def update
        if @match.update(match_params)
          redirect_to @round, notice: 'match was successfully updated.'
        else
          render :edit, status: :unprocessable_entity
        end
      end

    private
  # Use callbacks to share common setup or constraints between actions.
  def set_round
    @round = Round.find(params[:round_id])
  end
  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:date)
  end

    
end