class AddPriceToRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :price, :string
  end
end
