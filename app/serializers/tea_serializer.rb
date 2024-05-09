class TeaSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :description, :temperature, :brew_time, :created_at, :updated_at

  attribute :price do |object|
    '%.2f' % object.price
  end
end
