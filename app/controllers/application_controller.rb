class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user 
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] != nil
  end

  helper_method :current_user

  def logged_in?
  	!!current_user
  end

  def authorize!
  	redirect_to login_path unless logged_in?
  end
end
