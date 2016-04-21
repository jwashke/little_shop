class OrdersController < ApplicationController

  def create
    orders = OrderCreation.new(@cart, current_user)
    orders.create

    # @cart.contents.each do |item_id, quantity|
    #   current_user.orders.create(item_id: item_id, quantity: quantity)
    # end
    redirect_to orders_path
  end

  def index
    @orders = Order.all
  end

end
