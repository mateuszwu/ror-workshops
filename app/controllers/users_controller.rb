class UserController < ApplicationController
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_sign_in_path
  end
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name, :age)
  end
end
