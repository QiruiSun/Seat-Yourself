class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  after_create :add_user_points
  after_destroy :remove_user_points

  validate :less_than_max_occupancy

  def less_than_max_occupancy
    already_taken = Reservation.where(:restaurant_id => self.restaurant_id, :time => self.time).sum(:party_size)

    if already_taken + self.party_size > 100
      errors.add(:party_size, "Too many!")

    end



  end

  def remove_user_points
    self.user.points -= self.party_size * 100
    self.user.save
  end

  def add_user_points
    # self.user.update_attributes(points: self.user.points + self.party_size * 10)
    # self.user.points = self.user.points + self.party_size * 10
    self.user.points += self.party_size * 100
    self.user.save
  end
end

end
