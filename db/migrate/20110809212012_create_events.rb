class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :time
      t.text :location
      t.text :descrition
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
