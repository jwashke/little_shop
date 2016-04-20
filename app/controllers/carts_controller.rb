class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)

    session[:cart] = @cart.contents

    redirect_to items_path
  end

  def destroy
    item = Item.find(params[:item_id])
    item_id = params[:item_id]
    @cart.delete_item(item.id)
    session[:cart] = @cart.contents

    flash.now[:notice] = "Removed #{item.title} from cart <a href=\"/undo/#{item_id}\">undo</a>"

    render :show
  end

  def undo

    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    redirect_to cart_path
  end

  def show
  end
end
