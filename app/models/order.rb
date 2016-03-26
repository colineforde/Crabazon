class Order < ActiveRecord::Base
  belongs_to :user
	has_many :order_details
	has_many :products, through: :order_details
  # accepts_nested_attributes_for :products

  def index
    @order = Order.last
  end

  def add
    
  end

  def delete
  end


end