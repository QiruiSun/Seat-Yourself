class Restaurant < ActiveRecord::Base

  belongs_to :owner, class_name: "User"
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, :address, :price_range, :open_hour, :close_hour, presence: true


  def open_seats?(date, time, requested_guests)
    counter = 0
    self.reservations.where(date: date, time: time).find_each do |reservation|
      counter += reservation.party_size
    end

    self.capacity - counter >= requested_guests ? true : false
  end



end
