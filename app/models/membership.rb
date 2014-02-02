class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer_club

  validates :user_id, uniqueness: { scope: :beer_club_id, message: "One membership allowed per club" }
end
