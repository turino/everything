require "rails_helper"

describe "GET /inbound_texts" do
  it "records the message" do
    params = {
      "msisdn" => "15555551111",
      "to" => "12015551111",
      "text" => "I'm tired",
      "type" => "text",
    }

    get "/inbound_texts", params: params

    expect(response.status).to eq 204
    expect(Message.last).to have_attributes(
      responded: false,
      body: "I'm tired",
      phone_number: "15555551111",
    )
  end

  it "responds to test messages" do
    stub_request(:post, %r{api.twilio.com})
    params = {
      "msisdn" => "15555551111",
      "to" => "12015551111",
      "messageId" => "0B000000E47DFE28",
      "text" => Message::TEST_MESSAGE,
      "type" => "text",
      "keyword" => "HI",
      "message-timestamp" => "2018-06-08 21:05:00",
    }

    get "/inbound_texts", params: params

    expect(Message.last.responded).to be true
    expect(WebMock).to have_requested(:post, %r{api.twilio.com})
  end
end
