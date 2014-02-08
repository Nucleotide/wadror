class BeerClub < ActiveRecord::Base
  has_many :members, through: :memberships, source: :user
  has_many :memberships
end
