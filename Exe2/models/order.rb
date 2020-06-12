class Order < ActiveRecord::Base
    # Relations
    belongs_to :client
    has_many :order_items
    has_many :products, through: :order_items

    # Validations
    validates :order_items, presence: true
    validates_associated :order_items

    # Methods
    def to_s
        "#{created_at}, #{shipped_at}, #{status}"
    end

    def total_price
        order_items.sum(&:price)
    end
    
end