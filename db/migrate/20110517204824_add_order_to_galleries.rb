class AddOrderToGalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries, :ordering, :integer
  end

  def self.down
    remove_column :galleries, :ordering
  end
end
