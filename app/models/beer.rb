class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  def average_rating
    self.ratings.average('score')
  end

  def to_s
    "Beer: #{self.name}, Brewery: #{brewery.name}"
  end
end
