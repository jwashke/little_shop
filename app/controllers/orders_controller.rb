class OrdersController < ApplicationController

  def create
    orders = OrderCreation.new(@cart, current_user)
    orders.create
    redirect_to orders_path
  end

  def index
    @orders = Order.all
  end
end
