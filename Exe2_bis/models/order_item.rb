class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  
  validates :product, :order, presence: true
  validates :quantity, numericality: {greater_than_or_equal_to: 1, only_integer: true}

  before_save :set_item_price

  def price
    quantity * item_price
  end
  
  protected
  
  def set_item_price
    self.item_price ||= product.price
  end
end
