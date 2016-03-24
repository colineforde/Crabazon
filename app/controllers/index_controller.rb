class IndexController < ApplicationController
  def index
    @categories = Category.all
    # @products = Product.sort_by_price
  end
end
