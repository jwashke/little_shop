class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])

    @cart.add_item(item.id)

    session[:cart] = @cart.contents

    redirect_to items_path
  end

  def destroy
    item = Item.find(params[:item_id])

    @cart.delete_item(item.id)
    session[:cart] = @cart.contents
    render :show
  end

  def show
  end
end
