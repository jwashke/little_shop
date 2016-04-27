class Admin::OrdersController < Admin::BaseController
  before_action :set_order, only: [:update, :cancel]

  def index
    @orders = Order.all
  end

  def update
    @order.cycle_status
    if @order.completed?
      ItemSender.send_order(@order.user, @order).deliver_now
    end
    redirect_to admin_orders_path
  end

  def cancel
    @order.cancelled!
    redirect_to admin_orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
