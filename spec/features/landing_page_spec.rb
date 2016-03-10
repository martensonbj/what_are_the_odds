require "rails_helper"

RSpec.feature "landing page", :type => :feature do
  scenario "User visits the landing page" do
    visit "/"

    within '.home-content' do
      expect(page).to have_text("What Are The Odds?")
    end

    within '.login' do
      expect(page).to have_text("Login with Facebook")
    end
  end
end
