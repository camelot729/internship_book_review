class BookRatingPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def update?
    user.id == record.user_id
  end

  def destroy?
    user.id == record.user_id
  end
end
