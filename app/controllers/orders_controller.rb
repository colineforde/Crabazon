class OrdersController < ApplicationController

	def index
    @current_user = User.second
		@order = @current_user.orders.last
	end
end