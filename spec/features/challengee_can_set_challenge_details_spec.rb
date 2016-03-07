require 'rails_helper'

RSpec.feature "ChallengeeCanSetChallengeDetails", type: :request do
  fixtures :users, :challenges

  scenario "Challengee can set guess and submit challenge" do
        visit '/'
        within '.home-content' do
          click_on "Login with Facebook"
        end
        user = User.last
        user_2 = users(:user_2)
        challenge =  Challenge.create(title: "Pending Challenge 3",
          assigned_user: user.id.to_s,
          expiration_date: "2016-04-02 22:47:00",
          message: "What are the odds 1",
          user_id: user_2.id,
          status: 0)

        ApplicationController.any_instance.stubs(:current_user).returns(user)

        fill_in 'Email', with: 'example@email.com'
        fill_in 'Phone', with: '1234567898'
        click_on 'Finish Registration!'

        visit "challenges/#{challenge.id}"
        expect(page).to have_text "Send A Message!"
        click_on "Accept Challenge!"

        expect(page).to have_text "What Are Your Odds?"
        fill_in 'challenge_odds', with: "8"
        fill_in 'challenge[challengee_guess]', with: "5"
        click_on "Submit"

        expect(current_path).to eq "/challenges/#{challenge.id}"
  end
end


# require 'rails_helper'
# RSpec.describe SlackService do
#   fixtures :users, :channels
#   describe "#pull_new_messages" do
#     it "gets new messages from specified channel" do
#       VCR.use_cassette 'new_channel_messages' do
#         user = users(:first)
#         channel = channels(:first)
#         slack = SlackService.new
#         response = slack.pull_new_messages(channel, user.token)
#         expect(response.first.keys).to include("user", "type", "text", "ts")
#       end
#     end
#   end
# end
