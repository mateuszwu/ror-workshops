class MatchesController < ApplicationController
  before_action :set_round
  before_action :set_match, only: [:edit, :update]
  def new
    @match = @round.matches.new
  end

  def edit
  end

  def update
    if @match.update(match_params)
      redirect_to round_path(@round), notice: 'Match was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    #@match = @round.matches.new(match_params)
    @match = @round.matches.build(match_params)
    if @match.save
      redirect_to round_url(@round), notice: 'Match was successfully created.'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
  def set_round
    @round = Round.find(params[:round_id])
  end

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:id,:match_date,:home_team_id,:away_team_id)
  end
end
