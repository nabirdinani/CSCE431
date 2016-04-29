class ChangeDataTypeForAmout < ActiveRecord::Migration
  def change

  	change_column(:bids, :amount, :float)
  end
end
