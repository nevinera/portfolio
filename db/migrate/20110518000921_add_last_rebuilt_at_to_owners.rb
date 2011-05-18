class AddLastRebuiltAtToOwners < ActiveRecord::Migration
  def self.up
    add_column :owners, :last_rebuilt_at, :timestamp
  end

  def self.down
    remove_column :owners, :last_rebuilt_at
  end
end
