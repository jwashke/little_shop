class Order < ActiveRecord::Base
  has_many :invoices
  has_many :items, through: :invoices

  def quantity
    invoices.sum(:quantity)
  end

  def total
    invoices.reduce(0) do |acc, invoice|
      acc + (invoice.item.price * invoice.quantity)
      #maybe create a total within each invoice, makes this easier
    end
  end

  def status
    
  end
end
