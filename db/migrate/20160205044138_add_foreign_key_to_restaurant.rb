class AddForeignKeyToRestaurant < ActiveRecord::Migration
  def change
    add_reference :restaurants, :category, index: true, foreign_key: true

  end
end
