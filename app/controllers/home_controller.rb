class HomeController < ApplicationController
  def show
    @pagy, rounds=pagy(Round.all, items:1)
    @users=User.all.sort_by(&:points).reverse
    # @rounds=Round.all
    @round=rounds.first
    @teams=Team.all

    @users_tab= User.joins(bets: { match: :round }).distinct.where(bets:{matches: {rounds: params[:page].to_i}})

  end
  private
  def home_params
    params.require(:match).permit(:home_team_id, :away_team_id, :match_date, :home_team_score, :away_team_score)

  end
end
