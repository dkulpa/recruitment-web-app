require 'rails_helper'

RSpec.describe Interest do
  describe 'validations' do
    context 'name validation' do
      it 'prohibits creation of interest without a provided name' do
        interest = build(:interest, name: nil)
        interest.valid?
        expect(interest.errors).to include(:name)
        expect(interest.errors[:name]).to include("can't be blank")
      end

      it 'allows creation of interest with a provided name' do
        interest = create(:interest)
        interest.valid?
        expect(interest.errors).to_not include(:name)
      end
    end

    context 'interest_type validation' do
      it 'prohibits creation of interest without a provided interest_type' do
        interest = build(:interest, interest_type: nil)
        interest.valid?
        expect(interest.errors).to include(:interest_type)
        expect(interest.errors[:interest_type]).to include("can't be blank")
      end

      it 'prohibits creation of interest with invalid interest_type' do
        interest = build(:interest, interest_type: 'sport')
        interest.valid?
        expect(interest.errors[:interest_type]).to include('is not included in the list')
      end

      it 'allows creation of interest only with interest_type from given list' do
        interest = create(:interest)
        interest.valid?
        expect(interest.errors).to_not include(:interest_type)
      end
    end
  end
  describe '#interest_type_enum' do
    it 'returns an array of interests' do
      interest = create(:interest)
      expect(interest.interest_type_enum).to be_a_kind_of(Array)
      expect(interest.interest_type_enum.flatten).to include('health')
      expect(interest.interest_type_enum.flatten).to include('hobby')
      expect(interest.interest_type_enum.flatten).to include('work')
    end
  end
end
