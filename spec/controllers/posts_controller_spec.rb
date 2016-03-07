require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    fixtures :users, :challenges, :posts

    before :each do
      @user = generate_user
      @user_2 = users(:user_2)

      @challenge = Challenge.create(
        title: "Pending Challenge 3",
        assigned_user: @user_2.id,
        expiration_date: "2016-04-02 22:47:00",
        message: "What are the odds 1",
        user_id: @user.id,
        status: 0 )
    end

    describe "POST #create" do
      let(:attr) do
        {body: "Test body of post 1", user_id: @user.id, challenge_id: @challenge.id}
      end

      it "creates a new post" do
        post :create, post: attr
        expect(Post.last.body).to eq("Test body of post 1")
      end
    end
end
