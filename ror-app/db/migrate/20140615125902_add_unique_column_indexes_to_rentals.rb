class AddUniqueColumnIndexesToRentals < ActiveRecord::Migration
  def change
    add_index :rentals, [:dvd_id, :user_id], :unique => true
  end
end
