class RoundsController < ApplicationController
    before_action :set_round, only: %i[show edit update destroy]
  

    def index
        @rounds = Round.all
    end

    def show
    end
    
    def edit
    end

    def new
        @round = Round.new
    end

    def create
        @round = Round.new(round_params)

        if @round.save
        redirect_to round_url(@round), notice: 'Round was successfully created.'
        else
        render :new, status: :unprocessable_entity
        end
    end

    def update
        if @round.update(round_params)
          redirect_to round_url(@round), notice: 'Team was successfully updated.'
        else
          render :edit, status: :unprocessable_entity
        end
      end
    
      def destroy
        @round.destroy
    
        redirect_to rounds_url, notice: 'Round was successfully destroyed.', status: :see_other
      end

    

    private

    def round_params
        params.require(:round).permit(:year, :number)
    end

    def set_round
        @round = Round.find(params[:id])
      end
end