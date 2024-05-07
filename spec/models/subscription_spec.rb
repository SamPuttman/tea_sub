require 'rails_helper'

RSpec.describe Subscription, type: :model do
  let(:customer) { FactoryBot.create(:customer) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:frequency) }
  it { should define_enum_for(:status).with_values([:active, :cancelled]) }
  it { should define_enum_for(:frequency).with_values([:monthly, :bimonthly, :every_3_months, :every_4_months]) }
  it { should belong_to(:customer) }
  it { should have_many(:subscription_teas) }
  it { should have_many(:teas).through(:subscription_teas) }

  describe '#price' do
    let(:tea1) { FactoryBot.create(:tea, price: 5.0) }
    let(:tea2) { FactoryBot.create(:tea, price: 7.5) }
    let(:subscription) { FactoryBot.create(:subscription, customer: customer, teas: [tea1, tea2]) }

    it 'calculates the total price of associated teas' do
      expect(subscription.price).to eq('12.50')
    end
  end

  it 'creates a new subscription for a customer' do
    subscription = FactoryBot.create(:subscription, customer: customer)
    expect(customer.subscriptions).to include(subscription)
  end
end
