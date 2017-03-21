require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    context 'email validation' do
      it 'prohibits creation of user with a wrong email' do
        user = build(:user, email: 'gimme error!')
        user.valid?
        expect(user.errors).to include(:email)
        expect(user.errors[:email]).to include('is invalid')
      end

      it 'allows creation of user only with valid email' do
        user = create(:user)
        user.valid?
        expect(user.errors).to_not include(:email)
      end
    end

    context 'admin validation' do
      it 'prohibits creation of user without an admin value' do
        user = build(:user, admin: nil)
        user.valid?
        expect(user.errors).to include(:admin)
        expect(user.errors[:admin]).to include("can't be blank")
      end

      it 'allows creation of user with a alid admin value' do
        user = create(:user)
        user.valid?
        expect(user.errors).to_not include(:admin)
      end
    end

    context 'gender validation' do
      it 'prohibits creation of user without a gender' do
        user = build(:user, gender: nil)
        user.valid?
        expect(user.errors).to include(:gender)
        expect(user.errors[:gender]).to include("can't be blank")
      end

      it 'prohibits creation of user with a WRONG gender' do
        user = build(:user, gender: 'unknown')
        user.valid?
        expect(user.errors[:gender]).to include('is not included in the list')
      end

      it 'allows creation of user with a valid gender' do
        user = create(:user)
        user.valid?
        expect(user.errors).to_not include(:gender)
      end
    end

    context 'age validation' do
      it 'prohibits creation of user without an age' do
        user = build(:user, age: nil)
        user.valid?
        expect(user.errors).to include(:age)
        expect(user.errors[:age]).to include("can't be blank")
      end

      it 'prohibits creation of user with a wrong age' do
        below_zero_user = build(:user, age: -3)
        too_young_user = build(:user, age: 7)
        insanely_old_user = build(:user, age: 161)

        below_zero_user.valid?
        too_young_user.valid?
        insanely_old_user.valid?

        expect(below_zero_user.errors).to include(:age)
        expect(too_young_user.errors).to include(:age)
        expect(insanely_old_user.errors).to include(:age)
        expect(below_zero_user.errors[:age]).to include('is a wrong age')
        expect(too_young_user.errors[:age]).to include('is a wrong age')
        expect(insanely_old_user.errors[:age]).to include('is a wrong age')
      end
    end
  end

  describe '#gender_enum' do
    it 'returns an array' do
      user = create(:user)
      expect(user.gender_enum).to be_a_kind_of(Array)
    end

    it 'returns possible genders' do
      user = create(:user)
      expect(user.gender_enum.first).to include('male')
      expect(user.gender_enum.last).to include('female')
    end
  end
end
