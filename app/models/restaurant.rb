class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations

  belongs_to :owner, class_name: "User"

  validates :name, :address, :price_range, :open_hour, :close_hour, :capacity, presence: true

end
