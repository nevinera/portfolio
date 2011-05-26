class RemoveOwnerColumns < ActiveRecord::Migration
  def self.up
    remove_column :galleries, :owner_id
    remove_column :pictures, :owner_id
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
