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
    @match = @round.matches.build(match_params_new)
    if @match.save
      redirect_to @round, notice: 'Match was successfully created.'
    else
      @teams = options_for_team_select
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rounds/1/matches/1
  def update
    if is_score_set? && is_match_in_the_future?
      redirect_to @round, notice: 'Match wasn not played yet!!!'.upcase
    elsif @match.update(match_params_update)
      redirect_to @round, notice: 'Match was successfully updated.'
    else
      @teams = options_for_team_select
      render :edit, status: :unprocessable_entity
    end

    if is_score_set? 
      binding.break
      RoundSummaryJob.perform_later(@match)
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
  def match_params_new
      params.require(:match).permit(:home_team_id, :away_team_id, :match_date)
  end

  def match_params_update
    params.require(:match).permit(:home_team_id, :away_team_id, :match_date, :home_team_score, :away_team_score)
  end

  def is_score_set?
    @match.away_team_score.present? || @match.home_team_score.present?
  end

  def is_match_in_the_future?
    Date.parse(match_params_update[:match_date]) > Date.today
  end

end
