class Event < ActiveRecord::Base
  attr_accessible :name, :meetup_id, :description, :time, :venue_name, :venue_address1, :venue_address2, :venue_city, :venue_city, :venue_state, :venue_zip, :venue_map
  
  def self.next
    #@next_event = Event.first :conditions => ["date >= ?",Date.today], :order => "date"
    Event.first(:conditions => ["time >= ?",Time.now], :order => "time") || Event.last(:order => "time")
  end
end
