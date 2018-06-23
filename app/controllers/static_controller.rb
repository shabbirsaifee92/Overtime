class StaticController < ApplicationController

  def homepage
    @pending_approvals = Post.where(status: 'default')
    @recent_audit_logs = AuditLog.last(10)
  end
end