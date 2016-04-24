class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(name: params[:name])
    @items = @category.items
  end
end
