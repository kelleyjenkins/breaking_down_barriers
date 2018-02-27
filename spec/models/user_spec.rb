require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it {should have_one(:profile)}
  end
end
