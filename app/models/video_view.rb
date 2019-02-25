class VideoView < ApplicationRecord
  scope :watch_now, -> { where(created_at: (Time.now - 5.seconds)..Time.now) }

  validates :video_id, presence: true
  validates :customer_id, presence: true
end
