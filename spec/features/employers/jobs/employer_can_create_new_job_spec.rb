require 'rails_helper'

describe "Employer Creates a Job" do
  it "can create a new job" do
    employer = create(:employer)
    allow_any_instance_of(ApplicationController).to receive(:current_employer).and_return(employer)

    visit employers_dashboard_path

    click_on "Add New Job"

    expect(current_path).to eq(new_employers_job)

    fill_in "job[title]", :with => "Web Developer"
    fill_in "job[description]", :with => "It's an awesome job!"

    click_on "Create Job"

    expect(current_path).to eq(employers_dashboard_path)
    expect(page).to have_content("Web Developer")
    expect(page).to have_Content("It's an awesome job!")
  end
end
