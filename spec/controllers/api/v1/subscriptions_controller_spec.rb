require 'rails_helper'

RSpec.describe Api::V1::SubscriptionsController, type: :controller do
  let(:customer) { create(:customer) }

  describe 'index' do
    it 'returns a success response' do
      get :index, params: { customer_id: customer.id }
      expect(response).to be_successful
    end

    it 'returns all subscriptions for the customer' do
      subscription1 = create(:subscription, customer: customer)
      subscription2 = create(:subscription, customer: customer)

      get :index, params: { customer_id: customer.id }
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'create' do
    let(:customer) { create(:customer) }
    let(:tea1) { create(:tea) }
    let(:tea2) { create(:tea) }

    let(:valid_attributes) do
      {
        title: 'Monthly Tea Subscription',
        status: 'active',
        frequency: 'every_6_months',
        subscription_teas_attributes: [
          { tea_id: tea1.id, quantity: 2 },
          { tea_id: tea2.id, quantity: 3 }
        ]
      }
    end

    it 'creates a new subscription' do
      expect {
        post :create, params: { customer_id: customer.id, subscription: valid_attributes }
      }.to change(Subscription, :count).by(1)
    end

    it 'returns a success response' do
      post :create, params: { customer_id: customer.id, subscription: valid_attributes }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'update' do
    let(:customer) { create(:customer) }
    let(:subscription) { create(:subscription, customer: customer) }
    let(:valid_params) { { title: 'Updated Subscription', price: 19.99 } }
    let(:invalid_params) { { title: '', price: nil } }

    context 'with valid parameters' do
      it 'updates the subscription' do
        put :update, params: { customer_id: customer.id, id: subscription.id, subscription: valid_params }
        subscription.reload
        expect(subscription.title).to eq('Updated Subscription')
      end

      it 'returns a success status' do
        put :update, params: { customer_id: customer.id, id: subscription.id, subscription: valid_params }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the subscription' do
        put :update, params: { customer_id: customer.id, id: subscription.id, subscription: invalid_params }
        subscription.reload
        expect(subscription.title).not_to eq('')
        expect(subscription.price).not_to be_nil
      end

      it 'returns an unprocessable entity status' do
        put :update, params: { customer_id: customer.id, id: subscription.id, subscription: invalid_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'destroy' do
    let!(:subscription) { create(:subscription, customer: customer) }

    it 'destroys the subscription' do
      expect {
        delete :destroy, params: { customer_id: customer.id, id: subscription.id }
      }.to change(Subscription, :count).by(-1)
    end

    it 'returns a success response' do
      delete :destroy, params: { customer_id: customer.id, id: subscription.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
