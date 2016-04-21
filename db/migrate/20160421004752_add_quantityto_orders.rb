class AddQuantitytoOrders < ActiveRecord::Migration
  def change
    add_column :orders, :quantity, :integer, default: 1
  end
end
