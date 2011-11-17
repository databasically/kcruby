task :cron => :environment do
  
  Event.get_meetup
  
  Podcast.get_videos
  
end