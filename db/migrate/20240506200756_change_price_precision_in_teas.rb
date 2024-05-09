class ChangePricePrecisionInTeas < ActiveRecord::Migration[7.1]
  def change
    change_column :teas, :price, :decimal, precision: 10, scale: 2
  end
end
