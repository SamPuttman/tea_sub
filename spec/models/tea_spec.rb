require 'rails_helper'

RSpec.describe Tea, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:temperature) }
  it { should validate_presence_of(:brew_time) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:temperature).is_greater_than(0) }
  it { should validate_numericality_of(:brew_time).is_greater_than(0) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { should have_many(:subscription_teas) }
  it { should have_many(:subscriptions).through(:subscription_teas) }
end
