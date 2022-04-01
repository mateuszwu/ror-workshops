class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  def admin?
<<<<<<< HEAD
    current_user&.isAdmin
=======
    current_user.isAdmin
>>>>>>> a8fa942faab6c209fbcc3efe27da1a29f299072e
  end

end
