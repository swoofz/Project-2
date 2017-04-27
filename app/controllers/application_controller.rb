class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize, :user_allowed

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    redirect_to new_home_path unless logged_in?
  end

  def user_allowed
    logged_in? && (current_user.id == @comment.user_id) || (current_user.id == @post.user_id) || (current_user.id == @user.id)
  end
end
