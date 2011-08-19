class ChangePodcastColumns < ActiveRecord::Migration
  def self.up
    rename_column :podcasts, :link,           :video_url
    rename_column :podcasts, :screenshot,     :thumbnail_medium
    rename_column :podcasts, :date,           :upload_date
    add_column    :podcasts, :thumbnail_large,:string
    add_column    :podcasts, :width,          :string
    add_column    :podcasts, :height,         :string
    add_column    :podcasts, :private_video,  :boolean
  end

  def self.down
    rename_column :podcasts, :video_url,         :link     
    rename_column :podcasts, :thumbnail_medium,  :screenshot
    rename_column :podcasts, :upload_date,       :date   
    remove_column :podcasts, :thumbnail_large
    remove_column :podcasts, :width        
    remove_column :podcasts, :height
    remove_column :podcasts, :private_video    
    
  end
end
