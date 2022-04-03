class RoundsController < ApplicationController
  before_action :set_round, only: %i[edit update destroy]
  # before_action :is_admin?, except: %i[index show]
  #before_action :ensure_user_is_admin, except: %i[index show]


  def index
    @rounds = Round.all
  end

  def show
    @round = Round.find(params[:id])
  end

  def new
    @round = Round.new
    authorize @round
  end

  def create
    if Round.where(number: round_params[:number].to_i, year: round_params[:year].to_i).count == 0
      @round = Round.new(round_params)
      authorize @round

      if @round.save
        redirect_to rounds_path, notice: "Round was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_back(fallback_location: root_path , notice: 'Round was not created.')
    end
  end

  def edit
    @round = Round.find(params[:id])
    authorize @round
  end

  def update
    if Round.where(number: round_params[:number].to_i, year: round_params[:year].to_i).count == 0 && @round.update(round_params)
      redirect_to rounds_path, notice: 'Round was successfully updated.'
    else
      redirect_back(fallback_location: root_path , notice: 'Round was not updated.')
    end
  end

  def destroy
    @round = Round.find(params[:id])
    authorize @round
    @round.destroy
    redirect_to rounds_url
  end
  private

  def round_params
    params.require(:round).permit(:number, :year)
  end

  def set_round
    @round = Round.find(params[:id])
  end

end