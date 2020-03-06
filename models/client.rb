class Client < ActiveRecord::Base
    # Relations
    has_many :orders
    has_many :ordered_products, through: :orders, source: :products

    # Validation
    validates :firstname, :lastname, length: { minimum: 2, maximum: 50}

    # Methods
    def to_s
        "#{firstname} #{lastname}"
    end
    
end