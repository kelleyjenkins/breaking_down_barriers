class Job < ApplicationRecord
  validates_presence_of :title, :description, :full_address
  belongs_to :employer
  geocoded_by :full_address
  after_validation :geocode

end
