class OrdersController < ApplicationController
  before_action :require_login

  def index
    @orders = current_user.orders
  end

  def require_login
    redirect_to login_path unless current_user
  end

end
