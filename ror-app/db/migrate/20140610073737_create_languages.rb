class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :title, :limit => 50

      t.timestamps
    end
  end
end
