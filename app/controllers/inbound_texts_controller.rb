class InboundTextsController < ApplicationController
  def index
    message = Message.create(message_params)

    if Message.last_response_at < 1.hour.ago
      twilio_client.api.account.messages.create(
        from: twilio_phone_number,
        to: message.phone_number,
        body: "I'm alive!",
      )
      message.update(responded: true)
    end
  end

  private

  def message_params
    {
      body: params[:text],
      phone_number: params[:msisdn],
    }
  end

  def twilio_client
    Twilio::REST::Client.new(*twilio_credentials)
  end

  def twilio_phone_number
    Rails.application.credentials.twilio[:phone_number]
  end

  def twilio_credentials
    Rails.application.credentials.twilio.values_at(
      :account_sid,
      :auth_token,
    )
  end
end
