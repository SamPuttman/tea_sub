class Api::V1::CustomersController < ApplicationController

  def show
    customer = CustomerFacade.find_customer(params[:id])
    serialized_customer = CustomerSerializer.new(customer, include: [:subscriptions]).serializable_hash

    subscriptions = serialized_customer[:included].map do |subscription|
      subscription[:attributes].merge(id: subscription[:id])
    end

    render json: serialized_customer[:data][:attributes].merge(subscriptions: subscriptions)
  end

end
