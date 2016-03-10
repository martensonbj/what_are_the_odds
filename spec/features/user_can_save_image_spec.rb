require "rails_helper"

RSpec.feature "save image through headshot", :type => :feature do
  scenario "User clicks on shoot to save image" do
    user = generate_user
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit new_challenge_path
    within('.headshot') do
      click_on "Shoot"
    end
    hp = HeadshotPhoto.last
    expect(current_path).to eq new_challenge_path
  end
end
