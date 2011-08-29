class ChangeUsersToMembers < ActiveRecord::Migration
  def self.up
    rename_table :users, :members
  end

  def self.down
    rename_table :members, :users
  end
end
