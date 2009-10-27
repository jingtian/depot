class CreatePermissionAddProduct < ActiveRecord::Migration
  def self.up
    add_column :permissions, :add_product, :boolean
  end

  def self.down
    remove_column :permissions, :add_product
  end
end
