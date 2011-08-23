class HomeController < ApplicationController
  def index
    @podcasts = Podcast.public.desc.recent
  end
end
