class OrderBuilder
  attr_reader :cart, :current_user, :order

  def initialize(cart, order)
    @order = order
    @cart = cart
  end

  def create
    build_order_items_for_order
    order.save
  end

  def build_order_items_for_order
    cart.contents.each do |item_id, quantity|
      order.order_items.create(
        item_id: item_id,
        quantity: quantity,
      )
    end
  end
end
