class AuditLogPolicy < ApplicationPolicy

  def index?
    return true if user.present? && user.admin?
  end

  def confirm?
    record.user == user && record.pending?
  end
end