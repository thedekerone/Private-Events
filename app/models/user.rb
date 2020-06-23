class User < ApplicationRecord
  def self.user_can_attend(user_id, event)
    user_id && !event.attendee.include?(User.find(user_id)) && event.creator.id != user_id
  end

  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :event_attending, foreign_key: 'event_attendee_id'
  has_many :attended_event, through: :event_attending

  validates :username, uniqueness: true, presence: true, length: { minimum: 3, maximum: 30 }
end
