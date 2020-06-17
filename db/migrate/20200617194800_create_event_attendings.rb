class CreateEventAttendings < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendings do |t|
      t.belongs_to :attended_event
      t.belongs_to :event_attendee
      t.timestamps
    end
  end
end
