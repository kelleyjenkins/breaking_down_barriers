require 'rails_helper'

describe "Employer Edits Job" do
  it "can edit their job" do
    employer = create(:employer)
    allow_any_instance_of(ApplicationController).to receive(:current_employer).and_return(employer)
    job = create(:job, employer: employer)

    visit employer_path(employer)

    click_on "Edit Job"

    expect(current_path).to eq(edit_employers_job_path(job))

    fill_in "job[title]", with: "New Title"
    click_on "Update"

    expect(current_path).to eq(employer_path(employer))

    expect(page).to have_content("New Title")
  end
end
