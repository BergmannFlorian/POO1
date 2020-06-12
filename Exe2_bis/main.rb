require_relative "connection"
require_relative 'models'

#
# Ex2 - Suite
#

# 1. Afficher la commande la plus cher
if order = Order.most_expensive
  puts "\nCommande la plus cher:"
  puts "#{order} total: #{order.price}"
end


# 2. Afficher les catégories qui n'ont jamais été commandées
puts "\nCatégories jamais commandées"
puts Category.never_ordered_a

# Affiche les variantes, elles doivent avoir le même résultat
puts "\nVariantes d'implémentation: Catégories jamais commandées"
ActiveRecord::Base.logger.debug "=== Category.never_ordered_a"
p Category.never_ordered_a
ActiveRecord::Base.logger.debug "=== Category.never_ordered_b"
p Category.never_ordered_b
ActiveRecord::Base.logger.debug "=== Category.never_ordered_c"
p Category.never_ordered_c


# 3. Supprimer les clients n'ayant fait aucune commande
puts "\nClient sans commandes:"
puts Client.without_orders
Client.without_orders.destroy_all
puts "Doit être vide: #{Client.without_orders.all.join}"


# 4. Déterminer s'il y a des commandes ou non entre deux dates données
starts_at = Time.now - 1.week
ends_at = starts_at + 3.days
puts "\nCommandes passée entre #{starts_at} et #{ends_at}:"
puts Order.between(starts_at, ends_at)

# 5. Sortir les compagnies ayant passé commande des produits d'un fournisseur
puts "\nCompagnies ayant passé commande au fournisseur #{Supplier.first.name} :"
puts Supplier.first.companies

# 6. Afficher les catégories qui ont des produits qui coutent plus cher que 100.-
puts "\nCategories avec des produit de plus de 100.- :"
puts Category.has_products_more_than_100