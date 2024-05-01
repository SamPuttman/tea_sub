require 'rails_helper'

RSpec.describe Subscription do
  let(:attributes) do
    {
      id: 1,
      title: 'Monthly Tea Box',
      price: 29.99,
      status: 'active',
      frequency: 1,
      customer_id: 1
    }
  end

  subject { Subscription.new(attributes) }

  it 'initializes with the given attributes' do
    expect(subject.id).to eq(attributes[:id])
    expect(subject.title).to eq(attributes[:title])
    expect(subject.price).to eq(attributes[:price])
    expect(subject.status).to eq(attributes[:status])
    expect(subject.frequency).to eq(attributes[:frequency])
    expect(subject.customer_id).to eq(attributes[:customer_id])
  end
end
