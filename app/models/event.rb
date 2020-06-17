class Event < ApplicationRecord

  def self.upcomming
    self.where("event_date > ?", Date.today)
  end

  def self.previews
    self.where("event_date < ?", Date.today)
  end

  belongs_to :creator, class_name: "User"
  has_many :event_attending, foreign_key: "attended_event_id"
  has_many :attendee, through:  :event_attending, source: :event_attendee

end
