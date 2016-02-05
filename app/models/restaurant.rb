class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations


  validates :name, :address, :price_range, :open_hour, :close_hour, presence: true

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%")
  end

end
