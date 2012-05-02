require 'kconv'

class Event < ActiveRecord::Base
  attr_accessible :name, :event_url, :description, :time, :venue_name, :venue_address1, :venue_address2, :venue_city, :venue_state, :venue_zip, :venue_map
  
  # validates_presence_of :name, :event_url, :time => true
  
  def self.next
    Event.first(:conditions => ["time >= ?",Time.now], :order => "time")
  end
  
  def self.get_meetup
    u = URI.parse("http://api.meetup.com/events.json/?group_urlname=kcruby&amp;key=38a2a70114e565b3c155d919384a12")
    response = Net::HTTP.get(u)
    JSON.parse(response)["results"].each do |ev|
      # raise ev.inspect
      Event.find_or_create_by_id(ev["id"]).update_attributes(
        :id             => ev["id"],
        :name           => ev["name"],
        :time           => ev["time"],
        :venue_name     => ev["venue_name"],
        :description    => ev["description"].toutf8,
        :venue_address1 => ev["venue_address1"],
        :venue_address2 => ev["venue_address2"],
        :venue_city     => ev["venue_city"],
        :venue_state    => ev["venue_state"],
        :venue_zip      => ev["venue_zip"],
        :venue_map      => ev["venue_map"],
        :event_url      => ev["event_url"]
        )  
    
    end
    
  end
end
