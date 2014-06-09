class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :limit => 50
      t.string :surname, :limit => 50
      t.string :email, :limit => 100
      t.string :password # Leaving default length - 255
      t.string :phone, :limit => 20
      t.string :address

      t.timestamps
    end
  end
end
