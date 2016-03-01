require "rails_helper"

RSpec.feature "landing page", :type => :feature do
  scenario "User can log in with facebook" do
    visit "/"
    user = generate_user

    within '.navbar' do
      expect(page).to have_text("Log In")
      expect(page).to_not have_text("Logout")
    end

    within '.home-content' do
      click_on "Login with Facebook"
    end

    expect(current_path).to eq dashboard_path

    within '#dashboard-content' do
      expect(page).to have_text("Challenge A Friend!")
    end

    within '.navbar' do
      click_on "Logout"
    end

    expect(current_path).to eq root_path
  end
end
