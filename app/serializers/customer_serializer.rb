class CustomerSerializer
  include JSONAPI::Serializer
  attributes :id, :first_name, :last_name, :email, :address, :created_at, :updated_at

  has_many :subscriptions, serializer: SubscriptionSerializer
end
