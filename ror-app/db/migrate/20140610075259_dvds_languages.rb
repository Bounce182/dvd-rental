class DvdsLanguages < ActiveRecord::Migration
  def self.up
    create_table :dvds_languages, id: false do |t|
      t.integer :dvd_id
      t.integer :language_id
    end

    add_index :dvds_languages, [:dvd_id, :language_id]
  end

  def self.down
    drop_table :dvds_languages
  end
end
