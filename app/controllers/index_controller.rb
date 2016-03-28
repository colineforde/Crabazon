class IndexController < ApplicationController
  def index
    @products = Product.all
    @cart = current_user.try(:cart)
  end
end
