class TwilioMessage
  def self.send(number, joke)
    client.messages.create(
      from: Figaro.env.twilio_phone_number,
      to: number,
      body: joke
    )
  end

  def self.activate(number)
    client.messages.create(
      from: Figaro.env.twilio_phone_number,
      to: number,
      body: "Welcome to Kackle! Respond with 'yes' to confirm your subscription."
    )
  end

  private

  def self.client
    Twilio::REST::Client.new(Figaro.env.twilio_account_sid, Figaro.env.twilio_auth_token)
  end
end

