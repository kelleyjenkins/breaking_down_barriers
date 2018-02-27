FactoryBot.define do
  factory :profile do
    street_address "28 Elm St"
    city "Denver"
    state "CO"
    zip "80216"
    summary "Hire Me!"
    skills "bad ass"
    profile_pic "https://media.wired.com/photos/598e35994ab8482c0d6946e0/master/w_1164,c_limit/phonepicutres-TA.jpg"
    user
  end
end
