class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :authenticate

  private

  def authenticate
    current_user&.isAdmin? ? '' : (redirect_to root_path)
  end

end
