class Product < ActiveRecord::Base
	validates :name, :description, :price, :inventory, presence: true
  	belongs_to :user
  	has_many :product_categories
  	has_many :categories, through: :product_categories
  	has_many :order_products
  	has_many :orders, through: :order_products
  	scope :sort_by_price, -> { order(:price) }    
end
