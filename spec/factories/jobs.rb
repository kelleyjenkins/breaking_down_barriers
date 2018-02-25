FactoryBot.define do
  factory :job do
    sequence(:title) {|n| "title#{n}"}
    sequence(:description) {|n| "description#{n}"}
    employer
  end
end
