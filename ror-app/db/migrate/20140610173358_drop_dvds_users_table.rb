class DropDvdsUsersTable < ActiveRecord::Migration
  def up
    drop_table :dvds_users
  end

  def down
    create_table :dvds_users, id: false do |t|
      t.integer :dvd_id
      t.integer :user_id
      t.date :rent_date
      t.date :return_date
      t.decimal :total_price, precision: 10, scale: 2
      t.boolean :returned
    end

    add_index :dvds_users, [:dvd_id, :user_id]
  end
end
