class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_member, :require_login
  
  protected
  
  def require_login
    if !current_member
      respond_to do |format|
        format.html {
          redirect_to login_path
        }
        format.json {
          render :json => { 'error' => 'Access Denied' }.to_json
        }
      end
    end
  end
  
  def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end

end