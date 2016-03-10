require 'rails_helper'
require 'spec_helper'


RSpec.describe TextsController, type: :controller do
include SmsSpec::Helpers

  @user = generate_user
  ApplicationController.any_instance.stubs(:current_user).returns(@user)

    describe "POST send_text_message" do
    it "responds with success" do
        expect(response).to be_success
      end
    end

    describe "POST 'create'" do
      it "sends a text message to the phone number that registered" do

      post 'send_text_message', {:phone_number => "+16124147538"}

      open_last_text_message_for "612-414-7538"
      current_text_message.should have_body "You've been invited to play What Are The Odds! Create an account and join in at http://odds-roulette.herokuapp.com!"
    end
  end
end
