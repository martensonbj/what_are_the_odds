require 'rails_helper'

RSpec.feature "UserCanPostMessage", type: :request do
  fixtures :users
  before :each do
    user = generate_user
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    user_2 = users(:user_2)
    challenge =  Challenge.create(title: "Pending Challenge 3",
      assigned_user: user.id.to_s,
      expiration_date: "2016-04-02 22:47:00",
      message: "What are the odds 1",
      user_id: user_2.id,
      status: 0)

      visit "challenges/#{challenge.id}"

  end
  scenario "Challengee can set guess and submit challenge" do
    fill_in "post[body]", with: "MESSAGE!"
    click_on "Post Message!"
    within('.challenge-posts') do
      expect(page).to have_text "MESSAGE!"
    end
  end

  scenario "Challengee can't submit an empty message" do
    click_on "Post Message!"
    expect(page).to have_text "Message can't be blank!"
  end
end
