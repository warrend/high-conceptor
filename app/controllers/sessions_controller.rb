class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create 

  def new
    if logged_in?
      redirect_to loglines_path
    end
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to loglines_path
    else
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to loglines_path
      else
        flash[:error] = "There was an error while trying to authenticate you..."
        auth_failure
      end
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  def auth_failure
    redirect_to login_path
  end

end
