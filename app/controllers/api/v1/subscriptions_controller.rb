class Api::V1::SubscriptionsController < ApplicationController

  def index
    customer = CustomerFacade.find_customer(params[:customer_id])
    subscriptions = customer.subscriptions.map { |subscription| Subscription.new(subscription.attributes) }
    render json: subscriptions
  end

  def create
    customer = CustomerFacade.find_customer(params[:customer_id])
    subscription = customer.subscriptions.create(subscription_params)
    if subscription.persisted?
      render json: Subscription.new(subscription.attributes), status: :created
    else
      render json: { errors: subscription.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    customer = CustomerFacade.find_customer(params[:customer_id])
    subscription = customer.subscriptions.find(params[:id])
    subscription.destroy
    head :no_content
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency)
  end

end
