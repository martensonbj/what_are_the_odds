require 'rails_helper'

RSpec.describe FriendBuilder, type: :model do
  fixtures :users

  before do
    @user = generate_user
    @user_2 = users(:user_2)

    @challenge_1 = Challenge.create(title: "Pending Challenge 1",
    assigned_user: @user_2.id,
    expiration_date: "2016-04-02 22:47:00",
    message: "What are the odds 1",
    user_id: @user.id,
    odds: 10,
    challengee_guess: 5,
    challenger_guess: 5,
    status: 0)

    @challenge_2 = Challenge.create(title: "Pending Challenge 2",
    assigned_user: @user.id,
    expiration_date: "2016-04-02 22:47:00",
    message: "What are the odds 2",
    user_id: @user_2.id,
    odds: 10,
    challengee_guess: 4,
    challenger_guess: 5,
    status: 0)

    @challenge_3 = Challenge.create(title: "Pending Challenge 2",
    assigned_user: @user.id,
    expiration_date: "2016-04-02 22:47:00",
    message: "What are the odds 2",
    user_id: @user_2.id,
    odds: 10,
    challenger_guess: 5,
    status: 0)
  end

  it "both_guesses_submitted?" do
    expect(@challenge_1.both_guesses_submitted?).to be true
    expect(@challenge_3.both_guesses_submitted?).to be false
  end

  it "challenge_activated?" do
    expect(@challenge_1.challenge_activated?).to be true
    expect(@challenge_2.challenge_activated?).to be false
  end

  it "both_guesses_submitted?" do

  end

  it "both_guesses_submitted?" do

  end

  it "both_guesses_submitted?" do

  end

  it "both_guesses_submitted?" do

  end

  it "both_guesses_submitted?" do

  end

end
