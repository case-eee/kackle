class TwilioMessage
  def self.send(number)
    client.messages.create(
      from: Figaro.env.twilio_phone_number,
      to: number,
      body: Joke.random.full
    )
  end

  def self.activate(number)
    client.messages.create(
      from: Figaro.env.twilio_phone_number,
      to: number,
      body: "Welcome to Kackle!"
    )
  end

  def self.deactivate(number)
    client.messages.create(
      from: Figaro.env.twilio_phone_number,
      to: number,
      body: "Successfully unsubscribed."
    )
  end

  private

  def self.client
    Twilio::REST::Client.new(Figaro.env.twilio_account_sid, Figaro.env.twilio_auth_token)
  end
end

