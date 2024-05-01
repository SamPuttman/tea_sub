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
    let(:valid_attributes) { attributes_for(:subscription) }

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
