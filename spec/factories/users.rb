# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "john@foobar.com"
    password 'foobar01'
    password_confirmation 'foobar01'
  end
end
