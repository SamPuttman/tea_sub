require 'rails_helper'

RSpec.describe Subscription, type: :model do
  let(:customer) { FactoryBot.create(:customer) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:frequency) }
  it { should define_enum_for(:status).with_values([:active, :cancelled]) }
  it { should define_enum_for(:frequency).with_values([:bimonthly, :monthly, :every_2_months, :every_3_months, :every_4_months, :every_6_months, :yearly]) }
  it { should belong_to(:customer) }
  it { should have_many(:subscription_teas) }
  it { should have_many(:teas).through(:subscription_teas) }



  it 'creates a new subscription for a customer' do
    subscription = FactoryBot.create(:subscription, customer: customer)
    expect(customer.subscriptions).to include(subscription)
  end
end
