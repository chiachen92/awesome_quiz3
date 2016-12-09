FactoryGirl.define do
  factory :user do
    name 'Jen'
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'somepassword'
    password_confirmation 'somepassword'
  end
end
