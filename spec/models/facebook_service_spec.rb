require 'rails_helper'

RSpec.describe FacebookService do
  fixtures :users
  describe "#friends" do
    it "gets friends from user" do
      VCR.use_cassette 'list_friends' do
        user = generate_user
        fb = FacebookService.new(user)
        response = fb.friends
        expect(response.first[1][0].keys).to include(:name, :id)
      end
    end
  end
end
