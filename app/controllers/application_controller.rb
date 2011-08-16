class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :next_event
  
  
  
private
  def next_event
    @next_event = Event.first :conditions => ["date >= ?",Date.today], :order => "date"
  end
end