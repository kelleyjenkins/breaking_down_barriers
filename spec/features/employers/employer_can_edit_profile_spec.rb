require 'rails_helper'

describe "Employer Edits Profile" do
  it "can edit their account" do
    employer = create(:employer)
    allow_any_instance_of(ApplicationController).to receive(:current_employer).and_return(employer)

    visit employer_path(employer)

    click_on "Edit Company Information"

    expect(current_path).to eq(edit_employer_path(employer))

    fill_in "employer[company_name]", :with => "New Name"
    click_on "Update"

    expect(current_path).to eq(employer_path(employer))
    expect(page).to have_content("New Name")
  end
end
