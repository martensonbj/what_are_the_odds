require 'rails_helper'
RSpec.describe HeadshotController, type: :controller do
  describe "POST #capture" do

    it "responds with success" do
      filepath = "/Users/bmartenson/turing/3module/projects/what_are_the_odds/public/headshots/headshot_capture_825_1457590095.jpg"

      get :capture
      photos = HeadshotPhoto.all
      expect(photos.count).to eq 0
    end
  end
end
