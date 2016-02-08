class Restaurant < ActiveRecord::Base

  has_many :reviews
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :category

  validates :name, :address, :price_range, :open_hour, :close_hour, presence: true

  def self.search(query)
    where("name like ?", "%#{query}%")
    #code
  end




end
