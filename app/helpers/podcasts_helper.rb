module PodcastsHelper
  def print_duration(dur)
    min = (dur.to_i/60)
    sec = (dur.to_i%60)
    if (min > 60)
      hr = min / 60
      min = min % 60
      format("%i:%i:%i",hr, min, sec)
    else
      format("%i:%i",min, sec)
    end
  end  
end
