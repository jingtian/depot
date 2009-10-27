class CreateMultiplePermissionsAddUserDeleteUserUpdateUser < ActiveRecord::Migration
  def self.up
    add_column :permissions, :add_user, :boolean
    add_column :permissions, :delete_user, :boolean
    add_column :permissions, :update_user, :boolean
  end

  def self.down
    remove_column :permissions, :update_user
    remove_column :permissions, :delete_user
    remove_column :permissions, :add_user
  end
end
