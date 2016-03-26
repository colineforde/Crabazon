class CartsController < ApplicationController
  def index
    @cart = Cart.first
  end
end
