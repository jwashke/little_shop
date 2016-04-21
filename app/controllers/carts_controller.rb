class CartsController < ApplicationController
  before_action :set_item, only: [:create, :destroy]

  def create
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    redirect_to request.referrer
  end

  def destroy
    @cart.delete_item(@item.id)
    session[:cart] = @cart.contents

    link = view_context.link_to("Put one back?",
                                cart_path(item_id: @item.id),
                                method: :post)

    flash[:notice] = %[Removed #{@item.title} from cart. #{link}]

    redirect_to cart_path
  end

  def show
  end

  def update
    @cart.update_item(params[:item_id], params[:quantity].to_i)
    render :show
  end
end

private

def set_item
  @item = Item.find(params[:item_id])
end
