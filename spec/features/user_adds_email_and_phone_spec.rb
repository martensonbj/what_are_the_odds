require "rails_helper"

RSpec.feature "new user page", :type => :feature, vcr: true do
  scenario "User is prompted to add email and phone" do
    visit "/"
    user = generate_user

    within '.home-content' do
      click_on "Login with Facebook"
    end

    expect(current_path).to eq edit_user_path(user.id)

    expect(page).to have_text("Last step!")

    fill_in 'Email', with: 'example@gmail.com'
    fill_in 'Phone', with: '123-456-7899'
    click_on 'Submit'

    expect(current_path).to eq dashboard_path

    within '#dashboard-content' do
        expect(page).to have_text("Challenge A Friend!")
    end
  end
end
