class RenameTableUserDvds < ActiveRecord::Migration
  def self.up
    rename_table :rentals, :rentals
  end
  def self.down
    rename_table :rentals, :rentals
  end
end
