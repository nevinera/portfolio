class HashIsATerribleName < ActiveRecord::Migration
  def self.up
    rename_column :pictures, :hash, :imgur_id
    rename_column :galleries, :hash, :imgur_id
  end

  def self.down
    rename_column :pictures,  :imgur_id, :hash
    rename_column :galleries, :imgur_id, :hash
  end
end
