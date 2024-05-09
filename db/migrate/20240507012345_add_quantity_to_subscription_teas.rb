class AddQuantityToSubscriptionTeas < ActiveRecord::Migration[7.1]
  def change
    add_column :subscription_teas, :quantity, :integer, default: 1
  end
end
