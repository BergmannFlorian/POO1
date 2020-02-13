class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :product
    def to_s
        "#{quantity}, #{item_price}, #{description}"
    end
    
end