require 'rails_helper'

RSpec.describe EventAttending, type: :model do
  describe 'association' do
    it { should belong_to(:event_attendee) }
    it { should belong_to(:attended_event) }
  end
end