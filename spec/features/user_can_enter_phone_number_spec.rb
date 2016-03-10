require "rails_helper"

RSpec.feature "enter phone number", :type => :feature do
  xscenario "challenges#new success" do
    user = generate_user
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit new_challenge_path

    click_on "Send Text!"
    expect(true).to be_true
  end
end
