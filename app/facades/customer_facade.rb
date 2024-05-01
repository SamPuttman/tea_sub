class CustomerFacade

  def self.find_customer(customer_id)
    Customer.find(customer_id)
  end
  
end
