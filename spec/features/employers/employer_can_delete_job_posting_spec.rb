require 'rails_helper'

describe "Employer deletes job posting" do
  it "employer can delete their own job" do
    employer = create(:employer)
    job = create(:job, employer: employer)
    job1 = create(:job, employer: employer)


    allow_any_instance_of(ApplicationController).to receive(:current_employer).and_return(employer)

    visit employer_path(employer)

    first('.job').click_link "Delete"

    expect(current_path).to eq(employer_path(employer))
  end
end
