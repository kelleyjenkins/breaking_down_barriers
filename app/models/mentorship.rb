class Mentorship < ApplicationRecord
  belongs_to :user
  belongs_to :mentor, :class_name => "User"
end
