class AddColsToPictures < ActiveRecord::Migration
  def self.up
    add_column :pictures, :caption, :string
    add_column :pictures, :name,    :string
    add_column :pictures, :width,   :integer
    add_column :pictures, :height,  :integer
    add_column :pictures, :thumbnail_url, :string
  end

  def self.down
    remove_column :pictures, :caption
    remove_column :pictures, :name
    remove_column :pictures, :width
    remove_column :pictures, :height
    remove_column :pictures, :thumbnail_url
  end
end
