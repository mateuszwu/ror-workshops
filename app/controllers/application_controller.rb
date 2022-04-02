class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def auth_admin
    redirect_to root_path, notice: "Only admin can manage teams" unless current_user&.is_admin?
  end

end
