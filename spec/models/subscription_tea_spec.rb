require 'rails_helper'

RSpec.describe SubscriptionTea, type: :model do
  let(:subscription) { FactoryBot.create(:subscription) }
  let(:tea) { FactoryBot.create(:tea) }

  it { should belong_to(:subscription) }
  it { should belong_to(:tea) }

  it 'creates a new association between subscription and tea' do
    subscription_tea = SubscriptionTea.create(subscription: subscription, tea: tea)
    expect(subscription.teas).to include(tea)
    expect(tea.subscriptions).to include(subscription)
  end

  it 'validates the uniqueness of subscription and tea combination' do
    SubscriptionTea.create(subscription: subscription, tea: tea)
    duplicate_subscription_tea = SubscriptionTea.new(subscription: subscription, tea: tea)
    expect(duplicate_subscription_tea).not_to be_valid
    expect(duplicate_subscription_tea.errors[:subscription_id]).to include("tea combination must be unique")
  end

  it 'deletes the association when subscription is deleted' do
    subscription_tea = SubscriptionTea.create(subscription: subscription, tea: tea)
    expect { subscription.destroy }.to change { SubscriptionTea.count }.by(-3)
    expect(SubscriptionTea.exists?(subscription_tea.id)).to be_falsey
  end

  it 'deletes the association when tea is deleted' do
    subscription_tea = SubscriptionTea.create(subscription: subscription, tea: tea)
    expect { tea.destroy }.to change { SubscriptionTea.count }.by(-1)
    expect(SubscriptionTea.exists?(subscription_tea.id)).to be_falsey
  end
end
