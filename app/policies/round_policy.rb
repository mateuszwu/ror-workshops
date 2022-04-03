class RoundPolicy < ApplicationPolicy
  def update?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def create?
    user.admin?
  end

  def new?
    user.admin?
  end

end