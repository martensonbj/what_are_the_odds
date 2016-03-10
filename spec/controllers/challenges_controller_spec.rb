require 'rails_helper'

RSpec.describe ChallengesController, type: :controller do
  fixtures :users

  before do
    @user = generate_user
    ApplicationController.any_instance.stubs(:current_user).returns(@user)
    @user_2 = users(:user_2)

    @challenge = Challenge.create(title: "Pending Challenge 1",
      assigned_user: @user_2.id,
      expiration_date: "2016-04-02 22:47:00",
      message: "What are the odds 1",
      user_id: @user.id,
      status: 0)

    @challenge_2 = Challenge.create(title: "Pending Challenge 2",
      assigned_user: @user.id,
      expiration_date: "2016-04-02 22:47:00",
      message: "What are the odds 2",
      user_id: @user_2.id,
      status: 0)

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
      get :show, id: @challenge.id

      # response

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit/:id" do
    it "responds with success" do
      get :edit, id: @challenge.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update/:id" do
    let(:attr) do
      {odds: 8, challengee_guess: 5}
    end

    before :each do
      put :update, id: @challenge.id, challenge: attr
      @challenge.reload
    end

    it { expect(response).to have_http_status(200) }
    it { expect(@challenge.odds).to eq(attr[:odds]) }
    it { expect(@challenge.challengee_guess).to eq(attr[:challengee_guess]) }
  end

  describe "GET #new" do
    it "responds with success" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE #destroy/:id" do
    it "deletes the user" do
      expect {
        delete :destroy, id: @challenge.id
      }.to change(Challenge, :count).by(-1)
    end
  end

end
