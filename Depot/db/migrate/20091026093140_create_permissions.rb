class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.integer :authorizable_id
      t.string :authorizable_type
      t.boolean :god

      t.timestamps
    end
  end

  def self.down
    drop_table :permissions
  end
end
