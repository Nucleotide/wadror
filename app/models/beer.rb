class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, -> { uniq }, through: :ratings, source: :user
  include AverageRating

  validates :name, presence: true

  def to_s
    "Beer: #{self.name}, Brewery: #{brewery.name}"
  end
end
