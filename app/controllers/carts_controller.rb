class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to request.referrer
  end

  def destroy
    item = Item.find(params[:item_id])
    @cart.delete_item(item.id)
    session[:cart] = @cart.contents

    link = view_context.link_to("Put one back?",
                                cart_path(item_id: item.id),
                                method: :post)

    flash.now[:notice] = %[Removed #{item.title} from cart. #{link}]

    render :show
  end

  def show
  end

  def update
    @cart.update_item(params[:item_id], params[:quantity].to_i)
    render :show
  end
end
