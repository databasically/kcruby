class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :about
      t.text :links
      t.string :avatar
      t.string :token
      t.date :user_since
      t.string :github_user_id
      t.string :twitter_user_id
      t.integer :login_count
      t.date :ruby_since
      t.string :neighborhood
      t.boolean :available
      t.boolean :show_email
      t.boolean :email_reminders
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
