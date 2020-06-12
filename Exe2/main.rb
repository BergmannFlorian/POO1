require_relative 'connection'

Dir.glob("models/*").each{|file|
    require_relative file
}
require 'rails/observers/activerecord/active_record'
Dir.glob("observers/*").each{|file|
    require_relative file
}

ActiveRecord::Base.observers << :product_observer
ActiveRecord::Base.instantiate_observers

# client = Client.find(2)
# p client.ordered_products.cheap

# p OrderItem.all.bulk.map(&:products)

# client = Client.first

# order = client.orders.new(status: "En cours de préparation")
# order.order_items.new(quantity: 1, item_price: Product.first.price, product: Product.first)

# p order.save!

# order = Order.first

# p order.total_price

# order.order_items.create(quantity: 1, item_price: 1, product: Product.first)

# p order.order_items

# Exigence 6 --------------------------------------------------------

# individual = Individual.create(firstname: 'Indi', lastname: "Indi")
# compagny = Compagny.create(firstname: 'Comp', lastname: "Comp")

# p individual
# p compagny

# Exigence 7 ---------------------------------------------------------

# supplier1 = Supplier.create(name: 'Dubat')
# supplier2 = Supplier.create(name: 'McDo')

# p supplier1
# p supplier2

# product1 = Product.first
# product1.supplier = supplier1
# product1.save

# product2 = Product.first
# product2.supplier = supplier2
# product2.save

# p product1
# p product2

# Exigence 8 ---------------------------------------------------------

# product = Product.first
# p product.comments.create(comment: "C'est un beau produit")

# supplier = Supplier.first
# p supplier.comments.create(comment: "C'est un beau fournisseur")

# Exigence 9 ---------------------------------------------------------

product = Product.first
product.update(stock: 10)