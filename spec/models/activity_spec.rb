require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:activity_type) }
    it { should validate_presence_of(:level) }
  end

  describe 'associations' do
    it { should have_many(:schedules) }
  end
end
