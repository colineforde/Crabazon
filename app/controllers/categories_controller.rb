class CategoriesController < ApplicationController
  def index
 	@categories = Category.all
  end

  def new
  end

  def show
  	@category = Category.find(params[:id])
  	redirect_to category_products_path(@category)
  end
end