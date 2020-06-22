require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_least(3).is_at_most(30) }
  end

  describe 'association' do
    it { should have_many(:created_events) }
    it { should have_many(:attended_event).through(:event_attending) }
    it { should have_many(:event_attending) }
  end
end