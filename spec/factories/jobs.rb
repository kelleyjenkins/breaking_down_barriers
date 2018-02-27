FactoryBot.define do
  factory :job do
    sequence(:title) {|n| "title#{n}"}
    sequence(:description) {|n| "description#{n}"}
    full_address "14 Elm St, Denver, CO, 80216"
    employer
  end
end
