class MatchesController < ApplicationController
  before_action :set_round
  before_action :set_match, only: [ :edit, :update]
  def new
    @match = @round.matches.new
  end

  def create
    @match = @round.matches.build(match_params)
    if @match.save
      redirect_to round_url(@round)
    else
      render :new
    end
  end

  def  set_round
    @round = Round.find(params[:round_id])
  end


  def update
    if @match.update(match_params)
      redirect_to round_url(@match), notice: 'Match was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def show
    @match = Match.find(params[:id])
  end

  def edit
  end

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:date, :id, :team_away_id, :team_home_id)
  end
end