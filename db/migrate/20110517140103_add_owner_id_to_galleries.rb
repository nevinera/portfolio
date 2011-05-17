class AddOwnerIdToGalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries, :owner_id, :integer
  end

  def self.down
    remove_column :galleries, :owner_id
  end
end
