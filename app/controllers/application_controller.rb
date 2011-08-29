class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_member
  
  private
    def current_member
      @current_member ||= Member.find(session[:member_id]) if session[:member_id]
    end

end