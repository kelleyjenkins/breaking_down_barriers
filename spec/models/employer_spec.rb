require 'rails_helper'

RSpec.describe Employer, type: :model do
  it "has valid attributes" do
    employer = Employer.create(company_name: "Target", street_address: "14 Elm St", city: "Denver", state: "CO", email: "target@target.com", password_digest: "test")

    expect(employer.company_name).to eq("Target")
    expect(employer.street_address).to eq("14 Elm St")
    expect(employer.city).to eq("Denver")
    expect(employer.state).to eq("CO")
    expect(employer.email).to eq("target@target.com")
    expect(employer.password_digest).to eq("test")
  end
end
