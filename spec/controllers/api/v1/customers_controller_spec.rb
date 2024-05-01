require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
  describe 'show' do
    let(:customer) { create(:customer) }

    it 'returns a success response' do
      get :show, params: { id: customer.id }
      expect(response).to be_successful
    end

    it 'returns the customer with subscriptions' do
      subscription1 = create(:subscription, customer: customer)
      subscription2 = create(:subscription, customer: customer)

      get :show, params: { id: customer.id }
      expect(JSON.parse(response.body)['subscriptions'].size).to eq(2)
    end
  end
end
