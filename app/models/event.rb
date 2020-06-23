class Event < ApplicationRecord
  scope :upcomming, -> { where('event_date > ?', Date.today) }
  scope :previews, -> { where('event_date < ?', Date.today) }

  

  belongs_to :creator, class_name: 'User'
  has_many :event_attending, foreign_key: 'attended_event_id'
  has_many :attendee, through: :event_attending, source: :event_attendee

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :description, presence: true, length: { minimum: 3, maximum: 1000 }
end
