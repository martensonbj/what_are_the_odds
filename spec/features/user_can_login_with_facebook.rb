require "rails_helper"

RSpec.feature "landing page", :type => :feature, vcr: true do
  scenario "User can log in with facebook" do
    visit "/"
    user = generate_user
    
    within '.home-content' do
      click_on "Login with Facebook"
    end

    expect(current_path).to eq dashboard_path

    within '#dashboard-content' do
        expect(page).to have_text("Challenge A Friend!")
    end
  end
end
