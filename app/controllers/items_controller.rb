class ItemsController < ApplicationController
  def index
    @items = Item.all_by_state
  end
end
