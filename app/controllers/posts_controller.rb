class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :edit, :update, :destroy, :approve, :submit]


  def index
    # @posts = Post.find_by(user: current_user)
    @posts = Post.posts_by(current_user).page params[:page]
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
      render :new
    end
  end

  def show
    authorize @post
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: 'New post updated successfully'
    else
      render :edit
    end
  end

  def submit
    authorize @post
    if @post.submitted!
      @post.update_audit_log
      redirect_to root_path, notice: 'Post submitted successfully'
    else
      render :show, notice: 'Something went wrong'
    end
  end

  def approve
    authorize @post
    @post.approved!
    redirect_to root_path, notice: 'Post is approved'
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: 'You post is deleted'
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale, :status, :hours)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
