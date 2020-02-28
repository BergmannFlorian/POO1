require_relative 'connection'
Dir.glob("models/*").each{|file|
    require_relative file
}

client = Client.find(2)
p client.ordered_products.cheap

# p OrderItem.all.bulk.map(&:products)