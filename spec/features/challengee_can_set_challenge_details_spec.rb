require 'rails_helper'

RSpec.feature "ChallengeeCanSetChallengeDetails", type: :request do
  fixtures :users

  before :each do
    user = generate_user
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    user_2 = users(:user_2)
    @challenge =  Challenge.create(title: "Pending Challenge 3",
      assigned_user: user.id.to_s,
      expiration_date: "2016-04-02 22:47:00",
      message: "What are the odds 1",
      user_id: user_2.id,
      status: 0)

    visit "challenges/#{@challenge.id}"
    expect(page).to have_text "YOUR GUESS"
    expect(page).to have_text "THEIR GUESS"
    click_on "Accept Challenge!"
  end

  scenario "Challengee can set guess and submit challenge" do
    expect(page).to have_text "What Are Your Odds?"
    fill_in 'challenge_odds', with: "8"
    fill_in 'challenge[challengee_guess]', with: "5"
    click_on "Submit"

    expect(page).to have_text("Challenge Updated!")
  end

end
