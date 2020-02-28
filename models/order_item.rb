class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :product

    scope :bulk, ->(quantity = 100) { where("quantity >= ?", quantity) } 

    def to_s
        "#{quantity}, #{item_price}, #{description}"
    end
    
end