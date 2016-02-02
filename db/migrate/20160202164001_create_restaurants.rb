class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :capacity
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
