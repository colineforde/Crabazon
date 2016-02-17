class Product < ActiveRecord::Base
  validates :name, :price, :description, presence: true
  validates_numericality_of :price, greater_than: 0
end
