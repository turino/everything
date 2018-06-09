class Message < ApplicationRecord
  TEST_MESSAGE = "hi".freeze

  def test?
    body.casecmp(TEST_MESSAGE).zero?
  end
end
