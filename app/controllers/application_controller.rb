class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @bets = Bet.where(user_id: current_user.id)
  end
  protected
  def configure_permitted_parameters
    attributes = [:email, :password, :first_name, :last_name, :avatar]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end