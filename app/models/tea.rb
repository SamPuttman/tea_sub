class Tea < ApplicationRecord
  has_many :subscription_teas
  has_many :subscriptions, through: :subscription_teas

  validates :title, :description, :temperature, :brew_time, :price, presence: true
  validates :temperature, :brew_time, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
