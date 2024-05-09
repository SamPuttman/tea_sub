FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Lorem.paragraph }
    temperature { Faker::Number.between(from: 60, to: 100) }
    brew_time { Faker::Number.between(from: 1, to: 10) }
    price { Faker::Commerce.price(range: 2.0..10.0).round(2) }
  end
end
