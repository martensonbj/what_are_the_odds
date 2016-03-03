require 'rails_helper'

RSpec.describe FriendBuilder, type: :model do
  xit "creates an array of friends" do
    VCR.use_cassette 'create_friends' do
      user = OmniAuth.config.mock_auth[:facebook]
      fb = FriendBuilder.new
      friends = fb.build_friends(user)

      expect(friends.class).to eq (Array)
    end
  end
end
