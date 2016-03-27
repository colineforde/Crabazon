class IndexController < ApplicationController
  def index
    @products = Product.all
    @cart = current_user.cart
  end
end
