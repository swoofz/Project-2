class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    u = @post.user.id
    if @post.save
      redirect_to user_path(u)
    else
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    u = @post.user.id
    if @post.update_attributes(post_params)
      redirect_to user_path(u)
    else
      redirect_to edit_post_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :back
  end

  private
  def post_params
    params.require(:post).permit(:id, :title, :body, :user_id)
  end
end
