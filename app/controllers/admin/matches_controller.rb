module Admin
  class MatchesController < BaseController
    before_action :set_match, only: %i[show edit update destroy]
    before_action :set_round, only: %i[new create show edit update destroy]

    # GET /matches
    def index
      @matches = Match.all
    end

    def show
    end

    # GET /matches/new
    def new
      @match = Match.new
      @teams = Team.order(:name).all.map { |team| [team.name, team.id] }
      @rounds = Round.order(:number).all.map { |round| [round.number, round.id]}
    end

    # GET /matches/1/edit
    def edit
      @teams = Team.order(:name).all.map { |team| [team.name, team.id] }
      @rounds = Round.order(:number).all.map { |round| [round.number, round.id]}
    end

    # POST /matches
    def create
      @match = @round.matches.build(match_params)

      if @match.save
        redirect_to admin_root_path, notice: 'Match was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /matches/1
    def update
      if @match.update(match_params)
        redirect_to admin_root_path, notice: 'Match was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /matches/1
    def destroy
      @match.destroy

      redirect_to admin_root_path, notice: 'Match was successfully destroyed.', status: :see_other
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    def set_round
      @round = Round.find(params[:round_id])
    end

    # Only allow a list of trusted parameters through.
    def match_params
      params.require(:match).permit(
        :away_team_id,
        :home_team_id,
        :away_team_score,
        :home_team_score,
        :match_date,
        :round_id
      )
    end
  end
end