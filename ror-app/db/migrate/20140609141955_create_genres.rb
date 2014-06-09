class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :title, :limit => 100

      t.timestamps
    end
  end
end
