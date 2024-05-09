require 'rails_helper'

RSpec.describe SubscriptionFacade do
  describe '.find_subscriptions' do
    let(:customer) { FactoryBot.create(:customer) }
    let!(:subscription) { FactoryBot.create(:subscription, customer: customer) }
    let!(:tea) { FactoryBot.create(:tea) }

    before do
      subscription.teas << tea
    end

    it 'returns all subscriptions for a given customer with teas preloaded' do
      result = SubscriptionFacade.find_subscriptions(customer)
      expect(result).to include(subscription)
      expect(result.first.teas).to include(tea)
    end
  end

  describe '.create_subscription' do
    let(:customer) { FactoryBot.create(:customer) }
    let(:tea) { FactoryBot.create(:tea, price: 5.00) }
    let(:subscription_params) do
      { title: 'Monthly Tea', frequency: 'monthly', subscription_teas_attributes: [{ tea_id: tea.id, quantity: 2 }] }
    end

    it 'creates a new subscription and calculates the price correctly' do
      subscription = SubscriptionFacade.create_subscription(customer, subscription_params, [tea.id])
      expect(subscription.title).to eq('Monthly Tea')
      expect(subscription.price).to eq(15.00)
    end
  end


  describe '.update_subscription' do
    let(:subscription) { FactoryBot.create(:subscription, subscription_teas_attributes: [{ tea_id: FactoryBot.create(:tea, price: 5.00).id, quantity: 1 }]) }
    let(:new_tea) { FactoryBot.create(:tea, price: 10.00) }
    let(:updated_params) do
      { title: 'Updated Subscription', subscription_teas_attributes: [{ tea_id: new_tea.id, quantity: 1 }] }
    end

    it 'updates the subscription and recalculates the price' do
      updated_subscription = SubscriptionFacade.update_subscription(subscription, updated_params, [new_tea.id])
      updated_subscription.reload
      expect(updated_subscription.title).to eq('Updated Subscription')
      expect(updated_subscription.price).to eq(10.00)
      expect(updated_subscription.teas).to include(new_tea)
    end
  end

end
