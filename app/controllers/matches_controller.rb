class MatchesController < ApplicationController
  before_action :set_round, only: %i[new create show edit update destroy]
  before_action :set_match, only: %i[edit update show destroy ]


  def new
    @match = Match.new
  end

  def edit

  end

  def show

  end

  def create
    @match = @round.matches.build(match_params)

    if @match.save
      redirect_to @round
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @match.update(match_params)
      redirect_to @match.round
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def set_round
    @round = Round.find(params[:round_id])
  end

  def match_params
    params.require(:match).permit(:match_date, :home_team_id, :away_team_id)
  end

end