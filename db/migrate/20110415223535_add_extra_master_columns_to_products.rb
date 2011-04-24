class AddExtraMasterColumnsToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :weight, :decimal, :precision => 2, :scale => 2, :default => 0
    add_column :products, :width, :decimal, :precision => 2, :scale => 2, :default => 0
    add_column :products, :height, :decimal, :precision => 2, :scale => 2, :default => 0
    add_column :products, :depth, :decimal, :precision => 2, :scale => 2, :default => 0
  end

  def self.down
    remove_column :products, :weight
    remove_column :products, :width
    remove_column :products, :height
    remove_column :products, :depth
  end
end
