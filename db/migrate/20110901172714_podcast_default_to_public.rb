class PodcastDefaultToPublic < ActiveRecord::Migration
  def self.up
    change_column :podcasts, :private_video, :boolean, :default => false
  end

  def self.down
    change_column :podcasts, :private_video, :boolean, :default => nil
  end
end
