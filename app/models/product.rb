class Product < ActiveRecord::Base
  validates :name, :price, :description, :image_url, :quantity, presence: true
  validates_numericality_of :price, greater_than: 0
  validates_numericality_of :quantity, greater_than: -1
end
