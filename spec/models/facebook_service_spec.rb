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

  xdescribe "#email" do
    it "gets facebook email from current user" do
      VCR.use_cassette 'get_email' do
        user = users(:me)
        fb = FacebookService.new(user)
        response = fb.email
      end
    end
  end
end
