require_relative '../connection'
Dir.glob("../models/*").each{|file|
    require_relative file
}

# p Client.create(firstname: "Pascal", lastname: "Hurni")

# iterate = 10
# while iterate > 0
#     firstname = p (0...8).map{(65 + rand(26)).chr}.join
#     lastname = p (0...8).map{(65 + rand(26)).chr}.join
#     client = Client.create(firstname: firstname, lastname: lastname)
#     iterate = iterate - 1
# end

Create
user1 = Client.create(fistname: 'Kévin', lastname: "Pasteur")
user2 = Client.create(fistname: 'Gael', lastname: "Oberson")

catMoto = Category.create(name: "Moto", description: "véhicule à deux roues")
catVoiture = Category.create(name: "Voiture", description: "véhicule à quatres roues")

prod1 = Product.create(name: 'KTM 500 EXC', price: 0.01, description: "Une moto qui envoie sec !", category_id: catMoto)
prod2 = Product.create(name: 'Honda 250 CRF', price: 0.2, description: "Une moto qui parfaire pour débuter", category_id: catMoto)
prod3 = Product.create(name: 'Mitsubishi Lancer', price: 45000, description: "System sonor super performant", category_id: catVoiture)

orderGael = Order.create(created_at: DateTime.now(), shipped_at: DateTime.now()+12, status: "En cours de préparation", client_id: user2)

orderItemGael1 = OrderItem.create(quantity: 99, item_price: prod2.price, order_id: orderGael, product_id: prod2)
orderItemGael2 = OrderItem.create(quantity: 100, item_price: prod1.price, order_id: orderGael, product_id: prod1)
orderItemGael2 = OrderItem.create(quantity: 255, item_price: prod1.price, order_id: orderGael, product_id: prod1)