require "rails_helper"

RSpec.feature "create new challenge", :type => :feature do
  scenario "challenges#new" do
    visit "/"
    user = generate_user

    within '.home-content' do
      click_on "Login with Facebook"
    end

    expect(current_path).to eq edit_user_path(user.id)

    within '#dashboard-content' do
        expect(page).to have_text("Challenge A Friend!")
    end

    click_on "Challenge A Friend!"

    within('.new-challenge-form') do
      expect(current_path).to eq new_challenge_path
      expect(page).to have_text("Send To:")
      expect(page).to have_text("What Are The Odds...")
      expect(page).to have_button("Send Challenge!")
    end

    click_on "Send Challenge!"

    expect(current_path).to eq challenges_path
    expect(page).to have_text("Challenge Sent!")

  end
end
