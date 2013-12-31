# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'jmoon90@aol.com'
    password 'applepie'
    password_confirmation 'applepie'
  end
end
