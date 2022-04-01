class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private
  def isAdmin?
    redirect_to root_path, notice: "Odmowa dostepu" unless current_user.is_admin == true
  end

  def canShowUserDetails?
    redirect_to root_path, notice: "Odmowa dostepu do profilu uzytkownika" unless current_user.id == params[:id].to_i
  end
end
