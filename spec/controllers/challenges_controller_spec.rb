require 'rails_helper'

xRSpec.describe ChallengesController, type: :controller do
  user = OmniAuth.config.mock_auth[:facebook]
  describe "GET #index" do
    it "responds with success" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "responds with success" do
      get :show
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      get :show
      expect(response).to render_template("index")
    end
  end

end
