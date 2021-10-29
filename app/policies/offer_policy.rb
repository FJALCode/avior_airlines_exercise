class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def index?
    return true
  end

  def edit?
    user.admin
  end

  def update?
    user.admin
  end

  def destroy?
    return true
  end
end
