class Api::V1::SubscriptionsController < ApplicationController
  before_action :set_customer, only: [:index, :create, :update, :destroy]
  before_action :set_subscription, only: [:update, :destroy]

  def index
    subscriptions = SubscriptionFacade.find_subscriptions(@customer)
    render json: subscriptions.as_json(include: :teas, methods: :price)
  end

  def create
    subscription = @customer.subscriptions.build(subscription_params)

    if subscription.save
      render json: SubscriptionSerializer.new(subscription).serializable_hash, status: :created
    else
      render json: { errors: subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.teas.clear
    if subscription.update(subscription_params)
      if params[:subscription][:tea_ids].present?
        subscription.teas << Tea.where(id: params[:subscription][:tea_ids])
      end
      render json: SubscriptionSerializer.new(subscription).serializable_hash
    else
      render json: { errors: subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @subscription.destroy
    head :no_content
  end

  private

  def set_customer
    @customer = CustomerFacade.find_customer(params[:customer_id])
  end

  def set_subscription
    @subscription = @customer.subscriptions.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:title, :status, :frequency, subscription_teas_attributes: [:tea_id, :quantity])
  end
end
