class OrdersController < ApplicationController
	def index
		@order = Order.last
	end

	def update 
		@product = Product.find(params[:id])
		@order = Order.find(params[:user_id])
		@order << @product
		redirect 
	end
end