require 'rails_helper'

RSpec.describe ChallengesController, type: :controller do
  fixtures :users, :challenges

  before :each do
    visit '/'
    click_on "Login with Facebook"
    user = User.last
    ApplicationController.any_instance.stubs(:current_user).returns(user)
  end

  describe "GET #index" do
    it "responds with success" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds with success" do
      
      challenge = Challenge.create(title: "Pending Challenge 3",
        assigned_user: User.last.id,
        expiration_date: "2016-04-02 22:47:00",
        message: "What are the odds 1",
        user_id: User.first.id,
        status: 0)

      get :show
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end
