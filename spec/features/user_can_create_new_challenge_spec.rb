require "rails_helper"

RSpec.feature "create new challenge", :type => :feature do
  fixtures :users
  scenario "challenges#new" do
      # visit "/"
      # within '.home-content' do
      #   click_on "Login with Facebook"
      # end
      # user = User.last
      #
      # expect(current_path).to eq edit_user_path(user.id)
      #
      # fill_in 'Email', with: 'example@example.com'
      # fill_in 'Phone', with: '123-444-5555'
      # click_on 'Finish Registration!'
      user = generate_user
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit challenges_path
      within '#dashboard-content' do
          expect(page).to have_text("Challenge A Friend!")
      end

      VCR.use_cassette("create_challenge") do
        click_on "Challenge A Friend!"
      end

      expect(current_path).to eq new_challenge_path
      expect(page).to have_text("Test User")

      fill_in "challenge[title]", with: "Test Title 1"
      fill_in "challenge[message]", with: "Test Body 1"
      select "Test User", :from => "challenge[assigned_user]"
      select "8", :from => "challenge_expiration_date_3i"
      select "December", :from => "challenge_expiration_date_2i"
      select "2016", :from => "challenge_expiration_date_1i"

      click_on "Send Challenge!"

      expect(current_path).to eq challenges_path
    end
end
