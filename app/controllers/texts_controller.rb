require 'twilio-ruby'

class TextsController < ApplicationController

  def send_text_message
    target_phone = "+1#{params["text"]["target_phone_number"]}"
    message_body = "You've been invited to play What Are The Odds! Create an account and join in at http://odds-roulette.herokuapp.com!"
    from = "+16513833740"

    client = Twilio::REST::Client.new(
      ENV["TWILIO_ACCOUNT_SID"],
      ENV["TWILIO_AUTH_TOKEN"]
    )
    client.messages.create(
      to: target_phone,
      from: from,
      body: message_body
    )
    redirect_to challenges_path
  end

end
