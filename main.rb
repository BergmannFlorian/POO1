require_relative 'connection'
Dir.glob("models/*").each{|file|
    require_relative file
}

# client = Client.find(2)
# p client.ordered_products.cheap

# p OrderItem.all.bulk.map(&:products)

# client = Client.first

# order = client.orders.new(status: "En cours de préparation")
# order.order_items.new(quantity: 1, item_price: Product.first.price, product: Product.first)

# p order.save!

order = Order.first

# p order.total_price

order.order_items.create(quantity: 1, item_price: 1, product: Product.first)

p order.order_items