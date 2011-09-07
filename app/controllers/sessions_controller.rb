class SessionsController < ApplicationController
  def create
    # render :text => request.env["omniauth.auth"]
    begin
      # omniauth['extra']['user_hash']['id'] ?  uid =  omniauth['extra']['user_hash']['id'].to_s : uid = ''
      @member = Member.find_or_create_by_auth(request.env["omniauth.auth"])
      session[:member_id] = @member.id
    rescue Exception => ex
      logger.warn "Session#create exception: #{ex.inspect}"
    end
    
    if @member.incomplete_profile?
      redirect_to edit_member_path(@member), :notice => "Please complete profile"
    else      
      redirect_to root_path, :notice => "Logged in as #{@member.name}"
    end
  end
  
  def destroy
    session[:member_id] = nil
    redirect_to root_path, :notice => "Logged out"
  end
  
  def fail
    session[:member_id] = nil
    redirect_to root_path, :notice => "Login Failure"
  end
  
  
end
