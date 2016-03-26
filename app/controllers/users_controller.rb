class UsersController < ApplicationController
	has_many :orders

	
	def index				 
	end
	# def sign_in
	# 	if current_user
	# 		if current_user.admin?
	# 			@products = Product.sort_by_price
	# 			redirect_to '/admin'
	# 		else
	# 			@products = Product.sort_by_price
	# 			redirect_to '/'
	# 		end
	# 	end	
	# end
end


