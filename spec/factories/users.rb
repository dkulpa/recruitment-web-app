FactoryGirl.define do
  factory :user do
    email     'example@example.com'
    password  'qweasd'
    gender    'male'
    age       23
    admin     true
  end
end
