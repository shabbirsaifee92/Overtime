class PostPolicy < ApplicationPolicy

  def update?
    return true if user.admin?

    record.user == user && record.default?
  end

  def show?
    user.admin? || record.user == user
  end

  def edit?
    return true if user.admin?

    record.user == user && record.default?
  end

  def approve?
    user.admin?
  end

  def submit?
    (record.user == user || user.admin?) && record.default?
  end
end