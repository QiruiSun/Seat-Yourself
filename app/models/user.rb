class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  has_many :reservations
  has_many :restaurants, through: :reservations
  has_many :owned_restaurants, class_name: "Restaurant", foreign_key: "owner_id"
  validates :email, presence: true, uniqueness: true
end
