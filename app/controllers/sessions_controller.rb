class SessionsController < ApplicationController
  def create
    # render :text => request.env["omniauth.auth"]
    @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    @user.login_count = 1
    redirect_to root_path, :notice => "Logged in as #{@user.name}"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out"
  end
end
