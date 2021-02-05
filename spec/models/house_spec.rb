require 'rails_helper'

RSpec.describe House, type: :model do
  describe 'Validate fields' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  describe 'Associations' do
    it { should have_many(:favorites) }
  end
end
