require 'rails_helper'

describe "User Logs In" do
  scenario "using Google account" do
    VCR.use_cassette("user_login") do
      stub_omniauth
      visit root_path
      expect(page).to have_link("Employee Login")
      click_on "Employee Login"

      expect(page).to have_content("Sign Out")
    end
  end
end

def stub_omniauth
  OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: "google_oauth2",
      uid: 110854826262255536994,
      info: {name: "Kelley Jenkins"},
      credentials: {oauth_token: ENV["access_token"]}
    })
end
