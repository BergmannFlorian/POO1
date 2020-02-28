Create Bundle (package manager)

    bundle init

Run bundle

    bundle

Config.yml

    development:
        adapter:  'mysql2'
        host:     'localhost'
        username: 'root'
        password: ''
        database: 'ruby_ecommerce'

List rake cmd

    rake --task

Create db

    rake db:create

Create migration

    rake db:new_migration name=CreateClient options="firstname:string{50} lastname:string{50}"

Run migration

    rake db:migrate

Create entry

    irb
    require "./main.rb"
    Client.create(firstname: firstname, lastname: lastname)

    user2.orders.create(status: "En cours de préparation")


    rake -T db