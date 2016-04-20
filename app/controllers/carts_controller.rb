class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to request.referrer
  end

  def destroy
    item = Item.find(params[:item_id])
    item_id = params[:item_id]
    @cart.delete_item(item.id)
    session[:cart] = @cart.contents

    flash.now[:notice] = %Q[Removed #{item.title} from cart. #{view_context.link_to("Put one back?", cart_path(item_id: item.id), method: :post)}]

    render :show
  end

  def show
  end
end
