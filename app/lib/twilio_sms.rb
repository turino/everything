class TwilioSMS
  def initialize(account_sid:, auth_token:, from:)
    @from = from
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_sms(to:, body:)
    client.api.account.messages.create(
      from: from,
      to: to,
      body: body,
    )
  end

  private

  attr_reader :client, :from
end
