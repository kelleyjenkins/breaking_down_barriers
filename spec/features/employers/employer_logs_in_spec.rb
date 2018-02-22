require 'rails_helper'

describe "Employer Logs In" do
  scenario "user logs in from their login page" do
    it "logs in and sees employer dashboard" do
      employer = create(:employer)

      visit root_path
      click_on "Employer Login"

      expect(current_path).to eq(login_path)

      fill_in("email", :with => employer.email)
      fill_in("password", :with => employer.password)
      click_on "Sign In"

      expect(current_path).to eq(employer_dashboard_path)
    end
  end
end
