class Job < ApplicationRecord
  validates_presence_of :title, :description
  belongs_to :employer
end
