class CreateDvds < ActiveRecord::Migration
  def change
    create_table :dvds do |t|
      t.string :title
      t.text :description
      t.integer :year, :limit => 4
      t.string :lang, :limit => 8
      t.integer :length, :limit => 3
      t.decimal :rent_price, precision: 10, scale: 2 

      t.timestamps
    end
  end
end
