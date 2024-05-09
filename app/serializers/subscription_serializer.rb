class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :status, :frequency, :customer_id, :created_at, :updated_at

  attribute :price do |object|
    '%.2f' % object.price
  end

  attribute :teas do |object|
    object.subscription_teas.map do |subscription_tea|
      {
        id: subscription_tea.tea.id,
        title: subscription_tea.tea.title,
        description: subscription_tea.tea.description,
        temperature: subscription_tea.tea.temperature,
        brew_time: subscription_tea.tea.brew_time,
        price: '%.2f' % subscription_tea.tea.price,
        quantity: subscription_tea.quantity
      }
    end
  end
end
