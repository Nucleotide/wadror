require 'spec_helper'

describe "New beer page" do
  it "beer should be created with a proper name" do
    FactoryGirl.create(:brewery, name: "Koff", year: 1897)
    FactoryGirl.create(:user, username: "Pekka", password: "Foobar1", password_confirmation: "Foobar1")
    sign_in(username:"Pekka", password:"Foobar1")
    visit new_beer_path
    select('Weizen', from:'beer[style]')
    select('Koff', from:'beer[brewery_id]')
    fill_in('beer[name]', with:'El Bisse')

    expect{
      click_button "Create Beer"
    }.to change{Beer.count}.from(0).to(1)

    expect(page).to have_content 'Listing beers'

  end

  it "user should see new beer page if name for beer is not filled" do
    FactoryGirl.create(:brewery, name: "Koff", year: 1897)
    FactoryGirl.create(:user, username: "Pekka", password: "Foobar1", password_confirmation: "Foobar1")
    sign_in(username:"Pekka", password:"Foobar1")
    visit new_beer_path
    select('Weizen', from:'beer[style]')
    select('Koff', from:'beer[brewery_id]')
    click_button('Create Beer')

    expect{Beer.count == 0}

    expect(page).to have_content '1 error prohibited'
  end
end