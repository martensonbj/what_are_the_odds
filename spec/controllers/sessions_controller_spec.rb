require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before do
    request.env['omniauth.auth'] = call_mock_hash
  end

  describe "#create" do
    it "successfully creates a session" do
      post :create, provider: :facebook
      expect(session[:user_id]).to_not be_nil
    end
  end

  describe "#destroy" do
    before do
      get :create, provider: :facebook
    end

    it "should clear the session" do
      session[:user_id].should_not be_nil
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it "should redirect to the home page" do
      delete :destroy
      expect(response).to redirect_to root_url
    end
  end
end
