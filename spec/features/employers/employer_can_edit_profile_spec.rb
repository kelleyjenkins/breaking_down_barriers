require 'rails_helper'

describe "Employer Edits Profile" do
  it "can edit their account" do
    employer = create(:employer)
    allow_any_instance_of(ApplicationController).to receive(:current_employer).and_return(employer)

    visit employers_dashboard_path

    click_on "Edit Company Information"

    expect(current_path).to eq(edit_employer_path(employer))

    fill_in "employer[company_name]", :with => "New Name"
    click_on "Update"

    expect(current_path).to eq(employers_dashboard_path)
    expect(page).to have_content("New Name")
  end
end
