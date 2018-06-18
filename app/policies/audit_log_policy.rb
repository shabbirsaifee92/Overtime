class AuditLogPolicy < ApplicationPolicy

  def index?
    return true if user.present? && user.admin?
  end
end