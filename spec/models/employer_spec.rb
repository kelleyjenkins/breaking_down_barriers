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

  it "has to have a name to be valid" do
    employer = build(:employer, company_name: nil)

    expect(employer).to be_invalid
  end

  it "has to have an email to be valid" do
    employer = build(:employer, email: nil)

    expect(employer).to be_invalid
  end

  it "has to have a passowrd to be valid" do
    employer = build(:employer, password: nil)

    expect(employer).to be_invalid
  end

  it "must have a unique company name to be valid" do
    store1 = create(:employer, company_name: "Paws")
    store2 = build(:employer, company_name: "Paws")

    expect(store2).to be_invalid
  end

  describe "relationships" do
    it {should have_many(:jobs)}
  end
end
