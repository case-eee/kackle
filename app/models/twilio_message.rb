class TwilioMessage
  def self.send(number)
    client.messages.create(
      from: Figaro.env.twilio_phone_number,
      to: number,
      body: "Placeholder for a joke!"
    )
  end

  private

  def self.client
    Twilio::REST::Client.new(Figaro.env.twilio_account_sid, Figaro.env.twilio_auth_token)
  end
end
