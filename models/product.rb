class Product < ActiveRecord::Base
    has_one :category
    has_many :order_items
    has_many :orders, through: :order_items
    def to_s
        "#{name}, #{price}, #{description}"
    end
    
end