require "rails_helper"

RSpec.feature "create new challenge", :type => :feature do
  scenario "challenges#new" do
    visit "/"
    user = generate_user

    within '.home-content' do
      click_on "Login with Facebook"
    end

    expect(current_path).to eq dashboard_path

    within '#dashboard-content' do
        expect(page).to have_text("Challenge A Friend!")
    end

    click_on "Challenge A Friend!"

    expect(current_path).to eq new_challenge_path
    expect(page).to have_text("Select A User")
    expect(page).to have_text("What's the Challenge?")
    expect(page).to have_button("Submit")
  end
end
