class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

  def retire
    @item = Item.find(params[:id])
    @item.retire
    redirect_to admin_items_path
  end
end
