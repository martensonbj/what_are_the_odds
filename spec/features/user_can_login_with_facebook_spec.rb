require "rails_helper"

RSpec.describe "landing page" do
  scenario "User can log in with facebook" do
        visit "/"
        call_mock_hash
        within '.home-content' do
          click_on "Login with Facebook"
        end
        user = User.last
        expect(current_path).to eq edit_user_path(user.id)
  end
end
