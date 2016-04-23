class InvoiceCreation
  attr_reader :cart, :current_user, :order

  def initialize(cart, current_user, order)
    @order = order
    @cart = cart
    @current_user = current_user
  end

  def create
    cart.contents.each do |item_id, quantity|
      current_user.invoices.create(
        item_id: item_id,
        quantity: quantity,
        order_id: order.id
      )
    end
  end
end
