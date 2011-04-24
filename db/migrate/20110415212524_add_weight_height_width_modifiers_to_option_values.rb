class AddWeightHeightWidthModifiersToOptionValues < ActiveRecord::Migration
  def self.up
    add_column :option_values, :weight, :decimal, :precision => 2, :scale => 2, :default => 0
    add_column :option_values, :width, :decimal, :precision => 2, :scale => 2, :default => 0
    add_column :option_values, :height, :decimal, :precision => 2, :scale => 2, :default => 0
    add_column :option_values, :depth, :decimal, :precision => 2, :scale => 2, :default => 0
  end

  def self.down
    remove_column :option_values, :weight
    remove_column :option_values, :width
    remove_column :option_values, :height
    remove_column :option_values, :depth
  end
end
