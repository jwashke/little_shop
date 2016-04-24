class Order < ActiveRecord::Base
  has_many :invoices
  has_many :items, through: :invoices

  scope :ordered, -> { where(status: 0) }
  scope :paid, -> { where(status: 1) }
  scope :completed, -> { where(status: 2) }
  scope :cancelled, -> { where(status: 3) }


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

  def cycle_status
    if ordered?
      paid!
    elsif paid?
      completed!
    end
  end

  def cancel
  end

  enum status: %w(ordered paid cancelled completed)
end
