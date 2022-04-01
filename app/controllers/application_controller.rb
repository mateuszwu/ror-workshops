class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  def admin?
    current_user.isAdmin
  end

end
