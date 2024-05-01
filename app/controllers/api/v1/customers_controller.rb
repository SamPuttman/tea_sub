class Api::V1::CustomersController < ApplicationController

  def show
    customer = CustomerFacade.find_customer(params[:id])
    render json: customer, include: :subscriptions
  end
  
end
