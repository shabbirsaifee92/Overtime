class PostPolicy < ApplicationPolicy

  def update?
    record.user == user || user.admin?
  end

  def show?
    record.user == user || user.admin?
  end

end