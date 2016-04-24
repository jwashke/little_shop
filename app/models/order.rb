class Order < ActiveRecord::Base
  has_many :invoices
  has_many :items, through: :invoices

  scope :ordered, -> { where(status: 0) }
  scope :paid, -> { where(status: 1) }
  scope :completed, -> { where(status: 2) }
  scope :cancelled, -> { where(status: 3) }

  enum status: %w(ordered paid cancelled completed)

  def quantity
    invoices.sum(:quantity)
  end

  def total
    invoices.inject(0) { |sum, invoice| sum + invoice.total }
  end

  def cycle_status
    return paid! if ordered?
    return completed! if paid?
  end
end
