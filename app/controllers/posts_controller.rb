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
  end

  def destroy
    @post = Post.find(parmas[:id])
    @post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:id, :title, :body, :user_id)
  end
end
