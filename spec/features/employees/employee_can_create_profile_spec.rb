require 'rails_helper'

describe "Employee Creates Profile" do
  it "can create profile once logged in" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    click_on "Create Profile"

    fill_in "employee[skills]", :with => "ruby, rails, life"
    fill_in "employee[summary]", :with => "Please hire me!"
    fill_in "employee[street_address]", :with => "1850 17th Street"
    fill_in "employee[city]", :with => "Denver"
    fill_in "employee[state]", :with => "CO"
    fill_in "employee[zip]", :with => "80216"

    click_on "Create Employee"

    expect(page).to have_content(user.employee.street_address)
    expect(page).to have_content(user.employee.city)
    expect(page).to have_content(user.employee.state)
    expect(page).to have_content(user.employee.zip)
    expect(page).to have_content(user.employee.summary)
    expect(page).to have_content(user.employee.skills)

  end
end
