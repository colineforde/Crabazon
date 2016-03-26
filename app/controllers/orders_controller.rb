class OrdersController < ApplicationController
	def index
		@order = Order.last
	end
end