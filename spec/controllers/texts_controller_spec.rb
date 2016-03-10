require 'rails_helper'
require 'spec_helper'


RSpec.describe TextsController, type: :controller do

  @user = generate_user
  ApplicationController.any_instance.stubs(:current_user).returns(@user)

    describe "POST send_text_message" do
    it "responds with success" do
        expect(response).to be_success
      end
    end
end
