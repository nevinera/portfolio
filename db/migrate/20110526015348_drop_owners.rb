class DropOwners < ActiveRecord::Migration
  def self.up
    drop_table :owners
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
