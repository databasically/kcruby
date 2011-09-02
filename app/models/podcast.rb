class Podcast < ActiveRecord::Base
  attr_accessible :title, :description, :video_url, :thumbnail_medium, :thumbnail_large, :duration, :size, :upload_date, :width, :height, :private_video

  # validates_presence_of :upload_date, :video_url

  def self.get_videos
    u = URI.parse("http://vimeo.com/api/v2/wesgarrison/videos.json")
    response = Net::HTTP.get(u)
    JSON.parse(response).each do |pc|
        Podcast.find_or_create_by_id(pc["id"]).update_attributes(
          :id               => pc["id"],             
          :title            => pc["title"],         
          :description      => pc["description"],
          :video_url        => pc["url"],      
          :thumbnail_medium => pc["thumbnail_medium"],
          :thumbnail_large  => pc["thumbnail_large"],
          :upload_date      => pc["upload_date"],
          :duration         => pc["duration"],    
          :width            => pc["width"],
          :height           => pc["height"]
        )  
    end
  end

  def self.public
    where(:private_video => false)  
  end

  def self.desc
    order("upload_date DESC")
  end
  
  def self.recent(num = 1)
    public.desc.limit(num)
  end
end
