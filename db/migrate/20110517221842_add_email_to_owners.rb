class AddEmailToOwners < ActiveRecord::Migration
  def self.up
    add_column :owners, :email, :string
  end

  def self.down
    remove_column :owners, :email
  end
end
