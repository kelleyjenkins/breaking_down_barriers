require 'rails_helper'

describe "User Creates Profile" do
  it "can create profile once logged in" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    click_on "Create Profile"

    fill_in "profile[skills]", :with => "ruby, rails, life"
    fill_in "profile[summary]", :with => "Please hire me!"
    fill_in "profile[street_address]", :with => "1850 17th Street"
    fill_in "profile[city]", :with => "Denver"
    fill_in "profile[state]", :with => "CO"
    fill_in "profile[zip]", :with => "80216"

    click_on "Create Profile"

    expect(page).to have_content(user.profile.street_address)
    expect(page).to have_content(user.profile.city)
    expect(page).to have_content(user.profile.state)
    expect(page).to have_content(user.profile.zip)
    expect(page).to have_content(user.profile.summary)
    expect(page).to have_content(user.profile.skills)

  end
end
