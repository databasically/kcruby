class SessionsController < ApplicationController
  def create
    # render :text => request.env["omniauth.auth"]
    @member = Member.find_or_create_by_auth(request.env["omniauth.auth"])
    session[:member_id] = @member.id
    @member.login_count = 1
    redirect_to root_path, :notice => "Logged in as #{@member.name}"
  end
  
  def destroy
    session[:member_id] = nil
    redirect_to root_path, :notice => "Logged out"
  end
end
