class LikePolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def new?
    create?
  end

  def destroy?
    create?
  end

end
