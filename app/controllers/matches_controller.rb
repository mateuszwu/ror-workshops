class MatchesController < ApplicationController
  before_action :set_round
  before_action :set_match , only: [ :edit, :update]
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end

  def new
    @match = @round.matches.new
  end

  def create
    @match = @round.matches.new(match_params)
    # @match = Match.new(match_params)
    if @match.save
      flash[:notice] = "Successfully created match."
      redirect_to @round
    else
      render :action => 'new'
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      flash[:notice] = "Successfully updated match."
      redirect_to @round
    else
      render :action => 'edit'
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    flash[:notice] = "Successfully destroyed match."
    redirect_to matches_url
  end

  private
  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:date)
  end

  def set_round
    @round = Round.find(params[:round_id])
  end


end
