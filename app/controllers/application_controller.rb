class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def validate_admin
    redirect_back fallback_location: root_path unless current_user.admin?
  end

  def validate_user
    redirect_to root_path unless current_user == @user
  end
end
