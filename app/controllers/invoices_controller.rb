class InvoicesController < ApplicationController
  before_action :require_login, only: [:index]

  def create
    order = Order.create
    invoices = InvoiceBuilder.new(@cart, current_user, order)
    invoices.create
    session[:cart] = {}
    flash[:notice] = "Order was successfully placed"
    redirect_to orders_path
  end

  def index
    @order = Order.find(params[:order_id])
    @invoices = @order.invoices
  end

  private

  def require_login
    redirect_to login_path unless current_user
  end
end
