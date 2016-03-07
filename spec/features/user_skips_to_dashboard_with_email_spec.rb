require "rails_helper"

RSpec.feature "user login", :type => :feature do
  scenario "User is redirected to dashboard if registered with email" do
    visit '/'
    within '.home-content' do
      click_on "Login with Facebook"
    end

    user = User.last

    expect(current_path).to eq edit_user_path(user.id)
    user.update_attributes(email: 'example@gmail.com', phone: '123-456-7890')

    click_on "Logout"
    visit '/'
    within'.home-content' do
      click_on "Login with Facebook"
    end

    expect(current_path).to eq challenges_path

  end
end
