class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize

  def current_user
    @current_user ||= User.find(home[:user_id]) if home[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    redirect_to root_path unless logged_in?
  end
end
