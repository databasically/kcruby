class SessionsController < ApplicationController
  def create
    render :text => request.env["omniauth.auth"]
    # @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    # session[:user_id] = @user.id
    # redirect_to :root, :notice => "Logged in as #{@user.name}"
  end
end
