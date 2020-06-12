require_relative '../connection'
Dir.glob("./models/*").each{|file|
    require file
}

# Create
user1 = Client.create(firstname: 'Kévin', lastname: "Pasteur")
user2 = Client.create(firstname: 'Gael', lastname: "Oberson")

catMoto = Category.create(name: "Moto", description: "véhicule à deux roues")
catVoiture = Category.create(name: "Voiture", description: "véhicule à quatres roues")

prod1 = Product.create(name: 'KTM 500 EXC', price: 0.01, description: "Une moto qui envoie sec !", category: catMoto)
prod2 = Product.create(name: 'Honda 250 CRF', price: 0.2, description: "Une moto qui parfaire pour débuter", category: catMoto)
prod3 = Product.create(name: 'Mitsubishi Lancer', price: 45000, description: "System sonor super performant", category: catVoiture)

orderGael = Order.create(created_at: DateTime.now(), shipped_at: DateTime.now()+12, status: "En cours de préparation", client: user2)

orderItemGael1 = OrderItem.create(quantity: 99, item_price: prod2.price, order: orderGael, product: prod2)
orderItemGael2 = OrderItem.create(quantity: 100, item_price: prod1.price, order: orderGael, product: prod1)
orderItemGael2 = OrderItem.create(quantity: 255, item_price: prod1.price, order: orderGael, product: prod3)