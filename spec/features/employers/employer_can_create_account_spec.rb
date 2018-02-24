require 'rails_helper'

describe "Employer Creates an Account" do
  it "can create a new account" do
    visit root_path
    click_on "Employer Login"

    expect(current_path).to eq(login_path)

    click_on "Create Account"
    fill_in "employer[email]", :with => "employer@employer.com"
    fill_in "employer[company_name]", :with => "Employer1"
    fill_in "employer[street_address]", :with => "1850 17th Street"
    fill_in "employer[city]", :with => "Denver"
    fill_in "employer[state]", :with => "CO"
    fill_in"employer[password]", :with => "test"

    click_on "Create Account"

    expect(current_path).to eq(employers_dashboard_path)
  end
end
