class HomeController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:alert] = "Incorrect login or password 😢"
      redirect_to new_home_path
    end
  end

  def destory
    session[:user_id] = nil
    redirect_to root_path
  end
end
