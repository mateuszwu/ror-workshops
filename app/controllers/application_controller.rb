class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private



  protected

  def is_correct_user?
    unless current_user.id == params[:id].to_i
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def is_admin?
    unless current_user.is_admin
      redirect_back(fallback_location: root_path)
    end
  end

  def ensure_user_is_admin
    unless current_user.admin?
      redirect_back(fallback_location: root_path)
    end
  end
  def user_not_authorized
    redirect_back(fallback_location: root_path , notice: 'You cannot be here!')
  end
end

