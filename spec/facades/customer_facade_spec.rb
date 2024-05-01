require 'rails_helper'

RSpec.describe CustomerFacade do
  describe '.find_customer' do
    let(:customer) { create(:customer) }

    it 'returns the customer with the given ID' do
      expect(CustomerFacade.find_customer(customer.id)).to eq(customer)
    end

    it 'raises an error if the customer is not found' do
      expect { CustomerFacade.find_customer(987) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
