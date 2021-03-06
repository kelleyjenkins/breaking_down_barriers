require 'rails_helper'

describe "Employer Creates a Job" do
  it "can create a new job" do
    employer = create(:employer)
    job3 = create(:job, employer: employer)
    allow_any_instance_of(ApplicationController).to receive(:current_employer).and_return(employer)

    visit employer_path(employer)

    click_on "Add New Job"

    expect(current_path).to eq(new_employer_job_path(employer))

    fill_in "job[title]", :with => "Web Developer"
    fill_in "job[description]", :with => "It's an awesome job!"

    click_on "Create Job"

    expect(page).to have_content("Web Developer")
    expect(page).to have_content("It's an awesome job!")
  end
end
