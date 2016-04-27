class Admin::ItemsController < Admin::BaseController
  before_action :set_item, only: [:retire, :activate, :edit, :update]

  def index
    @items = Item.all_by_id
  end

  def retire
    @item.retired!
    redirect_to admin_items_path
  end

  def activate
    @item.active!
    redirect_to admin_items_path
  end

  def new
    @categories = Category.all
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      flash[:notice] = @item.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :avatar, :file, :category_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
