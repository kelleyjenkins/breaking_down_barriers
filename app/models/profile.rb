class Profile < ApplicationRecord
  belongs_to :user
  geocoded_by :full_address
  after_validation :geocode

  enum mentor: ["Active", "Inactive"]

  def full_address
    [street_address, city, state, zip].compact.join(', ')
  end
end
