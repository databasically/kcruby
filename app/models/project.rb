class Project < ActiveRecord::Base
  attr_accessible :title, :description, :member_id, :timestamp, :created

  # belongs_to :member
  # 
  # validates :title => true

end
