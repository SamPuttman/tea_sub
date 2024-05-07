class Subscription < ApplicationRecord
  has_many :subscription_teas, dependent: :destroy
  has_many :teas, through: :subscription_teas
  belongs_to :customer
  accepts_nested_attributes_for :subscription_teas

  enum status: { active: 0, cancelled: 1 }
  enum frequency: { bimonthly: 0, monthly: 1, every_2_months: 2, every_3_months: 3, every_4_months: 4, every_6_months: 5, yearly: 6 }

  def price
    total_price = subscription_teas.sum { |subscription_tea| subscription_tea.tea.price * subscription_tea.quantity }
    '%.2f' % total_price
  end

end
