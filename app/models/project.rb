class Project < ActiveRecord::Base
  attr_accessible :title, :description, :member_id, :timestamp, :created
  
   # validates_presence_of :title => true
   belongs_to :member

end
