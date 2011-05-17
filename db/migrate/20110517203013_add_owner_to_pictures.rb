class AddOwnerToPictures < ActiveRecord::Migration
  def self.up
    add_column :pictures, :owner_id, :integer
  end

  def self.down
    remove_column :pictures, :owner_id
  end
end
