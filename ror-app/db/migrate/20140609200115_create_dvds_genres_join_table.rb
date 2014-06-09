class CreateDvdsGenresJoinTable < ActiveRecord::Migration
  def self.up
    create_table :dvds_genres, id: false do |t|
      t.integer :dvd_id
      t.integer :genre_id
    end

    add_index :dvds_genres, [:dvd_id, :genre_id]
  end

  def self.down
    drop_table :dvds_genres
  end
end
