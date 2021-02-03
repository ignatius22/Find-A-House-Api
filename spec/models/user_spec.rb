require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Association' do
    it { should have_many(:favorites) }
    it { should have_many(:houses).through('favorites') }
  end

  describe 'Validate username and email' do
    it { should validate_uniqueness_of(:email) }
    it { should validate_length_of(:email).is_at_most(50) }
    it { should validate_presence_of(:email) }
  end
end
