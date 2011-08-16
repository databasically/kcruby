class Podcast < ActiveRecord::Base
  attr_accessible :title, :description, :link, :screenshot, :size, :duration, :date
end
