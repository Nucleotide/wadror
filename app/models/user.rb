class User < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  include AverageRating

  has_secure_password

  validates :username, uniqueness: true, length: { minimum: 3, maximum: 15 }
  validates :password, length: { minimum: 4 }, format: { with: %r{(?=.*[A-Z])(?=.*[0-9])}, message: 'password must contain a number and a capital letter' }

end
