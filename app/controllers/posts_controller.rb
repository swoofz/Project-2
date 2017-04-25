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
    # u = User.find(params[:id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path
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
