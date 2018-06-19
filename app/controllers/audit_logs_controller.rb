class AuditLogsController < ApplicationController

  # before_action :authenticate_admin!

  def index
    @audit_logs = AuditLog.order(:id).page params[:page]
    authorize @audit_logs
  end

end
