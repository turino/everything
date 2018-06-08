class Message < ApplicationRecord
  scope :recent, -> { order(created_at: :desc) }
  scope :responded, -> { where(responded: true) }

  def self.last_response_at
    recent.responded.limit(1).pluck(:created_at).first || 1.year.ago
  end
end
