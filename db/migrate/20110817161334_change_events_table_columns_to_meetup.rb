class ChangeEventsTableColumnsToMeetup < ActiveRecord::Migration
  def self.up
    rename_column :events, :title, :name
    rename_column :events, :location, :venue_name
    rename_column :events, :descrition, :description
    change_column :events, :time, :datetime
    remove_column :events, :date
    add_column    :events, :venue_address1, :string
    add_column    :events, :venue_address2, :string
    add_column    :events, :venue_city, :string    
    add_column    :events, :venue_state, :string   
    add_column    :events, :venue_zip, :string     
    add_column    :events, :venue_map, :string
    add_column    :events, :meet_up_id, :string
         
  end

  def self.down
    rename_column :events, :name, :title
    rename_column :events, :venue_name, :location
    rename_column :events, :description, :descrition
    change_column :events, :time, :time
    add_column :events, :date, :date
    remove_column :events, :venue_address1, :string
    remove_column :events, :venue_address2, :string
    remove_column :events, :venue_city, :string
    remove_column :events, :venue_state, :string
    remove_column :events, :venue_zip, :string
    remove_column :events, :venue_map, :string
    remove_column :events, :meet_up_id, :string   
  end
end
