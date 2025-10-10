class UserPolicy < ApplicationPolicy
 class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin? || user.super_admin?
        scope.all  # Admins see all users
      else
        scope.where(id: user.id)  # Students only see themselves
      end
    end
  end

  def show?
    record.id == user.id || user.admin? || user.super_admin?
  end

  def create?
    true
  end

  def update?
    user.super_admin? || record.id == user.id
  end

  def destroy?
    user.super_admin? || user.admin? || record.id == user.id
  end
end
