require 'twilio-ruby'
class TwilioService

  def send_twilio_message
    target_phone = params["to"]
    message_body = "You've been invited to play What Are The Odds! Create an account and join in at http://odds-roulette.herokuapp.com!"

    client = Twilio::REST::Client.new(
      ENV["TWILIO_ACCOUNT_SID"],
      ENV["TWILIO_AUTH_TOKEN"]
    )

    client.message.create(
      to: target_phone,
      from: '6513833740',
      body: message_body
    )

  end

end
