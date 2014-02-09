require 'spec_helper'
include OwnTestHelper

describe "User page" do
  it "User page should display all ratings the user has made" do
    FactoryGirl.create(:user, username: "Anssi")
    FactoryGirl.create(:user, username: "Sami")
    FactoryGirl.create :beer
    FactoryGirl.create(:rating, score: 15, beer_id: 1, user_id: 1)
    FactoryGirl.create(:rating, score: 5, beer_id: 1, user_id: 1)
    FactoryGirl.create(:rating, score: 5, beer_id: 1, user_id: 2)
    FactoryGirl.create(:rating, score: 5, beer_id: 1, user_id: 2)

    @user = User.first
    visit user_path(@user)

    expect(page).to have_content "Has #{@user.ratings.count} ratings,"
  end

  it "User should be able to delete ratings from his own user page when logged in" do
    FactoryGirl.create(:user, username: "Pekka", password: "Foobar1", password_confirmation: "Foobar1")
    FactoryGirl.create :beer
    u = User.find_by username: "Pekka"
    id = u.id
    FactoryGirl.create(:rating, score: 25, beer_id: 1, user_id: id)

    sign_in(username:"Pekka", password:"Foobar1")
    expect{Rating.count == 1}

    click_link "delete"

    expect{Rating.count == 0}
  end
end