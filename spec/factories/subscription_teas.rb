FactoryBot.define do
  factory :subscription_tea do
    subscription
    tea
    quantity { Faker::Number.between(from: 1, to: 5) }
  end
end
