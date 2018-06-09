class SMS
  def self.send(*args)
    new.send(*args)
  end

  def send(to:, body:)
    client.send_sms(to: to, body: body)
  end

  private

  def client
    TwilioSMS.new(
      account_sid: account_sid,
      auth_token: auth_token,
      from: from,
    )
  end

  def account_sid
    Rails.application.credentials.twilio[:account_sid]
  end

  def auth_token
    Rails.application.credentials.twilio[:auth_token]
  end

  def from
    Rails.application.credentials.twilio[:phone_number]
  end
end
