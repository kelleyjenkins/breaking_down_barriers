require 'rails_helper'

describe "User Edits Profile" do
  it "can edit their own profile" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    profile = create(:profile, user: user)

    visit user_path(user)
    within(".e-profile") do
      click_on "Edit Profile"
    end

    expect(current_path).to eq(edit_user_profiles_path(user))

    fill_in "profile[street_address]", with: "53 New Street"
    click_on "Update"

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("53 New Street")
  end
end
