class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :actualluser

  # GET /users/1
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:avatar, :first_name, :last_name)
  end

  def actualluser
    redirect_to root_path, notice:"Brak dostepu do innego konta" unless current_user == @user
  end
end
