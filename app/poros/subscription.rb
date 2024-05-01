class Subscription
  attr_reader :id, :title, :price, :status, :frequency, :customer_id

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @price = attributes[:price]
    @status = attributes[:status]
    @frequency = attributes[:frequency]
    @customer_id = attributes[:customer_id]
  end
end
