FactoryBot.define do
  factory :subscription do
    title { Faker::Lorem.word }
    price { Faker::Commerce.price(range: 10..50) }
    status { ["active", "cancelled"].sample }
    frequency { Faker::Number.between(from: 1, to: 12) }
    association :customer
  end
end
