class PostPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user.student?
  end

  def update?
    user.super_admin? || record.user_id == user.id
  end

  def destroy?
    user.super_admin? || user.admin? || record.user_id == user.id
  end
end
