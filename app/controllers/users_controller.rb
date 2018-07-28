class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = Employee.where.not(id: current_user.id)
  end

  def follow
    new_following = Employee.find(params[:id])
    new_follower = UserFollower.new(user: new_following, follower: current_user)
    if new_follower.save
      redirect_to root_path, notice: "You are now following #{new_following.full_name}"
    else
      render :index, error: "Unable to add the follower. Please try later"
    end
  end
end