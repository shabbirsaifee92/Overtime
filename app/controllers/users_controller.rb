class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = Employee.where.not(id: current_user.id)
  end

  def follow
    new_followed_user = Employee.find(params[:id])
    if current_user.follow!(new_followed_user)
      redirect_to root_path, notice: "You are now following #{new_followed_user.full_name}"
    else
      render :index, error: "Unable to add the follower. Please try later"
    end
  end

  def following; end

  def followers; end
end