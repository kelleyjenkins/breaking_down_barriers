require 'rails_helper'

RSpec.describe Job, type: :model do
  it "has valid attributes" do
    employer = create(:employer)
    job = Job.create(title: "Clown", description: "I'm so funny", full_address: "14 Elm St, Denver, CO, 80216", employer_id: employer.id )

    expect(job.title).to eq("Clown")
    expect(job.description).to eq("I'm so funny")
    expect(job.full_address).to eq("14 Elm St, Denver, CO, 80216")
    expect(job.employer_id).to eq(employer.id)
  end

  it "has to have a title to be valid" do
    job = build(:job, title: nil)

    expect(job).to be_invalid
  end

  it "has to have a description to be valid" do
    job = build(:job, description: nil)

    expect(job).to be_invalid
  end

  it "has to have an address to be valid" do
    job = build(:job, full_address: nil)

    expect(job).to be_invalid
  end

  describe "relationships" do
    it {should belong_to(:employer)}
  end

end
