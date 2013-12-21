# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "John #{n}"
    end
    sequence :email do |n|
      "john#{n}@gmail.com"
    end
    sequence :password do |n|
      "foobar#{n}"
    end
    sequence :password_confirmation do |n|
      "foobar#{n}"
    end
  end
end
