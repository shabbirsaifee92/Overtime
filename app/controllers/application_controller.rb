class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_unauthorized

  private

  def user_unauthorized
    flash[:error] = 'Unauthorized attempt'
    redirect_to root_path
  end
end
