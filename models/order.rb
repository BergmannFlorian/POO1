class Order < ActiveRecord::Base
    belongs_to :client
    has_many :order_items
    has_many :products, through: :order_items
    def to_s
        "#{created_at}, #{shipped_at}, #{status}"
    end
    
end