class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order.cycle_status
    redirect_to admin_orders_path
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancelled!
    redirect_to admin_orders_path
  end
end
