class RenameAmountToPriceInOptionValues < ActiveRecord::Migration
  def self.up
    rename_column :option_values, :amount, :price
  end

  def self.down
    rename_column :option_values, :price, :amount
  end
end