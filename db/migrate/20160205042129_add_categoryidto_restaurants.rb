class AddCategoryidtoRestaurants < ActiveRecord::Migration
  def change
    add_foreign_key :restaurants, :column, :category_id

  end
end
