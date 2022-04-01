class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private
  def is_admin?
    unless current_user.is_admin
      redirect_back(fallback_location: root_path)
    end
  end
end
