require "rails_helper"

RSpec.feature "show page", :type => :feature do
  fixtures :users
  before :each do
    @user = generate_user
    ApplicationController.any_instance.stubs(:current_user).returns(@user)
    @user_2 = users(:user_2)

    @challenge = Challenge.create(title: "Pending Challenge 1",
    assigned_user: @user_2.id,
    expiration_date: "2016-04-02 22:47:00",
    message: "What are the odds 1",
    user_id: @user.id,
    status: 0)

    @challenge.update_attributes(response_video: "http://video.jpg")
    @challenge.reload

    @challenge_2 = Challenge.create(title: "Pending Challenge 2",
    assigned_user: @user.id,
    expiration_date: "2016-04-02 22:47:00",
    message: "What are the odds 2",
    user_id: @user_2.id,
    status: 0)
  end

  scenario "User can see sent and pending challenges" do
    visit challenges_path(@challenge.id)

    within first('.challenge-details-table') do
      expect(page).to_not be_nil
    end
  end

end
