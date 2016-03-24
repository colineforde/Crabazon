class UsersController < ApplicationController
	# after_create :welcome_email
	def index				 
	end

	def sign_in
		if current_user
			if current_user.admin?
				@products = Product.sort_by_price
				redirect_to '/admin'
			else
				@products = Product.sort_by_price
				redirect_to '/'
			end
		end	
	end

	# def welcome_email
	# 	mail(to: self.email, subject: "Welcome to the Shoppe! Thanks for signing up.")
	# end
end
