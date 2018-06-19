class AuditLogsController < ApplicationController

  # before_action :authenticate_admin!

  def index
    @audit_logs = AuditLog.all
    authorize @audit_logs
  end

end
