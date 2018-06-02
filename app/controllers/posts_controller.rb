class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show]

  def index
    # @posts = Post.find_by(user: current_user)
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: 'New post created successfully'
    else
      flash[:error] = 'Cannot create new post!!'
      render :new
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
