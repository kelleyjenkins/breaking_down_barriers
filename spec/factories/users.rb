FactoryBot.define do
  factory :user do
    provider "google_oauth2"
    uid 110854826262255536994
    name "Kelley"
    oauth_token ENV["access_token"]
  end
end
