class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all_by_id
  end

  def retire
    @item = Item.find(params[:id])
    @item.retired!
    redirect_to admin_items_path
  end

  def activate
    @item = Item.find(params[:id])
    @item.active!
    redirect_to admin_items_path
  end
end
