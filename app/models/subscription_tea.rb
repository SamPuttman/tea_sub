class SubscriptionTea < ApplicationRecord
  belongs_to :subscription
  belongs_to :tea

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
