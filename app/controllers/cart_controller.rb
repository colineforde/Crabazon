class CartController < ApplicationController
	def index
		@order = Order.last
	end

	def update 
		@order = current_user.cart
		OrderProduct.find_or_create_by(order_id: @order.id, product_id: params[:product][:product_id])
		# render json: {count: @order.order_products.count} 
	end
end