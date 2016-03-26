class Product < ActiveRecord::Base
	validates :name, :description, :price, :quantity, presence: true
  	belongs_to :user
  	has_many :product_categories
  	has_many :categories, through: :product_categories
  	has_many :order_details
  	has_many :orders, through: :order_details
  	scope :sort_by_price, -> { order(:price) }    
end
