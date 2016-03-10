require 'rails_helper'

RSpec.describe FriendBuilder, type: :model do
  it "creates an array of friends" do
    VCR.use_cassette 'create_friends' do
      user = generate_user
      fb = FriendBuilder.new
      friends = fb.build_friends(user)

      expect(friends.class).to eq (Array)
    end
  end
end
