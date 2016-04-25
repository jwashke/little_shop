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

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to admin_items_path
    else
      flash[:notice] = "Something went wrong"
      render :new
    end

  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :avatar)
  end
end
