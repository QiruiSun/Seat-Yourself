class Addaddrestorestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :address, :string
    add_column :restaurants, :price_range, :string
    add_column :restaurants, :summary, :string
    add_column :restaurants, :open_hour, :integer
    add_column :restaurants, :close_hour, :integer
  end
end
