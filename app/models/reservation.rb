class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  after_create :add_user_points
  after_destroy :remove_user_points

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
