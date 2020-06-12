require_relative '../models'

sport   = Category.create! name: 'Sport'
pickles = Category.create! name: 'Pickles'

crazy  = Supplier.create! name: 'CrazySport'
xpress = Supplier.create! name: 'Xepresso'

Product.create! name: "Ski de pistes", description: "Pour débutants", price: BigDecimal('327.50'), category: sport, supplier: crazy
Product.create! name: "Ski de fonds", description: "Pour les endurants", price: BigDecimal('99.95'), category: sport, supplier: crazy
Product.create! name: "Gants", description: "One size", price: BigDecimal('19.50'), category: sport, supplier: xpress
Product.create! name: "Carambar", price: BigDecimal('0.20'), category: pickles, supplier: xpress
Product.create! name: "Chiclette", price: BigDecimal('0.10'), category: pickles, supplier: xpress

Individual.create! firstname: 'Pascal', lastname: 'Hurni'
Individual.create! firstname: 'Xavier', lastname: 'Carrel'
Individual.create! firstname: 'Jérome', lastname: 'Chevillat'

Company.create! name: 'Tricatel'
Company.create! name: 'Los Pollos'

happy = Company.first
happy.authored_comments.create(body: "Super produit!", target: Product.last)
Supplier.first.comments.create(body: "Super fournisseur!", author: happy)

angry = Individual.first
angry.authored_comments.create(body: "Evitez ce fournisseur!", target: Supplier.last)
Product.first.comments.create(body: "Fuyez ce produit!", author: angry)
