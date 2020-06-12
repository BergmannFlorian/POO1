class Client < ActiveRecord::Base
  has_many :orders
  has_many :ordered_products, lambda { distinct }, through: :orders, source: :products
  has_many :authored_comments, class_name: 'Comment', foreign_key: :author_id, dependent: :destroy 
  
  def self.without_orders
    left_joins(:orders).where(orders: {id: nil})
  end
end
