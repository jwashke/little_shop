class ItemsController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.all_by_state
  end
end
