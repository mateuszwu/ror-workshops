class MatchesController < ApplicationController
  before_action :require_admin_role
  before_action :set_round, only: %i[new create show edit update destroy]
  before_action :set_match, only: %i[show edit update destroy]

  # GET /rounds/1/matches/new
  def new
    @match = Match.new
    @teams = options_for_team_select
  end

  # GET /rounds/1/matches/1/edit
  def edit
    @teams = options_for_team_select
  end

  # POST /rounds/1/matches
  def create
    @match = @round.matches.build(match_params)

    if @match.save
      redirect_to @round, notice: 'Match was successfully created.'
    else
      @teams = options_for_team_select
      render :new, status: :unprocessable_entity
    end
  end

  def match_finished?
    #@match.match_date > Date.today moe? :>
  end

  def updating_score?
    (params[:home_team_score].present? || params[:away_team_score].present?)
  end

  # PATCH/PUT /rounds/ 1/matches/1
  def update
    if match_finished? && updating_score? && !current_user.is_admin?
      redirect_to @round, notice: 'You dont have access'
    elsif
    @match.update(match_params)
      redirect_to @round, notice: 'Match was successfully updated.'
      @teams = options_for_team_select

    end
  end

  # DELETE /rounds/1/matches/1
  def destroy
    @match.destroy

    redirect_to @round, notice: 'Match was successfully destroyed.', status: :see_other
  end

  private

  def options_for_team_select
    Team.order(:name).all.map { |team| [team.name, team.id] }
  end

  def set_round
    @round = Round.find(params[:round_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_match
    @match = Match.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def match_params
    params.require(:match).permit(:home_team_id, :away_team_id, :match_date, :home_team_score, :away_team_score)
  end
end
