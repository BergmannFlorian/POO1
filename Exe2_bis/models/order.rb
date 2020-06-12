class Order < ActiveRecord::Base
  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :client
  belongs_to :company, -> {where(type: Company)}, foreign_key: 'client_id'
  
  validates :order_items, :client, presence: true
  validates_associated :order_items
  
  ### Ex2-suite-4
  scope :between, ->(starts_at, ends_at) { where(created_at: starts_at..ends_at) }
  
  ### Ex2-suite-1-variante-a
  def self.order_by_price
    all.sort_by {|order| order.price}
  end
  
  def self.most_expensive
    order_by_price.last
  end

  ### Ex2-suite-1-variante-b
  def self.most_expensive
    all.max_by(&:price)
  end

  ### Ex2-suite-1-variante-c
  def self.order_by_price
    select("orders.*, SUM(quantity*item_price) AS total_price").joins(:order_items).group('orders.id').order('total_price')
  end

  def self.most_expensive
    order_by_price.last
  end
  ###

  def price
    order_items.sum {|item| item.price}
  end
  
  def to_s
    "La commande #{id} du #{created_at}"
  end
end
