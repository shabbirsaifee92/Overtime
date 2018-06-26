class AuditLogsController < ApplicationController

  # before_action :authenticate_admin!
  before_action :find_audit_log, only: [:confirm]
  def index
    @audit_logs = AuditLog.order(:id).page params[:page]
    authorize @audit_logs
  end

  def confirm
    authorize @audit_log
    if @audit_log.confirmed!
      redirect_to root_path, notice: 'Confirmation done'
    else
      redirect_to root_path, error: 'Something went wrong.'
    end
  end
  private

  def find_audit_log
    @audit_log = AuditLog.find(params[:audit_log_id])
  end
end
