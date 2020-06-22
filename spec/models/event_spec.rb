require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(25) }
    it { should validate_length_of(:description).is_at_least(3).is_at_most(1000) }
  end

  describe 'association' do
    it { should have_many(:event_attending) }
    it { should have_many(:attendee).through(:event_attending) }
    it { should belong_to(:creator) }
  end
end
