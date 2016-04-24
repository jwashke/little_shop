class Invoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :order

  def total
    item.price * quantity
  end

end
