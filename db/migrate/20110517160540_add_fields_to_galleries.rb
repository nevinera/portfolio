class AddFieldsToGalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries, :shortname, :string
    add_column :galleries, :hash, :string
  end

  def self.down
    remove_column :galleries, :shortname
    remove_column :galleries, :hash
  end
end
