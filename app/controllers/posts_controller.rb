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
    u = User.find params[:post][:user_id]
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path(u.id)
    else
      redirect_to new_post_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:id, :title, :body, :user_id)
  end
end
