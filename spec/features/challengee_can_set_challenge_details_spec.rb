require 'rails_helper'

RSpec.describe "ChallengeeCanSetChallengeDetails", type: :request do
  scenario "GET /challengee_can_set_challenge_details" do
    it "can establish a range and guess a number" do
        user = OmniAuth.config.mock_auth[:facebook]
        challenge = Challenge.create()
    end
  end
end
