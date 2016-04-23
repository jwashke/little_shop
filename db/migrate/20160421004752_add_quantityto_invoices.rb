class AddQuantitytoInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :quantity, :integer, default: 1
  end
end
