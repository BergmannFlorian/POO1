class OrderItem < ActiveRecord::Base
    # Relation
    belongs_to :order
    belongs_to :product

    scope :bulk, ->(quantity = 100) { where("quantity >= ?", quantity) } 

    # Validation
    validates :order, :product, presence: true

    # Callback
    before_save :set_price

    protected
    def set_price
        item_price.nill? item_price = product.price
    end

    # Method
    def to_s
        "#{quantity}, #{item_price}, #{description}"
    end

    def price
        quantity * item_price
    end

end