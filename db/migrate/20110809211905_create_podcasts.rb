class CreatePodcasts < ActiveRecord::Migration
  def self.up
    create_table :podcasts do |t|
      t.string :title
      t.text :description
      t.string :link
      t.string :screenshot
      t.integer :size
      t.string :duration
      t.date :date
      t.timestamps
    end
  end

  def self.down
    drop_table :podcasts
  end
end
