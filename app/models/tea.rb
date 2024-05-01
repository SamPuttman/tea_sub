class Tea < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :temperature, presence: true, numericality: { greater_than: 0 }
  validates :brew_time, presence: true, numericality: { greater_than: 0 }
end
