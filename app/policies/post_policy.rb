class PostPolicy < ApplicationPolicy

  def update?
    return true if record.approved? && user.admin?

    (record.user == user || user.admin?) && record.default?
  end

  def show?
    record.user == user || user.admin?
  end


  def approve?
    user.admin?
  end

  def submit?
    (record.user == user || user.admin?) && record.default?
  end
end