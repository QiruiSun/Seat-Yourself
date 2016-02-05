class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validate :less_than_max_occupancy

  def less_than_max_occupancy
    other_people = Reservation.where(:restaurant_id => self.restaurant_id, :time => self.time).sum(:party_size)

    if other_people + self.party_size > 100


    end
  end

end
