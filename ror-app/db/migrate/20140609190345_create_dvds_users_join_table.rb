class CreateDvdsUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :dvds_users, id: false do |t|
      t.integer :dvd_id
      t.integer :user_id
      t.date :rent_date
      t.date :return_date
    end

    add_index :dvds_users, [:dvd_id, :user_id]
  end

  def self.down
    drop_table :dvds_users
  end
end
