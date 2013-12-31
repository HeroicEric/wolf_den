FactoryGirl.define do
  factory :post do
    association :user

    sequence(:title) { |n| "Awesome #{n} Post" }
    content "Awesome content"
  end
end
