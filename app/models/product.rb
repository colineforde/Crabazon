class Product < ActiveRecord::Base
	validates :name, :description, :price, :quantity, presence: true
  	belongs_to :user
  	belongs_to :cart
  	has_many :product_categories
  	has_many :categories, through: :product_categories
  	scope :sort_by_price, -> { order(:price) }    
end
