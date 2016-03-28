class CartController < ApplicationController
	def index
		@order = Order.last
		@cart = current_user.cart
	end

	def increment
		@order = current_user.cart
		order_product = OrderProduct.find(params[:order_product][:order_product_id])
		order_product.quantity += 1
		order_product.save!
		render json: {quantity: order_product.quantity, id: order_product.id} 
	end

	def decrement
		@order = current_user.cart
		order_product = OrderProduct.find(params[:order_product][:order_product_id])
		order_product.quantity -= 1
		order_product.save!
		render json: {quantity: order_product.quantity, id: order_product.id} 
	end

	def update 
		@order = current_user.cart
		order_product = OrderProduct.find_or_create_by!(order_id: @order.id, product_id: params[:product][:product_id])
		# render json: {count: @order.order_products.count} 
	end

	def removal
		@order_product = OrderProduct.find_by(id: params[:order_product][:order_product_id], order_id: current_user.cart.id)
		@order_product.destroy
		redirect_to '/cart'
	end
end