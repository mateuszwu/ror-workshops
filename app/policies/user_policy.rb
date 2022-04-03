class UserPolicy < ApplicationPolicy
  def edit?
    user == signed_user
  end

  def show?
    user == signed_user
  end

  def update?
    user == signed_user
  end

  private

  def signed_user
    record
  end
end