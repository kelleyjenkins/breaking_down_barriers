require 'rails_helper'

describe "Any visitor can see jos" do
  it "they can see a list of jobs" do
    employer1 = create(:employer)
    employer2 = create(:employer)
    job1 = create(:job, employer: employer2)
    job2 = create(:job, employer: employer1)
    job3 = create(:job, employer: employer2)

    visit jobs_path

    expect(page).to have_content(job1.title)
    expect(page).to have_content(job1.description)
    expect(page).to have_content(job1.employer.company_name)
    expect(page).to have_content(job2.title)
    expect(page).to have_content(job2.description)
    expect(page).to have_content(job2.employer.company_name)
    expect(page).to have_content(job3.title)
    expect(page).to have_content(job3.description)
    expect(page).to have_content(job3.employer.company_name)

  end
end
