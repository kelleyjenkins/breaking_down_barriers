FactoryBot.define do
  factory :profile do
    street_address "28 Elm St"
    city "Denver"
    state "CO"
    zip "80216"
    summary "Hire Me!"
    skills "bad ass"
    user
  end
end
