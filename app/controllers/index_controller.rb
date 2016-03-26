class IndexController < ApplicationController
  def index
    if user_signed_in?
      @current_user = current_user
      @order = @current_user.orders.last
    end
    # @current_user = current_user
    # @order = @current_user.orders.last
    @products = Product.all
  end
end
