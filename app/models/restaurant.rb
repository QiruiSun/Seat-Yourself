class Restaurant < ActiveRecord::Base

  belongs_to :owner, class_name: "User"
  has_many :reservations
  has_many :users, through: :reservations
  validates :name, :address, :price_range, :open_hour, :close_hour, :capacity, presence: true
end
