require 'rails_helper'

describe "User Logs In" do
  scenario "using Google account" do
    VCR.use_cassette("user_login") do
      stub_omniauth
      visit root_path
      expect(page).to have_link("Sign in with Google")
      click_on "Sign in with Google"
      expect(page).to have_content("Signed in as Kelley Jenkins")
      expect(page).to have_content("Sign out")
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
