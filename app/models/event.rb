class Event < ActiveRecord::Base
  attr_accessible :title, :date, :time, :location, :descrition
end
