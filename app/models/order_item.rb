class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order

  def total
    ((quantity) * (item.price)).round(2)
  end

  def title
    item.title
  end
end
