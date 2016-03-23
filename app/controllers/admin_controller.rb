class AdminController < ApplicationController
	before_action :authenticate_user!
	def index
		if !current_user.admin?
			flash[:error] = "You must be an admin to view the requested page"
			redirect_to '/'
		else
			@products = Product.sort_by_price
		end
	end
end


