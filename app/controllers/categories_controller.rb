class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(name: params[:name]) || not_found
    @items = @category.items
  end
end
