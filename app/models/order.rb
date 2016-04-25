class Order < ActiveRecord::Base
  has_many :invoices
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user

  scope :ordered, -> { where(status: 0) }
  scope :paid, -> { where(status: 1) }
  scope :cancelled, -> { where(status: 2) }
  scope :completed, -> { where(status: 3) }

  enum status: %w(ordered paid cancelled completed)

  def quantity
    order_items.sum(:quantity)
  end

  def total
    order_items.inject(0) { |sum, order_item| sum + order_item.total }
  end

  def cycle_status
    return paid! if ordered?
    return completed! if paid?
  end
end
