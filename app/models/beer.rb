class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  include AverageRating

  def to_s
    "Beer: #{self.name}, Brewery: #{brewery.name}"
  end
end
