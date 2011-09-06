class Podcast < ActiveRecord::Base
  attr_accessible :title, :description, :video_url, :thumbnail_medium, :thumbnail_large, :duration, :size, :upload_date, :width, :height, :private_video

  validates_presence_of :upload_date, :video_url

  def self.get_videos
    u = URI.parse("http://vimeo.com/api/v2/wesgarrison/videos.json")
    response = Net::HTTP.get(u)
    JSON.parse(response).each do |pc|
      @podcast = Podcast.find_or_create_by_id(pc["id"])
      @podcast.id                                 = pc["id"]
      if @podcast.title.blank?
        @podcast.title = pc["title"]
        @podcast.description      = pc["description"]
        @podcast.video_url        = pc["url"]
        @podcast.thumbnail_medium = pc["thumbnail_medium"]
        @podcast.thumbnail_large  = pc["thumbnail_large"]
        @podcast.upload_date      = pc["upload_date"]
        @podcast.duration         = pc["duration"]
        @podcast.width            = pc["width"]
        @podcast.height           = pc["height"]
      end
      @podcast.save
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
