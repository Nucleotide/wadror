require 'spec_helper'

describe "Ratings page" do

  it "Should display amount of ratings and each rating" do
    FactoryGirl.create :user
    FactoryGirl.create :beer
    FactoryGirl.create(:rating, score: 15, beer_id: 1, user_id: 1)
    FactoryGirl.create(:rating, score: 5, beer_id: 1, user_id: 1)

    visit ratings_path
    expect(page).to have_content "Number of ratings: #{Rating.count}"

    @ratings = Rating.all
    @ratings.each do |rating|
      expect(page).to have_content "#{rating.beer.name}"
    end
  end
end