class AddAdminToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :admin, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :members, :admin
  end
end
