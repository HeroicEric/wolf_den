# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "jmoon#{n}@aol.com" }
    password 'applepie'
    password_confirmation 'applepie'
  end
end
