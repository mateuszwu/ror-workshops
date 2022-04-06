class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pagy::Backend

  private

  def require_admin_role
    redirect_to root_path, notice: 'Only admins can manage teams' unless current_user.is_admin?
  end
end
