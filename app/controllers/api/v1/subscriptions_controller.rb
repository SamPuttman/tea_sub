class Api::V1::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    render json: subscriptions
  end

  def create
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.build(subscription_params)

    if subscription.save
      render json: subscription, status: :created
    else
      render json: { errors: subscription.errors }, status: :unprocessable_entity
    end
  end

  def update
    subscription = Subscription.find(params[:id])

    if subscription.update(subscription_params)
      render json: subscription
    else
      render json: { errors: subscription.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.find(params[:id])
    subscription.destroy
    head :no_content
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency)
  end

end
