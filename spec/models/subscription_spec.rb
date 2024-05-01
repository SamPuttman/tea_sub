require 'rails_helper'

RSpec.describe Subscription, type: :model do
  let(:customer) { FactoryBot.create(:customer) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:frequency) }
  it { should validate_numericality_of(:price).is_greater_than(0) }
  it { should validate_numericality_of(:frequency).only_integer.is_greater_than(0) }
  it { should define_enum_for(:status).with_values([:active, :cancelled]) }

  it { should belong_to(:customer) }

  it 'creates a new subscription for a customer' do
    subscription = FactoryBot.create(:subscription, customer: customer)
    expect(customer.subscriptions).to include(subscription)
  end
end
