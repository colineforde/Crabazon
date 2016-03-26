class OrderProductsController < ApplicationController

  def index
    @current_user = current_user
    @order = @current_user.orders.last
    @order_product = @order.order_products.all
  end

  def add_quantity
    @current_user = current_user
    @order = @current_user.orders.last
    @order_product = @order.order_products.find(params[:id])
    @order_product.quantity += 1
    @order_product.product.inventory -= 1
    redirect_to user_order_order_products_path(@current_user, @order)
  end


  def reduce_quantity
    @current_user = current_user
    @order = @current_user.orders.last
    @order_product = @order.order_products.find(params[:id])
    @order_product.quantity -= 1
    @order_product.product.inventory += 1
    redirect_to user_order_order_products_path(@current_user, @order)
  end

  def destroy
    @current_user = current_user
    @order = current_user.orders.last
    @order_product = @order.order_products.find(params[:id])
    @order_product.destroy
    redirect_to user_order_order_products_path(@current_user, @order)
  end


end