class ChangeTimeDataType < ActiveRecord::Migration
  def change
    change_column :reservations, :time, :datetime
  end
end
