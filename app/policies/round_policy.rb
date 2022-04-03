class RoundPolicy < ApplicationPolicy
  def new?
    user.admin?
  end

end