class OrderProduct < ActiveRecord::Base
	belongs_to :order
	belongs_to :product

	def name
		self.product.name
	end

	def price
		self.product.price
	end

	def product_image
		self.product.product_image
	end

end