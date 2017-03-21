FactoryGirl.define do
  factory :interest do
    user
    name          'cycling'
    interest_type ['health', 'hobby', 'work'].sample
  end
end
