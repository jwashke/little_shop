class OrderCreation
  attr_reader :cart, :current_user

  def initialize(cart, current_user)
    @cart = cart
    @current_user = current_user
  end

  def create
    cart.contents.each do |item_id, quantity|
      current_user.orders.create(item_id: item_id, quantity: quantity)
    end
  end

end
