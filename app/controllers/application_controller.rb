class ApplicationController < ActionController::Base
  before_action :authenticate_user!

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
  end

