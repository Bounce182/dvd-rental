class SetColumnDefaultValueForTableRentals < ActiveRecord::Migration
  def change
    change_column :rentals, :returned, :boolean, :default => false
  end
end
