class UsersController < ApplicationController

  before_action :authorize, only: [:index, :show]

  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @comment = Comment.new
  end

  def new
    @user = User.new
  end

  def create
    u = User.new(user_params)
    u.name = params[:user][:name]
    u.user_name = params[:user][:user_name]
    u.email = params[:user][:email].downcase
    u.password = params[:user][:password]
    u.save
    if u.save
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.email = params[:user][:email].downcase!
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_name, :email, :password)
  end
end
