module Admin
  class RoundsController < BaseController
    before_action :set_round, only: %i[show edit update destroy round_summary]

    # GET /teams
    def index
      @rounds = Round.all
    end

    def round_summary
      RoundSummaryJob.perform(@round)
    end

    # GET /teams/1
    def show
    end

    # GET /teams/new
    def new
      @round = Round.new
    end

    # GET /teams/1/edit
    def edit
    end

    # POST /teams
    def create
      @round = Round.new(round_params)

      if @round.save
        redirect_to admin_round_url(@round), notice: 'Round was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /teams/1
    def update
      if @round.update(round_params)
        redirect_to admin_round_url(@round), notice: 'Round was successfully updated.'
        @round.round_summary
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /teams/1
    def destroy
      @round.destroy

      redirect_to admin_rounds_url, notice: 'Round was successfully destroyed.', status: :see_other
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def round_params
      params.require(:round).permit(:year, :number)
    end
  end
end