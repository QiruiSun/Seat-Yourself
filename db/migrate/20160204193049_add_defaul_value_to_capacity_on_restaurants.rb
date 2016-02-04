class AddDefaulValueToCapacityOnRestaurants < ActiveRecord::Migration
  def change
    change_column :restaurants, :capacity, :integer, :default => 100
  end
end
