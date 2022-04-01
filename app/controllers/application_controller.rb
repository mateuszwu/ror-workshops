class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  private
  def is_admin?
    if current_user&.admin == false
      flash[:notice] = "You are not allowed to access this page"
      redirect_to root_path
    end
  end

  def autorize_myself?

    if current_user&.id != params[:id].to_i

      flash[:notice] = "You are not allowed to access this page"
      redirect_to user_path(current_user)
    end
  end

end