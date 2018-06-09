class InboundTextsController < ApplicationController
  def index
    message = Message.create(message_params)

    if message.test?
      SMS.send(to: phone_number, body: "I'm alive!")
      message.update(responded: true)
    end
  end

  private

  def message_params
    {
      body: message_body,
      phone_number: phone_number,
    }
  end

  def message_body
    params[:text]
  end

  def phone_number
    params[:msisdn]
  end
end
