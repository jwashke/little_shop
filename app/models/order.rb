class Order < ActiveRecord::Base
  has_many :invoices
  has_many :items, through: :invoices

  def quantity
    invoices.sum(:quantity)
  end

  def total
    invoices.inject(0) do |acc, invoice|
      acc + (invoice.item.price * invoice.quantity)
      # maybe create a total within each invoice, makes this easier
    end
  end

  def current_status
    status
  end

  enum status: %w(Ordered Paid Cancelled Completed)
end
