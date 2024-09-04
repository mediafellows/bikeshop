require 'rails_helper'

describe Product, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:brand) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
  end
end
