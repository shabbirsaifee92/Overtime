class AuditLogsController < ApplicationController

  before_action :authenticate_admin!

end
