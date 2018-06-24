class StaticController < ApplicationController

  before_action :authenticate_user!
  def homepage
    if current_user.admin?
      @pending_approvals = Post.where(status: 'submitted')
      @recent_audit_logs = AuditLog.last(10)
    else
      @unsubmitted_posts = Post.posts_by(current_user).where(status: 'default')
      @pending_audit_confirmations = current_user.audit_logs
    end

  end
end