class SubscriptionTea < ApplicationRecord
  belongs_to :subscription
  belongs_to :tea

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :subscription_id, uniqueness: { scope: :tea_id, message: "tea combination must be unique" }
end
