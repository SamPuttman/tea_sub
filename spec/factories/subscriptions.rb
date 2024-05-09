FactoryBot.define do
  factory :subscription do
    title { Faker::Lorem.word }
    status { ["active", "cancelled"].sample }
    frequency { Faker::Number.between(from: 0, to: 6) }
    customer

    after(:create) do |subscription|
      create_list(:subscription_tea, 2, subscription: subscription)
    end
  end
end
