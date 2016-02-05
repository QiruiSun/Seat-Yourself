class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations


  validates :name, :address, :price_range, :open_hour, :close_hour, presence: true



  


end
