class RemoveFieldsFromTableDvds < ActiveRecord::Migration
  def change
    remove_column :dvds, :lang, :string
    remove_column :dvds, :rent_price, :decimal
  end
end
