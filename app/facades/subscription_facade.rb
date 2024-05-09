class SubscriptionFacade
  def self.find_subscriptions(customer)
    customer.subscriptions.includes(:teas)
  end

  def self.create_subscription(customer, subscription_params, tea_ids)
    subscription = customer.subscriptions.build(subscription_params)
    subscription.teas = Tea.find(tea_ids) if tea_ids.present?
    subscription
  end

  def self.update_subscription(subscription, subscription_params, tea_ids)
    subscription.update(subscription_params)
    subscription.teas = Tea.find(tea_ids) if tea_ids.present?
    subscription
  end
end
