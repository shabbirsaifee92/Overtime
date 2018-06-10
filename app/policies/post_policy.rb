class PostPolicy < ApplicationPolicy

  def update?
    record.user == user || user.admin?
  end
end