class Project < ActiveRecord::Base
  attr_accessible :title, :description, :user_id, :timestamp, :created
end
