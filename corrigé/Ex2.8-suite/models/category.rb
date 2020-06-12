class Category < ActiveRecord::Base
  has_many :products
  has_many :suppliers, through: :products

  ### Needed for Ex2-suite-2-variante-b
  has_many :order_items, through: :products
  
  ### Needed for Ex2-suite-2-variante-c
  has_many :orders, through: :products

  validates :name, length: {minimum: 2, maximum: 50}
  
  ### Ex2-suite-2-variante-a
  def self.never_ordered_a
    all.find_all {|category| category.products.all? {|product| product.order_items.empty? } }
  end

  ### Ex2-suite-2-variante-b
  def self.never_ordered_b
    # needs `has_many :order_items, through: :products`, see above
    all.find_all {|category| category.order_items.empty? }
  end

  ### Ex2-suite-2-variante-c
  def self.never_ordered_c
    where.not(id: joins(:orders))
  end
  ###
  
  def to_s
    name
  end
end
