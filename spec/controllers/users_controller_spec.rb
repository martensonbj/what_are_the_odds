require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
    @user = generate_user
  end

  describe "GET #edit" do
    it "responds with success" do
      get :edit, id: @user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update/:id" do
    let(:attr) do
      {email: "email@example.com", phone: "9529533966"}
    end

    before :each do
      put :update, id: @user.id, user: attr
      @user.reload
    end

    it { expect(response).to have_http_status(302)}
    it { expect(response). to redirect_to(challenges_path) }
    it { expect(@user.email).to eq(attr[:email]) }
    it { expect(@user.phone).to eq(attr[:phone]) }
  end
end
