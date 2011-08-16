class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all
  end

  def show
    @podcast = Podcast.find(params[:id])
  end

  def new
    @podcast = Podcast.new
  end

  def create
    @podcast = Podcast.new(params[:podcast])
    if @podcast.save
      redirect_to @podcast, :notice => "Successfully created podcast."
    else
      render :action => 'new'
    end
  end

  def edit
    @podcast = Podcast.find(params[:id])
  end

  def update
    @podcast = Podcast.find(params[:id])
    if @podcast.update_attributes(params[:podcast])
      redirect_to @podcast, :notice  => "Successfully updated podcast."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @podcast = Podcast.find(params[:id])
    @podcast.destroy
    redirect_to podcasts_url, :notice => "Successfully destroyed podcast."
  end
end
