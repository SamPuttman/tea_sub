class Subscription < ApplicationRecord
  belongs_to :customer

  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true
  validates :frequency, presence: true, numericality: { only_integer: true, greater_than: 0 }

  enum status: { active: 0, cancelled: 1 }
end
