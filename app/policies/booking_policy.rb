class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def create?
    return true
  end

  def edit?
    return true
  end

  def update?
    return true
  end

  private

  # def user_is_owner?
  #   user == record.user
  # end
end
